import os
import cv2
import numpy as np
import torch
import time
from facenet_pytorch import MTCNN, InceptionResnetV1
from collections import deque, Counter

from database import (
    get_student_details,
    get_current_class,
    log_violation,
    get_faculty_email,
    send_alert
)

# ================= CONFIG =================
DATASET_PATH = "processed_dataset"
DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")

MATCH_THRESHOLD = 0.65
BUFFER_SIZE = 5
TRACK_DISTANCE_THRESHOLD = 80
DISAPPEAR_TIME = 2

SAVE_PATH = r"D:\xampp\htdocs\proofs"
os.makedirs(SAVE_PATH, exist_ok=True)

# ================= MODELS =================
mtcnn = MTCNN(keep_all=True, device=DEVICE)
facenet = InceptionResnetV1(pretrained="vggface2").eval().to(DEVICE)

# ================= LOAD EMBEDDINGS =================
embeddings_db = {}

for class_name in os.listdir(DATASET_PATH):
    class_path = os.path.join(DATASET_PATH, class_name)

    if not os.path.isdir(class_path):
        continue

    for roll_no in os.listdir(class_path):
        student_path = os.path.join(class_path, roll_no)

        emb_list = []

        for root, _, files in os.walk(student_path):
            for file in files:
                if file.endswith(".npy"):
                    emb = np.load(os.path.join(root, file))
                    emb = emb / np.linalg.norm(emb)
                    emb_list.append(emb)

        if emb_list:
            embeddings_db[roll_no] = emb_list

print(f"✅ Loaded {len(embeddings_db)} students")

# ================= HELPERS =================
def cosine_similarity(a, b):
    return np.dot(a, b)

def get_embedding(face):
    face = cv2.resize(face, (160, 160))
    rgb = cv2.cvtColor(face, cv2.COLOR_BGR2RGB)

    tensor = torch.tensor(rgb).permute(2, 0, 1).float()
    tensor = tensor.unsqueeze(0) / 255.0
    tensor = tensor.to(DEVICE)

    with torch.no_grad():
        emb = facenet(tensor)

    emb = emb.cpu().numpy()[0]
    return emb / np.linalg.norm(emb)

# 🔥 FIXED MATCHING (RELAXED + DEBUG)
def match_embedding(embedding):
    best_name = "Unknown"
    best_score = -1
    second_score = -1

    for roll_no, embs in embeddings_db.items():
        scores = [cosine_similarity(embedding, e) for e in embs]
        score = max(scores)

        if score > best_score:
            second_score = best_score
            best_score = score
            best_name = roll_no
        elif score > second_score:
            second_score = score

    print(f"BEST: {best_name} | score: {best_score:.3f} | second: {second_score:.3f}")

    if best_score >= MATCH_THRESHOLD:
        return best_name, best_score

    return "Unknown", best_score

def is_blurry(face):
    gray = cv2.cvtColor(face, cv2.COLOR_BGR2GRAY)
    return cv2.Laplacian(gray, cv2.CV_64F).var() < 80

def get_center(box):
    x1, y1, x2, y2 = box
    return ((x1 + x2) // 2, (y1 + y2) // 2)

# ================= TRACKING =================
trackers = {}
track_id = 0

def remove_duplicates(boxes, threshold=0.5):
    final = []

    for box in boxes:
        x1, y1, x2, y2 = box
        keep = True

        for fb in final:
            fx1, fy1, fx2, fy2 = fb

            inter_x1 = max(x1, fx1)
            inter_y1 = max(y1, fy1)
            inter_x2 = min(x2, fx2)
            inter_y2 = min(y2, fy2)

            inter = max(0, inter_x2 - inter_x1) * max(0, inter_y2 - inter_y1)

            area1 = (x2 - x1) * (y2 - y1)
            area2 = (fx2 - fx1) * (fy2 - fy1)

            iou = inter / (area1 + area2 - inter + 1e-5)

            if iou > threshold:
                keep = False
                break

        if keep:
            final.append(box)

    return final

# ================= MAIN FUNCTION =================
def identify_frame(frame):
    global track_id

    results = []
    current_ids = set()

    rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
    boxes, _ = mtcnn.detect(rgb)

    if boxes is None:
        return []

    boxes = [list(map(int, b)) for b in boxes]
    boxes = remove_duplicates(boxes)

    for box in boxes:
        x1, y1, x2, y2 = map(int, box)
        w, h = x2 - x1, y2 - y1

        # 🔥 FILTER SMALL OBJECTS
        if w < 60 or h < 60:
            continue

        center = get_center((x1, y1, x2, y2))

        assigned = None
        best_dist = float("inf")

        for tid, data in trackers.items():
            dist = np.linalg.norm(np.array(center) - np.array(data["center"]))
            if dist < TRACK_DISTANCE_THRESHOLD and dist < best_dist:
                assigned = tid
                best_dist = dist

        if assigned is None:
            assigned = track_id
            track_id += 1

            trackers[assigned] = {
                "center": center,
                "buffer": deque(maxlen=BUFFER_SIZE),
                "locked": False,
                "name": None,
                "confidence": 0,
                "start_time": time.time(),
                "last_seen": time.time(),
                "image": None
            }

        data = trackers[assigned]
        data["center"] = center
        data["last_seen"] = time.time()
        current_ids.add(assigned)

        if data["locked"]:
            results.append({
                "box": (x1, y1, w, h),
                "name": data["name"],
                "confidence": data["confidence"]
            })
            continue

        face = frame[y1:y2, x1:x2]

        if face.size == 0 or is_blurry(face):
            name = "Unknown"
            conf = 0
        else:
            emb = get_embedding(face)
            name, conf = match_embedding(emb)

        data["buffer"].append(name)

        # 🔒 SAFE LOCK
        if len(data["buffer"]) >= BUFFER_SIZE:
            votes = Counter(data["buffer"])
            final, count = votes.most_common(1)[0]

            if final != "Unknown" and count >= BUFFER_SIZE * 0.7:
                data["locked"] = True
                data["name"] = final
                data["confidence"] = conf

                # SAVE PROOF IMAGE WITH BOX
                cv2.rectangle(frame, (x1,y1), (x2,y2), (0,255,0), 2)
                cv2.putText(frame, final, (x1, y1-10),
                            cv2.FONT_HERSHEY_SIMPLEX, 0.9, (0,255,0), 2)

                filename = f"{final}_{int(time.time())}.jpg"
                full_path = os.path.join(SAVE_PATH, filename)
                cv2.imwrite(full_path, frame)

                data["image"] = f"proofs/{filename}"

        label = data["name"] if data["locked"] else "Detecting..."

        results.append({
            "box": (x1, y1, w, h),
            "name": label,
            "confidence": conf
        })

    # ================= CLEANUP =================
    to_delete = []

    for tid, data in trackers.items():
        if tid not in current_ids:

            if time.time() - data["last_seen"] > DISAPPEAR_TIME:

                if data["locked"]:
                    roll = data["name"]

                    student = get_student_details(roll)
                    if student:
                        roll, name, dept, year, section = student
                        cls = get_current_class(dept, year, section)

                        if cls:
                            subject, _, _ = cls

                            log_violation(
                                roll,
                                name,
                                subject,
                                f"students/{roll}.jpg",
                                data["image"]
                            )

                            email = get_faculty_email(subject)
                            if email:
                                send_alert(roll, name, subject, email)

                to_delete.append(tid)

    for tid in to_delete:
        del trackers[tid]

    return results
import os
import cv2
import numpy as np
import mediapipe as mp
import torch
from facenet_pytorch import InceptionResnetV1
from scipy.spatial import Delaunay

# ================= CONFIG =================
RAW_DATASET = "raw_dataset"
PROCESSED_DATASET = "processed_dataset"

DEVICE = torch.device("cuda" if torch.cuda.is_available() else "cpu")

# Pose angles
POSES = {
    "front": (0, "y"),
    "left": (-20, "y"),
    "right": (20, "y"),
    "up": (-15, "x"),
    "down": (15, "x"),
}

# ================= LOAD MODELS =================
print("🔄 Loading Models...")

mp_face_mesh = mp.solutions.face_mesh
face_mesh = mp_face_mesh.FaceMesh(static_image_mode=True)

facenet = InceptionResnetV1(pretrained='vggface2').eval().to(DEVICE)

print("✅ Models Loaded\n")


# ================= FACE ALIGN =================
def align_face(img):
    img = cv2.resize(img, (160, 160))
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    img = img.astype(np.float32) / 255.0
    img = torch.tensor(img).permute(2, 0, 1)
    return img


# ================= GET LANDMARKS =================
def get_landmarks(image):
    rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
    results = face_mesh.process(rgb)

    if not results.multi_face_landmarks:
        return None

    h, w = image.shape[:2]
    landmarks = []

    for lm in results.multi_face_landmarks[0].landmark:
        landmarks.append([int(lm.x * w), int(lm.y * h)])

    return np.array(landmarks, dtype=np.float32)


# ================= ROTATION MATRIX =================
def rotate_landmarks(landmarks, angle, axis):
    angle = np.radians(angle)
    rotated = landmarks.copy()

    if axis == "y":
        rotated[:, 0] += angle * 100
    elif axis == "x":
        rotated[:, 1] += angle * 100

    return rotated.astype(np.float32)


# ================= MESH WRAP =================
def mesh_wrap(image, landmarks, angle, axis):
    transformed = rotate_landmarks(landmarks, angle, axis)

    h, w = image.shape[:2]
    output = np.zeros_like(image)

    tri = Delaunay(landmarks)

    for t in range(len(tri.simplices)):
        try:
            pts_src = np.array([landmarks[i] for i in tri.simplices[t]], dtype=np.float32)
            pts_dst = np.array([transformed[i] for i in tri.simplices[t]], dtype=np.float32)

            # Safety checks
            if pts_src.shape != (3, 2) or pts_dst.shape != (3, 2):
                continue

            if np.any(np.isnan(pts_src)) or np.any(np.isnan(pts_dst)):
                continue

            r1 = cv2.boundingRect(pts_src)
            r2 = cv2.boundingRect(pts_dst)

            x1, y1, w1, h1 = r1
            x2, y2, w2, h2 = r2

            crop_src = image[y1:y1+h1, x1:x1+w1]

            pts_src_offset = np.array([[p[0]-x1, p[1]-y1] for p in pts_src], dtype=np.float32)
            pts_dst_offset = np.array([[p[0]-x2, p[1]-y2] for p in pts_dst], dtype=np.float32)

            if pts_src_offset.shape != (3, 2) or pts_dst_offset.shape != (3, 2):
                continue

            M = cv2.getAffineTransform(pts_src_offset, pts_dst_offset)

            warped = cv2.warpAffine(crop_src, M, (w2, h2),
                                    flags=cv2.INTER_LINEAR,
                                    borderMode=cv2.BORDER_REFLECT_101)

            mask = np.zeros((h2, w2, 3), dtype=np.uint8)
            cv2.fillConvexPoly(mask, np.int32(pts_dst_offset), (1, 1, 1))

            output[y2:y2+h2, x2:x2+w2] = (
                output[y2:y2+h2, x2:x2+w2] * (1 - mask) +
                warped * mask
            )

        except:
            continue

    return output


# ================= EMBEDDING =================
def get_embedding(face_img):
    face_tensor = align_face(face_img).unsqueeze(0).to(DEVICE)

    with torch.no_grad():
        emb = facenet(face_tensor).cpu().numpy()[0]

    return emb


# ================= MAIN PIPELINE =================
print("🔹 Generating embeddings with mesh poses\n")

total_students = 0

for class_name in os.listdir(RAW_DATASET):
    class_path = os.path.join(RAW_DATASET, class_name)

    if not os.path.isdir(class_path):
        continue

    print(f"📂 Processing Class: {class_name}")

    for img_name in os.listdir(class_path):
        img_path = os.path.join(class_path, img_name)

        roll_no = os.path.splitext(img_name)[0]
        save_dir = os.path.join(PROCESSED_DATASET, class_name, roll_no)

        os.makedirs(save_dir, exist_ok=True)

        image = cv2.imread(img_path)
        if image is None:
            continue

        landmarks = get_landmarks(image)

        if landmarks is None:
            print(f"⚠️ No face detected: {roll_no}")
            continue

        saved = 0

        for pose_name, (angle, axis) in POSES.items():
            try:
                if pose_name == "front":
                    warped = image
                else:
                    warped = mesh_wrap(image, landmarks, angle, axis)

                face = cv2.resize(warped, (160, 160))
                emb = get_embedding(face)

                np.save(os.path.join(save_dir, f"{pose_name}.npy"), emb)
                saved += 1

            except:
                continue

        print(f"   ➜ {roll_no} → {saved} embeddings saved")

        total_students += 1

print("\n🎯 Dataset Processing Complete")
print(f"🎓 Total Students Processed: {total_students}")
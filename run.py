import cv2
from face_engine import identify_frame

#STREAM_URL = "http://10.115.223.98:8080/video"

cap = cv2.VideoCapture(0)

while True:
    ret, frame = cap.read()

    if not ret:
        continue

    results = identify_frame(frame)

    for r in results:
        x,y,w,h = r["box"]
        name = r["name"]
        conf = r["confidence"]

        color = (0,255,0) if name != "Unknown" else (0,0,255)

        cv2.rectangle(frame,(x,y),(x+w,y+h),color,2)
        cv2.putText(frame,f"{name} ({conf:.2f})",
                    (x,y-10),
                    cv2.FONT_HERSHEY_SIMPLEX,
                    0.6,color,2)

    cv2.imshow("Face Recognition", frame)

    if cv2.waitKey(1) == 27:
        break

cap.release()
cv2.destroyAllWindows()
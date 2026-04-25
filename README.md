# RealTime-Corridor-Surveillance-System-Using-MTCNN-and-Facenet
AI-based real-time corridor surveillance system using MTCNN and FaceNet for student recognition. Detects corridor violations during class hours, logs events in MySQL, sends faculty alerts via webhook, and provides monitoring through a PHP dashboard.

## 📌 Overview
This project is an AI-powered corridor monitoring system that detects and recognizes students moving in corridors during class hours. It uses face recognition, automated alerts, and a monitoring dashboard to reduce manual surveillance.

## 🎯 Objective
To automate corridor monitoring by:
- Detecting students in corridors during lecture hours
- Recognizing students using face recognition
- Logging violations automatically
- Sending alerts to faculty in real time
- Providing a dashboard for monitoring

---

## 🚀 Features
- Real-time face detection using MTCNN
- Face recognition using FaceNet embeddings
- Pose augmentation using MediaPipe face mesh
- Cosine similarity-based matching
- Violation logging in MySQL
- Faculty email alerts using Google Apps Script webhook
- PHP dashboard for monitoring
- Face tracking and buffering for stable recognition

---

## 🛠 Technologies Used

### AI / ML
- Python
- OpenCV
- PyTorch
- MTCNN
- FaceNet (InceptionResnetV1)
- MediaPipe

### Database
- MySQL

### Web / Dashboard
- PHP
- HTML/CSS
- XAMPP

### Alerts
- Google Apps Script (Webhook)
- Email Notification System

---

## 🧠 System Architecture

```text
Camera Input
   ↓
Face Detection (MTCNN)
   ↓
Face Recognition (FaceNet)
   ↓
Cosine Similarity Matching
   ↓
Violation Detection
   ↓
MySQL Database Logging
   ↓
Webhook Alert to Faculty
   ↓
PHP Dashboard Monitoring
```

---

## 🔍 Face Recognition Pipeline

### Dataset Creation
- Facial landmarks extracted using MediaPipe (468 points)
- Mesh warping used for pose augmentation
- FaceNet generates embeddings
- Embeddings stored as `.npy` files

### Real-Time Recognition
- Detect face using MTCNN
- Generate embeddings using FaceNet
- Match using cosine similarity
- Use tracking and buffering for stable recognition

---

## 📂 Project Modules
- Dataset Builder
- Recognition Engine
- Database Module
- Alert System
- Monitoring Dashboard

---

## 📌 Algorithms Used
### Face Detection
- MTCNN  
  - P-Net  
  - R-Net  
  - O-Net

### Face Recognition
- FaceNet (InceptionResnetV1)
- Triplet Loss
- Cosine Similarity

---

## ⚙️ Installation

### Clone Repository
```bash
git clone https://github.com/your-username/project-name.git
cd project-name
```

### Create Virtual Environment
```bash
python -m venv mp_env
```

### Activate Environment
```bash
mp_env\Scripts\activate
```

### Install Dependencies
```bash
pip install -r requirements.txt
```

---

## ▶ Run Project

### Start Recognition
```bash
python main.py
```

### Start XAMPP
- Apache ON
- MySQL ON

Open:
```text
http://localhost/dashboard
```

---

## 📧 Real-Time Alerts
Faculty alerts are sent using:
- Python requests
- Google Apps Script webhook
- Email automation

---

## 📊 Dashboard Features
- Violation logs
- Student details
- Captured proof images
- Timetable integration
- Real-time monitoring

---

## 🔐 Future Enhancements
- Multi-camera support
- ArcFace integration
- Mobile alert app
- Attendance analytics
- Cloud deployment

---



## 📜 License
This project is developed for academic and research purposes.

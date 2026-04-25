
import mysql.connector
import requests
from datetime import datetime
WEBHOOK_URL = "https://script.google.com/macros/s/AKfycbya4YKotq0-3wTLhXw8ggNEtkuZu1aqd27mSy9o0uSDUPsFdPhrLOPnu_2suphl3twiwg/exec"

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="face_surveillance",
    
)

cursor = db.cursor()

def get_student_details(roll_no):

    query = """
        SELECT roll_no, name, department, year, section
        FROM students
        WHERE roll_no = %s
    """

    cursor.execute(query, (roll_no,))
    return cursor.fetchone()
def get_current_class(department, year, section):

    query = """
        SELECT subject, start_time, end_time
        FROM timetable
        WHERE department=%s
        AND year=%s
        AND section=%s
        AND CURRENT_TIME BETWEEN start_time AND end_time
    """

    cursor.execute(query, (department, year, section))

    return cursor.fetchone()
#def log_violation(roll_no, name, subject, image_path):

    #query = """
       # INSERT INTO corridor_violations
       # (roll_no, name, subject, detected_time, camera_location, image_path)
       # VALUES (%s,%s,%s,NOW(),'Corridor Camera',%s)
   # """

    #cursor.execute(query, (roll_no, name, subject, image_path))
    #db.commit()
def log_violation(roll, name, subject, image_path, augmented_path):
    query = """
    INSERT INTO corridor_violations
    (roll_no, name, subject, detected_time, image_path, augmented_path)
    VALUES (%s, %s, %s, NOW(), %s, %s)
    """
    cursor.execute(query, (roll, name, subject, image_path, augmented_path))
    db.commit()

def get_faculty_email(subject):

    query = """
        SELECT email
        FROM faculty
        WHERE subject = %s
    """

    cursor.execute(query, (subject,))
    result = cursor.fetchone()

    return result[0] if result else None
def send_alert(roll, name, subject, email):

    payload = {
        "roll_no": roll,
        "name": name,
        "subject": subject,
        "time": datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        "email": email
    }

    try:
        requests.post(WEBHOOK_URL, json=payload)
        print("📩 Alert sent to faculty")
    except Exception as e:
        print("Alert error:", e)



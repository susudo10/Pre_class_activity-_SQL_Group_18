# Pre_class_activity-_SQL_Group_18
# 🎓 ALU Rwanda – Student Performance Database

This project is a **Pre-Class Activity** for ALU Rwanda, where we designed a **Student Performance Database** to track and analyze grades from students enrolled in **Linux** and **Python** courses.  

The database was implemented using **MySQL** and tested with meaningful sample data.  

---

## 📌 Project Objectives
1. Create a student performance database with three tables:
   - **students(student_id, student_name, intake_year)**
   - **linux_grades(course_id, course_name, student_id, grade_obtained)**
   - **python_grades(course_id, course_name, student_id, grade_obtained)**
2. Insert **sample data** for at least 15 students (a mix of those who took one or both courses).
3. Run queries to:
   - Find students who scored less than 50% in Linux.
   - Find students who took only one course.
   - Find students who took both courses.
   - Calculate the average grade per course.
   - Identify the top-performing student across both courses.

---

## 🗂️ Repository Contents
- **`student_performance.sql`** → SQL script containing table creation, sample inserts, and queries.  
- **`REPORT.md`** → Query results with expected outputs in tabular format.  
- **`README.md`** → Documentation of project overview, setup, and usage (this file).  

---

## ⚙️ Setup Instructions
Follow these steps to run the project:

### 1. Clone the Repository
```bash
git clone https://github.com/<your-group-name>/student-performance-db.git
cd student-performance-db
2. Open MySQL
Login to your MySQL environment:

bash
Copy
Edit
mysql -u root -p
3. Create and Use a Database
sql
Copy
Edit
CREATE DATABASE alu_students;
USE alu_students;
4. Run the SQL Script
Import the SQL file into your database:

sql
Copy
Edit
SOURCE student_performance.sql;

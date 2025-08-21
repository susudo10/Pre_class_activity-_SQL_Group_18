# Pre_class_activity-_SQL_Group_18

# 📊 Student Performance Database Report – ALU Rwanda

This report summarizes the queries implemented for the **Student Performance Database** project using **MySQL**.  

---

## ✅ Database Structure
- **students(student_id, student_name, intake_year)**
- **linux_grades(course_id, course_name, student_id, grade_obtained)**
- **python_grades(course_id, course_name, student_id, grade_obtained)**

---

## 1. Students who scored < 50% in Linux
```sql
SELECT s.student_id, s.student_name, l.grade_obtained
FROM students s
JOIN linux_grades l ON s.student_id = l.student_id
WHERE l.grade_obtained < 50;

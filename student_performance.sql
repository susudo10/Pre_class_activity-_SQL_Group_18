DROP TABLE IF EXISTS python_grades;
DROP TABLE IF EXISTS linux_grades;
DROP TABLE IF EXISTS students;

-- ================================================
-- 1. CREATE TABLES
-- ================================================
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    intake_year INT
);

CREATE TABLE linux_grades (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) DEFAULT 'Linux',
    student_id INT,
    grade_obtained DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE python_grades (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50) DEFAULT 'Python',
    student_id INT,
    grade_obtained DECIMAL(5,2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- ================================================
-- 2. INSERT SAMPLE DATA (15 students)
-- Some take only Linux, some only Python, some both
-- ================================================
INSERT INTO students (student_id, student_name, intake_year) VALUES
(1, 'Alice Johnson', 2022),
(2, 'Brian Smith', 2021),
(3, 'Carla Mendes', 2023),
(4, 'David Kamau', 2022),
(5, 'Eva Nshimiyimana', 2023),
(6, 'Frank Uwimana', 2021),
(7, 'Grace Mutesi', 2022),
(8, 'Henry Dushimimana', 2023),
(9, 'Irene Mukamana', 2022),
(10, 'John Doe', 2021),
(11, 'Kevin Lee', 2023),
(12, 'Linda Kayitesi', 2022),
(13, 'Mark Twain', 2021),
(14, 'Nina Uwase', 2023),
(15, 'Oscar Rugamba', 2022);

-- Linux Grades
INSERT INTO linux_grades (course_id, student_id, grade_obtained) VALUES
(101, 1, 72),
(102, 2, 45),
(103, 3, 88),
(104, 4, 64),
(105, 6, 39),
(106, 7, 55),
(107, 9, 80),
(108, 11, 90),
(109, 13, 49),
(110, 15, 77);

-- Python Grades
INSERT INTO python_grades (course_id, student_id, grade_obtained) VALUES
(201, 1, 84),
(202, 3, 92),
(203, 5, 60),
(204, 6, 55),
(205, 8, 70),
(206, 9, 81),
(207, 10, 68),
(208, 12, 47),
(209, 14, 95),
(210, 15, 88);

-- ================================================
-- 3. QUERY: Students who scored < 50% in Linux
-- ================================================
SELECT s.student_id, s.student_name, l.grade_obtained
FROM students s
JOIN linux_grades l ON s.student_id = l.student_id
WHERE l.grade_obtained < 50;

-- ================================================
-- 4. QUERY: Students who took only ONE course
-- (in Linux but not in Python OR in Python but not in Linux)
-- ================================================
SELECT s.student_id, s.student_name
FROM students s
WHERE s.student_id IN (
    SELECT student_id FROM linux_grades
    EXCEPT
    SELECT student_id FROM python_grades
)
UNION
SELECT s.student_id, s.student_name
FROM students s
WHERE s.student_id IN (
    SELECT student_id FROM python_grades
    EXCEPT
    SELECT student_id FROM linux_grades
);

-- ================================================
-- 5. QUERY: Students who took BOTH courses
-- ================================================
SELECT s.student_id, s.student_name
FROM students s
WHERE s.student_id IN (
    SELECT student_id FROM linux_grades
    INTERSECT
    SELECT student_id FROM python_grades
);

-- ================================================
-- 6. QUERY: Average grade per course
-- Linux and Python separately
-- ================================================
SELECT 'Linux' AS course, AVG(grade_obtained) AS avg_grade
FROM linux_grades
UNION
SELECT 'Python', AVG(grade_obtained)
FROM python_grades;

-- ================================================
-- 7. QUERY: Top-performing student across BOTH courses
-- Based on average of all grades
-- ================================================
SELECT s.student_id, s.student_name,
       AVG(g.grade_obtained) AS overall_avg
FROM students s
JOIN (
    SELECT student_id, grade_obtained FROM linux_grades
    UNION ALL
    SELECT student_id, grade_obtained FROM python_grades
) g ON s.student_id = g.student_id
GROUP BY s.student_id, s.student_name
ORDER BY overall_avg DESC
LIMIT 1;

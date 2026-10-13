-- Separate SQL file for Lab Sheet 5
-- Database: MySQL / MySQL Workbench
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- LAB SHEET 5: SQL JOINS
-- =========================================================

-- Create normalized join-practice tables
CREATE TABLE IF NOT EXISTS Department_Join (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Course_Join (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100) NOT NULL,
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

CREATE TABLE IF NOT EXISTS Student_Join (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Dept_ID INT NULL,
    Course_ID INT NULL,
    City VARCHAR(100),
    FOREIGN KEY (Dept_ID) REFERENCES Department_Join(Dept_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course_Join(Course_ID)
);

CREATE TABLE IF NOT EXISTS Employee_Join (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100) NOT NULL,
    Dept_ID INT,
    Manager_ID INT NULL,
    Salary DECIMAL(10,2),
    FOREIGN KEY (Dept_ID) REFERENCES Department_Join(Dept_ID),
    FOREIGN KEY (Manager_ID) REFERENCES Employee_Join(Emp_ID)
);

INSERT INTO Department_Join VALUES
(1, 'IT', 'Jaipur'), (2, 'HR', 'Delhi'), (3, 'Finance', 'Mumbai'), (4, 'Marketing', 'Pune');
INSERT INTO Course_Join VALUES
(1, 'BCA', '3 years', 90000), (2, 'BBA', '3 years', 105000), (3, 'BCom', '3 years', 75000);
INSERT INTO Student_Join VALUES
(1, 'Aarav Sharma', 20, 1, 1, 'Jaipur'),
(2, 'Priya Singh', 21, 2, 2, 'Delhi'),
(3, 'Rohan Verma', 19, 1, 1, 'Meerut'),
(4, 'Neha Gupta', 22, NULL, 3, 'Jaipur'),
(5, 'Kabir Khan', 20, 3, NULL, 'Mumbai');
INSERT INTO Employee_Join VALUES
(1, 'Amit Kumar', 1, NULL, 80000),
(2, 'Sana Ali', 2, 1, 55000),
(3, 'Vikram Das', 3, 1, 65000),
(4, 'Pooja Mehta', 1, 2, 70000);

-- 1. INNER JOIN Student and Department
SELECT s.Name, d.Dept_Name
FROM Student_Join s
INNER JOIN Department_Join d ON s.Dept_ID = d.Dept_ID;

-- 2. Student names and department names
SELECT s.Name AS student_name, d.Dept_Name AS department_name
FROM Student_Join s
INNER JOIN Department_Join d ON s.Dept_ID = d.Dept_ID;

-- 3. Employee names and department names
SELECT e.Emp_Name, d.Dept_Name
FROM Employee_Join e
INNER JOIN Department_Join d ON e.Dept_ID = d.Dept_ID;

-- 4. Students with course details
SELECT s.Name, c.Course_Name, c.Duration, c.Fees
FROM Student_Join s
INNER JOIN Course_Join c ON s.Course_ID = c.Course_ID;

-- 5. Students in a particular department
SELECT s.Name, d.Dept_Name
FROM Student_Join s
INNER JOIN Department_Join d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'IT';

-- 6. LEFT OUTER JOIN
SELECT s.Name, d.Dept_Name
FROM Student_Join s
LEFT JOIN Department_Join d ON s.Dept_ID = d.Dept_ID;

-- 7. All students, including those without a matching department
SELECT s.Name, d.Dept_Name
FROM Student_Join s
LEFT JOIN Department_Join d ON s.Dept_ID = d.Dept_ID;

-- 8. RIGHT OUTER JOIN
SELECT s.Name, d.Dept_Name
FROM Student_Join s
RIGHT JOIN Department_Join d ON s.Dept_ID = d.Dept_ID;

-- 9. All departments, including departments with no students
SELECT d.Dept_Name, s.Name
FROM Department_Join d
LEFT JOIN Student_Join s ON d.Dept_ID = s.Dept_ID;

-- 10. Students not assigned to a department
SELECT s.*
FROM Student_Join s
LEFT JOIN Department_Join d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- 11. Departments with no students
SELECT d.Dept_ID, d.Dept_Name
FROM Department_Join d
LEFT JOIN Student_Join s ON d.Dept_ID = s.Dept_ID
WHERE s.Student_ID IS NULL;

-- 12. FULL OUTER JOIN workaround in MySQL
SELECT s.Student_ID, s.Name, d.Dept_ID, d.Dept_Name
FROM Student_Join s
LEFT JOIN Department_Join d ON s.Dept_ID = d.Dept_ID
UNION
SELECT s.Student_ID, s.Name, d.Dept_ID, d.Dept_Name
FROM Student_Join s
RIGHT JOIN Department_Join d ON s.Dept_ID = d.Dept_ID;

-- 13. CROSS JOIN
SELECT s.Name, c.Course_Name
FROM Student_Join s
CROSS JOIN Course_Join c;

-- 14. Number of Student-Course combinations
SELECT COUNT(*) AS possible_combinations
FROM Student_Join
CROSS JOIN Course_Join;

-- 15. NATURAL JOIN (shared Dept_ID column)
SELECT Name, Dept_Name
FROM Student_Join
NATURAL JOIN Department_Join;

-- 16. Compare NATURAL JOIN and INNER JOIN
SELECT s.Name, d.Dept_Name
FROM Student_Join s
INNER JOIN Department_Join d ON s.Dept_ID = d.Dept_ID;

SELECT Name, Dept_Name
FROM Student_Join NATURAL JOIN Department_Join;

-- 17. SELF JOIN employee-manager relationships
SELECT e.Emp_Name AS employee, m.Emp_Name AS manager
FROM Employee_Join e
LEFT JOIN Employee_Join m ON e.Manager_ID = m.Emp_ID;

-- 18. Employees along with their managers
SELECT e.Emp_Name AS employee_name, m.Emp_Name AS manager_name
FROM Employee_Join e
LEFT JOIN Employee_Join m ON e.Manager_ID = m.Emp_ID;

-- 19. Join Student, Department and Course
SELECT s.Name, d.Dept_Name, c.Course_Name
FROM Student_Join s
LEFT JOIN Department_Join d ON s.Dept_ID = d.Dept_ID
LEFT JOIN Course_Join c ON s.Course_ID = c.Course_ID;

-- 20. Student name, course name and department name
SELECT s.Name AS student_name, c.Course_Name, d.Dept_Name
FROM Student_Join s
LEFT JOIN Course_Join c ON s.Course_ID = c.Course_ID
LEFT JOIN Department_Join d ON s.Dept_ID = d.Dept_ID;

-- 21. Employees earning more than their department's average salary
SELECT e.Emp_Name, d.Dept_Name, e.Salary
FROM Employee_Join e
INNER JOIN Department_Join d ON e.Dept_ID = d.Dept_ID
WHERE e.Salary > (
    SELECT AVG(e2.Salary)
    FROM Employee_Join e2
    WHERE e2.Dept_ID = e.Dept_ID
);

-- 22. Department having the maximum number of students
SELECT d.Dept_ID, d.Dept_Name, COUNT(s.Student_ID) AS student_count
FROM Department_Join d
LEFT JOIN Student_Join s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name
HAVING COUNT(s.Student_ID) = (
    SELECT MAX(student_count)
    FROM (
        SELECT COUNT(s2.Student_ID) AS student_count
        FROM Department_Join d2
        LEFT JOIN Student_Join s2 ON d2.Dept_ID = s2.Dept_ID
        GROUP BY d2.Dept_ID
    ) AS counts_by_department
);

-- 23. Departments and total number of students
SELECT d.Dept_Name, COUNT(s.Student_ID) AS total_students
FROM Department_Join d
LEFT JOIN Student_Join s ON d.Dept_ID = s.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;

-- 24. Courses and number of enrolled students
SELECT c.Course_Name, COUNT(s.Student_ID) AS enrolled_students
FROM Course_Join c
LEFT JOIN Student_Join s ON c.Course_ID = s.Course_ID
GROUP BY c.Course_ID, c.Course_Name;

-- 25. Complete student-department-course report using joins, grouping and aggregates
SELECT d.Dept_Name,
       c.Course_Name,
       COUNT(s.Student_ID) AS student_count,
       AVG(s.Age) AS average_student_age
FROM Department_Join d
LEFT JOIN Student_Join s ON d.Dept_ID = s.Dept_ID
LEFT JOIN Course_Join c ON s.Course_ID = c.Course_ID
GROUP BY d.Dept_ID, d.Dept_Name, c.Course_ID, c.Course_Name
ORDER BY d.Dept_Name, c.Course_Name;

-- End of Lab Sheets 1-5

-- Separate SQL file for Lab Sheet 2
-- Database: MySQL / MySQL Workbench
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- LAB SHEET 2: DML COMMANDS - INSERT, UPDATE, DELETE
-- =========================================================

-- Reusable practice tables with clean, consistent columns
CREATE TABLE IF NOT EXISTS Student_DML (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100),
    Email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Employee_DML (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2),
    Email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS Department_DML (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS Product_DML (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);

CREATE TABLE IF NOT EXISTS Customer_DML (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS Course_DML (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

-- 1. Insert one student record
INSERT INTO Student_DML (Student_ID, Name, Age, Course, City, Email)
VALUES (1, 'Aarav Sharma', 20, 'BCA', 'Jaipur', 'aarav@example.com');

-- 2. Insert five students using separate statements
INSERT INTO Student_DML VALUES (2, 'Priya Singh', 21, 'BBA', 'Delhi', 'priya@example.com');
INSERT INTO Student_DML VALUES (3, 'Rohan Verma', 19, 'BCA', 'Meerut', 'rohan@example.com');
INSERT INTO Student_DML VALUES (4, 'Neha Gupta', 22, 'BCom', 'Jaipur', 'neha@example.com');
INSERT INTO Student_DML VALUES (5, 'Kabir Khan', 20, 'BCA', 'Delhi', 'kabir@example.com');
INSERT INTO Student_DML VALUES (6, 'Isha Patel', 21, 'BSc', 'Meerut', 'isha@example.com');

-- 3. Multiple rows in one INSERT
INSERT INTO Student_DML (Student_ID, Name, Age, Course, City, Email) VALUES
(7, 'Meera Joshi', 20, 'BCA', 'Mumbai', 'meera@example.com'),
(8, 'Arjun Rao', 23, 'BBA', 'Pune', 'arjun@example.com');

-- 4. Insert Employee records
INSERT INTO Employee_DML VALUES
(1, 'Amit Kumar', 'IT', 55000, 'amit@example.com'),
(2, 'Sana Ali', 'HR', 48000, 'sana@example.com'),
(3, 'Vikram Das', 'Finance', 62000, 'vikram@example.com'),
(4, 'Pooja Mehta', 'IT', 70000, 'pooja@example.com');

-- 5. Insert Department records
INSERT INTO Department_DML VALUES
(1, 'IT', 'Jaipur'), (2, 'HR', 'Delhi'), (3, 'Finance', 'Mumbai'), (4, 'Marketing', 'Pune');

-- 6. Insert Product records
INSERT INTO Product_DML VALUES
(1, 'Keyboard', 850, 25), (2, 'Mouse', 450, 40), (3, 'Monitor', 8500, 10), (4, 'USB Cable', 250, 0);

-- 7. Insert Customer records
INSERT INTO Customer_DML VALUES
(1, 'Anaya Shah', 'anaya@example.com', '9876500001'),
(2, 'Rahul Jain', 'rahul@example.com', '9876500002');

-- 8. Insert Course records
INSERT INTO Course_DML VALUES
(1, 'BCA', '3 years', 90000), (2, 'BBA', '3 years', 105000), (3, 'BCom', '3 years', 75000);

-- 9. Insert a student with all columns
INSERT INTO Student_DML (Student_ID, Name, Age, Course, City, Email)
VALUES (9, 'Dev Malhotra', 20, 'BCA', 'Jaipur', 'dev@example.com');

-- 10. Insert selected columns only
INSERT INTO Student_DML (Student_ID, Name, Course)
VALUES (10, 'Tara Kapoor', 'BSc');

-- 11. Update city of a particular student
UPDATE Student_DML SET City = 'Lucknow' WHERE Student_ID = 2;

-- 12. Update salary of a particular employee
UPDATE Employee_DML SET Salary = 58000 WHERE Emp_ID = 1;

-- 13. Increase all employee salaries by 10%
UPDATE Employee_DML SET Salary = Salary * 1.10;

-- 14. Increase all product prices by 5%
UPDATE Product_DML SET Price = Price * 1.05;

-- 15. Change the course of a student
UPDATE Student_DML SET Course = 'BSc' WHERE Student_ID = 3;

-- 16. Update an employee's department
UPDATE Employee_DML SET Department = 'Operations' WHERE Emp_ID = 2;

-- 17. Change all Meerut students to Delhi
UPDATE Student_DML SET City = 'Delhi' WHERE City = 'Meerut';

-- 18. Update fees for a course
UPDATE Course_DML SET Fees = 95000 WHERE Course_ID = 1;

-- 19. Update multiple student columns at once
UPDATE Student_DML SET Age = 21, City = 'Jaipur' WHERE Student_ID = 4;

-- 20. Delete a particular student
DELETE FROM Student_DML WHERE Student_ID = 10;

-- 21. Delete students from a particular city
-- DELETE FROM Student_DML WHERE City = 'Mumbai';

-- 22. Delete employees whose salary is below a specified amount
-- DELETE FROM Employee_DML WHERE Salary < 40000;

-- 23. Delete products whose quantity is zero
-- DELETE FROM Product_DML WHERE Quantity = 0;

-- 24. Delete using multiple conditions
-- DELETE FROM Student_DML WHERE (City = 'Delhi' AND Age < 20) OR Course = 'BCom';

-- 25. Complete INSERT, UPDATE, DELETE sequence with display after each operation
INSERT INTO Student_DML (Student_ID, Name, Age, Course, City)
VALUES (100, 'Test Student', 19, 'BCA', 'Jaipur');
SELECT * FROM Student_DML WHERE Student_ID = 100;
UPDATE Student_DML SET City = 'Delhi', Age = 20 WHERE Student_ID = 100;
SELECT * FROM Student_DML WHERE Student_ID = 100;
DELETE FROM Student_DML WHERE Student_ID = 100;
SELECT * FROM Student_DML WHERE Student_ID = 100;

-- =========================================================

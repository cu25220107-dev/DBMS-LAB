-- LAB SHEET 1: DDL COMMANDS - CREATE, ALTER, DROP
-- =========================================================

-- 1. Create database
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- 2. Create Student table
CREATE TABLE IF NOT EXISTS Student (
    Student_ID INT,
    Name VARCHAR(100),
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

-- 3. Create Employee table
CREATE TABLE IF NOT EXISTS Employee (
    Emp_ID INT,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- 4. Create Department table
CREATE TABLE IF NOT EXISTS Department (
    Dept_ID INT,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);

-- 5. Create Product table
CREATE TABLE IF NOT EXISTS Product (
    Product_ID INT,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2),
    Quantity INT
);

-- 6. Create Customer table
CREATE TABLE IF NOT EXISTS Customer (
    Customer_ID INT,
    Customer_Name VARCHAR(100),
    Email VARCHAR(255),
    Phone VARCHAR(20)
);

-- 7. Create Course table
CREATE TABLE IF NOT EXISTS Course (
    Course_ID INT,
    Course_Name VARCHAR(100),
    Duration VARCHAR(50),
    Fees DECIMAL(10,2)
);

-- 8. Create Faculty table
CREATE TABLE IF NOT EXISTS Faculty (
    Faculty_ID INT,
    Faculty_Name VARCHAR(100),
    Subject VARCHAR(100),
    Salary DECIMAL(10,2)
);

-- 9. Create Library table
CREATE TABLE IF NOT EXISTS Library (
    Book_ID INT,
    Book_Name VARCHAR(200),
    Author VARCHAR(100),
    Price DECIMAL(10,2)
);

-- 10. Department with Primary Key (use a separate example table to avoid conflict)
CREATE TABLE IF NOT EXISTS Department_PK (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(100),
    Location VARCHAR(100)
);

-- 11. Student with PK and NOT NULL
CREATE TABLE IF NOT EXISTS Student_Constraints (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Age INT,
    Course VARCHAR(100),
    City VARCHAR(100)
);

-- 12. Employee with UNIQUE Email
CREATE TABLE IF NOT EXISTS Employee_Unique (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(100),
    Department VARCHAR(100),
    Salary DECIMAL(10,2),
    Email VARCHAR(255) UNIQUE
);

-- 13. Product with CHECK Price > 0
CREATE TABLE IF NOT EXISTS Product_Check (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(100),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Quantity INT
);

-- 14. Add Email column to Student (guarded by the initial schema)
ALTER TABLE Student ADD COLUMN Email VARCHAR(255);

-- 15. Add Phone column
ALTER TABLE Student ADD COLUMN Phone VARCHAR(20);

-- 16. Modify Name column size/type
ALTER TABLE Student MODIFY COLUMN Name VARCHAR(150);

-- 17. Rename Student table
RENAME TABLE Student TO Student_Details;

-- 18. Rename City column to Address
ALTER TABLE Student_Details RENAME COLUMN City TO Address;

-- 19. Add Salary to Employee
ALTER TABLE Employee ADD COLUMN Salary_Bonus DECIMAL(10,2);

-- 20. Drop Phone column
ALTER TABLE Student_Details DROP COLUMN Phone;

-- 21. Drop Email column
ALTER TABLE Student_Details DROP COLUMN Email;

-- 22. Remove all records using TRUNCATE (example)
-- TRUNCATE TABLE Student_Details;

-- 23. Drop Course table (uncomment to execute)
-- DROP TABLE IF EXISTS Course;

-- 24. Drop Customer table (uncomment to execute)
-- DROP TABLE IF EXISTS Customer;

-- 25. Complete Student table with PK, NOT NULL, UNIQUE and CHECK
CREATE TABLE IF NOT EXISTS Student_Complete (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(255) UNIQUE,
    Age INT CHECK (Age >= 16),
    Course VARCHAR(100),
    City VARCHAR(100)
);
ALTER TABLE Student_Complete ADD COLUMN Phone VARCHAR(20);
ALTER TABLE Student_Complete MODIFY COLUMN Name VARCHAR(150) NOT NULL;
-- Example DROP operation; commented to preserve the completed table:
-- ALTER TABLE Student_Complete DROP COLUMN Phone;

-- =========================================================

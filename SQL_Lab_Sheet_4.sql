-- Separate SQL file for Lab Sheet 4
-- Database: MySQL / MySQL Workbench
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- LAB SHEET 4: SQL OPERATORS
-- =========================================================

-- Arithmetic operators
SELECT 10 + 5 AS addition_result;
SELECT 10 - 5 AS subtraction_result;
SELECT 10 * 5 AS multiplication_result;
SELECT 10 / 5 AS division_result;
SELECT Product_Name, Price, Quantity, Price * Quantity AS total_amount
FROM Product_DML;

-- Logical operators
SELECT * FROM Student_DML WHERE Course = 'BCA' AND City = 'Jaipur';
SELECT * FROM Employee_DML WHERE Department = 'IT' OR Department = 'HR';
SELECT * FROM Student_DML WHERE NOT City = 'Delhi';
SELECT * FROM Student_DML WHERE Course = 'BCA' AND City = 'Jaipur';
SELECT * FROM Employee_DML WHERE Department IN ('IT', 'HR');

-- Comparison operators
SELECT * FROM Student_DML WHERE City = 'Jaipur';
SELECT * FROM Employee_DML WHERE Salary > 50000;
SELECT * FROM Employee_DML WHERE Salary < 60000;
SELECT * FROM Employee_DML WHERE Salary >= 50000 AND Salary <= 70000;
SELECT * FROM Student_DML WHERE City <> 'Delhi';
SELECT * FROM Student_DML WHERE City != 'Delhi';

-- Special operators
SELECT * FROM Employee_DML WHERE Salary BETWEEN 45000 AND 65000;
SELECT * FROM Student_DML WHERE City IN ('Jaipur', 'Delhi');
SELECT * FROM Student_DML WHERE City NOT IN ('Jaipur', 'Delhi');
SELECT * FROM Student_DML WHERE Name LIKE 'A%';
SELECT * FROM Student_DML WHERE Email IS NULL;
SELECT * FROM Student_DML WHERE Email IS NOT NULL;

-- Set operations
SELECT City AS place FROM Student_DML
UNION
SELECT Location AS place FROM Department_DML;

SELECT City AS place FROM Student_DML
UNION ALL
SELECT Location AS place FROM Department_DML;

-- MySQL 8.0.31+ supports INTERSECT and EXCEPT
SELECT City AS place FROM Student_DML
INTERSECT
SELECT Location AS place FROM Department_DML;

SELECT City AS place FROM Student_DML
EXCEPT
SELECT Location AS place FROM Department_DML;

-- Combined operators example
SELECT Product_Name, Price, Quantity, Price * Quantity AS stock_value
FROM Product_DML
WHERE Price > 300 AND Quantity BETWEEN 1 AND 50
  AND Product_Name LIKE '%o%';

-- =========================================================

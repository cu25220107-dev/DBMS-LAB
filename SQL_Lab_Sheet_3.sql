-- Separate SQL file for Lab Sheet 3
-- Database: MySQL / MySQL Workbench
CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- LAB SHEET 3: SQL FUNCTIONS (MySQL)
-- =========================================================

-- A. Number functions
SELECT ABS(-25) AS absolute_value;
SELECT ROUND(123.4567, 2) AS rounded_value;
SELECT CEIL(12.2) AS ceiling_value, FLOOR(12.8) AS floor_value;
SELECT MOD(17, 5) AS remainder;
SELECT Emp_Name, ROUND(Salary) AS rounded_salary FROM Employee_DML;

-- B. Aggregate functions
SELECT COUNT(*) AS total_students FROM Student_DML;
SELECT SUM(Salary) AS total_salary FROM Employee_DML;
SELECT AVG(Salary) AS average_salary FROM Employee_DML;
SELECT MAX(Salary) AS highest_salary FROM Employee_DML;
SELECT MIN(Salary) AS lowest_salary FROM Employee_DML;

-- C. Character functions
SELECT UPPER(Name) AS uppercase_name FROM Student_DML;
SELECT LOWER(Name) AS lowercase_name FROM Student_DML;
SELECT Name, LENGTH(Name) AS name_length_bytes FROM Student_DML;
SELECT CONCAT('Aarav', ' ', 'Sharma') AS full_name;
SELECT SUBSTRING('Database', 1, 4) AS substring_example;
SELECT SUBSTR('Database', 5, 4) AS substr_example;

-- D. Conversion functions
SELECT CAST(123 AS CHAR) AS number_as_string;
SELECT CAST('456' AS UNSIGNED) AS string_as_number;
SELECT DATE_FORMAT('2026-10-13', '%d-%m-%Y') AS formatted_date;
SELECT CAST('2026-10-13' AS DATE) AS cast_date;
SELECT CONVERT('123', UNSIGNED) AS converted_number;

-- E. Date functions
SELECT CURDATE() AS current_date;
SELECT YEAR('2026-10-13') AS year_value,
       MONTH('2026-10-13') AS month_value,
       DAY('2026-10-13') AS day_value;
SELECT DATEDIFF('2026-12-31', '2026-10-13') AS days_between;
SELECT DATE_ADD('2026-10-13', INTERVAL 10 DAY) AS date_after_10_days;
-- Joining-date example: add a Joining_Date column and use DATE_FORMAT
ALTER TABLE Employee_DML ADD COLUMN Joining_Date DATE;
UPDATE Employee_DML SET Joining_Date = '2024-01-15' WHERE Emp_ID = 1;
UPDATE Employee_DML SET Joining_Date = '2023-06-10' WHERE Emp_ID = 2;
UPDATE Employee_DML SET Joining_Date = '2022-09-01' WHERE Emp_ID = 3;
UPDATE Employee_DML SET Joining_Date = '2021-03-20' WHERE Emp_ID = 4;
SELECT Emp_Name, DATE_FORMAT(Joining_Date, '%d/%m/%Y') AS formatted_joining_date
FROM Employee_DML;

-- =========================================================

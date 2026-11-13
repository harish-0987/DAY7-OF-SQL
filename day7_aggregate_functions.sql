-- ====================================================================
-- DAY 7 OF SQL: BASIC LEVEL AGGREGATE FUNCTIONS
-- Topic: COUNT(), SUM(), AVG(), MIN(), MAX() with Few Clean Queries
-- ====================================================================

-- 1. Setup Database & Sample Table
CREATE DATABASE IF NOT EXISTS day7_db;
USE day7_db;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(50) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    bonus DECIMAL(10, 2) DEFAULT NULL
);

-- 2. Insert Sample Records
INSERT INTO employees (emp_name, department, salary, bonus) VALUES
('Harish',  'Engineering', 85000.00, 5000.00),
('Rahul',   'Engineering', 70000.00, 4000.00),
('Priya',   'HR',          55000.00, NULL),       -- NULL bonus to show NULL handling
('Amit',    'Engineering', 95000.00, 6000.00),
('Sneha',   'Finance',     68000.00, 4500.00),
('Ananya',  'Finance',     72000.00, NULL);

-- --------------------------------------------------------------------
-- QUERY 1: COUNT() - Counting Rows and Unique Values
-- --------------------------------------------------------------------
-- Total employees in company (counts all rows)
SELECT COUNT(*) AS total_employees FROM employees;

-- Count employees who received a bonus (ignores NULLs)
SELECT COUNT(bonus) AS employees_with_bonus FROM employees;

-- Count distinct departments
SELECT COUNT(DISTINCT department) AS total_departments FROM employees;

-- --------------------------------------------------------------------
-- QUERY 2: SUM() - Total Sum of Column Values
-- --------------------------------------------------------------------
-- Total monthly payroll expenditure
SELECT SUM(salary) AS total_payroll FROM employees;

-- --------------------------------------------------------------------
-- QUERY 3: AVG() - Mathematical Mean with Decimal Rounding
-- --------------------------------------------------------------------
-- Average salary across the company rounded to 2 decimal places
SELECT ROUND(AVG(salary), 2) AS average_salary FROM employees;

-- --------------------------------------------------------------------
-- QUERY 4: MIN() & MAX() - Lowest and Highest Values
-- --------------------------------------------------------------------
-- Find the lowest and highest salary paid
SELECT 
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary
FROM employees;

-- --------------------------------------------------------------------
-- QUERY 5: ALL-IN-ONE SUMMARY (Company-Wide Overview)
-- --------------------------------------------------------------------
-- Single row dashboard summary using all aggregate functions
SELECT 
    COUNT(*) AS total_staff,
    SUM(salary) AS total_payroll,
    ROUND(AVG(salary), 2) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees;

-- --------------------------------------------------------------------
-- QUERY 6: BASIC GROUP BY (Aggregates Per Category)
-- --------------------------------------------------------------------
-- Department-level breakdown using COUNT and AVG
SELECT 
    department,
    COUNT(*) AS staff_count,
    ROUND(AVG(salary), 2) AS avg_dept_salary
FROM employees
GROUP BY department;

# 📘 Day 7 of SQL: Aggregate Functions in SQL

Welcome to **Day 7 of SQL**! 🚀

Today we focus on one of the most powerful and fundamental features in SQL for data analysis and reporting: **Aggregate Functions**.

---

## 📑 Table of Contents
1. [What is an Aggregate Function?](#1-what-is-an-aggregate-function)
2. [Scalar vs Aggregate Functions](#2-scalar-vs-aggregate-functions)
3. [How Aggregate Functions Handle NULLs](#3-how-aggregate-functions-handle-nulls)
4. [The 5 Core Aggregate Functions](#4-the-5-core-aggregate-functions)
   - [1. COUNT()](#1-count)
   - [2. SUM()](#2-sum)
   - [3. AVG()](#3-avg)
   - [4. MIN()](#4-min)
   - [5. MAX()](#5-max)
5. [All-in-One Summary Query](#5-all-in-one-summary-query)
6. [Aggregate Functions with WHERE Clause](#6-aggregate-functions-with-where-clause)
7. [Basic Aggregate Functions with GROUP BY](#7-basic-aggregate-functions-with-group-by)
8. [Summary Cheat Sheet](#8-summary-cheat-sheet)

---

## 1. What is an Aggregate Function?

An **Aggregate Function** in SQL takes multiple values from a column across multiple rows, performs a mathematical calculation on them, and returns a **single summarized value**.

```
  Multiple Row Values               Single Result
┌─────────────────────┐
│ salary: 85,000      │
│ salary: 70,000      │ ───────►  AVG(salary) ───────►  74,166.67
│ salary: 55,000      │
│ salary: 95,000      │
│ salary: 68,000      │
│ salary: 72,000      │
└─────────────────────┘
```

---

## 2. Scalar vs Aggregate Functions

| Feature | Scalar Function | Aggregate Function |
| :--- | :--- | :--- |
| **Input** | Takes a single value per row | Takes multiple values across many rows |
| **Output** | Returns one value for each row | Returns a single summarized result |
| **Examples** | `UPPER()`, `LOWER()`, `LENGTH()`, `ROUND()` | `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()` |

---

## 3. How Aggregate Functions Handle NULLs

- **Most aggregate functions (`SUM`, `AVG`, `MIN`, `MAX`, `COUNT(column)`) ignore `NULL` values.**
- **`COUNT(*)` is the only exception**: it counts **all** rows, including those where columns contain `NULL`.
- **`COUNT(column_name)`** counts only rows where that specific column is **not `NULL`**.

---

## 4. The 5 Core Aggregate Functions

### 1. COUNT()
Counts the number of rows or non-null values.

- **`COUNT(*)`**: Counts every row in the table.
  ```sql
  SELECT COUNT(*) AS total_employees FROM employees;
  ```
- **`COUNT(column)`**: Counts only rows where the column is not `NULL`.
  ```sql
  SELECT COUNT(bonus) AS employees_with_bonus FROM employees;
  ```
- **`COUNT(DISTINCT column)`**: Counts only unique, non-duplicate values.
  ```sql
  SELECT COUNT(DISTINCT department) AS total_departments FROM employees;
  ```

---

### 2. SUM()
Calculates the total mathematical sum of a numeric column.

```sql
-- Total company payroll expenditure
SELECT SUM(salary) AS total_payroll FROM employees;
```

---

### 3. AVG()
Calculates the arithmetic mean (average) of a numeric column.
> **Tip**: Pair `AVG()` with `ROUND(..., 2)` to format results to 2 decimal places.

```sql
-- Average employee salary
SELECT ROUND(AVG(salary), 2) AS average_salary FROM employees;
```

---

### 4. MIN()
Finds the lowest (minimum) value in a column.
- Works on **numbers** (lowest number).
- Works on **dates** (earliest date).
- Works on **text** (first alphabetically).

```sql
SELECT MIN(salary) AS lowest_salary FROM employees;
```

---

### 5. MAX()
Finds the highest (maximum) value in a column.
- Works on **numbers** (highest number).
- Works on **dates** (latest date).
- Works on **text** (last alphabetically).

```sql
SELECT MAX(salary) AS highest_salary FROM employees;
```

---

## 5. All-in-One Summary Query

You can run all aggregate functions together in a single `SELECT` statement to create an executive metrics dashboard in one row:

```sql
SELECT 
    COUNT(*) AS total_staff,
    SUM(salary) AS total_payroll,
    ROUND(AVG(salary), 2) AS avg_salary,
    MIN(salary) AS lowest_salary,
    MAX(salary) AS highest_salary
FROM employees;
```

---

## 6. Aggregate Functions with WHERE Clause

When used with a `WHERE` clause, the aggregate function is applied **only to rows that match the condition**:

```sql
-- Calculate metrics only for the Engineering department
SELECT 
    COUNT(*) AS engineering_count,
    ROUND(AVG(salary), 2) AS avg_engineering_salary,
    SUM(salary) AS total_engineering_cost
FROM employees
WHERE department = 'Engineering';
```

---

## 7. Basic Aggregate Functions with GROUP BY

Combine aggregate functions with `GROUP BY` to see summary metrics for each category or department:

```sql
SELECT 
    department,
    COUNT(*) AS staff_count,
    ROUND(AVG(salary), 2) AS avg_salary,
    MIN(salary) AS min_salary,
    MAX(salary) AS max_salary
FROM employees
GROUP BY department;
```

---

## 8. Summary Cheat Sheet

| Function | Purpose | Handles NULLs? | Works on Data Types |
| :--- | :--- | :--- | :--- |
| **`COUNT(*)`** | Counts total rows | Counts all rows | All |
| **`COUNT(col)`**| Counts non-null rows | Ignores `NULL` | All |
| **`COUNT(DISTINCT col)`** | Counts unique non-null rows | Ignores `NULL` | All |
| **`SUM(col)`** | Calculates total sum | Ignores `NULL` | Numeric only |
| **`AVG(col)`** | Calculates average value | Ignores `NULL` | Numeric only |
| **`MIN(col)`** | Finds smallest value | Ignores `NULL` | Numeric, Date, String |
| **`MAX(col)`** | Finds largest value | Ignores `NULL` | Numeric, Date, String |

---

⭐ **Stay tuned for Day 8!** Keep practicing and writing queries.

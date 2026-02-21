# hr-analytics-project
**HR Analytics Project:**

This project uses MySQL to analyze employee attrition data and identify key factors affecting workforce turnover, supporting data-driven HR decisions.

**KEY OBJECTIVES**

Analyze employee attrition using MySQL
Identify departments and roles with high turnover
Understand the impact of salary and experience on attrition
Provide data-driven insights to improve employee retention

**This project is useful**

This project is useful for understanding employee attrition patterns, identifying high-risk workforce segments, and supporting data-driven HR decisions to improve employee retention.
sample use cases
Identifying departments with high employee attrition
Analyzing salary and experience levels linked to turnover
Supporting HR in improving retention and hiring strategies
Helping management make data-driven workforce decisions

**queries classification**

Simple Queries:
 		 SELECT, WHERE, ORDER BY
Intermediate Queries: 
		GROUP BY, HAVING, LIMITS, JOINS
Advanced Queries: 
		CTE, Sub query, Window function ,
		 Functions , Store procedures, Views


**TABLES**

CREATE DATABASE hr_analytics;

USE hr_analytics;

CREATE TABLE departments (
	dept_id INT PRIMARY KEY,
	dept_name VARCHAR(50)
	);


CREATE TABLE jobs (

    job_id INT PRIMARY KEY,
	
    job_title VARCHAR(50)
	
);

CREATE TABLE employees (

    emp_id INT PRIMARY KEY,
	
    emp_name VARCHAR(50),
	
    gender VARCHAR(10),
    age INT,
	
    dept_id INT,
	
    job_id INT,
	
    hire_date DATE,
	
    attrition VARCHAR(5),   -- Yes / No
	
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
	
    FOREIGN KEY (job_id) REFERENCES jobs(job_id)
	
);

CREATE TABLE salaries (

    emp_id INT,
	
    salary INT,
	
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE performance (

    emp_id INT,
	
    performance_rating INT,   -- 1 to 5
	
    years_at_company INT,
	
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);



**VALUE INSERT**

INSERT INTO departments VALUES

(1,'HR'),(2,'IT'),(3,'Sales'),(4,'Finance');
INSERT INTO jobs VALUES
(1,'HR Executive'),
(2,'Software Engineer'),
(3,'Sales Executive'),
(4,'Accountant');
INSERT INTO employees VALUES
(101,'Asha','Female',26,2,2,'2021-06-10','Yes'),
(102,'Rahul','Male',30,3,3,'2020-01-15','No'),
(103,'Sneha','Female',24,2,2,'2022-08-01','Yes'),
(104,'Vikram','Male',35,4,4,'2018-03-20','No'),
(105,'Neha','Female',29,1,1,'2019-11-11','No');
INSERT INTO salaries VALUES
(101,35000),(102,45000),(103,32000),(104,60000),(105,40000);
INSERT INTO performance VALUES
(101,3,2),(102,4,4),(103,2,1),(104,5,6),(105,4,5);
		 
**SCHEMA- STAR SCHEMA –HR DATABASE**
     
<img width="1536" height="1024" alt="ChatGPT Image Feb 21, 2026, 03_29_34 PM" src="https://github.com/user-attachments/assets/498e97df-9ec5-40f4-8ff3-b73bb08acf67" />

**Constraints**

**Unique Key:**

A unique key in MySQL is a single field or combination of fields that ensure all values going to store into the column will be unique. It means a column cannot stores duplicate

**Primary Key:**

MySQL primary key is a single or combination of the field, which is used to identify each record in a table uniquely. If the column contains primary key constraints, then it cannot be null or empty. A table may have duplicate columns, but it can contain only one primary key. It always contains unique value into a column.

**Foreign Key:**

The foreign key is used to link one or more than one table together. It is also known as the referencing key. A foreign key matches the primary key field of another table. It means a foreign key field in one table refers to the primary key field of the other table. It identifies each row of another table uniquely that maintains the referential integrity in MySQL.

**NOT NULL:**

The NOT NULL constraint is a column constraint that ensures values stored in a column are not NULL.

**Main Database Tables**

Employees – Stores employee personal details, department, job role, experience, income, and attrition status

Departments – Contains department IDs and department names

Job_Roles – Stores job role IDs and role names<img width="970" height="258" alt="image" src="https://github.com/user-attachments/assets/d0d4a724-0c24-4ddf-b099-df1c847c97fc" />


Salaries – Stores employee salary, bonus, and year-wise compensation details

**SELECT * from departments;**

<img width="970" height="336" alt="image" src="https://github.com/user-attachments/assets/7ade000a-1866-4ab4-89bd-fae89052eac7" />


**SELECT * FROM employees;**

<img width="1035" height="287" alt="Screenshot 2026-02-21 154429" src="https://github.com/user-attachments/assets/6947f169-8d60-4dc6-90b1-6afc1f028c5b" />


**SELECT * FROM jobs;**


<img width="970" height="258" alt="image" src="https://github.com/user-attachments/assets/0dc532c1-f1ac-4ab2-9880-4bb91170225f" />

**SELECT * FROM performance;**


<img width="993" height="237" alt="image" src="https://github.com/user-attachments/assets/75265e0d-9030-485f-a5e2-0df13f66a127" />


**SELECT * FROM salaries;**



<img width="1022" height="237" alt="image" src="https://github.com/user-attachments/assets/090385ff-94cd-460a-80ad-b52d969aa51e" />

**What is WHERE condition?**

The WHERE condition is used in SQL to filter records and return only the rows that meet specific conditions.

SELECT *
FROM employees
WHERE attrition = 'Yes';


<img width="972" height="291" alt="image" src="https://github.com/user-attachments/assets/67702a1f-e3a2-44dd-9355-7753833908c3" />


What is GROUP BY?

GROUP BY is used in SQL to group rows with the same values and apply aggregate functions to each group.

SELECT dept_id, COUNT(*) AS total_employees
FROM employees
GROUP BY dept_id;



<img width="966" height="280" alt="image" src="https://github.com/user-attachments/assets/47fb86d3-5461-453c-989c-a77e8f6af8f7" />

What is HAVING?

HAVING is used in SQL to filter grouped results (after GROUP BY).

 WHERE filters rows before grouping
 HAVING filters groups after grouping

 SELECT dept_id, COUNT(emp_id) AS total_employees
FROM employees
GROUP BY dept_id
HAVING COUNT(emp_id) > 1;
 

 <img width="1008" height="246" alt="image" src="https://github.com/user-attachments/assets/ce876aef-6f74-42da-96c7-4805a5745405" />


 What is ORDER BY?

ORDER BY is used in SQL to sort the result set in ascending or descending order.

 It works after SELECT, WHERE, GROUP BY, and HAVING.

 SELECT emp_name, age
FROM employees
ORDER BY age ASC;


 <img width="1008" height="311" alt="image" src="https://github.com/user-attachments/assets/fd5998cf-0094-42f5-8ec9-3fc86d3611dd" />

 What is CASE function?

The CASE function in SQL is used to apply conditional logic (like IF–ELSE) inside a query.

 It returns values based on conditions.

 SELECT emp_name, age,
CASE
  WHEN age < 25 THEN 'Young'
  WHEN age BETWEEN 25 AND 35 THEN 'Mid-age'
  ELSE 'Senior'
END AS age_group
FROM employees;

<img width="975" height="427" alt="image" src="https://github.com/user-attachments/assets/93fd1ee7-bfca-4933-abdc-271b6ad76085" />

What is JOIN?

A JOIN in SQL is used to combine rows from two or more tables based on a related column (usually a primary key and foreign key).

 It helps retrieve meaningful information stored across multiple tables.

 Types of JOIN

INNER JOIN – Matching records only

LEFT JOIN – All records from left table

RIGHT JOIN – All records from right table

FULL JOIN – All records from both tables

LEFT JOIN

LEFT JOIN returns all rows from the left table and matching rows from the right table, with NULL for non-matching records.

SELECT e.emp_name, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_id = s.emp_id;


<img width="1016" height="312" alt="image" src="https://github.com/user-attachments/assets/d4638e90-c6ca-42df-9118-11b63b63be39" />


What is CTE (Common Table Expression)?

A CTE is a temporary result set that you define using the WITH keyword and use inside a main SQL query.
It makes complex queries easier to read, write, and maintain.

Think of CTE as a temporary table that exists only during query execution.


WITH attrition_cte AS (
    SELECT emp_id, emp_name, dept_id
    FROM employees
    WHERE attrition = 'Yes'
)
SELECT *
FROM attrition_cte;

<img width="1082" height="357" alt="image" src="https://github.com/user-attachments/assets/bda96d5d-b7d2-421c-875b-3b3916ac3377" />


What is a Window Function?

A window function performs calculations across a set of rows related to the current row without collapsing rows (unlike GROUP BY).

Each row keeps its identity, but you still get aggregates, ranks, or running totals.

SELECT emp_name, dept_id,
ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY emp_id) AS row_num
FROM employees;


<img width="1011" height="280" alt="image" src="https://github.com/user-attachments/assets/faf13392-b229-484b-92f7-8c0ec0a4b6f7" />


What is a VIEW?

A VIEW is a virtual table created from a SQL query.
It does not store data physically—it stores only the query definition.

When you select from a VIEW, the database runs the underlying query.


CREATE VIEW employee_basic_view AS
SELECT e.emp_id, e.emp_name, d.dept_name, j.job_title
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN jobs j ON e.job_id = j.job_id;

What is a Stored Procedure?

A Stored Procedure is a precompiled set of SQL statements stored in the database and executed using a single command.

 It helps reuse logic, improve performance, and maintain consistency.


 DELIMITER $$

CREATE PROCEDURE get_employees_by_dept(IN deptId INT)
BEGIN
    SELECT e.emp_name, d.dept_name
    FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id
    WHERE e.dept_id = deptId;
END $$

DELIMITER ;

What is a Function (SQL)?

A function in SQL is a stored program that returns a single value after performing a calculation or operation.
It can be used inside SELECT statements.

Think of a function as input → process → output (one value).


DELIMITER $$

CREATE FUNCTION get_salary(empId INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE emp_salary INT;

    SELECT salary INTO emp_salary
    FROM salaries
    WHERE emp_id = empId;

    RETURN emp_salary;
END $$

DELIMITER ;

 **Conclusion**

This project successfully demonstrates how MySQL can be used to analyze HR data and identify employee attrition patterns. By applying SQL concepts such as JOINs, GROUP BY, HAVING, CASE, CTEs, window functions, views, stored procedures, and functions, meaningful insights were generated on workforce distribution, performance, salary trends, and attrition. The analysis supports data-driven HR decision-making and helps organizations improve employee retention and workforce planning.



















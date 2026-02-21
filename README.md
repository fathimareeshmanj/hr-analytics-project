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
















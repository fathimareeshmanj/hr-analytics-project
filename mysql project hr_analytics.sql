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

SELECT attrition, COUNT(*) AS total
FROM employees
GROUP BY attrition;

SELECT d.dept_name, COUNT(e.emp_id) AS attrition_count
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.attrition = 'Yes'
GROUP BY d.dept_name;

SELECT AVG(s.salary) AS avg_salary
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id
WHERE e.attrition = 'Yes';

SELECT 
    CASE 
        WHEN years_at_company < 2 THEN '0-2 years'
        WHEN years_at_company BETWEEN 2 AND 5 THEN '2-5 years'
        ELSE '5+ years'
    END AS experience_group,
    COUNT(*) AS employees_left
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
WHERE attrition = 'Yes'
GROUP BY experience_group;

SELECT e.emp_name, p.performance_rating
FROM employees e
JOIN performance p ON e.emp_id = p.emp_id
ORDER BY p.performance_rating DESC;

SELECT e.emp_name, s.salary,
RANK() OVER (ORDER BY s.salary DESC) AS salary_rank
FROM employees e
JOIN salaries s ON e.emp_id = s.emp_id;

CREATE VIEW hr_summary AS
SELECT e.emp_name, d.dept_name, j.job_title, s.salary, p.performance_rating
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN jobs j ON e.job_id = j.job_id
JOIN salaries s ON e.emp_id = s.emp_id
JOIN performance p ON e.emp_id = p.emp_id;

SELECT * from departments;
SELECT * FROM employees;


















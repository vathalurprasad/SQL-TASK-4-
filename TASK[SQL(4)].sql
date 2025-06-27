-- Table 1: employees
CREATE TABLE employees (
  emp_id INTEGER PRIMARY KEY,
  first_name TEXT,
  dept TEXT,
  salary REAL
);

INSERT INTO employees VALUES
(1, 'Alice', 'Sales', 55000),
(2, 'Bob', 'HR', 48000),
(3, 'Charlie', 'IT', 62000),
(4, 'Diana', 'IT', 69000),
(5, 'Eva', 'Marketing', 53000),
(6, 'Frank', 'Sales', 59000);

Select*from employees;
-- Table 2: orders
CREATE TABLE orders (
  order_id INTEGER PRIMARY KEY,
  emp_id INTEGER,
  order_date DATE,
  amount REAL,
  status TEXT,
  FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

INSERT INTO orders VALUES
(101, 1, '2022-05-10', 1500, 'Completed'),
(102, 3, '2022-05-12', 2300, 'Completed'),
(103, 1, '2022-05-13', 500, 'Pending'),
(104, 4, '2022-05-14', 1200, 'Cancelled'),
(105, 2, '2022-05-15', 700, 'Completed'),
(106, 3, '2022-05-18', 1800, 'Pending'),
(107, 5, '2022-05-20', 1100, 'Completed'),
(108, 6, '2022-05-22', 1400, 'Completed'),
(109, 6, '2022-05-23', 800, 'Pending');

select*from orders;

SELECT SUM(salary) AS total_salary FROM employees;

SELECT AVG(salary) AS avg_salary FROM employees;

SELECT dept, COUNT(*) AS num_employees
FROM employees
GROUP BY dept;

SELECT dept, SUM(salary) AS total_salary
FROM employees
GROUP BY dept;

SELECT AVG(amount) AS avg_order FROM orders;

SELECT emp_id, SUM(amount) AS total_amount
FROM orders
GROUP BY emp_id;

SELECT status, COUNT(*) AS count_orders
FROM orders
GROUP BY status;

SELECT dept, MAX(salary) AS max_sal, MIN(salary) AS min_sal
FROM employees
GROUP BY dept;


SELECT emp_id, COUNT(*) AS order_count
FROM orders
GROUP BY emp_id
HAVING COUNT(*) > 1;

SELECT emp_id, SUM(amount) AS total_spent
FROM orders
GROUP BY emp_id
HAVING SUM(amount) > 2000;

SELECT dept, AVG(salary) AS avg_salary
FROM employees
GROUP BY dept
HAVING AVG(salary) > 55000;

SELECT status, SUM(amount) AS total_amount
FROM orders
GROUP BY status;

SELECT ROUND(AVG(amount), 2) AS rounded_avg_order
FROM orders;

SELECT COUNT(*) AS total_employees FROM employees;

SELECT
  CASE
    WHEN salary < 55000 THEN 'Low'
    WHEN salary BETWEEN 55000 AND 65000 THEN 'Medium'
    ELSE 'High'
  END AS salary_group,
  COUNT(*) AS count_employees
FROM employees
GROUP BY salary_group;

SELECT dept, MAX(salary) AS highest_salary
FROM employees
GROUP BY dept;
SELECT e.dept, AVG(o.amount) AS avg_order
FROM employees e
JOIN orders o ON e.emp_id = o.emp_id
WHERE e.dept = 'IT'
GROUP BY e.dept;

SELECT emp_id, status, COUNT(*) AS total_orders
FROM orders
GROUP BY emp_id, status;






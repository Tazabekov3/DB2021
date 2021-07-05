--From lab3 file
CREATE TABLE departments (
  code INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  budget DECIMAL NOT NULL
);

CREATE TABLE employees (
  ssn INTEGER PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  department INTEGER NOT NULL ,
  city VARCHAR(255),
  FOREIGN KEY (department) REFERENCES departments(code)
);

CREATE TABLE customers (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL ,
  lastname VARCHAR(255) NOT NULL ,
  city VARCHAR(255)
);

INSERT INTO departments(code,name,budget) VALUES(14,'IT',65000);
INSERT INTO departments(code,name,budget) VALUES(37,'Accounting',15000);
INSERT INTO departments(code,name,budget) VALUES(59,'Human Resources',240000);
INSERT INTO departments(code,name,budget) VALUES(77,'Research',55000);
INSERT INTO departments(code,name,budget) VALUES(45,'Management',155000);
INSERT INTO departments(code,name,budget) VALUES(11,'Sales',85000);

INSERT INTO employees(ssn,name,lastname,department, city) VALUES('123234877','Michael','Rogers',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('152934485','Anand','Manikutty',14, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('222364883','Carol','Smith',37, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('326587417','Joe','Stevens',37, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332154719','Mary-Anne','Foster',14, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('332569843','George','ODonnell',77, 'Astana');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('546523478','John','Doe',59, 'Shymkent');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('631231482','David','Smith',77, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('654873219','Zacary','Efron',59, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('745685214','Eric','Goldsmith',59, 'Atyrau');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657245','Elizabeth','Doe',14, 'Almaty');
INSERT INTO employees(ssn,name,lastname,department, city) VALUES('845657246','Kumar','Swamy',14, 'Almaty');



INSERT INTO customers(name,lastname, city) VALUES('John','Wills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Garry','Foster', 'London');
INSERT INTO customers(name,lastname, city) VALUES('Amanda','Hills', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('George','Doe', 'Tokyo');
INSERT INTO customers(name,lastname, city) VALUES('David','Little', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Shawn','Efron', 'Astana');
INSERT INTO customers(name,lastname, city) VALUES('Eric','Gomez', 'Shymkent');
INSERT INTO customers(name,lastname, city) VALUES('Elizabeth','Tailor', 'Almaty');
INSERT INTO customers(name,lastname, city) VALUES('Julia','Adams', 'Astana');



--Debug commands
SELECT budget FROM departments;

SELECT name FROM departments;

SELECT * FROM departments
ORDER BY budget DESC;

SELECT count(*), department FROM employees
GROUP BY department;

SELECT DISTINCT department FROM employees;

DROP TABLE departments, employees, customers;



--Select the last name of all employees
SELECT lastname FROM employees;



--Select the last name of all employees, without duplicates
SELECT DISTINCT lastname FROM employees;



--Select all data of employees with last name "Smith"
SELECT * FROM employees
WHERE lastname = 'Smith';



--Select all data of employees with last name "Smith" or "Doe"
SELECT * FROM employees
WHERE lastname = 'Smith' OR lastname = 'Doe';



--Select all data of employees working in department 14
SELECT * FROM employees
WHERE department = 14;



--Select all data of employees working in department 37 or department 77
SELECT * FROM employees
WHERE department = 37 OR department = 77;



--Select sum of all departments' budgets
SELECT sum(budget) AS summa FROM departments;



--Select the number of employees in each department
SELECT department, count() AS number_of_emp FROM employees;



--Select the department code with more than 2 employees
SELECT department FROM employees
GROUP BY department
HAVING count(*) > 2;



--Select the name of the department with second highest budget
SELECT name FROM departments
ORDER BY budget DESC
LIMIT 1
OFFSET 1;



--Select the name and last name of employees working in departments with lowest budget
SELECT name, lastname FROM employees
WHERE department = (
    SELECT code FROM departments
    WHERE budget = (SELECT min(budget) FROM departments));



--Select the name of all employees and customers from Almaty
SELECT name, lastname FROM employees
WHERE city = 'Almaty'
UNION
SELECT name, lastname FROM customers
WHERE city = 'Almaty';



--Select departments with budget exceeding 60k
SELECT * FROM departments
ORDER BY budget ASC, code DESC;



--Reduce the budget of the department with lowest budget by 10%
UPDATE departments
SET budget = budget * 0.9
WHERE budget = (SELECT min(budget) FROM departments);



--Reassign all employees from Research department to IT department
UPDATE employees
SET department = 14
WHERE department = 77;




--Delete all employees from IT department
DELETE FROM employees AS e USING departments AS d
WHERE e.department = d.code AND d.name = 'IT';



--Delete all employees
DELETE FROM employees;
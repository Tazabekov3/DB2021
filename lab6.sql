--Debug commands
INSERT INTO locations(street_address, postal_code, city, state_province)
VALUES ('Windsor', '0001', 'London', 'UK'),
       ('Andropov', '0002', 'Moscow', 'RF'),
       ('Lincoln', '0003', 'Washington', 'USA'),
       ('Koshkarbayev', '0004', 'Astana', 'RK'),
       ('Ling Tian', '0005', 'Beijing', 'PRC');

SELECT * FROM locations;

INSERT INTO departments(department_name, budget, location_id)
VALUES ('IT', 500000, 5),
       ('Management', 400000, 1),
       ('Chemistry', 450000, 2),
       ('HR', 100000, 3),
       ('Johnny Deppartment', 200000, 4),
       ('Ran Out of Ideas', 350000, 5);

SELECT * FROM departments;

INSERT INTO employees(first_name, last_name, email, phone_number, salary, manager_id, department_id)
VALUES ('Bilbo', 'Beggins', 'bilbeg@gmail.com', '12345678', 10000, null, 1),
       ('John', 'Doe', 'corpse@gmail.com', '23456781', 11000, null, 3),
       ('Trevor', 'Henderson', 'siren@gmail.com', '34567812', 8000, 4, 4),
       ('Abay', 'Omirzakov', 'omirzaq@gmail.com', '45678123', 6700, 2, 2),
       ('Ivan', 'Ivanov', 'ivanych@gmail.com', '56781234', 10300, null, 3),
       ('Tetsutetsu', 'Tetsutetsu', 'ironiron@gmail.com', '67812345', 9000, 1, 1),
       ('Babay', 'Yokarny', 'yadryonavosh@gmail.com', '78123456', 8500, 5, 5),
       ('George', 'Johnson', 'johngeo@gmail.com', '81234567', 7200, 2, 2);

SELECT * FROM employees;



--Create database called "lab6"
CREATE DATABASE lab6;



--Create following tables
CREATE TABLE locations (
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

CREATE TABLE departments (
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

CREATE TABLE employees (
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(10),
    salary integer,
    manager_id integer references employees,
    department_id integer references departments
);

CREATE TABLE job_grades (
    grade char(1),
    lowest_salary integer,
    highest_salary integer
);



--Select those employees who contain a letter b to their last name and also display their first name, department_id, city, and state province
SELECT e.first_name, e.last_name, e.department_id, l.city, l.state_province FROM employees e
INNER JOIN departments d ON d.department_id = e.department_id
INNER JOIN locations l ON l.location_id = d.location_id
WHERE e.last_name LIKE 'B%' OR e.last_name LIKE '%b%';



--Select the department name, city, and state province for each department
SELECT d.department_name, l.city, l.state_province FROM departments d
INNER JOIN locations l on d.location_id = l.location_id;



--Select the first name of all employees and the first name of their manager including those who does not work under any manager
SELECT e1.first_name AS employee, e2.first_name AS manager FROM employees e1
LEFT OUTER JOIN employees e2 on e1.manager_id = e2.employee_id;


--Select the grade level and average salary of employees for each grade



--Select the first and last name of those employees who work in any department located in London
SELECT e.first_name, e.last_name FROM employees e
INNER JOIN departments d on d.department_id = e.department_id
INNER JOIN locations l on d.location_id = l.location_id
WHERE l.city = 'London';
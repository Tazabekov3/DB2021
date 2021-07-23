--Debug commands
CREATE TABLE countries (
    name varchar(50),
    population integer
);

CREATE TABLE employees (
    id serial primary key,
    name varchar(50),
    surname varchar(50),
    salary integer,
    department_id integer
);

CREATE TABLE departments (
    department_id serial primary key,
    name varchar(50),
    budget integer
);



--1st task
CREATE INDEX task1_index ON countries(name);



--2nd task
CREATE INDEX task2_index ON employees(name, surname);



--3rd task
CREATE UNIQUE INDEX task3_index ON employees(salary) WHERE salary BETWEEN 10 AND 20;



--4th task
CREATE INDEX task4_index ON employees(name) WHERE name LIKE 'abcd%';
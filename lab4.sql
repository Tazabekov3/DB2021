--Debug commands
SELECT * FROM salesmen;

SELECT * FROM customers;

SELECT * FROM orders;



--Create database "lab5"
CREATE DATABASE lab5;



--Create tables "customers" and "orders"
CREATE TABLE salesmen (
    salesman_id integer primary key,
    name varchar(255),
    city varchar(255),
    commission numeric(3, 2)
);

INSERT INTO salesmen
VALUES (5001, 'James Hood', 'New York', 0.15),
       (5002, 'Nail Knite', 'Paris', 0.13),
       (5005, 'Pit Alex', 'London', 0.11),
       (5006, 'Mc Lyon', 'Paris', 0.14),
       (5003, 'Lauson Hen', NULL, 0.12),
       (5007, 'Paul Adam', 'Rome', 0.13);

CREATE TABLE customers (
    customer_id integer primary key,
    cust_name varchar(255),
    city varchar(255),
    grade integer,
    salesman_id integer references salesmen(salesman_id)
);

INSERT INTO customers
VALUES (3002, 'Nick Rimando', 'New York', 100, 5001),
       (3005, 'Graham Zusi', 'California', 200, 5002),
       (3001, 'Brad Guzan', 'London', NULL, 5005),
       (3004, 'Fabian Johns', 'Paris', 300, 5006),
       (3007, 'Brad Davis', 'New York', 200, 5001),
       (3009, 'Geoff Camero', 'Berlin', 100, 5003),
       (3008, 'Julian Green', 'London', 300, 5002);

CREATE TABLE orders (
    ord_no integer primary key,
    purch_amt numeric(7, 2),
    ord_date date,
    customer_id integer references customers(customer_id),
    salesman_id integer references salesmen(salesman_id)
);

INSERT INTO orders
VALUES (7001, 150.5, '2021-10-05', 3005, 5002),
       (7009, 270.65, '2012-09-10', 3001, 5005),
       (7002, 65.26, '2012-10-05', 3002, 5001),
       (7004, 110.5, '2012-08-17', 3009, 5003),
       (7007, 948.5, '2012-09-10', 3005, 5002),
       (7005, 2400.6, '2012-07-27', 3007, 5001),
       (7008, 5760, '2012-09-10', 3002, 5001);



--Select the total purchase amount of all orders
SELECT sum(purch_amt) AS total_amt FROM orders;



--Select the average purchase amount of all orders
SELECT avg(purch_amt) AS avg_amt FROM orders;



--Select how many customer have listed their names
SELECT count(cust_name) AS number FROM customers
WHERE cust_name IS NOT NULL;



--Select the minimum purchase amount of all the orders
SELECT min(purch_amt) AS min_amt FROM orders;



--Select customer with all information whose name ends with the letter "b"
SELECT * FROM customers
WHERE cust_name LIKE '%b';



--Select orders which were made by customers from "New York"
SELECT o.ord_no, o.ord_date, c.cust_name FROM orders AS o, customers AS c
WHERE o.customer_id = c.customer_id AND c.city = 'New York';



--Select customers with all information who has order with purchase amount more than 10
SELECT o.ord_no, c.customer_id, c.cust_name, o.purch_amt FROM customers AS c, orders AS o
WHERE c.customer_id = o.customer_id AND o.purch_amt > 10;



--Select total grade of all customers
SELECT sum(grade) AS total_grade FROM customers;



--Select all customers who have listed their names
SELECT cust_name FROM customers
WHERE cust_name IS NOT NULL;



--Select the maximum grade of all the customers
SELECT max(grade) AS max_grade FROM customers;
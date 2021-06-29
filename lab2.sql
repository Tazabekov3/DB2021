--Debug commands
SELECT * FROM countries;

DROP TABLE countries;

INSERT INTO countries (region_id, population)
VALUES (1, 1000);

SELECT * FROM countries_new;

INSERT INTO countries_new (country_id, region_id, population)
VALUES (1, 1, 1000),
       (2, 2, 15000),
       (3, 2, 10000),
       (4, 1, 5000);

DROP TABLE countries_new;



--Create database "lab2"
CREATE DATABASE lab2;



--Create table "countries"
CREATE TABLE countries (
    country_id serial primary key,
    country_name varchar(50),
    region_id integer,
    population integer
);



--Insert a row into "countries" against each column
INSERT INTO countries (country_id ,country_name, region_id, population)
VALUES (1, 'Ireland', 1, 100000);



--Insert a row into "countries" against columns "country_id" and "country_name"
INSERT INTO countries (country_id, country_name)
VALUES (2, 'Malaysia')



--Insert null value to "region_id" column
INSERT INTO countries (country_id, country_name, region_id)
VALUES (3, 'Iran', null);



--Insert 3 rows by a single INSERT statement
INSERT INTO countries (country_name, region_id, population)
VALUES
    ('Romania', 1, 100000),
    ('Mongolia', 2, 150000),
    ('Nigeria', 3, 50000);



--Set default value "Kazakhstan" to "country_name" column
ALTER TABLE countries
ALTER country_name SET DEFAULT 'Kazakhstan';



--Insert default value to "country_name" column
INSERT INTO countries (region_id, population)
VALUES (1, 20000);



--Insert only default values against each column
INSERT INTO countries DEFAULT VALUES;



--Create duplicate of "countries" table
CREATE TABLE countries_new (
    LIKE countries
);



--Insert all rows from "countries" to "countries_new"
INSERT INTO countries_new
SELECT * FROM countries;



--Change "region_id" of a country to 1 if it equals null
UPDATE countries
SET region_id = 1 WHERE region_id IS NULL;



--Write a statement to increase population of all countries by 10%
UPDATE countries
SET population = population * 1.1
RETURNING country_name, population AS New_Population;



--Remove all rows from "countries" table with less than 100k population
DELETE FROM countries
WHERE population < 100000;



--Remove all rows from "countries_new" table if "country_id" exists in "countries"
DELETE FROM countries_new USING countries
WHERE countries_new.country_id = countries.country_id
RETURNING *;



--Remove all rows from "countries" table
DELETE FROM countries
RETURNING *;
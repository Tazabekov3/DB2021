--Debug commands
SELECT * FROM users;

DROP TABLE users;

INSERT INTO users (firstname, lastname, isadmin)
VALUES ('Vinc', 'Vinc', 1);

INSERT INTO users (firstname, lastname)
VALUES ('Mute', 'Mute');

SELECT * FROM tasks;



--Create database called "lab1"
CREATE DATABASE lab1;



--Create table "users"
CREATE TABLE users (
    id serial,
    firstname varchar(50),
    lastname varchar(50)
);



--Add column "isadmin" into "users" table
ALTER TABLE users
    ADD COLUMN isadmin integer
    CONSTRAINT isadmin
        check ( isadmin = 0 OR isadmin = 1 );



--Change type of "isadmin" column to boolean
ALTER TABLE users
    DROP CONSTRAINT isadmin;

ALTER TABLE users
    ALTER isadmin TYPE bool USING
        CASE
            WHEN isadmin = 0 THEN FALSE
            ELSE TRUE
            END;



--Set default type as false to "isadmin" column
ALTER TABLE users
    ALTER isadmin SET DEFAULT FALSE;



--Add primary key constraint to "id" column
ALTER TABLE users
    ADD CONSTRAINT key primary key (id);



--Create table "tasks"
CREATE TABLE tasks (
    id serial,
    name varchar(50),
    user_id integer
);



--Delete "tasks" table
DROP TABLE tasks;



--Delete "lab1" database
DROP DATABASE lab1;
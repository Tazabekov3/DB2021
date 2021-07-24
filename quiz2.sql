--PART 1

--1. С (1,2,4,6)
--У столбца B нет значения 6, так что варианты B и D отпадают, также не существует у пары C,D значений 6,9,
--поэтому остается только вариант C

--2. D (2,5,3)
--Пересечение таблиц R и S даст несколько строк: (1, 2, 3), (4, 5, 6) и (2, 5, 3). Вариант D содержится в этом списке,
--в то время как остальные варианты ответа - нет

--3. A Student.sID, College.cName
--Запрос выполняется, совмещая колонки sID и cName у таблиц Students-Apply и College-Apply соответственно,
--но у Students.sID и College.cName эти значения будут уникальны, в то время как в таблице Apply они могут повторяться
--(один студент может податься в несколько колледжей, и много студентов могут податься в один колледж)

--4. C I and II
--Вид создается с условием Borrower.loan-number=Loan.loan-number. В обоих запросах это условие выполняется
--(в первом номер равен НУЛЛу, а во втором 1209)

--5. C c >= (SELECT SUM(b) FROM R)
--Сумма столбца b будет равна 10, а в кортеже данных (4, 4, 9) c = 9 < 10, что противоречит ограничению


--PART 2

--6. List movie titles and average ratings, from highest-rated to lowest-rated. If two or more movies have the same average rating, list them in alphabetical order.
SELECT m.title, avg(ra.stars) AS avg_rat FROM Movie m
INNER JOIN Rating ra ON ra.mID = m.mID
GROUP BY m.title
ORDER BY avg_rat DESC, m.title;

--7. For each movie that has at least one rating, find the lowest number of stars that movie received. Return the movie title and number of stars. Sort by movie title.
SELECT m.title, min(ra.stars) AS min_rat FROM Movie m
INNER JOIN Rating ra ON ra.mID = m.mID
GROUP BY m.title
ORDER BY m.title;

--8. Some reviewers didn't provide a date with their rating. Find the names of all reviewers who have ratings with a NULL value for the date.
SELECT re.name FROM Reviewer re
INNER JOIN Rating ra ON ra.rID = re.rID
WHERE ratingDate IS NULL;

--9. Create materialized view for the next statement. Find the titles of all movies that have no ratings.
CREATE VIEW unrated AS (
    SELECT m.title FROM Movie m
    WHERE m.mID NOT IN (SELECT ra.mID FROM Rating ra)
);

SELECT * FROM unrated;

--10. Create role with any name and give select and update privileges on the previous view.




--Debug commands
CREATE TABLE Movie (
    mID integer primary key,
    title varchar(50),
    year integer,
    director varchar(50)
);

CREATE TABLE Reviewer (
    rID integer primary key,
    name varchar(50)
);

CREATE TABLE Rating (
    rID integer references Reviewer(rID),
    mID integer references Movie(mID),
    stars integer,
    ratingDate date
);

INSERT INTO Movie
VALUES (101, 'Gone With The Wind', 1939, 'Victor Fleming'),
       (102, 'Star Wars', 1977, 'George Lucas'),
       (103, 'The Sound of Music', 1965, 'Robert Wise'),
       (104, 'E.T.', 1982, 'Steven Spielberg'),
       (105, 'Titanic', 1997, 'James Cameron'),
       (106, 'Snow White', 1937, null),
       (107, 'Avatar', 2009, 'James Cameron'),
       (108, 'Raider of The Lost Arc', 1981, 'Steven Spielberg');

INSERT INTO Reviewer
VALUES (201, 'Sarah Martinez'),
       (202, 'Daniel Lewis'),
       (203, 'Brittany Harris'),
       (204, 'Mike Anderson'),
       (205, 'Chris Jackson'),
       (206, 'Elizabeth Thomas'),
       (207, 'James Cameron'),
       (208, 'Ashley White');

INSERT INTO Rating
VALUES (201, 101, 2, '2011-01-22'),
       (201, 101, 4, '2011-01-27'),
       (202, 106, 4, null),
       (203, 103, 2, '2011-01-20'),
       (203, 108, 4, '2011-01-12'),
       (203, 108, 2, '2011-01-30'),
       (204, 101, 3, '2011-01-09'),
       (205, 103, 3, '2011-01-27'),
       (205, 104, 2, '2011-01-22');

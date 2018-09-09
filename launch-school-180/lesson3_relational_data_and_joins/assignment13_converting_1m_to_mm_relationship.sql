--------------------------------- 1 -------------------------------------------
-- Import this file into a database using psql.

psql -d l3_13 < films7.sql













--------------------------------- 2 -------------------------------------------
-- Write a SQL statement that will add a primary key column to films.

ALTER TABLE films ADD COLUMN id serial PRIMARY KEY;














--------------------------------- 3 -------------------------------------------
-- Write the SQL statement needed to create a join table that will allow a film to have multiple directors, and directors to have multiple films. Include an id column in this table, and add foreign key constraints to the other columns.

CREATE TABLE directors_films (
  id serial PRIMARY KEY,
  director_id integer NOT NULL REFERENCES directors(id),
  film_id integer NOT NULL REFERENCES films(id)
);











--------------------------------- 4 -------------------------------------------
-- Write the SQL statements needed to insert data into the new join table to represent the existing one-to-many relationships.

INSERT INTO directors_films (director_id, film_id)
  SELECT director_id, id FROM films;














--------------------------------- 5 -------------------------------------------
-- Write a SQL statement to remove any unneeded columns from films.

ALTER TABLE films DROP COLUMN director_id;












--------------------------------- 6 -------------------------------------------
-- Write a SQL statement that will return the following result:

--            title           |         name
-- ---------------------------+----------------------
--  12 Angry Men              | Sidney Lumet
--  1984                      | Michael Anderson
--  Casablanca                | Michael Curtiz
--  Die Hard                  | John McTiernan
--  Let the Right One In      | Michael Anderson
--  The Birdcage              | Mike Nichols
--  The Conversation          | Francis Ford Coppola
--  The Godfather             | Francis Ford Coppola
--  Tinker Tailor Soldier Spy | Tomas Alfredson
--  Wayne's World             | Penelope Spheeris
-- (10 rows)

SELECT films.title, directors.name
  FROM films
    INNER JOIN directors_films ON films.id = directors_films.film_id
    INNER JOIN directors ON directors.id = directors_films.director_id
  ORDER BY films.title;













--------------------------------- 7 -------------------------------------------
-- Write SQL statements to insert data for the following films into the database:

-- Film  Year  Genre   Duration  Directors
-- Fargo   1996  comedy  98  Joel Coen
-- No Country for Old Men  2007  western   122   Joel Coen, Ethan Coen
-- Sin City  2005  crime   124   Frank Miller, Robert Rodriguez
-- Spy Kids  2001  scifi   88  Robert Rodriguez

INSERT INTO directors_films (film_id, director_id) VALUES
  (11, 9), (12, 9), (12, 10), (13, 11), (13, 12), (14, 12);













--------------------------------- 8 -------------------------------------------
-- Write a SQL statement that determines how many films each director in the database has directed. Sort the results by number of films (greatest first) and then name (in alphabetical order).

SELECT directors.name AS director, count(directors.id) AS number_of_films
  FROM directors
    INNER JOIN directors_films ON directors_films.director_id = directors.id
  GROUP BY directors.id
  ORDER BY number_of_films DESC, director;




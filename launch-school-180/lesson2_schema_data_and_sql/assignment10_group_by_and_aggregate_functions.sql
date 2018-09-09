---- 1 ----

' sql -d films < films4.sql '



---- 2 ----

INSERT INTO films VALUES
  ('Wayne''s World', 1992, 'comedy', 'Penelope Spheeris', 95),
  ('Bourne Identity', 2002, 'espionage', 'Doub Liman', 118);





---- 3 ----

SELECT genre, count(genre) FROM films GROUP BY genre;





---- 4 ----

SELECT DISTINCT genre FROM films;





---- 5 ----

SELECT round(avg(duration)) AS average_duration FROM films;





---- 6 ----


SELECT genre, round(avg(duration)) AS average_duration FROM films GROUP BY genre;




---- 7 ----


SELECT substr(to_char(year, '9999'), 1, 4) || '0' AS decade,
       round(avg(duration)) AS average_duration
  FROM films GROUP BY decade ORDER BY decade;

--or:

SELECT year / 10 * 10 AS decade, round(avg(duration)) AS average_duration
  FROM films GROUP BY decade ORDER BY decade;





---- 8 ----

SELECT * FROM films WHERE director LIKE 'John %';





---- 9 ----

SELECT genre, count(id) FROM films GROUP BY genre ORDER BY count DESC;




---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---- 10 ---------!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SELECT year / 10 * 10 AS decade, genre, string_agg(title, ', ') AS films
  FROM films GROUP BY decade, genre ORDER BY decade, genre;

---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!





---- 11 ----

SELECT genre, sum(duration) AS total_duration
  FROM films GROUP BY genre ORDER BY total_duration;



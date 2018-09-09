---- 1.  Create a Database ----

CREATE DATABASE animals;




---- 2.  Create a Table ----

CREATE TABLE birds (
  id serial PRIMARY KEY,
  name VARCHAR(25),
  age integer,
  species VARCHAR(15)
);




---- 3.  Insert Data ----

INSERT INTO birds (name, age, species) VALUES
  ('Charlie', 3, 'Finch'),
  ('Allie', 5, 'Owl'),
  ('Jennifer', 3, 'Magpie'),
  ('Jamie', 4, 'Owl'),
  ('Roy', 8, 'Crow');




---- 4.  Select Data ----

SELECT * FROM birds;





---- 5.  WHERE Clause ----

SELECT * FROM birds WHERE age < 5;






---- 6.  Update Data ----

UPDATE birds SET species = 'Raven' WHERE species = 'Crow';




---- 7.  Delete Data ----

DELETE FROM birds WHERE age = 3 AND species = 'Finch';





---- 8.  Add Constraint ----

ALTER TABLE birds ADD CHECK (age > 0);

INSERT INTO birds VALUES (7, 'bob', -1, 'bird');

-- new row for relation "birds" violates check constraint "birds_age_check"
-- DETAIL:  Failing row contains (7, bob, -1, bird).





---- 9.  Drop Table ----

DROP TABLE birds;




---- 10.  Drop Database ----

------------------------------ 1 -------------------------------------
-- Write a SQL statement to add the following call data to the database::

-- when  duration  first_name  last_name   number
-- 2016-01-18 14:47:00   632   William   Swift   7204890809

INSERT INTO calls ("when", duration, contact_id)
  VALUES ('2016-01-18 14:47:00', 632, 6);










------------------------------ 2 --------------------------------------------
-- Write a SQL statement to retrieve the call times, duration, and first name for all calls not made to William Swift.:

SELECT "when", duration, first_name
  FROM calls INNER JOIN contacts ON calls.contact_id = contacts.id
  WHERE first_name != 'William' AND last_name != 'Swift';










------------------------------ 3 --------------------------------------------
-- Write SQL statements to add the following call data to the database::

-- when  duration  first_name  last_name   number
-- 2016-01-17 11:52:00   175   Merve   Elk   6343511126
-- 2016-01-18 21:22:00   79  Sawa  Fyodorov  6125594874

INSERT INTO contacts (first_name, last_name, number) VALUES
  ('Merve', 'Elk', 6343511126), ('Sawa', 'Fyodorov', 6125594874);

INSERT INTO calls ("when", duration, contact_id) VALUES
  ('2016-01-17 11:52:00', 175, 26), ('2016-01-18 21:22:00', 79, 27);








------------------------------ 4 --------------------------------------------
-- Add a constraint to contacts that prevents a duplicate value being added in the column number.:

ALTER TABLE contacts ADD CONSTRAINT number_unique UNIQUE (number);









------------------------------ 5 --------------------------------------------
-- Write a SQL statement that attempts to insert a duplicate number for a new contact but fails. What error is shown?:

INSERT INTO contacts (first_name, last_name, number)
  VALUES ('bob', 'loblaw', 6343511126);
-- duplicate key value violates unique constraint "number_unique"
-- DETAIL:  Key (number)=(6343511126) already exists.









------------------------------ 6 --------------------------------------------
-- Why does "when" need to be quoted in many of the queries in this lesson?:

  -- b/c it is an SQL keyword, so it needs quotes so the DB treats it as an identifier instead of a keyword









------------------------------ 7 --------------------------------------------
-- Draw an entity-relationship diagram for the data we've been working with in this assignment.:

  -- (1:M)

--- 1 ---

-- using an operator with a NULL value as either operand will result in NULL being returned, instead of a boolean like usual, even if both operands are NULL.
-- Instead, the IS NULL and IS NOT NULL constructs should be used, which will return a boolean.
-- NULL signifies an unknown value




--- 2 ---

ALTER TABLE employees RENAME COLUMN depratment TO department; --- fix typo ---

ALTER TABLE employees ALTER COLUMN department SET DEFAULT 'unassigned';
UPDATE employees SET department = DEFAULT WHERE department IS NULL;
ALTER TABLE employees ALTER COLUMN department SET NOT NULL;





--- 3 ---

CREATE TABLE temperatures (
  date date NOT NULL DEFAULT NOW(),
  low integer NOT NULL CHECK (low > -50 AND low < 150),
  high integer NOT NULL CHECK (high > -50 AND high < 150)
);





--- 4 ---
INSERT INTO temperatures VALUES
  ('2016-03-03', 31, 47),
  ('2016-03-04', 33, 42),
  ('2016-03-05', 39, 46),
  ('2016-03-06', 32, 43),
  ('2016-03-07', 29, 32),
  ('2016-03-08', 23, 31),
  ('2016-03-09', 17, 28);




--- 5 ---

SELECT date, (low + high) / 2 AS average
  FROM temperatures
 WHERE date BETWEEN '2016-03-02' AND '2016-03-08';





--- 6 ---

ALTER TABLE temperatures ADD COLUMN rainfall integer NOT NULL DEFAULT 0;




--- 7 ---

UPDATE temperatures
   SET rainfall = (low + high) / 2 - 35
 WHERE (low + high) / 2 > 35;





--- 8 ---

ALTER TABLE temperatures ALTER COLUMN rainfall TYPE decimal(6, 3);
UPDATE temperatures SET rainfall = rainfall * 0.039370079;




--- 9 ---

ALTER TABLE temperatures RENAME TO weather;





--- 10 ---

  -- the psql "\d table_name" meta command shows the structure of a table
  -- \d describes the argument passed to it

\d weather




--- 11 ---

pg_dump -d s -t weather --inserts --clean > weather_dump.sql

------------------------- 5. Designing a Schema ----------------------------

-- 1 --

CREATE TABLE lists (
............ id serial PRIMARY KEY,
............ name varchar(100) NOT NULL UNIQUE CHECK (length(name) >= 1)
............ );

CREATE TABLE todos (
............ id serial PRIMARY KEY,
............ name varchar(100) NOT NULL CHECK (length(name) >= 1),
............ completed boolean NOT NULL DEFAULT false,
............ list_id integer NOT NULL REFERENCES lists(id)
............ );





-- 2 --

pg_dump todos > schema.sql





-- 3 --

psql todos < schema.sql











---------------------- 6. Setting up a Database Connection --------------------

-- 1 --

  -- b/c Enumerable is included in PG::Result so any Enumerable methods are available to be called on it


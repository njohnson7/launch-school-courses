-------------- 1.  Create an Extrasolar Planetary Database --------------------

createdb extrasolar
pgcli extrasolar


CREATE TABLE stars (
  id serial PRIMARY KEY,
  name varchar(25) NOT NULL UNIQUE,
  distance integer NOT NULL CHECK (distance > 0),
  spectral_type char(1) CHECK (spectral_type ~ '[OBAFGKM]'),
  companions integer NOT NULL CHECK (companions >= 0)
);

 CREATE TABLE planets (
  id serial PRIMARY KEY,
  designation char(1) CHECK (designation ~* '[a-z]'),
  mass integer
);










-------------- 2.  Relating Stars and Planets --------------------------------

ALTER TABLE planets ADD COLUMN star_id integer NOT NULL REFERENCES stars;

















-------------- 3.  Increase Star Name Length --------------------------------

ALTER TABLE stars ALTER COLUMN name TYPE varchar(50);















-------------- 4.  Stellar Distance Precision --------------------------------

ALTER TABLE stars ALTER COLUMN distance TYPE numeric;


















-------------- 5.  Check Values in List --------------------------------------

ALTER TABLE stars ADD CHECK (spectral_type ~ '[OBAFGKM]'),
  ALTER spectral_type SET NOT NULL;

















-------------- 6.  Enumerated Types -----------------------------------------

CREATE TYPE spectral AS ENUM ('O', 'B', 'A', 'F', 'G', 'K', 'M');

ALTER TABLE stars ALTER COLUMN spectral_type TYPE spectral USING spectral_type::spectral;
















-------------- 7.  Planetary Mass Precision -----------------------------------

ALTER TABLE planets
  ADD CHECK (mass > 0.0),
  ALTER mass TYPE numeric,
  ALTER mass SET NOT NULL,
  ALTER designation SET NOT NULL;

















-------------- 8.  Add a Semi-Major Axis Column ------------------------------

ALTER TABLE planets ADD COLUMN semi_major_axis numeric NOT NULL CHECK (semi_major_axis > 0.0);

















-------------- 9.  Add a Moons Table -----------------------------------------

CREATE TABLE moons (
  id serial PRIMARY KEY,
  designation integer NOT NULL CHECK (designation >= 1),
  semi_major_axis numeric CHECK (semi_major_axis > 0.0),
  mass numeric CHECK (mass > 0.0),
  star_id integer NOT NULL REFERENCES stars(id),
  planet_id integer NOT NULL REFERENCES planets(id)
);

















-------------- 10. Delete the Database --------------------------------------

\c ...
DROP DATABASE extrasolar;

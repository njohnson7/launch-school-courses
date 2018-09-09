----------------------- 1.  Set Up Database  ----------------------------------

CREATE DATABASE workshop
\c workshop

CREATE TABLE devices (
  id serial PRIMARY KEY,
  name text NOT NULL,
  created_at timestamp NOT NULL DEFAULT now()
);

CREATE TABLE parts (
  id serial PRIMARY KEY,
  part_number integer NOT NULL UNIQUE,
  device_id integer REFERENCES devices(id)
);








----------------------- 2.  Insert Data for Parts and Devices  ----------------

INSERT INTO devices (name) VALUES ('Accelerometer'), ('Gyroscope');

INSERT INTO parts (part_number, device_id) VALUES
  (111, 1), (112, 1), (113, 1), (222, 2), (223, 2), (224, 2), (225, 2), (226, 2);

INSERT INTO parts (part_number) VALUES (777), (888), (999);








----------------------- 3.  INNER JOIN ----------------------------------------

SELECT name, part_number FROM devices INNER JOIN parts ON devices.id = parts.device_id;










----------------------- 4.  SELECT part_number --------------------------------

SELECT * FROM parts WHERE part_number::text ~ '^2';

-- or:

SELECT * FROM parts WHERE part_number::text LIKE '2%';








----------------------- 5.  Aggregate Functions  ------------------------------

SELECT name AS device, count(name) AS number_of_parts
  FROM devices INNER JOIN parts ON devices.id = parts.device_id
  GROUP BY name;








----------------------- 6.  ORDER BY ------------------------------------------


SELECT name, count(devices.id)
  FROM devices
  INNER JOIN parts ON devices.id = parts.device_id
  GROUP BY devices.id
  ORDER BY name;









----------------------- 7.  IS NULL and IS NOT NULL  --------------------------

SELECT part_number, device_id FROM parts WHERE device_id IS NOT NULL;

SELECT part_number, device_id FROM parts WHERE device_id IS NULL;










----------------------- 8.  Oldest Device  ------------------------------------

SELECT name AS oldest_device FROM devices ORDER BY created_at DESC LIMIT 1;









----------------------- 9.  UPDATE device_id ----------------------------------

UPDATE parts SET device_id = 1 WHERE part_number BETWEEN 225 AND 226;

UPDATE parts SET device_id = 2 WHERE part_number = (SELECT min(part_number) FROM parts);








----------------------- 10. Delete Accelerometer ------------------------------

DELETE FROM parts WHERE device_id = 1;

DELETE FROM devices WHERE id = 1;



-- further exploration:

CREATE TABLE omg (
  id serial PRIMARY KEY,
  device_id integer,
  FOREIGN KEY (device_id) REFERENCES devices(id) ON DELETE CASCADE
);

INSERT INTO omg (device_id) VALUES (3);
DELETE FROM devices WHERE id = 3;

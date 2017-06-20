---------------------- 1.  Set Up Database-------------------------------------

CREATE DATABASE billing;

\c billing

CREATE TABLE customers (
  id serial PRIMARY KEY,
  name text NOT NULL,
  payment_token char(8) NOT NULL UNIQUE CHECK (payment_token ~ '[A-Z]{8}')
);

CREATE TABLE services (
  id serial PRIMARY KEY,
  description text NOT NULL,
  price numeric(10, 2) NOT NULL CHECK (price >= 0.00)
);

INSERT INTO customers (name, payment_token) VALUES
  ('Pat Johnson',   'XHGOAHEQ'),
  ('Nancy Monreal', 'JKWQPJKL'),
  ('Lynn Blake',    'KLZXWEEE'),
  ('Chen Ke-Hua',   'KWETYCVX'),
  ('Scott Lakso',   'UUEAPQPS'),
  ('Jim Pornot',    'XKJEYAZA');

INSERT INTO services (description, price) VALUES
  ('Unix Hosting',        5.95),
  ('DNS',                 4.95),
  ('Whois Registration',  1.95),
  ('High Bandwidth',      15.00),
  ('Business Support',    250.00),
  ('Dedicated Hosting',   50.00),
  ('Bulk Email',          250.00),
  ('One-to-one Training', 999.00);

CREATE TABLE customers_services (
  customer_id integer REFERENCES customers(id) ON DELETE CASCADE,
  service_id integer REFERENCES services(id),
  PRIMARY KEY (customer_id, service_id)
);

INSERT INTO customers_services
  VALUES (1, 1), (1, 2), (1, 3), (2, NULL), (3, 1), (3, 2), (3, 3), (3, 4),
         (3, 5), (4, 1), (4, 4), (5, 1), (5, 2), (5, 6), (6, 1), (6, 6), (6, 7);












---------------------- 2.  Get Customers With Services-------------------------

SELECT DISTINCT customers.* FROM customers
  INNER JOIN customers_services ON customers_services.customer_id = customers.id;












---------------------- 3.  Get Customers With No Services----------------------

SELECT * FROM customers WHERE id NOT IN (SELECT customer_id FROM customers_services);

-- or:

SELECT customers.* FROM customers
  LEFT OUTER JOIN customers_services ON id = customer_id
  WHERE customer_id IS NULL;


-- further exploration:

SELECT customers.*, services.* FROM customers
  FULL OUTER JOIN customers_services ON customers_services.customer_id = customers.id
  FULL OUTER JOIN services ON services.id = customers_services.service_id
  WHERE services.id IS NULL OR customers.id IS NULL;









---------------------- 4.  Get Services With No Customers----------------------

SELECT description FROM customers_services
  RIGHT OUTER JOIN services ON services.id = customers_services.service_id
  WHERE service_id IS NULL;













---------------------- 5.  Services for each Customer--------------------------


SELECT customers.name, string_agg(services.description, ', ')
    FROM customers
      LEFT OUTER JOIN customers_services ON customers_services.customer_id = customers.id
      LEFT OUTER JOIN services ON services.id = customers_services.service_id
    GROUP BY customers.id;

-- further exploration:

SELECT CASE WHEN customers.name = lag(customers.name) OVER (ORDER BY customers.name) THEN NULL
            ELSE customers.name
            END,
       description
  FROM customers
  LEFT OUTER JOIN customers_services
               ON customer_id = customers.id
  LEFT OUTER JOIN services
               ON services.id = service_id;











---------------------- 6.  Services With At Least 3 Customers------------------

SELECT description, count(customer_id)
  FROM services INNER JOIN customers_services ON customers_services.service_id = services.id
  GROUP BY services.id
  HAVING count(customer_id) >= 3
  ORDER BY description;













---------------------- 7.  Total Gross Income----------------------------------

SELECT sum(price) AS gross
  FROM services
  INNER JOIN customers_services ON service_id = services.id;













---------------------- 8.  Add New Customer------------------------------------

INSERT INTO customers (name, payment_token) VALUES ('John Doe', 'EYODHLCN');

INSERT INTO customers_services VALUES (7, 1), (7, 2), (7, 3);














---------------------- 9.  Hypothetically--------------------------------------

SELECT sum(price) FROM services
  INNER JOIN customers_services ON service_id = services.id
  WHERE price > 100;

SELECT sum(price) FROM services CROSS JOIN customers WHERE price > 100;


-- or w/ a subquery:
SELECT sum(price) * (SELECT count(id) FROM customers) AS sum FROM services WHERE price > 100;









---------------------- 10. Deleting Rows---------------------------------------

DELETE FROM customers WHERE name = 'Chen Ke-Hua';

DELETE FROM customers_services WHERE service_id = 7;

DELETE FROM services where description = 'Bulk Email';

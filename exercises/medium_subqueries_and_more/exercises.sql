------------------ 1. Set Up the Database using \copy ------------------------

CREATE TABLE bidders (
.............. id serial PRIMARY KEY,
.............. name text NOT NULL
.............. );

CREATE TABLE items (
.............. id serial PRIMARY KEY,
.............. name text NOT NULL,
.............. initial_price numeric(6, 2) NOT NULL CHECK (initial_price BETWEEN 0.01 AND
..............  1000.00),
.............. sales_price numeric(6, 2) CHECK (sales_price BETWEEN 0.01 AND 1000.00)
.............. );

CREATE TABLE bids (
.............. id serial PRIMARY KEY,
.............. bidder_id integer NOT NULL REFERENCES bidders(id) ON DELETE CASCADE,
.............. item_id integer NOT NULL REFERENCES items(id) ON DELETE CASCADE,
.............. amount numeric(6, 2) NOT NULL CHECK (amount BETWEEN 0.01 AND 1000.00),
.............. );

CREATE INDEX ON bids (bidder_id, item_id);

\copy bidders (id, name) FROM './bidders.csv' DELIMITER ',' HEADER CSV;

\copy items FROM 'items.csv' HEADER CSV;

\copy bids FROM 'bids.csv' HEADER CSV;







------------------ 2.  Conditional Subqueries: IN ---------------------------














------------------ 3.  Conditional Subqueries: NOT IN ------------------------














------------------ 4.  Conditional Subqueries: EXISTS -----------------------














------------------ 5.  Conditional Subqueries: ANY, SOME, ALL ----------------














------------------ 6.  Query From a Virtual Table ----------------------------














------------------ 7.  Scalar Subqueries -------------------------------------














------------------ 8.  Row Comparison ---------------------------------------














------------------ 9.  EXPLAIN ----------------------------------------------














------------------ 10. Comparing SQL Statements -----------------------------














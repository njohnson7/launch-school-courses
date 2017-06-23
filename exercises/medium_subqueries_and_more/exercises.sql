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

SELECT name AS "Bid on Items" FROM items
  WHERE id IN (SELECT DISTINCT item_id FROM bids);

-- or:

SELECT DISTINCT items.name
.............. FROM items
.............. INNER JOIN bids ON bids.item_id = items.id;









------------------ 3.  Conditional Subqueries: NOT IN ------------------------

SELECT name AS "Not Bid On" FROM items
.............. WHERE id NOT IN (SELECT item_id FROM bids);

--or:

SELECT name AS "Not Bid On" FROM items
.............. LEFT JOIN bids ON bids.item_id = items.id
.............. WHERE bidder_id IS NULL;










------------------ 4.  Conditional Subqueries: EXISTS -----------------------

SELECT name FROM bidders
.............. WHERE EXISTS (SELECT 1 FROM bids WHERE bidder_id = bidders.id);

-- or:

SELECT DISTINCT name FROM bidders
  INNER JOIN bids ON bids.bidder_id = bidders.id;










------------------ 5.  Conditional Subqueries: ANY, SOME, ALL ----------------

-- ANY:

SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
.............. WHERE id = ANY (SELECT item_id FROM bids WHERE amount < 100);

--or:

SELECT name AS "Highest Bid Less Than 100 Dollars"
.............. FROM items WHERE 100 > ANY (SELECT amount FROM bids WHERE item_id = items.id);





-- ALL:
SELECT name AS "Highest Bid Less Than 100 Dollars" FROM items
  WHERE id <> ALL
   (SELECT item_id FROM bids WHERE amount >= 100)
  AND sales_price IS NOT NULL;

--or:

SELECT name AS "Highest Bid Less Than 100 Dollars"
.............. FROM items WHERE 100 > ALL (SELECT amount FROM bids WHERE item_id = items.id);






-- JOIN:

SELECT DISTINCT name AS "Highest Bid Less Than 100 Dollars"
  FROM items JOIN bids ON item_id = items.id
  WHERE amount < 100;






-- simple:

SELECT name AS "Highest Bid Less Than 100 Dollars"
  FROM items WHERE sales_price < 100;








------------------ 6.  Query From a Virtual Table ----------------------------

SELECT max(count) FROM (SELECT count(id) FROM bids
.............. GROUP BY bidder_id) AS foo;

-- or:

SELECT count(id) AS max FROM bids
.............. GROUP BY bidder_id
.............. ORDER BY count DESC LIMIT 1;










------------------ 7.  Scalar Subqueries -------------------------------------

SELECT name,
      (SELECT count(item_id) FROM bids WHERE item_id = items.id)
  FROM items;

-- or:

SELECT name, count(item_id) FROM items
  LEFT JOIN bids ON item_id = items.id
  GROUP BY name;









------------------ 8.  Row Comparison ---------------------------------------

SELECT id FROM items
  WHERE name || initial_price || sales_price = 'Painting100.00250.00';

-- or:

SELECT id FROM items
.............. WHERE ROW(name, initial_price, sales_price) = ROW('Painting', 100.00, 250.
.............. 00);











------------------ 9.  EXPLAIN ----------------------------------------------

EXPLAIN ANALYZE SELECT name FROM bidders
.............. WHERE EXISTS (SELECT 1 FROM bids WHERE bids.bidder_id = bidders.id);
+----------------------------------------------------------------------------------------
| QUERY PLAN
|----------------------------------------------------------------------------------------
| Hash Join  (cost=33.38..62.84 rows=635 width=32) (actual time=0.026..0.027 rows=6 loops
|   Hash Cond: (bidders.id = bids.bidder_id)
|   ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual time=0.006..0.
|   ->  Hash  (cost=30.88..30.88 rows=200 width=4) (actual time=0.014..0.014 rows=6 loops
|         Buckets: 1024  Batches: 1  Memory Usage: 9kB
|         ->  HashAggregate  (cost=28.88..30.88 rows=200 width=4) (actual time=0.011..0.0
|               Group Key: bids.bidder_id
|               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0
| Planning time: 0.119 ms
| Execution time: 0.055 ms
+-----------------------------
EXPLAIN





EXPLAIN ANALYZE SELECT DISTINCT name FROM bidders
..............   INNER JOIN bids ON bids.bidder_id = bidders.id;
+----------------------------------------------------------------------------------------
| QUERY PLAN
|----------------------------------------------------------------------------------------
| HashAggregate  (cost=88.21..90.21 rows=200 width=32) (actual time=0.036..0.037 rows=6 l
|   Group Key: bidders.name
|   ->  Hash Join  (cost=38.58..84.44 rows=1510 width=32) (actual time=0.023..0.027 rows=
|         Hash Cond: (bids.bidder_id = bidders.id)
|         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.008..
|         ->  Hash  (cost=22.70..22.70 rows=1270 width=36) (actual time=0.008..0.008 rows
|               Buckets: 2048  Batches: 1  Memory Usage: 17kB
|               ->  Seq Scan on bidders  (cost=0.00..22.70 rows=1270 width=36) (actual ti
| Planning time: 0.149 ms
| Execution time: 0.066 ms
+----------------------------------------------------------------------------------------
EXPLAIN





-- SQL is checking how much time it takes to do each thing, and then adding it up







------------------ 10. Comparing SQL Statements -----------------------------

EXPLAIN ANALYZE SELECT MAX(bid_counts.count) FROM
                  (SELECT COUNT(bidder_id) FROM bids GROUP BY bidder_id) AS bid_counts;
+----------------------------------------------------------------------------------------
| QUERY PLAN
|----------------------------------------------------------------------------------------
| Aggregate  (cost=37.15..37.16 rows=1 width=8) (actual time=0.028..0.028 rows=1 loops=1)
|   ->  HashAggregate  (cost=32.65..34.65 rows=200 width=4) (actual time=0.024..0.025 row
|         Group Key: bids.bidder_id
|         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.009..
| Planning time: 0.087 ms
| Execution time: 0.070 ms
+----------------------------------------------------------------------------------------
EXPLAIN
Time: 0.003s





EXPLAIN ANALYZE SELECT COUNT(bidder_id) AS max_bid FROM bids
                  GROUP BY bidder_id
                  ORDER BY max_bid DESC
                  LIMIT 1;
+----------------------------------------------------------------------------------------
| QUERY PLAN
|----------------------------------------------------------------------------------------
| Limit  (cost=35.65..35.65 rows=1 width=4) (actual time=0.028..0.028 rows=1 loops=1)
|   ->  Sort  (cost=35.65..36.15 rows=200 width=4) (actual time=0.027..0.027 rows=1 loops
|         Sort Key: (count(bidder_id)) DESC
|         Sort Method: top-N heapsort  Memory: 25kB
|         ->  HashAggregate  (cost=32.65..34.65 rows=200 width=4) (actual time=0.019..0.0
|               Group Key: bidder_id
|               ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0
| Planning time: 0.083 ms
| Execution time: 0.058 ms
+----------------------------------------------------------------------------------------
EXPLAIN
Time: 0.002s


  -- the second is more efficent
    -- b/c it only queries one table





-- further exploration:


  __auction >> EXPLAIN ANALYZE SELECT name,
.............. (SELECT COUNT(item_id) FROM bids WHERE item_id = items.id)
.............. FROM items;
+----------------------------------------------------------------------------------------
| QUERY PLAN
|----------------------------------------------------------------------------------------
| Seq Scan on items  (cost=0.00..25455.20 rows=880 width=36) (actual time=0.022..0.036 ro
|   SubPlan 1
|     ->  Aggregate  (cost=28.89..28.91 rows=1 width=4) (actual time=0.004..0.004 rows=1
|           ->  Seq Scan on bids  (cost=0.00..28.88 rows=8 width=4) (actual time=0.002..0
|                 Filter: (item_id = items.id)
|                 Rows Removed by Filter: 22
| Planning time: 0.090 ms
| Execution time: 0.065 ms
+----------------------------------------------------------------------------------------
EXPLAIN





  __auction >> EXPLAIN ANALYZE SELECT name, count(item_id) FROM items
..............   LEFT JOIN bids ON item_id = items.id
..............   GROUP BY name;
+----------------------------------------------------------------------------------------
| QUERY PLAN
|----------------------------------------------------------------------------------------
| HashAggregate  (cost=83.21..85.21 rows=200 width=36) (actual time=0.055..0.056 rows=6 l
|   Group Key: items.name
|   ->  Hash Right Join  (cost=29.80..75.66 rows=1510 width=36) (actual time=0.037..0.039
|         Hash Cond: (bids.item_id = items.id)
|         ->  Seq Scan on bids  (cost=0.00..25.10 rows=1510 width=4) (actual time=0.003..
|         ->  Hash  (cost=18.80..18.80 rows=880 width=36) (actual time=0.027..0.027 rows=
|               Buckets: 1024  Batches: 1  Memory Usage: 9kB
|               ->  Seq Scan on items  (cost=0.00..18.80 rows=880 width=36) (actual time=
| Planning time: 0.116 ms
| Execution time: 0.094 ms
+----------------------------------------------------------------------------------------
EXPLAIN
Time: 0.002s
  __auction >>

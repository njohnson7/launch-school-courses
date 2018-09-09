------------------------------------ 1 ---------------------------------------
-- Import this file into an empty PostgreSQL database.

psql -d l3 < theater_full.sql





------------------------------------ 2 ---------------------------------------
-- Write a query that determines how many tickets have been sold.

SELECT count(id) AS number_sold FROM tickets;






------------------------------------ 3 ---------------------------------------
-- Write a query that determines how many different customers purchased tickets to at least one event.

SELECT count(DISTINCT customer_id) FROM tickets;





------------------------------------ 4 ---------------------------------------
-- Write a query that determines what percentage of the customers in the database have purchased a ticket to one of the events.


SELECT count(DISTINCT tickets.customer_id) /
       count(DISTINCT customers.id)::float * 100 AS percent
  FROM customers
  LEFT OUTER JOIN tickets ON customers.id = tickets.customer_id;





------------------------------------ 5 ---------------------------------------
-- Write a query that returns the name of each event and how many tickets were sold for it, in order from most popular to least popular.

SELECT name, count(name) AS popularity
  FROM tickets LEFT OUTER JOIN events ON events.id = tickets.event_id
  GROUP BY name
  ORDER BY popularity DESC;

-- or:

SELECT e.name, COUNT(t.id) AS popularity
  FROM events AS e LEFT OUTER JOIN tickets AS t ON t.event_id = e.id
  GROUP BY e.id
  ORDER BY popularity DESC;




------------------------------------ 6 ---------------------------------------
-- Write a query that returns the user id, email address, and number of events for all customers that have purchased tickets to three events.

-- user id, email, number of events
  -- for all customers that pruchased tickets to 3 events

SELECT customer_id, email, count(DISTINCT event_id) AS num_events
  FROM tickets LEFT OUTER JOIN customers ON customers.id = customer_id
  GROUP BY customer_id, email ORDER BY num_events DESC, customer_id LIMIT 12;

--or:

SELECT customer_id, email, count(DISTINCT event_id) AS num_events
  FROM tickets LEFT OUTER JOIN customers ON customers.id = customer_id
  GROUP BY customer_id, email
  HAVING count(DISTINCT event_id) = 3;

--or:

SELECT customers.id, customers.email, COUNT(DISTINCT tickets.event_id)
  FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id
  GROUP BY customers.id
  HAVING COUNT(DISTINCT tickets.event_id) = 3;







------------------------------------ 7 ---------------------------------------
-- Write a query to print out a report of all tickets purchased by the customer with the email address 'gennaro.rath@mcdermott.co'.
-- The report should include the event name and starts_at and the seat's section name, row, and seat number.

SELECT events.name AS event, events.starts_at, sections.name AS section, seats.row, seats.number AS seat
  FROM tickets
    INNER JOIN customers ON customers.id = tickets.customer_id
    INNER JOIN events ON events.id = tickets.event_id
    INNER JOIN seats ON seats.id = tickets.seat_id
    INNER JOIN sections ON sections.id = seats.section_id
  WHERE customers.email = 'gennaro.rath@mcdermott.co';

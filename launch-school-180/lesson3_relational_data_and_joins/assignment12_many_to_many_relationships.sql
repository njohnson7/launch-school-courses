---------------------------------- 1 -----------------------------------------
-- Write a SQL statement that will return the following result:

SELECT books.id, author, string_agg(categories.name, ', ') AS categories
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON categories.id = books_categories.category_id
  GROUP BY books.id;










---------------------------------- 2 -----------------------------------------
-- Write SQL statements to insert the following new books into the database. What do you need to do to ensure this data fits in the database?
CREATE TABLE authors (
  id serial PRIMARY KEY,
  name text NOT NULL
);

CREATE TABLE books_authors (
  book_id integer NOT NULL REFERENCES books(id),
  author_id integer NOT NULL REFERENCES authors(id)
);

INSERT INTO authors (name) VALUES
  ('Charles Dickens'), ('J.K. Rowling'), ('Walter Isaacson');

ALTER TABLE books DROP column author;

INSERT INTO books_authors (book_id, author_id) VALUES
  (1, 1), (2, 2), (3, 3);

INSERT INTO authors (name) VALUES
  ('Lynn Sherr'), ('Charlotte Brontë'), ('Meeru Dhalwala'), ('Vikram Vij');

ALTER TABLE books ALTER COLUMN title TYPE text;

INSERT INTO books (title) VALUES
  ('Sally Ride: America''s First Woman in Space'), ('Jane Eyre'), ('Vij''s: Elegant and Inspired Indian Cuisine');

INSERT INTO categories (name) VALUES
  ('Space Exploration'), ('Cookbook'), ('South Asia');

INSERT INTO books_authors (book_id, author_id) VALUES
  (4, 4), (5, 5), (6, 6), (6, 7);

INSERT INTO books_categories (book_id, category_id) VALUES
  (4, 5), (4, 1), (4, 7), (5, 2), (5, 4), (6, 8), (6, 1), (6, 9);


SELECT books.id, string_agg(DISTINCT authors.name, ' and ') AS author, books.title, string_agg(DISTINCT categories.name, ', ') AS categories
  FROM books
    INNER JOIN books_authors ON books.id = books_authors.book_id
    INNER JOIN authors ON books_authors.author_id = authors.id
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY books.id
  ORDER BY books.id;










---------------------------------- 3 -----------------------------------------
-- Write a SQL statement to add a uniqueness constraint on the combination of columns book_id and category_id of the books_categories table. This constraint should be a table constraint; so, it should check for uniqueness on the combination of book_id and category_id across all rows of the books_categories table.

ALTER TABLE books_authors ADD PRIMARY KEY (book_id, author_id);

ALTER TABLE books_categories ADD PRIMARY KEY (book_id, category_id);

--or:

ALTER TABLE books_categories ADD UNIQUE (book_id, category_id);









---------------------------------- 4 -----------------------------------------
-- Write a SQL statement that will return the following result:

SELECT categories.name, count(books.id) AS book_count, string_agg(books.title, ', ') AS book_titles
  FROM books
    INNER JOIN books_categories ON books.id = books_categories.book_id
    INNER JOIN categories ON books_categories.category_id = categories.id
  GROUP BY categories.id
  ORDER BY categories.name;

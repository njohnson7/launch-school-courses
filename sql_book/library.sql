--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.7
-- Dumped by pg_dump version 9.5.7

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

ALTER TABLE ONLY public.users_books DROP CONSTRAINT users_books_user_id_fkey;
ALTER TABLE ONLY public.users_books DROP CONSTRAINT users_books_book_id_fkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_user_id_fkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_book_id_fkey;
ALTER TABLE ONLY public.addresses DROP CONSTRAINT fk_user_id;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users_books DROP CONSTRAINT users_books_pkey;
ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_pkey;
ALTER TABLE ONLY public.books DROP CONSTRAINT books_isbn_key;
ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.reviews ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.books ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.users_id_seq;
DROP TABLE public.users_books;
DROP TABLE public.users;
DROP SEQUENCE public.reviews_id_seq;
DROP TABLE public.reviews;
DROP SEQUENCE public.books_id_seq;
DROP TABLE public.books;
DROP TABLE public.addresses;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: one
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO one;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: one
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE addresses (
    user_id integer NOT NULL,
    street character varying(30) NOT NULL,
    city character varying(30) NOT NULL,
    state character varying(30) NOT NULL
);


ALTER TABLE addresses OWNER TO one;

--
-- Name: books; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    author character varying(100) NOT NULL,
    published_date timestamp without time zone NOT NULL,
    isbn integer
);


ALTER TABLE books OWNER TO one;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE books_id_seq OWNER TO one;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE reviews (
    id integer NOT NULL,
    book_id integer NOT NULL,
    user_id integer NOT NULL,
    review_content character varying(255),
    rating integer,
    published_date timestamp without time zone DEFAULT now()
);


ALTER TABLE reviews OWNER TO one;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO one;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(25) NOT NULL,
    enabled boolean DEFAULT true,
    last_login timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE users OWNER TO one;

--
-- Name: users_books; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE users_books (
    user_id integer NOT NULL,
    book_id integer NOT NULL,
    checkout_date timestamp without time zone,
    return_date timestamp without time zone
);


ALTER TABLE users_books OWNER TO one;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: one
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO one;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: one
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: one
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: one
--

INSERT INTO addresses VALUES (1, '1 Market Street', 'San Francisco', 'CA');
INSERT INTO addresses VALUES (2, '2 Elm Street', 'San Francisco', 'CA');


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: one
--

INSERT INTO books VALUES (1, 'My First SQL book', 'Mary Parker', '2017-06-13 12:02:31.055198', NULL);
INSERT INTO books VALUES (2, 'My Second SQL book', 'John Mayer', '2017-06-13 12:02:31.061335', NULL);
INSERT INTO books VALUES (3, 'My Third SQL book', 'Cary Flint', '2017-06-13 12:02:31.074323', NULL);


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('books_id_seq', 3, true);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: one
--

INSERT INTO reviews VALUES (1, 1, 1, 'My first review', NULL, '2017-06-13 12:02:31.059321');
INSERT INTO reviews VALUES (2, 2, 1, 'My second review', NULL, '2017-06-13 12:02:31.064632');
INSERT INTO reviews VALUES (3, 2, 2, 'review_content', NULL, '2017-06-13 12:02:31.071285');


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('reviews_id_seq', 3, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: one
--

INSERT INTO users VALUES (1, 'John Smith', true, '2017-06-13 12:02:31.038796');
INSERT INTO users VALUES (2, 'Jane Smiley', true, '2017-06-13 12:02:31.066425');
INSERT INTO users VALUES (3, 'Alice Munro', true, '2017-06-13 12:02:31.072922');


--
-- Data for Name: users_books; Type: TABLE DATA; Schema: public; Owner: one
--

INSERT INTO users_books VALUES (1, 1, '2017-06-13 12:02:31.057163', NULL);
INSERT INTO users_books VALUES (1, 2, '2017-06-13 12:02:31.062871', NULL);
INSERT INTO users_books VALUES (2, 2, '2017-06-13 12:02:31.069633', NULL);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: one
--

SELECT pg_catalog.setval('users_id_seq', 3, true);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (user_id);


--
-- Name: books_isbn_key; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_isbn_key UNIQUE (isbn);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users_books_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY users_books
    ADD CONSTRAINT users_books_pkey PRIMARY KEY (user_id, book_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: reviews_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE;


--
-- Name: reviews_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;


--
-- Name: users_books_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY users_books
    ADD CONSTRAINT users_books_book_id_fkey FOREIGN KEY (book_id) REFERENCES books(id) ON UPDATE CASCADE;


--
-- Name: users_books_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: one
--

ALTER TABLE ONLY users_books
    ADD CONSTRAINT users_books_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id) ON UPDATE CASCADE;


--
-- PostgreSQL database dump complete
--


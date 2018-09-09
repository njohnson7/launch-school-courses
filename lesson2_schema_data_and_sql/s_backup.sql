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

DROP TABLE public.weather;
DROP TABLE public.menu_items;
DROP TABLE public.films;
DROP TABLE public.employees;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
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
-- Name: employees; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE employees (
    first_name character varying(100),
    last_name character varying(100),
    department character varying(100) DEFAULT 'unassigned'::character varying NOT NULL,
    vacation_remaining integer DEFAULT 0 NOT NULL
);


ALTER TABLE employees OWNER TO one;

--
-- Name: films; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE films (
    title character varying(255),
    year integer,
    genre character varying(100),
    director text,
    duration integer
);


ALTER TABLE films OWNER TO one;

--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE menu_items (
    item text,
    prep_time integer,
    ingredient_cost numeric(5,2),
    sales integer,
    menu_price numeric(5,2)
);


ALTER TABLE menu_items OWNER TO one;

--
-- Name: weather; Type: TABLE; Schema: public; Owner: one
--

CREATE TABLE weather (
    date date DEFAULT now() NOT NULL,
    low integer NOT NULL,
    high integer NOT NULL,
    rainfall numeric(6,3) DEFAULT 0 NOT NULL,
    CONSTRAINT temperatures_high_check CHECK (((high > '-50'::integer) AND (high < 150))),
    CONSTRAINT temperatures_low_check CHECK (((low > '-50'::integer) AND (low < 150)))
);


ALTER TABLE weather OWNER TO one;

--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: one
--

COPY employees (first_name, last_name, department, vacation_remaining) FROM stdin;
Leonardo	Ferreira	finance	14
Sara	Mikaelsen	operations	14
Lian	Ma	marketing	13
bob	jones	unassigned	0
eric	fredrickson	unassigned	0
\.


--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: one
--

COPY films (title, year, genre, director, duration) FROM stdin;
Die Hard	1988	action	John McTiernan	132
Casablanca	1942	drama	Michael Curtiz	102
The Conversation	1974	thriller	Francis Ford Coppola	113
1984	1956	scifi	Michael Anderson	90
Tinker Tailor Soldier Spy	2011	espionage	Tomas Alfredson	127
The Birdcage	1996	comedy	Mike Nichols	118
\.


--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: one
--

COPY menu_items (item, prep_time, ingredient_cost, sales, menu_price) FROM stdin;
omelette	10	1.50	182	7.99
tacos	5	2.00	254	8.99
oatmeal	1	0.50	79	5.99
\.


--
-- Data for Name: weather; Type: TABLE DATA; Schema: public; Owner: one
--

COPY weather (date, low, high, rainfall) FROM stdin;
2016-03-07	29	32	0.000
2016-03-08	23	31	0.000
2016-03-09	17	28	0.000
2016-03-01	34	43	0.118
2016-03-02	32	44	0.118
2016-03-03	31	47	0.157
2016-03-04	33	42	0.079
2016-03-05	39	46	0.276
2016-03-06	32	43	0.079
\.


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


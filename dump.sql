--
-- PostgreSQL database dump
--

-- Dumped from database version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.5 (Ubuntu 12.5-0ubuntu0.20.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: interval_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.interval_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interval_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: intervals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.intervals (
    interval_id integer DEFAULT nextval('public.interval_id_seq'::regclass) NOT NULL,
    description character varying(500),
    timer_id integer NOT NULL
);


ALTER TABLE public.intervals OWNER TO postgres;

--
-- Name: timer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.timer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.timer_id_seq OWNER TO postgres;

--
-- Name: timers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.timers (
    timer_id integer DEFAULT nextval('public.timer_id_seq'::regclass) NOT NULL,
    description character varying(500),
    user_id integer NOT NULL
);


ALTER TABLE public.timers OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer DEFAULT nextval('public.user_id_seq'::regclass) NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(100),
    api_token character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: intervals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.intervals (interval_id, description, timer_id) FROM stdin;
\.


--
-- Data for Name: timers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.timers (timer_id, description, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, email, password, api_token) FROM stdin;
12	newemail13@gmail.com	updatedpasswrod1092091	19i209i1209e0129i090e
\.


--
-- Name: interval_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.interval_id_seq', 1, false);


--
-- Name: timer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.timer_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 17, true);


--
-- Name: intervals intervals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervals
    ADD CONSTRAINT intervals_pkey PRIMARY KEY (interval_id);


--
-- Name: timers timers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timers
    ADD CONSTRAINT timers_pkey PRIMARY KEY (timer_id);


--
-- Name: users unique_email_constraint; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_email_constraint UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: intervals fk_timer_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.intervals
    ADD CONSTRAINT fk_timer_id FOREIGN KEY (timer_id) REFERENCES public.timers(timer_id) ON DELETE CASCADE;


--
-- Name: timers fk_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.timers
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--


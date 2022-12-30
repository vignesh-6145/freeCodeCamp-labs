--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    name character varying(22) NOT NULL,
    ngames integer DEFAULT 0 NOT NULL,
    bscore integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (30, 'user_1672394241580', 2, 241);
INSERT INTO public.user_info VALUES (40, 'user_1672394428401', 2, 197);
INSERT INTO public.user_info VALUES (29, 'user_1672394241581', 5, 275);
INSERT INTO public.user_info VALUES (39, 'user_1672394428402', 5, 122);
INSERT INTO public.user_info VALUES (32, 'user_1672394273005', 2, 798);
INSERT INTO public.user_info VALUES (31, 'user_1672394273006', 5, 163);
INSERT INTO public.user_info VALUES (42, 'user_1672394466208', 2, 531);
INSERT INTO public.user_info VALUES (1, 'vignesh', 2, 22);
INSERT INTO public.user_info VALUES (34, 'user_1672394308325', 2, 534);
INSERT INTO public.user_info VALUES (41, 'user_1672394466209', 5, 106);
INSERT INTO public.user_info VALUES (33, 'user_1672394308326', 5, 235);
INSERT INTO public.user_info VALUES (44, 'user_1672394673413', 2, 548);
INSERT INTO public.user_info VALUES (36, 'user_1672394329237', 2, 344);
INSERT INTO public.user_info VALUES (43, 'user_1672394673414', 5, 12);
INSERT INTO public.user_info VALUES (35, 'user_1672394329238', 5, 464);
INSERT INTO public.user_info VALUES (38, 'user_1672394364356', 2, 347);
INSERT INTO public.user_info VALUES (46, 'user_1672394707613', 2, 530);
INSERT INTO public.user_info VALUES (28, 'user_1672393980629', 2, 222);
INSERT INTO public.user_info VALUES (37, 'user_1672394364357', 5, 191);
INSERT INTO public.user_info VALUES (45, 'user_1672394707614', 5, 263);
INSERT INTO public.user_info VALUES (27, 'user_1672393980630', 5, 248);
INSERT INTO public.user_info VALUES (48, 'user_1672394787267', 2, 291);
INSERT INTO public.user_info VALUES (47, 'user_1672394787268', 5, 126);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 48, true);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--


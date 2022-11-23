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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean,
    distance_from_earth numeric(7,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30),
    moon_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean,
    distance_from_earth numeric(7,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: place; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.place (
    place_id integer NOT NULL,
    name character varying(30) NOT NULL,
    area numeric(7,1),
    on_earth boolean
);


ALTER TABLE public.place OWNER TO freecodecamp;

--
-- Name: places_place_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.places_place_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.places_place_id_seq OWNER TO freecodecamp;

--
-- Name: places_place_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.places_place_id_seq OWNED BY public.place.place_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(30),
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean,
    distance_from_earth numeric(7,2),
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30),
    star_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    has_life boolean,
    distance_from_earth numeric(7,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: place place_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.place ALTER COLUMN place_id SET DEFAULT nextval('public.places_place_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky way', 1, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('MCU', 2, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('DCU', 3, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('LCU', 4, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('RCU', 5, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES ('SCU', 6, NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('a', 1, NULL, NULL, NULL, NULL, 13);
INSERT INTO public.moon VALUES ('b', 2, NULL, NULL, NULL, NULL, 14);
INSERT INTO public.moon VALUES ('c', 3, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.moon VALUES ('d', 4, NULL, NULL, NULL, NULL, 16);
INSERT INTO public.moon VALUES ('e', 5, NULL, NULL, NULL, NULL, 17);
INSERT INTO public.moon VALUES ('f', 6, NULL, NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES ('g', 7, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES ('h', 8, NULL, NULL, NULL, NULL, 20);
INSERT INTO public.moon VALUES ('i', 9, NULL, NULL, NULL, NULL, 21);
INSERT INTO public.moon VALUES ('j', 10, NULL, NULL, NULL, NULL, 22);
INSERT INTO public.moon VALUES ('aa', 12, NULL, NULL, NULL, NULL, 13);
INSERT INTO public.moon VALUES ('bb', 13, NULL, NULL, NULL, NULL, 14);
INSERT INTO public.moon VALUES ('cc', 14, NULL, NULL, NULL, NULL, 15);
INSERT INTO public.moon VALUES ('dd', 15, NULL, NULL, NULL, NULL, 16);
INSERT INTO public.moon VALUES ('ee', 16, NULL, NULL, NULL, NULL, 17);
INSERT INTO public.moon VALUES ('ff', 17, NULL, NULL, NULL, NULL, 18);
INSERT INTO public.moon VALUES ('gg', 18, NULL, NULL, NULL, NULL, 19);
INSERT INTO public.moon VALUES ('hh', 19, NULL, NULL, NULL, NULL, 20);
INSERT INTO public.moon VALUES ('ii', 20, NULL, NULL, NULL, NULL, 21);
INSERT INTO public.moon VALUES ('jj', 21, NULL, NULL, NULL, NULL, 22);


--
-- Data for Name: place; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.place VALUES (1, 'Nandigama', NULL, NULL);
INSERT INTO public.place VALUES (2, 'Amaravati', NULL, NULL);
INSERT INTO public.place VALUES (3, 'kovvuru', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('earth', 13, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('jupiter', 14, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('neptune', 15, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES ('mars', 16, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES ('pluto', 17, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('a', 18, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('b', 19, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES ('c', 20, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('d', 21, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('e', 22, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('f', 23, NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES ('g', 24, NULL, NULL, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sirius', 1, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES ('evans', 2, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES ('kamal', 3, NULL, NULL, NULL, NULL, 4);
INSERT INTO public.star VALUES ('anand', 4, NULL, NULL, NULL, NULL, 6);
INSERT INTO public.star VALUES ('ram', 5, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES ('bale', 6, NULL, NULL, NULL, NULL, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: places_place_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.places_place_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: galaxy name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: moon name_mn; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT name_mn UNIQUE (name);


--
-- Name: planet name_pt; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_pt UNIQUE (name);


--
-- Name: star name_st; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name_st UNIQUE (name);


--
-- Name: place places_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT places_name_key UNIQUE (name);


--
-- Name: place places_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.place
    ADD CONSTRAINT places_pkey PRIMARY KEY (place_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


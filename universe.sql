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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovered_on date,
    discovered_by character varying(60),
    radius_in_ly integer
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
-- Name: human_colony; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.human_colony (
    human_colony_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    active_colony boolean,
    life_expectancy integer,
    motto text,
    name character varying(30) NOT NULL
);


ALTER TABLE public.human_colony OWNER TO freecodecamp;

--
-- Name: human_colony_human_colony_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.human_colony_human_colony_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.human_colony_human_colony_id_seq OWNER TO freecodecamp;

--
-- Name: human_colony_human_colony_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.human_colony_human_colony_id_seq OWNED BY public.human_colony.human_colony_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    gravity numeric,
    visited boolean,
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    has_life boolean,
    age_in_millions_of_years numeric,
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    lifespan_in_million_of_years integer,
    galaxy_id integer,
    average_temperature_in_k integer
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
-- Name: human_colony human_colony_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_colony ALTER COLUMN human_colony_id SET DEFAULT nextval('public.human_colony_human_colony_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', '1610-01-01', 'Galileo', 52850);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', '1612-01-01', 'Simon Marius', 110000);
INSERT INTO public.galaxy VALUES (3, 'NGC 332', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 225', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'NGC 315', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 250', NULL, NULL, NULL);


--
-- Data for Name: human_colony; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.human_colony VALUES (1, 1, 1, true, 63, '', 'Origin');
INSERT INTO public.human_colony VALUES (2, 1, 7, false, 0, 'Everything is possible...', 'First Try of Colonization');
INSERT INTO public.human_colony VALUES (3, 2, 2, true, 250, 'Transhumanism', 'Cyborgs');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (6, 'Moon', 1.62, true, 1);
INSERT INTO public.moon VALUES (1, 'Titan', NULL, NULL, 7);
INSERT INTO public.moon VALUES (2, 'Mimas', NULL, NULL, 7);
INSERT INTO public.moon VALUES (3, 'Encelado', NULL, NULL, 7);
INSERT INTO public.moon VALUES (4, 'Dione', NULL, NULL, 7);
INSERT INTO public.moon VALUES (5, 'Tetis', NULL, NULL, 7);
INSERT INTO public.moon VALUES (7, 'Io', NULL, NULL, 3);
INSERT INTO public.moon VALUES (8, 'Europa', NULL, NULL, 3);
INSERT INTO public.moon VALUES (9, 'Ganymede', NULL, NULL, 3);
INSERT INTO public.moon VALUES (10, 'Callisto', NULL, NULL, 3);
INSERT INTO public.moon VALUES (11, 'Leda', NULL, NULL, 3);
INSERT INTO public.moon VALUES (12, 'Himalia', NULL, NULL, 3);
INSERT INTO public.moon VALUES (13, 'Ersa', NULL, NULL, 3);
INSERT INTO public.moon VALUES (14, 'Alga', NULL, NULL, 2);
INSERT INTO public.moon VALUES (15, 'LLL EG 2', NULL, NULL, 2);
INSERT INTO public.moon VALUES (16, 'OIL 5', NULL, NULL, 4);
INSERT INTO public.moon VALUES (17, 'Klot', NULL, NULL, 4);
INSERT INTO public.moon VALUES (18, 'Jota', NULL, NULL, 5);
INSERT INTO public.moon VALUES (19, 'PPP 312', NULL, NULL, 5);
INSERT INTO public.moon VALUES (20, 'Aseo 2', NULL, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 4543, 1);
INSERT INTO public.planet VALUES (2, 'KKL 340', false, 6000, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', false, 4603, 1);
INSERT INTO public.planet VALUES (4, 'OOLC 12', NULL, NULL, 5);
INSERT INTO public.planet VALUES (5, 'AALC 12', NULL, NULL, 5);
INSERT INTO public.planet VALUES (6, 'UULC 24', NULL, NULL, 5);
INSERT INTO public.planet VALUES (7, 'Saturn', NULL, NULL, 1);
INSERT INTO public.planet VALUES (8, 'PON 21', NULL, NULL, 5);
INSERT INTO public.planet VALUES (9, 'PON 34', NULL, NULL, 5);
INSERT INTO public.planet VALUES (10, 'ALCA 34', NULL, NULL, 6);
INSERT INTO public.planet VALUES (11, 'Alfajor', NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Medialuna', NULL, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Highon', 3500, 2, 6000);
INSERT INTO public.star VALUES (3, 'HHHCI 83', 5540, 3, 6550);
INSERT INTO public.star VALUES (4, 'future bh', 1, 4, 4000);
INSERT INTO public.star VALUES (5, 'ALLC 343', 8000, 5, 7000);
INSERT INTO public.star VALUES (6, '22331-233456', 5700, 6, 5552);
INSERT INTO public.star VALUES (1, 'Sun', 5000, 1, 5778);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: human_colony_human_colony_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.human_colony_human_colony_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: human_colony human_colony_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_colony
    ADD CONSTRAINT human_colony_name_key UNIQUE (name);


--
-- Name: human_colony human_colony_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_colony
    ADD CONSTRAINT human_colony_pkey PRIMARY KEY (human_colony_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: human_colony uc_human_colony_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_colony
    ADD CONSTRAINT uc_human_colony_id UNIQUE (human_colony_id);


--
-- Name: human_colony human_colony_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_colony
    ADD CONSTRAINT human_colony_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: human_colony human_colony_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.human_colony
    ADD CONSTRAINT human_colony_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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


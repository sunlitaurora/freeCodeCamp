--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km numeric(8,2),
    is_potentially_hazardous boolean NOT NULL,
    last_observed_date date,
    star_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    diameter_in_light_years numeric(10,2),
    is_spiral boolean NOT NULL,
    is_visible_to_naked_eye boolean,
    description text
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
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    diameter_km integer,
    is_spherical boolean,
    is_tidally_locked boolean NOT NULL,
    orbital_period_days numeric(10,2),
    planet_id integer
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
    name character varying(100) NOT NULL,
    mass_in_earth_masses numeric(10,2),
    diameter_km integer,
    has_atmosphere boolean NOT NULL,
    is_habitable boolean,
    orbital_period_days numeric(10,2) NOT NULL,
    star_id integer
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
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    temperature_kelvin integer NOT NULL,
    is_spherical boolean,
    is_main_sequence boolean NOT NULL,
    galaxy_id integer
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 945.00, false, '2023-08-01', 1);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 530.00, false, '2023-07-15', 1);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512.00, false, '2023-06-30', 1);
INSERT INTO public.asteroid VALUES (4, 'Hygiea', 431.00, false, '2023-09-01', 1);
INSERT INTO public.asteroid VALUES (5, 'Interamnia', 335.00, false, '2023-08-15', 1);
INSERT INTO public.asteroid VALUES (6, 'Psyche', 226.00, false, '2023-08-30', 1);
INSERT INTO public.asteroid VALUES (7, 'Apophis', 0.34, true, '2023-09-02', 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 100000.00, true, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 220000.00, true, true, 'Nearest major galaxy to the Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3200, 60000.00, true, true, 'Smallest member of the Local Group of galaxies');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 13000, 60000.00, false, true, 'Prominent elliptical galaxy');
INSERT INTO public.galaxy VALUES (5, 'Messier 81', 13300, 120000.00, true, true, 'Grand design spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Messier 82', 12000, 37000.00, false, true, 'Starburst galaxy with a galactic superwind');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, true, true, 27.32, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, false, true, 0.32, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, false, true, 1.26, 2);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5268, true, true, 7.15, 3);
INSERT INTO public.moon VALUES (5, 'Callisto', 4820, true, true, 16.69, 3);
INSERT INTO public.moon VALUES (6, 'Io', 3642, true, true, 1.77, 3);
INSERT INTO public.moon VALUES (7, 'Europa', 3122, true, true, 3.55, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 5150, true, true, 15.95, 4);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, true, true, 1.37, 4);
INSERT INTO public.moon VALUES (10, 'Dione', 1122, true, true, 2.74, 4);
INSERT INTO public.moon VALUES (11, 'Rhea', 1530, true, true, 4.52, 4);
INSERT INTO public.moon VALUES (12, 'Iapetus', 730, true, true, 79.33, 4);
INSERT INTO public.moon VALUES (13, 'Ariel', 1160, true, true, 2.52, 5);
INSERT INTO public.moon VALUES (14, 'Umbriel', 1190, true, true, 4.14, 5);
INSERT INTO public.moon VALUES (15, 'Titania', 1580, true, true, 8.71, 5);
INSERT INTO public.moon VALUES (16, 'Oberon', 1530, true, true, 13.46, 5);
INSERT INTO public.moon VALUES (17, 'Triton', 2720, true, true, 5.87, 6);
INSERT INTO public.moon VALUES (18, 'Nereid', 340, false, true, 360.13, 6);
INSERT INTO public.moon VALUES (19, 'Despina', 150, false, true, 0.33, 6);
INSERT INTO public.moon VALUES (20, 'Galatea', 170, false, true, 0.43, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.00, 12742, true, true, 365.25, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 0.11, 6779, true, false, 687.00, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 317.83, 142984, true, false, 4332.82, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 95.16, 120536, true, false, 10759.22, 1);
INSERT INTO public.planet VALUES (5, 'Uranus', 14.54, 51118, true, false, 30688.50, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 17.15, 49528, true, false, 60182.00, 1);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri b', 1.17, 12742, true, true, 11.18, 1);
INSERT INTO public.planet VALUES (8, 'Kepler-186f', 1.11, 13789, true, true, 130.00, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-16b', 0.33, 9979, true, false, 228.78, 1);
INSERT INTO public.planet VALUES (10, 'HD 209458 b', 0.69, 14300, true, false, 3.52, 1);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 0.62, 9200, true, true, 6.10, 1);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 5.00, 15000, true, true, 384.84, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 5778, true, true, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 230, 9940, true, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10, 3600, false, false, 1);
INSERT INTO public.star VALUES (4, 'Aldebaran', 5000, 3900, true, false, 1);
INSERT INTO public.star VALUES (5, 'Vega', 455, 9600, true, true, 1);
INSERT INTO public.star VALUES (6, 'Antares', 11, 3600, false, false, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


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
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


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
-- Name: asteroid asteroid_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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


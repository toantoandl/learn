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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (661, 2018, 'Final', 1079, 1080, 4, 2);
INSERT INTO public.games VALUES (662, 2018, 'Third Place', 1081, 1082, 2, 0);
INSERT INTO public.games VALUES (663, 2018, 'Semi-Final', 1080, 1082, 2, 1);
INSERT INTO public.games VALUES (664, 2018, 'Semi-Final', 1079, 1081, 1, 0);
INSERT INTO public.games VALUES (665, 2018, 'Quarter-Final', 1080, 1083, 3, 2);
INSERT INTO public.games VALUES (666, 2018, 'Quarter-Final', 1082, 1084, 2, 0);
INSERT INTO public.games VALUES (667, 2018, 'Quarter-Final', 1081, 1085, 2, 1);
INSERT INTO public.games VALUES (668, 2018, 'Quarter-Final', 1079, 1086, 2, 0);
INSERT INTO public.games VALUES (669, 2018, 'Eighth-Final', 1082, 1087, 2, 1);
INSERT INTO public.games VALUES (670, 2018, 'Eighth-Final', 1084, 1088, 1, 0);
INSERT INTO public.games VALUES (671, 2018, 'Eighth-Final', 1081, 1089, 3, 2);
INSERT INTO public.games VALUES (672, 2018, 'Eighth-Final', 1085, 1090, 2, 0);
INSERT INTO public.games VALUES (673, 2018, 'Eighth-Final', 1080, 1091, 2, 1);
INSERT INTO public.games VALUES (674, 2018, 'Eighth-Final', 1083, 1092, 2, 1);
INSERT INTO public.games VALUES (675, 2018, 'Eighth-Final', 1086, 1093, 2, 1);
INSERT INTO public.games VALUES (676, 2018, 'Eighth-Final', 1079, 1094, 4, 3);
INSERT INTO public.games VALUES (677, 2014, 'Final', 1095, 1094, 1, 0);
INSERT INTO public.games VALUES (678, 2014, 'Third Place', 1096, 1085, 3, 0);
INSERT INTO public.games VALUES (679, 2014, 'Semi-Final', 1094, 1096, 1, 0);
INSERT INTO public.games VALUES (680, 2014, 'Semi-Final', 1095, 1085, 7, 1);
INSERT INTO public.games VALUES (681, 2014, 'Quarter-Final', 1096, 1097, 1, 0);
INSERT INTO public.games VALUES (682, 2014, 'Quarter-Final', 1094, 1081, 1, 0);
INSERT INTO public.games VALUES (683, 2014, 'Quarter-Final', 1085, 1087, 2, 1);
INSERT INTO public.games VALUES (684, 2014, 'Quarter-Final', 1095, 1079, 1, 0);
INSERT INTO public.games VALUES (685, 2014, 'Eighth-Final', 1085, 1098, 2, 1);
INSERT INTO public.games VALUES (686, 2014, 'Eighth-Final', 1087, 1086, 2, 0);
INSERT INTO public.games VALUES (687, 2014, 'Eighth-Final', 1079, 1099, 2, 0);
INSERT INTO public.games VALUES (688, 2014, 'Eighth-Final', 1095, 1100, 2, 1);
INSERT INTO public.games VALUES (689, 2014, 'Eighth-Final', 1096, 1090, 2, 1);
INSERT INTO public.games VALUES (690, 2014, 'Eighth-Final', 1097, 1101, 2, 1);
INSERT INTO public.games VALUES (691, 2014, 'Eighth-Final', 1094, 1088, 1, 0);
INSERT INTO public.games VALUES (692, 2014, 'Eighth-Final', 1081, 1102, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (1079, 'France');
INSERT INTO public.teams VALUES (1080, 'Croatia');
INSERT INTO public.teams VALUES (1081, 'Belgium');
INSERT INTO public.teams VALUES (1082, 'England');
INSERT INTO public.teams VALUES (1083, 'Russia');
INSERT INTO public.teams VALUES (1084, 'Sweden');
INSERT INTO public.teams VALUES (1085, 'Brazil');
INSERT INTO public.teams VALUES (1086, 'Uruguay');
INSERT INTO public.teams VALUES (1087, 'Colombia');
INSERT INTO public.teams VALUES (1088, 'Switzerland');
INSERT INTO public.teams VALUES (1089, 'Japan');
INSERT INTO public.teams VALUES (1090, 'Mexico');
INSERT INTO public.teams VALUES (1091, 'Denmark');
INSERT INTO public.teams VALUES (1092, 'Spain');
INSERT INTO public.teams VALUES (1093, 'Portugal');
INSERT INTO public.teams VALUES (1094, 'Argentina');
INSERT INTO public.teams VALUES (1095, 'Germany');
INSERT INTO public.teams VALUES (1096, 'Netherlands');
INSERT INTO public.teams VALUES (1097, 'Costa Rica');
INSERT INTO public.teams VALUES (1098, 'Chile');
INSERT INTO public.teams VALUES (1099, 'Nigeria');
INSERT INTO public.teams VALUES (1100, 'Algeria');
INSERT INTO public.teams VALUES (1101, 'Greece');
INSERT INTO public.teams VALUES (1102, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 692, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1102, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--


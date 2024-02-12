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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    player_id integer,
    number_of_guesses integer,
    game_id integer NOT NULL
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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    username character varying(22),
    num_games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (474, 8, 17);
INSERT INTO public.games VALUES (474, 9, 18);
INSERT INTO public.games VALUES (474, 14, 19);
INSERT INTO public.games VALUES (475, 871, 20);
INSERT INTO public.games VALUES (475, 730, 21);
INSERT INTO public.games VALUES (476, 52, 22);
INSERT INTO public.games VALUES (476, 484, 23);
INSERT INTO public.games VALUES (475, 44, 24);
INSERT INTO public.games VALUES (475, 599, 25);
INSERT INTO public.games VALUES (475, 664, 26);
INSERT INTO public.games VALUES (474, 4, 27);
INSERT INTO public.games VALUES (477, 870, 28);
INSERT INTO public.games VALUES (477, 198, 29);
INSERT INTO public.games VALUES (478, 433, 30);
INSERT INTO public.games VALUES (478, 298, 31);
INSERT INTO public.games VALUES (477, 973, 32);
INSERT INTO public.games VALUES (477, 960, 33);
INSERT INTO public.games VALUES (477, 873, 34);
INSERT INTO public.games VALUES (474, 3, 35);
INSERT INTO public.games VALUES (479, 587, 36);
INSERT INTO public.games VALUES (479, 200, 37);
INSERT INTO public.games VALUES (480, 633, 38);
INSERT INTO public.games VALUES (480, 132, 39);
INSERT INTO public.games VALUES (479, 50, 40);
INSERT INTO public.games VALUES (479, 877, 41);
INSERT INTO public.games VALUES (479, 676, 42);
INSERT INTO public.games VALUES (481, 590, 43);
INSERT INTO public.games VALUES (481, 185, 44);
INSERT INTO public.games VALUES (482, 981, 45);
INSERT INTO public.games VALUES (482, 34, 46);
INSERT INTO public.games VALUES (481, 78, 47);
INSERT INTO public.games VALUES (481, 804, 48);
INSERT INTO public.games VALUES (481, 976, 49);
INSERT INTO public.games VALUES (483, 331, 50);
INSERT INTO public.games VALUES (483, 827, 51);
INSERT INTO public.games VALUES (484, 549, 52);
INSERT INTO public.games VALUES (484, 657, 53);
INSERT INTO public.games VALUES (483, 49, 54);
INSERT INTO public.games VALUES (483, 134, 55);
INSERT INTO public.games VALUES (483, 282, 56);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (474, 'Paul', NULL, NULL);
INSERT INTO public.players VALUES (475, 'user_1707696898366', NULL, NULL);
INSERT INTO public.players VALUES (476, 'user_1707696898365', NULL, NULL);
INSERT INTO public.players VALUES (477, 'user_1707697198165', NULL, NULL);
INSERT INTO public.players VALUES (478, 'user_1707697198164', NULL, NULL);
INSERT INTO public.players VALUES (479, 'user_1707697319669', NULL, NULL);
INSERT INTO public.players VALUES (480, 'user_1707697319668', NULL, NULL);
INSERT INTO public.players VALUES (481, 'user_1707697376269', NULL, NULL);
INSERT INTO public.players VALUES (482, 'user_1707697376268', NULL, NULL);
INSERT INTO public.players VALUES (483, 'user_1707697458269', NULL, NULL);
INSERT INTO public.players VALUES (484, 'user_1707697458268', NULL, NULL);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 56, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 484, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--


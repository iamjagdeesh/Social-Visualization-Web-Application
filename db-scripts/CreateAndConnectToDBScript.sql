SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "AdaptiveWeb";
--
-- TOC entry 2153 (class 1262 OID 16433)
-- Name: AdaptiveWeb; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "AdaptiveWeb" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE "AdaptiveWeb" OWNER TO postgres;

\connect "AdaptiveWeb"
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.14
-- Dumped by pg_dump version 9.5.14

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12355)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16553)
-- Name: event; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.event OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16585)
-- Name: event_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_history (
    id integer NOT NULL,
    event_id integer NOT NULL,
    event_time timestamp without time zone NOT NULL,
    user_id character varying(255) NOT NULL,
    description character varying(255)
);


ALTER TABLE public.event_history OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16583)
-- Name: event_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_history_id_seq OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 186
-- Name: event_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_history_id_seq OWNED BY public.event_history.id;


--
-- TOC entry 182 (class 1259 OID 16551)
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO postgres;

--
-- TOC entry 2158 (class 0 OID 0)
-- Dependencies: 182
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- TOC entry 185 (class 1259 OID 16564)
-- Name: login_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.login_history (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    login_time timestamp without time zone NOT NULL
);


ALTER TABLE public.login_history OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16562)
-- Name: login_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.login_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.login_history_id_seq OWNER TO postgres;

--
-- TOC entry 2159 (class 0 OID 0)
-- Dependencies: 184
-- Name: login_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.login_history_id_seq OWNED BY public.login_history.id;


--
-- TOC entry 181 (class 1259 OID 16442)
-- Name: user_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_table (
    id character varying(255) NOT NULL,
    name character varying(255),
    password character varying(255) NOT NULL
);


ALTER TABLE public.user_table OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 24687)
-- Name: user_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tags (
    id integer NOT NULL,
    user_id character varying(255) NOT NULL,
    tag character varying(255) NOT NULL,
    count integer DEFAULT 1 NOT NULL,
    last_visited timestamp without time zone NOT NULL
);


ALTER TABLE public.user_tags OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 24685)
-- Name: user_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_tags_id_seq OWNER TO postgres;

--
-- TOC entry 2160 (class 0 OID 0)
-- Dependencies: 188
-- Name: user_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_tags_id_seq OWNED BY public.user_tags.id;


--
-- TOC entry 2006 (class 2604 OID 16556)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 16588)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_history ALTER COLUMN id SET DEFAULT nextval('public.event_history_id_seq'::regclass);


--
-- TOC entry 2007 (class 2604 OID 16567)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history ALTER COLUMN id SET DEFAULT nextval('public.login_history_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 24690)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tags ALTER COLUMN id SET DEFAULT nextval('public.user_tags_id_seq'::regclass);


--
-- TOC entry 2141 (class 0 OID 16553)
-- Dependencies: 183
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event (id, name) VALUES (1, 'click');
INSERT INTO public.event (id, name) VALUES (2, 'post');
INSERT INTO public.event (id, name) VALUES (3, 'like');
INSERT INTO public.event (id, name) VALUES (4, 'upvote');
INSERT INTO public.event (id, name) VALUES (5, 'downvote');
INSERT INTO public.event (id, name) VALUES (6, 'answer');
INSERT INTO public.event (id, name) VALUES (7, 'comment');
INSERT INTO public.event (id, name) VALUES (13, 'question-link');
INSERT INTO public.event (id, name) VALUES (14, 'vote-up');
INSERT INTO public.event (id, name) VALUES (15, 'vote-down');
INSERT INTO public.event (id, name) VALUES (16, 'favorite');
INSERT INTO public.event (id, name) VALUES (17, 'tagsInPage');


--
-- TOC entry 2145 (class 0 OID 16585)
-- Dependencies: 187
-- Data for Name: event_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (1, 1, '2018-09-18 03:13:44.227', 'aaa', 'Clicked post something');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (2, 1, '2018-09-18 16:04:55.751', 'aaa', 'Clicked anything');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (3, 1, '2018-09-18 16:05:01.636', 'aaa', 'Clicked anything');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (4, 1, '2018-09-18 16:05:01.646', 'aaa', 'Clicked anything');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (5, 1, '2018-09-18 16:05:23.716', 'aaa', 'Clicked anything');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (6, 1, '2018-09-18 16:05:23.722', 'aaa', 'Clicked anything');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (7, 1, '2018-09-18 16:06:39.207', 'aaa', 'Clicked anything');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (8, 1, '2018-09-18 16:06:39.211', 'aaa', 'Clicked anything');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (13, 13, '2018-09-18 16:29:25.637', 'aaa', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (14, 14, '2018-09-18 16:31:31.291', 'aaa', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (15, 15, '2018-09-18 16:32:11.405', 'aaa', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (16, 16, '2018-09-18 16:33:32.421', 'aaa', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (17, 16, '2018-09-18 16:36:26.059', 'aaa', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (18, 13, '2018-09-18 16:41:45.88', 'aaa', 'https://stackoverflow.com/questions/tagged/python');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (19, 13, '2018-09-18 16:51:41.255', 'aaa', 'https://stackoverflow.com/questions/tagged/java');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (20, 13, '2018-09-18 16:56:41.697', 'aaa', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (21, 13, '2018-09-18 18:54:52.472', 'aaa', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (22, 13, '2018-09-18 18:57:06.348', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (23, 13, '2018-09-18 21:09:02.956', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (24, 13, '2018-09-18 21:09:26.184', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (25, 13, '2018-09-18 21:09:42.551', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (26, 13, '2018-09-18 21:10:31.776', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (27, 13, '2018-09-18 21:15:48.432', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (28, 13, '2018-09-18 21:15:59.239', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (29, 14, '2018-09-18 21:16:13.674', 'iamjagdeesh', 'https://stackoverflow.com/questions/9554636/the-use-of-multiple-jframes-good-or-bad-practice');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (30, 15, '2018-09-18 21:16:20.296', 'iamjagdeesh', 'https://stackoverflow.com/questions/9554636/the-use-of-multiple-jframes-good-or-bad-practice');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (31, 13, '2018-09-18 21:16:40.235', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (32, 14, '2018-09-18 21:16:50.91', 'iamjagdeesh', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (33, 15, '2018-09-18 21:16:54.039', 'iamjagdeesh', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (34, 17, '2018-09-19 04:39:20.729', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (35, 17, '2018-09-19 04:39:58.107', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (36, 13, '2018-09-19 04:42:20.431', 'iamjagdeesh', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (37, 17, '2018-09-19 04:42:21.753', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (38, 17, '2018-09-19 05:14:04.262', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (39, 17, '2018-09-19 05:14:09.136', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (40, 17, '2018-09-19 05:14:12.832', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (41, 17, '2018-09-19 05:14:17.72', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (42, 17, '2018-09-19 05:14:18.911', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (43, 17, '2018-09-19 05:14:19.679', 'iamjagdeesh', '');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (44, 13, '2018-09-19 05:14:20.319', 'iamjagdeesh', 'https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (45, 17, '2018-09-19 05:14:22.183', 'iamjagdeesh', 'android,swing,spring,eclipse,hibernate,multithreading,maven,json,spring-mvc,xml,string,arrays,jpa,servlets,jsp,jdbc,tomcat,java-ee,java-8,generics,mysql,regex,javafx,spring-boot,jar');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (46, 17, '2018-09-19 05:14:23.96', 'iamjagdeesh', 'android,swing,spring,eclipse,hibernate,multithreading,maven,json,spring-mvc,xml,string,arrays,jpa,servlets,jsp,jdbc,tomcat,java-ee,java-8,generics,mysql,regex,javafx,spring-boot,jar');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (47, 17, '2018-09-19 05:14:25.159', 'aaa', 'android,swing,spring,eclipse,hibernate,multithreading,maven,json,spring-mvc,xml,string,arrays,jpa,servlets,jsp,jdbc,tomcat,java-ee,java-8,generics,mysql,regex,javafx,spring-boot,jar');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (48, 13, '2018-09-19 15:10:27.255', 'bbb', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (49, 13, '2018-09-19 15:59:31.83', 'aaa', 'https://stackoverflow.com/questions/tagged/javascript');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (50, 16, '2018-09-19 20:06:44.265', 'ccc', 'https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (51, 16, '2018-09-19 20:06:45.633', 'ccc', 'https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (52, 14, '2018-09-19 20:07:17.282', 'ccc', 'https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (53, 15, '2018-09-19 20:07:20.045', 'ccc', 'https://stackoverflow.com/questions/513832/how-do-i-compare-strings-in-java');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (54, 13, '2018-09-20 00:23:40.092', 'am11', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (55, 13, '2018-09-20 00:23:49.683', 'am11', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (56, 14, '2018-09-20 00:23:53.171', 'am11', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (57, 15, '2018-09-20 00:23:55.218', 'am11', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (58, 16, '2018-09-20 00:24:00.144', 'am11', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (59, 16, '2018-09-20 00:24:02.272', 'am11', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (60, 14, '2018-09-20 00:24:11.22', 'am11', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (61, 14, '2018-09-20 00:24:17.849', 'am11', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (62, 13, '2018-09-20 00:49:56.469', 'mr10', 'https://stackoverflow.com/questions/tagged/java?sort=frequent&pageSize=15');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (63, 14, '2018-09-20 00:49:58.317', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (64, 15, '2018-09-20 00:49:59.368', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (65, 14, '2018-09-20 00:50:03.242', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (66, 14, '2018-09-20 00:50:03.553', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (67, 14, '2018-09-20 00:50:03.794', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (68, 14, '2018-09-20 00:50:03.992', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (69, 14, '2018-09-20 00:50:04.186', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (70, 14, '2018-09-20 00:50:04.401', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (71, 14, '2018-09-20 00:50:04.607', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (72, 14, '2018-09-20 00:50:04.793', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (73, 14, '2018-09-20 00:50:04.96', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (74, 15, '2018-09-20 00:50:06.312', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (75, 16, '2018-09-20 00:50:09.016', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (76, 16, '2018-09-20 00:50:09.626', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (77, 16, '2018-09-20 00:50:10.226', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (78, 16, '2018-09-20 00:50:10.513', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (79, 16, '2018-09-20 00:50:10.599', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (80, 16, '2018-09-20 00:50:11.169', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (81, 16, '2018-09-20 00:50:11.425', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (82, 16, '2018-09-20 00:50:11.872', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');
INSERT INTO public.event_history (id, event_id, event_time, user_id, description) VALUES (83, 16, '2018-09-20 00:50:12.121', 'mr10', 'https://stackoverflow.com/questions/218384/what-is-a-nullpointerexception-and-how-do-i-fix-it');


--
-- TOC entry 2161 (class 0 OID 0)
-- Dependencies: 186
-- Name: event_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_history_id_seq', 83, true);


--
-- TOC entry 2162 (class 0 OID 0)
-- Dependencies: 182
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.event_id_seq', 17, true);


--
-- TOC entry 2143 (class 0 OID 16564)
-- Dependencies: 185
-- Data for Name: login_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.login_history (id, user_id, login_time) VALUES (1, 'aaa', '2018-09-15 01:27:39.933');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (2, 'aaa', '2018-09-15 01:46:03.349');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (3, 'aaa', '2018-09-15 01:46:04.302');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (4, 'aaa', '2018-09-15 01:46:05.277');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (5, 'aaa', '2018-09-15 01:46:05.935');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (6, 'aaa', '2018-09-15 01:46:07.128');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (7, 'aaa', '2018-09-15 01:46:08.686');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (8, 'aaa', '2018-09-15 01:46:10.521');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (9, 'aaa', '2018-09-16 02:59:39.968');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (10, 'aaa', '2018-09-16 02:59:44.458');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (11, 'aaa', '2018-09-16 03:05:53.888');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (12, 'aaa', '2018-09-16 03:07:46.455');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (13, 'aaa', '2018-09-16 03:09:29.255');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (14, 'aaa', '2018-09-16 03:13:21.475');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (15, 'bbb', '2018-09-16 03:14:03.663');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (16, 'bbb', '2018-09-16 03:14:14.3');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (17, 'ccc', '2018-09-16 03:14:22.27');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (18, 'ccc', '2018-09-16 03:15:58.925');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (19, 'ccc', '2018-09-16 03:16:42.614');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (20, 'aaa', '2018-09-16 15:58:08.971');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (21, 'aaa', '2018-09-16 15:58:47.267');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (22, 'iamjagdeesh', '2018-09-16 16:08:21.608');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (23, 'ddg', '2018-09-16 16:49:27.03');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (24, 'aaa', '2018-09-16 17:27:18.993');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (25, 'aaa', '2018-09-16 17:27:54.785');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (26, 'aaa', '2018-09-16 17:29:07.082');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (27, 'aaa', '2018-09-16 17:29:10.696');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (28, 'aaa', '2018-09-16 17:47:10.078');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (29, 'aaa', '2018-09-16 18:45:21.591');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (30, 'aaa', '2018-09-16 21:24:02.701');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (31, 'aaa', '2018-09-16 21:24:55.875');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (32, 'aaa', '2018-09-16 21:48:30.152');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (33, 'aaa', '2018-09-16 21:50:46.701');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (34, 'aaa', '2018-09-16 21:50:54.019');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (35, 'aaa', '2018-09-17 00:31:51.255');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (36, 'aaa', '2018-09-17 00:32:18.197');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (37, 'iamjagdeesh', '2018-09-17 00:32:33.565');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (38, 'aaa', '2018-09-17 00:49:27.353');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (39, 'aaa', '2018-09-17 01:01:19.668');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (40, 'aaa', '2018-09-17 01:01:32.926');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (41, 'aaa', '2018-09-17 01:01:35.687');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (42, 'aaa', '2018-09-17 01:02:22.153');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (43, 'aaa', '2018-09-17 01:02:25.628');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (44, 'aaa', '2018-09-17 01:02:26.331');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (45, 'aaa', '2018-09-17 01:09:49.241');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (46, 'aaa', '2018-09-17 01:12:01.8');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (47, 'aaa', '2018-09-17 01:17:07.143');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (48, 'aaa', '2018-09-17 01:28:27.545');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (49, 'Henrikh Mkhitaryan', '2018-09-17 01:29:13.793');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (50, 'aaa', '2018-09-17 01:31:47.3');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (51, 'iamjagdeesh', '2018-09-17 01:33:49.889');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (52, 'iamjagdeesh', '2018-09-17 01:39:44');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (53, 'aaa', '2018-09-17 01:44:43.184');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (54, 'aaa', '2018-09-17 01:52:09.474');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (55, 'aaa', '2018-09-17 01:52:23.575');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (56, 'iamjagdeesh', '2018-09-17 01:54:10.611');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (57, 'ah21', '2018-09-17 01:59:49.824');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (58, 'aaa', '2018-09-17 02:00:47.162');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (59, 'aaa', '2018-09-17 02:02:27.115');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (60, 'aaa', '2018-09-17 02:23:12.239');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (61, 'aaa', '2018-09-17 02:24:03.415');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (62, 'aaa', '2018-09-17 02:24:35.271');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (63, 'ah21', '2018-09-17 03:25:49.819');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (64, 'ah21', '2018-09-17 03:28:31.742');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (65, 'ah21', '2018-09-17 03:33:17.742');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (66, 'aaa', '2018-09-17 03:39:12.56');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (67, 'aaa', '2018-09-17 03:40:16.333');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (68, 'aaa', '2018-09-17 03:42:36.317');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (69, 'aaa', '2018-09-17 03:49:04.107');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (70, 'ah21', '2018-09-17 03:51:54.571');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (71, 'ah21', '2018-09-17 03:53:24.882');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (72, 'aaa', '2018-09-17 03:54:54.804');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (73, 'aaa', '2018-09-17 03:55:31.953');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (74, 'aaa', '2018-09-17 03:57:36.72');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (75, 'ah21', '2018-09-17 03:58:28.239');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (76, 'iamjagdeesh', '2018-09-17 04:15:04.815');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (77, 'ah21', '2018-09-17 04:34:47.622');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (78, 'ah21', '2018-09-17 04:36:47.169');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (79, 'aaa', '2018-09-17 04:37:39.83');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (80, 'aaa', '2018-09-17 04:39:20.08');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (81, 'aaa', '2018-09-17 04:41:56.469');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (82, 'aaa', '2018-09-17 13:19:49.274');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (83, 'iamjagdeesh', '2018-09-17 13:27:29.191');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (84, 'aaa', '2018-09-17 23:21:48.797');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (85, 'aaa', '2018-09-17 23:56:17.156');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (86, 'aaa', '2018-09-17 23:56:52.059');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (87, 'aaa', '2018-09-17 23:57:11.314');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (88, 'aaa', '2018-09-17 23:57:41.961');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (89, 'aaa', '2018-09-18 13:56:15.294');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (90, 'aaa', '2018-09-18 13:56:48.765');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (91, 'aaa', '2018-09-18 14:08:43.34');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (92, 'aaa', '2018-09-18 14:25:12.808');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (93, 'aaa', '2018-09-18 15:00:26.119');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (94, 'aaa', '2018-09-18 18:18:17.784');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (95, 'iamjagdeesh', '2018-09-18 18:18:46.197');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (96, 'iamjagdeesh', '2018-09-18 18:26:56.253');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (97, 'iamjagdeesh', '2018-09-18 18:32:11.897');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (98, 'iamjagdeesh', '2018-09-18 18:33:10.998');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (99, 'aaa', '2018-09-18 18:45:31.875');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (100, 'iamjagdeesh', '2018-09-18 18:56:31.822');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (101, 'aaa', '2018-09-18 19:23:26.689');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (102, 'iamjagdeesh', '2018-09-18 19:24:08.505');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (103, 'iamjagdeesh', '2018-09-18 21:08:36.446');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (104, 'iamjagdeesh', '2018-09-18 22:51:33.409');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (105, 'iamjagdeesh', '2018-09-18 22:52:39.731');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (106, 'iamjagdeesh', '2018-09-18 22:55:19.414');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (107, 'iamjagdeesh', '2018-09-18 23:20:35.456');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (108, 'iamjagdeesh', '2018-09-18 23:24:56.706');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (109, 'iamjagdeesh', '2018-09-19 00:15:04.528');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (110, 'iamjagdeesh', '2018-09-19 00:18:41.271');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (111, 'iamjagdeesh', '2018-09-19 00:19:38.389');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (112, 'iamjagdeesh', '2018-09-19 00:22:43.466');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (113, 'iamjagdeesh', '2018-09-19 02:15:06.566');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (114, 'iamjagdeesh', '2018-09-19 02:17:31.05');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (115, 'iamjagdeesh', '2018-09-19 02:27:09.933');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (116, 'iamjagdeesh', '2018-09-19 02:27:27.818');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (117, 'iamjagdeesh', '2018-09-19 02:33:20.859');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (118, 'iamjagdeesh', '2018-09-19 02:33:56.742');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (119, 'iamjagdeesh', '2018-09-19 02:36:18.338');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (120, 'iamjagdeesh', '2018-09-19 02:37:26.294');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (121, 'iamjagdeesh', '2018-09-19 02:45:18.639');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (122, 'iamjagdeesh', '2018-09-19 03:10:17.431');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (123, 'aaa', '2018-09-19 03:25:35.68');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (124, 'iamjagdeesh', '2018-09-19 03:31:34.175');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (125, 'iamjagdeesh', '2018-09-19 04:37:22.309');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (126, 'iamjagdeesh', '2018-09-19 05:01:40.64');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (127, 'aaa', '2018-09-19 05:02:31.075');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (128, 'iamjagdeesh', '2018-09-19 05:03:42.701');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (129, 'iamjagdeesh', '2018-09-19 05:04:02.464');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (130, 'iamjagdeesh', '2018-09-19 05:04:42.092');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (131, 'aaa', '2018-09-19 05:13:07.977');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (132, 'bbb', '2018-09-19 15:03:41.514');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (133, 'bbb', '2018-09-19 15:41:26.128');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (134, 'bbb', '2018-09-19 15:44:00.138');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (135, 'bbb', '2018-09-19 15:45:37.181');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (136, 'aaa', '2018-09-19 15:49:42.126');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (137, 'aaa', '2018-09-19 15:51:22.479');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (138, 'aaa', '2018-09-19 15:58:28.408');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (139, 'aaa', '2018-09-19 15:58:40.577');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (140, 'aaa', '2018-09-19 19:08:37.603');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (141, 'aaa', '2018-09-19 19:15:25.117');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (142, 'aaa', '2018-09-19 19:15:51.647');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (143, 'aaa', '2018-09-19 19:16:27.021');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (144, 'aaa', '2018-09-19 19:22:20.902');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (145, 'iamjagdeesh', '2018-09-19 19:26:40.071');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (146, 'aaa', '2018-09-19 19:27:24.63');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (147, 'aaa', '2018-09-19 19:30:26.47');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (148, 'aaa', '2018-09-19 19:36:59.736');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (149, 'aaa', '2018-09-19 19:39:24.485');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (150, 'aaa', '2018-09-19 19:41:01.032');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (151, 'aaa', '2018-09-19 19:44:10.311');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (152, 'aaa', '2018-09-19 19:49:46.808');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (153, 'aaa', '2018-09-19 19:56:37.505');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (154, 'aaa', '2018-09-19 19:58:39.528');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (155, 'aaa', '2018-09-19 20:00:14.761');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (156, 'aaa', '2018-09-19 20:01:10.288');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (157, 'ccc', '2018-09-19 20:03:59.155');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (158, 'ccc', '2018-09-19 20:05:30.404');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (159, 'ccc', '2018-09-19 20:10:15.727');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (160, 'ccc', '2018-09-19 20:24:31.457');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (161, 'aaa', '2018-09-19 20:29:52.981');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (162, 'ccc', '2018-09-19 20:31:21.708');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (163, 'aaa', '2018-09-19 20:32:42.786');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (164, 'aaa', '2018-09-19 20:33:19.356');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (165, 'iamjagdeesh', '2018-09-19 20:52:02.449');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (166, 'bbb', '2018-09-19 20:53:33.303');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (167, 'aaa', '2018-09-19 20:53:51.371');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (168, 'aaa', '2018-09-19 20:57:25.655');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (169, 'aaa', '2018-09-19 20:59:03.155');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (170, 'aaa', '2018-09-19 20:59:18.757');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (171, 'aaa', '2018-09-19 21:03:40.935');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (172, 'aaa', '2018-09-19 21:16:56.974');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (173, 'aaa', '2018-09-19 21:17:56.717');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (174, 'aaa', '2018-09-19 21:18:21.349');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (175, 'aaa', '2018-09-19 21:20:59.863');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (176, 'aaa', '2018-09-19 21:32:01.92');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (177, 'aaa', '2018-09-19 21:34:09.397');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (178, 'aaa', '2018-09-19 21:40:55.069');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (179, 'aaa', '2018-09-19 21:51:55.392');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (180, 'aaa', '2018-09-19 21:53:01.613');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (181, 'aaa', '2018-09-19 21:54:32.926');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (182, 'aaa', '2018-09-19 21:55:42.295');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (183, 'aaa', '2018-09-19 21:57:04.807');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (184, 'aaa', '2018-09-19 22:16:33.627');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (185, 'aaa', '2018-09-19 22:18:49.493');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (186, 'aaa', '2018-09-19 22:22:50.759');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (187, 'aaa', '2018-09-19 22:38:12.458');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (188, 'aaa', '2018-09-19 23:07:54.237');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (189, 'aaa', '2018-09-19 23:12:38.586');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (190, 'aaa', '2018-09-19 23:14:35.546');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (191, 'aaa', '2018-09-19 23:59:52.411');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (192, 'aaa', '2018-09-20 00:00:16.187');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (193, 'aaa', '2018-09-20 00:02:39.465');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (194, 'aaa', '2018-09-20 00:04:15.526');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (195, 'aaa', '2018-09-20 00:05:29.044');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (196, 'aaa', '2018-09-20 00:05:54.99');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (197, 'aaa', '2018-09-20 00:06:16.318');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (198, 'am11', '2018-09-20 00:21:20.53');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (199, 'am11', '2018-09-20 00:23:29.434');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (200, 'am11', '2018-09-20 00:36:24.027');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (201, 'am11', '2018-09-20 00:47:04.7');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (202, 'mr10', '2018-09-20 00:48:15.78');
INSERT INTO public.login_history (id, user_id, login_time) VALUES (203, 'mr10', '2018-09-20 00:49:28.031');


--
-- TOC entry 2163 (class 0 OID 0)
-- Dependencies: 184
-- Name: login_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.login_history_id_seq', 203, true);


--
-- TOC entry 2139 (class 0 OID 16442)
-- Dependencies: 181
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_table (id, name, password) VALUES ('aaa', 'aaa', '123');
INSERT INTO public.user_table (id, name, password) VALUES ('bbb', 'bbb', '123');
INSERT INTO public.user_table (id, name, password) VALUES ('ccc', 'ccc', '123');
INSERT INTO public.user_table (id, name, password) VALUES ('ddd', 'ddd', '123');
INSERT INTO public.user_table (id, name, password) VALUES ('iamjagdeesh', 'Jagdeesh Basavaraju', '123');
INSERT INTO public.user_table (id, name, password) VALUES ('ddg', 'David De Gea', 'united1');
INSERT INTO public.user_table (id, name, password) VALUES ('Henrikh Mkhitaryan', 'mkhi', '123');
INSERT INTO public.user_table (id, name, password) VALUES ('ah21', 'Ander Herrera', '123');
INSERT INTO public.user_table (id, name, password) VALUES ('am11', 'Anthony Martial', '123');
INSERT INTO public.user_table (id, name, password) VALUES ('mr10', 'Marcus Rashford', '123');


--
-- TOC entry 2147 (class 0 OID 24687)
-- Dependencies: 189
-- Data for Name: user_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (26, 'bbb', '', 1, '2018-09-19 15:06:48.543');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (1, 'bbb', 'android', 2, '2018-09-19 15:04:01.976');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (2, 'bbb', 'swing', 2, '2018-09-19 15:04:01.987');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (87, 'ccc', 'multithreading', 1, '2018-09-19 20:05:40.099');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (4, 'bbb', 'eclipse', 2, '2018-09-19 15:04:01.995');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (88, 'ccc', 'maven', 1, '2018-09-19 20:05:40.102');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (6, 'bbb', 'multithreading', 2, '2018-09-19 15:04:02.005');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (7, 'bbb', 'maven', 2, '2018-09-19 15:04:02.01');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (8, 'bbb', 'json', 2, '2018-09-19 15:04:02.013');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (9, 'bbb', 'spring-mvc', 2, '2018-09-19 15:04:02.017');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (10, 'bbb', 'xml', 2, '2018-09-19 15:04:02.022');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (11, 'bbb', 'string', 2, '2018-09-19 15:04:02.025');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (12, 'bbb', 'arrays', 2, '2018-09-19 15:04:02.029');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (89, 'ccc', 'json', 1, '2018-09-19 20:05:40.108');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (14, 'bbb', 'servlets', 2, '2018-09-19 15:04:02.037');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (15, 'bbb', 'jsp', 2, '2018-09-19 15:04:02.044');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (16, 'bbb', 'jdbc', 2, '2018-09-19 15:04:02.047');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (17, 'bbb', 'tomcat', 2, '2018-09-19 15:04:02.053');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (18, 'bbb', 'java-ee', 2, '2018-09-19 15:04:02.056');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (19, 'bbb', 'java-8', 2, '2018-09-19 15:04:02.061');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (20, 'bbb', 'generics', 2, '2018-09-19 15:04:02.067');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (21, 'bbb', 'mysql', 2, '2018-09-19 15:04:02.072');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (22, 'bbb', 'regex', 2, '2018-09-19 15:04:02.076');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (23, 'bbb', 'javafx', 2, '2018-09-19 15:04:02.08');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (24, 'bbb', 'spring-boot', 2, '2018-09-19 15:04:02.083');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (25, 'bbb', 'jar', 2, '2018-09-19 15:04:02.088');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (90, 'ccc', 'spring-mvc', 1, '2018-09-19 20:05:40.11');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (29, 'bbb', 'database', 1, '2018-09-19 15:46:48.123');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (91, 'ccc', 'xml', 1, '2018-09-19 20:05:40.114');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (28, 'bbb', 'nullpointerexception', 2, '2018-09-19 15:10:28.871');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (27, 'bbb', 'java', 4, '2018-09-19 15:06:52.318');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (3, 'bbb', 'spring', 3, '2018-09-19 15:04:01.991');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (5, 'bbb', 'hibernate', 3, '2018-09-19 15:04:01.999');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (30, 'bbb', 'mongodb', 1, '2018-09-19 15:47:33.366');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (13, 'bbb', 'jpa', 3, '2018-09-19 15:04:02.033');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (31, 'aaa', 'android', 1, '2018-09-19 15:59:04.659');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (32, 'aaa', 'swing', 1, '2018-09-19 15:59:04.664');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (33, 'aaa', 'spring', 1, '2018-09-19 15:59:04.668');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (34, 'aaa', 'eclipse', 1, '2018-09-19 15:59:04.671');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (35, 'aaa', 'hibernate', 1, '2018-09-19 15:59:04.673');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (36, 'aaa', 'multithreading', 1, '2018-09-19 15:59:04.674');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (37, 'aaa', 'maven', 1, '2018-09-19 15:59:04.677');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (39, 'aaa', 'spring-mvc', 1, '2018-09-19 15:59:04.686');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (40, 'aaa', 'xml', 1, '2018-09-19 15:59:04.689');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (41, 'aaa', 'string', 1, '2018-09-19 15:59:04.692');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (43, 'aaa', 'jpa', 1, '2018-09-19 15:59:04.702');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (44, 'aaa', 'servlets', 1, '2018-09-19 15:59:04.705');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (45, 'aaa', 'jsp', 1, '2018-09-19 15:59:04.709');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (46, 'aaa', 'jdbc', 1, '2018-09-19 15:59:04.712');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (47, 'aaa', 'tomcat', 1, '2018-09-19 15:59:04.716');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (48, 'aaa', 'java-ee', 1, '2018-09-19 15:59:04.721');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (49, 'aaa', 'java-8', 1, '2018-09-19 15:59:04.728');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (50, 'aaa', 'generics', 1, '2018-09-19 15:59:04.731');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (51, 'aaa', 'mysql', 1, '2018-09-19 15:59:04.734');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (53, 'aaa', 'javafx', 1, '2018-09-19 15:59:04.742');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (54, 'aaa', 'spring-boot', 1, '2018-09-19 15:59:04.747');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (55, 'aaa', 'jar', 1, '2018-09-19 15:59:04.75');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (56, 'aaa', '', 1, '2018-09-19 15:59:11.549');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (57, 'aaa', 'jquery', 1, '2018-09-19 15:59:31.316');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (58, 'aaa', 'html', 1, '2018-09-19 15:59:31.321');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (59, 'aaa', 'css', 1, '2018-09-19 15:59:31.323');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (60, 'aaa', 'angularjs', 1, '2018-09-19 15:59:31.326');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (61, 'aaa', 'node.js', 1, '2018-09-19 15:59:31.328');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (63, 'aaa', 'php', 1, '2018-09-19 15:59:31.335');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (64, 'aaa', 'html5', 1, '2018-09-19 15:59:31.337');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (38, 'aaa', 'json', 2, '2018-09-19 15:59:04.682');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (42, 'aaa', 'arrays', 2, '2018-09-19 15:59:04.699');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (65, 'aaa', 'reactjs', 1, '2018-09-19 15:59:31.349');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (66, 'aaa', 'google-chrome', 1, '2018-09-19 15:59:31.352');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (52, 'aaa', 'regex', 2, '2018-09-19 15:59:04.739');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (67, 'aaa', 'asp.net', 1, '2018-09-19 15:59:31.358');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (68, 'aaa', 'dom', 1, '2018-09-19 15:59:31.361');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (69, 'aaa', 'd3.js', 1, '2018-09-19 15:59:31.364');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (70, 'aaa', 'google-maps', 1, '2018-09-19 15:59:31.367');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (71, 'aaa', 'canvas', 1, '2018-09-19 15:59:31.37');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (72, 'aaa', 'twitter-bootstrap', 1, '2018-09-19 15:59:31.372');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (73, 'aaa', 'angular', 1, '2018-09-19 15:59:31.375');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (74, 'aaa', 'javascript-events', 1, '2018-09-19 15:59:31.377');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (75, 'aaa', 'c#', 1, '2018-09-19 15:59:31.38');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (77, 'aaa', 'google-maps-api-3', 1, '2018-09-19 15:59:31.385');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (78, 'aaa', 'internet-explorer', 1, '2018-09-19 15:59:31.387');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (79, 'aaa', 'javascript', 1, '2018-09-19 15:59:33.976');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (62, 'aaa', 'ajax', 2, '2018-09-19 15:59:31.332');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (80, 'aaa', 'asynchronous', 1, '2018-09-19 15:59:33.985');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (76, 'aaa', 'ecmascript-6', 2, '2018-09-19 15:59:31.383');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (81, 'aaa', 'ecmascript-2017', 1, '2018-09-19 15:59:33.99');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (82, 'ccc', 'android', 1, '2018-09-19 20:05:40.063');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (83, 'ccc', 'swing', 1, '2018-09-19 20:05:40.084');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (84, 'ccc', 'spring', 1, '2018-09-19 20:05:40.087');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (85, 'ccc', 'eclipse', 1, '2018-09-19 20:05:40.092');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (86, 'ccc', 'hibernate', 1, '2018-09-19 20:05:40.096');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (93, 'ccc', 'arrays', 1, '2018-09-19 20:05:40.122');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (94, 'ccc', 'jpa', 1, '2018-09-19 20:05:40.126');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (95, 'ccc', 'servlets', 1, '2018-09-19 20:05:40.129');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (96, 'ccc', 'jsp', 1, '2018-09-19 20:05:40.134');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (97, 'ccc', 'jdbc', 1, '2018-09-19 20:05:40.138');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (98, 'ccc', 'tomcat', 1, '2018-09-19 20:05:40.143');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (99, 'ccc', 'java-ee', 1, '2018-09-19 20:05:40.146');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (100, 'ccc', 'java-8', 1, '2018-09-19 20:05:40.15');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (101, 'ccc', 'generics', 1, '2018-09-19 20:05:40.154');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (102, 'ccc', 'mysql', 1, '2018-09-19 20:05:40.159');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (103, 'ccc', 'regex', 1, '2018-09-19 20:05:40.162');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (104, 'ccc', 'javafx', 1, '2018-09-19 20:05:40.166');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (105, 'ccc', 'spring-boot', 1, '2018-09-19 20:05:40.17');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (106, 'ccc', 'jar', 1, '2018-09-19 20:05:40.174');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (107, 'ccc', 'java', 1, '2018-09-19 20:05:59.376');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (92, 'ccc', 'string', 2, '2018-09-19 20:05:40.118');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (108, 'ccc', 'equality', 1, '2018-09-19 20:05:59.4');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (110, 'am11', 'swing', 3, '2018-09-20 00:23:35.147');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (111, 'am11', 'spring', 3, '2018-09-20 00:23:35.15');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (112, 'am11', 'eclipse', 3, '2018-09-20 00:23:35.154');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (113, 'am11', 'hibernate', 3, '2018-09-20 00:23:35.156');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (115, 'am11', 'maven', 3, '2018-09-20 00:23:35.164');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (116, 'am11', 'json', 3, '2018-09-20 00:23:35.167');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (117, 'am11', 'spring-mvc', 3, '2018-09-20 00:23:35.17');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (118, 'am11', 'xml', 3, '2018-09-20 00:23:35.173');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (119, 'am11', 'string', 3, '2018-09-20 00:23:35.176');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (120, 'am11', 'arrays', 3, '2018-09-20 00:23:35.179');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (121, 'am11', 'jpa', 3, '2018-09-20 00:23:35.182');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (122, 'am11', 'servlets', 3, '2018-09-20 00:23:35.185');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (123, 'am11', 'jsp', 3, '2018-09-20 00:23:35.187');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (124, 'am11', 'jdbc', 3, '2018-09-20 00:23:35.19');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (125, 'am11', 'tomcat', 3, '2018-09-20 00:23:35.191');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (126, 'am11', 'java-ee', 3, '2018-09-20 00:23:35.194');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (127, 'am11', 'java-8', 3, '2018-09-20 00:23:35.197');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (128, 'am11', 'generics', 3, '2018-09-20 00:23:35.199');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (129, 'am11', 'mysql', 3, '2018-09-20 00:23:35.203');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (130, 'am11', 'regex', 3, '2018-09-20 00:23:35.206');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (132, 'am11', 'spring-boot', 3, '2018-09-20 00:23:35.213');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (133, 'am11', 'jar', 3, '2018-09-20 00:23:35.215');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (109, 'am11', 'android', 3, '2018-09-20 00:23:35.14');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (134, 'am11', 'java', 3, '2018-09-20 00:23:41.117');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (135, 'am11', 'nullpointerexception', 3, '2018-09-20 00:23:41.121');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (114, 'am11', 'multithreading', 3, '2018-09-20 00:23:35.161');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (131, 'am11', 'javafx', 3, '2018-09-20 00:23:35.209');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (162, 'mr10', 'nullpointerexception', 1, '2018-09-20 00:49:57.676');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (136, 'mr10', 'android', 2, '2018-09-20 00:49:49.511');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (138, 'mr10', 'spring', 2, '2018-09-20 00:49:49.525');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (139, 'mr10', 'eclipse', 2, '2018-09-20 00:49:49.529');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (140, 'mr10', 'hibernate', 2, '2018-09-20 00:49:49.535');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (141, 'mr10', 'multithreading', 2, '2018-09-20 00:49:49.54');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (142, 'mr10', 'maven', 2, '2018-09-20 00:49:49.543');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (143, 'mr10', 'json', 2, '2018-09-20 00:49:49.548');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (144, 'mr10', 'spring-mvc', 2, '2018-09-20 00:49:49.551');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (145, 'mr10', 'xml', 2, '2018-09-20 00:49:49.553');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (146, 'mr10', 'string', 2, '2018-09-20 00:49:49.556');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (147, 'mr10', 'arrays', 2, '2018-09-20 00:49:49.561');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (148, 'mr10', 'jpa', 2, '2018-09-20 00:49:49.565');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (149, 'mr10', 'servlets', 2, '2018-09-20 00:49:49.568');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (150, 'mr10', 'jsp', 2, '2018-09-20 00:49:49.571');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (151, 'mr10', 'jdbc', 2, '2018-09-20 00:49:49.574');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (152, 'mr10', 'tomcat', 2, '2018-09-20 00:49:49.576');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (153, 'mr10', 'java-ee', 2, '2018-09-20 00:49:49.58');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (154, 'mr10', 'java-8', 2, '2018-09-20 00:49:49.581');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (155, 'mr10', 'generics', 2, '2018-09-20 00:49:49.585');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (156, 'mr10', 'mysql', 2, '2018-09-20 00:49:49.587');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (157, 'mr10', 'regex', 2, '2018-09-20 00:49:49.59');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (158, 'mr10', 'javafx', 2, '2018-09-20 00:49:49.594');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (159, 'mr10', 'spring-boot', 2, '2018-09-20 00:49:49.598');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (160, 'mr10', 'jar', 2, '2018-09-20 00:49:49.601');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (161, 'mr10', 'java', 2, '2018-09-20 00:49:57.671');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (137, 'mr10', 'swing', 3, '2018-09-20 00:49:49.521');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (163, 'mr10', 'user-interface', 1, '2018-09-20 00:50:46.592');
INSERT INTO public.user_tags (id, user_id, tag, count, last_visited) VALUES (164, 'mr10', 'jframe', 1, '2018-09-20 00:50:46.602');


--
-- TOC entry 2164 (class 0 OID 0)
-- Dependencies: 188
-- Name: user_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_tags_id_seq', 164, true);


--
-- TOC entry 2018 (class 2606 OID 16590)
-- Name: event_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_history
    ADD CONSTRAINT event_history_pk PRIMARY KEY (id);


--
-- TOC entry 2014 (class 2606 OID 16558)
-- Name: event_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pk PRIMARY KEY (id);


--
-- TOC entry 2016 (class 2606 OID 16569)
-- Name: login_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_pk PRIMARY KEY (id);


--
-- TOC entry 2012 (class 2606 OID 16449)
-- Name: user_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_pk PRIMARY KEY (id);


--
-- TOC entry 2020 (class 2606 OID 24696)
-- Name: user_tags_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tags
    ADD CONSTRAINT user_tags_pk PRIMARY KEY (id);


--
-- TOC entry 2023 (class 2606 OID 16596)
-- Name: event_history_event_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_history
    ADD CONSTRAINT event_history_event_fk FOREIGN KEY (event_id) REFERENCES public.event(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2022 (class 2606 OID 16591)
-- Name: event_history_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_history
    ADD CONSTRAINT event_history_user_fk FOREIGN KEY (user_id) REFERENCES public.user_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2021 (class 2606 OID 16570)
-- Name: login_history_user_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.login_history
    ADD CONSTRAINT login_history_user_fk FOREIGN KEY (user_id) REFERENCES public.user_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2024 (class 2606 OID 24697)
-- Name: user_tags_user_table_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tags
    ADD CONSTRAINT user_tags_user_table_fk FOREIGN KEY (user_id) REFERENCES public.user_table(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2155 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2018-09-20 00:54:06

--
-- PostgreSQL database dump complete
--


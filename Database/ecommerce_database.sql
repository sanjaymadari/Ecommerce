--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6
-- Dumped by pg_dump version 13.6

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
-- Name: customer; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.customer (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    gender character varying(6) NOT NULL,
    date_of_birth date NOT NULL,
    email character varying(255),
    mobile bigint NOT NULL
);


ALTER TABLE public.customer OWNER TO school_admin;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.customer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO school_admin;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school_admin
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: order_product; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.order_product (
    order_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.order_product OWNER TO school_admin;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    customer_id bigint NOT NULL,
    ordered_at timestamp with time zone NOT NULL,
    total_price numeric(12,2) NOT NULL,
    mode_of_payment character varying(50) NOT NULL
);


ALTER TABLE public.orders OWNER TO school_admin;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO school_admin;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school_admin
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.product (
    id bigint NOT NULL,
    name character varying NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.product OWNER TO school_admin;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_id_seq OWNER TO school_admin;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school_admin
--

ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: school_admin
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    brand character varying(50) NOT NULL,
    color character varying(20) NOT NULL,
    model character varying(50) NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.tags OWNER TO school_admin;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: school_admin
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO school_admin;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: school_admin
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: school_admin
--

COPY public.customer (id, name, password, gender, date_of_birth, email, mobile) FROM stdin;
2	Ravalika Madari	Ravalika@123	Female	2002-03-16	ravalika@gmail.com	9989624473
1	Sanjay Madari	Sanjay@123	Male	2002-03-16	sanjaymadari@gmail.com	9666886540
\.


--
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: school_admin
--

COPY public.order_product (order_id, product_id) FROM stdin;
1	1
2	2
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: school_admin
--

COPY public.orders (id, customer_id, ordered_at, total_price, mode_of_payment) FROM stdin;
1	1	2022-03-16 13:57:32.634+05:30	50000.00	COD
2	2	2022-03-16 15:25:57.183+05:30	20000.00	Card
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: school_admin
--

COPY public.product (id, name, price) FROM stdin;
1	Laptop	50000.00
2	Mobile	20000.00
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: school_admin
--

COPY public.tags (id, brand, color, model, product_id) FROM stdin;
1	Lenovo	Black	ThinkPad	1
3	Redmi	Red	Note	2
\.


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school_admin
--

SELECT pg_catalog.setval('public.customer_id_seq', 2, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school_admin
--

SELECT pg_catalog.setval('public.orders_id_seq', 2, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school_admin
--

SELECT pg_catalog.setval('public.product_id_seq', 2, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: school_admin
--

SELECT pg_catalog.setval('public.tags_id_seq', 3, true);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: customer mobile; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT mobile UNIQUE (mobile);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: orders customer_id; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id) REFERENCES public.customer(id) NOT VALID;


--
-- Name: order_product order_id; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public.orders(id) NOT VALID;


--
-- Name: tags product_id; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.product(id) NOT VALID;


--
-- Name: order_product product_id; Type: FK CONSTRAINT; Schema: public; Owner: school_admin
--

ALTER TABLE ONLY public.order_product
    ADD CONSTRAINT product_id FOREIGN KEY (product_id) REFERENCES public.product(id) NOT VALID;


--
-- PostgreSQL database dump complete
--


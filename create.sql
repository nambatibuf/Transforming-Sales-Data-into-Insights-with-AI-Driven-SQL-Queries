-- Table: sales_data.customer

-- DROP TABLE IF EXISTS sales_data.customer;

CREATE TABLE IF NOT EXISTS sales_data.customer
(
    customer_id integer NOT NULL DEFAULT nextval('sales_data.customer_customer_id_seq'::regclass),
    customer_name character varying(255) COLLATE pg_catalog."default",
    phone character varying(255) COLLATE pg_catalog."default",
    address_line1 character varying(255) COLLATE pg_catalog."default",
    address_line2 character varying(255) COLLATE pg_catalog."default",
    city character varying(255) COLLATE pg_catalog."default",
    state character varying(255) COLLATE pg_catalog."default",
    postal_code character varying(255) COLLATE pg_catalog."default",
    country character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT customer_pkey PRIMARY KEY (customer_id),
    CONSTRAINT country_fk FOREIGN KEY (country)
        REFERENCES sales_data.territories (country) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sales_data.customer
    OWNER to postgres;
-- Index: idx_customer_name

-- DROP INDEX IF EXISTS sales_data.idx_customer_name;

CREATE INDEX IF NOT EXISTS idx_customer_name
    ON sales_data.customer USING btree
    (customer_name COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;


-- Table: sales_data.department

-- DROP TABLE IF EXISTS sales_data.department;

CREATE TABLE IF NOT EXISTS sales_data.department
(
    department_id integer NOT NULL DEFAULT nextval('sales_data.department_department_id_seq'::regclass),
    department_name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT department_pkey PRIMARY KEY (department_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sales_data.department
    OWNER to postgres;


-- Table: sales_data.employee

-- DROP TABLE IF EXISTS sales_data.employee;

CREATE TABLE IF NOT EXISTS sales_data.employee
(
    employee_id integer NOT NULL DEFAULT nextval('sales_data.employee_employee_id_seq'::regclass),
    employee_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    salary numeric(10,2),
    department_id integer,
    CONSTRAINT employee_pkey PRIMARY KEY (employee_id),
    CONSTRAINT department_id FOREIGN KEY (department_id)
        REFERENCES sales_data.department (department_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sales_data.employee
    OWNER to postgres;
-- Index: idx_empoloyee_name

-- DROP INDEX IF EXISTS sales_data.idx_empoloyee_name;

CREATE INDEX IF NOT EXISTS idx_empoloyee_name
    ON sales_data.employee USING btree
    (employee_name COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;

-- Table: sales_data.order_details

-- DROP TABLE IF EXISTS sales_data.order_details;

CREATE TABLE IF NOT EXISTS sales_data.order_details
(
    order_detail_id integer NOT NULL DEFAULT nextval('sales_data.order_details_order_detail_id_seq'::regclass),
    order_id integer,
    product_code character varying(255) COLLATE pg_catalog."default",
    order_line_number integer,
    quantity_ordered integer,
    price_each numeric(10,2),
    sales numeric(10,2),
    employee_id integer,
    CONSTRAINT order_details_pkey PRIMARY KEY (order_detail_id),
    CONSTRAINT employee_id FOREIGN KEY (employee_id)
        REFERENCES sales_data.employee (employee_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT order_id FOREIGN KEY (order_id)
        REFERENCES sales_data.orders_status (order_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product_code FOREIGN KEY (product_code)
        REFERENCES sales_data.product (product_code) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sales_data.order_details
    OWNER to postgres;
-- Index: idx_order_details

-- DROP INDEX IF EXISTS sales_data.idx_order_details;

CREATE INDEX IF NOT EXISTS idx_order_details
    ON sales_data.order_details USING btree
    (order_id ASC NULLS LAST)
    TABLESPACE pg_default;


-- Table: sales_data.orders_status

-- DROP TABLE IF EXISTS sales_data.orders_status;

CREATE TABLE IF NOT EXISTS sales_data.orders_status
(
    order_id integer NOT NULL DEFAULT nextval('sales_data.orders_status_order_id_seq'::regclass),
    order_date date,
    order_status character varying(255) COLLATE pg_catalog."default",
    customer_id integer,
    CONSTRAINT orders_status_pkey PRIMARY KEY (order_id),
    CONSTRAINT customer_id FOREIGN KEY (customer_id)
        REFERENCES sales_data.customer (customer_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sales_data.orders_status
    OWNER to postgres;

-- Table: sales_data.product

-- DROP TABLE IF EXISTS sales_data.product;

CREATE TABLE IF NOT EXISTS sales_data.product
(
    product_code character varying(255) COLLATE pg_catalog."default" NOT NULL,
    product_line text COLLATE pg_catalog."default",
    msrp integer,
    CONSTRAINT product_pkey PRIMARY KEY (product_code)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sales_data.product
    OWNER to postgres;

-- Table: sales_data.territories

-- DROP TABLE IF EXISTS sales_data.territories;

CREATE TABLE IF NOT EXISTS sales_data.territories
(
    territory character varying(255) COLLATE pg_catalog."default",
    country character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT territories_pkey PRIMARY KEY (country)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS sales_data.territories
    OWNER to postgres;



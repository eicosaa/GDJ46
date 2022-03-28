-- ���̺� ����

-- 1)
CREATE TABLE country(
    country_id NUMBER(5) NOT NULL, -- -99999 ~ 99999, mysql�� smallint�� ���� ������ ����Ŭ Ÿ��
    /*  �����ѱ��ڴ� 1byte, �ѱ��� ���ڵ��� ����  2byte, 3byte, ...  */
    country VARCHAR2(50) NOT NULL, -- 255byte �������ڿ�, �ִ� 4000byte���� 
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY(country_id) -- PK����
);
-- 2)
CREATE TABLE city (
    city_id NUMBER(5) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    country_id NUMBER(5) NOT NULL, -- country.country_id �����ϴ� �ܷ�Ű(FK)
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY(city_id), -- PK����
    CONSTRAINT city_fk1 FOREIGN KEY(country_id) REFERENCES country(country_id) -- FK����
);

-- 3) 
CREATE TABLE address (
    address_id NUMBER(5) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    address2 VARCHAR2(50),
    district VARCHAR2(20) NOT NULL,
    city_id NUMBER(5) NOT NULL,
    postal_code VARCHAR2(10),
    phone VARCHAR2(20) NOT NULL,
    location VARCHAR2(20) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT address_pk PRIMARY KEY(address_id),
    CONSTRAINT address_fk1 FOREIGN KEY(city_id) REFERENCES city(city_id)
);

-- 4) 
CREATE TABLE language (
    language_id NUMBER(5) NOT NULL,
    name CHAR(20) , -- CHARŸ�� �������ڷ� 1byte���ڰ� �ԷµǾ 20byte�� �����Ѵ�.
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT language_pk PRIMARY KEY(language_id)
);

-- 5)
CREATE TABLE film (
    film_id NUMBER(5) NOT NULL, -- PK
    title VARCHAR2(128) NOT NULL,
    description LONG NULL, -- mysql TEXT 65535byte, VARCHAR2 4000byte����
    release_year CHAR(4), -- ����Ŭ���� mysql�� YEAR�� ������ Ÿ���� �������� �ʾƼ� 4�ڸ� ���� ���ڸ� ���
    language_id NUMBER(5) NOT NULL, -- FK
    original_language_id NUMBER(5) NULL, -- FK
    rental_duration NUMBER(5) NOT NULL,
    rental_rate NUMBER(4, 2) NOT NULL, -- -99.99 ~ +99.99
    length NUMBER(5) NULL,
    replacement_cost NUMBER(5, 2) NOT NULL, -- -999.99 ~ +999.99
    rating VARCHAR2(10) DEFAULT 'G', -- mysql ENUMŸ���� ����Ŭ������ CHECK�������� ����
    special_features VARCHAR2(128), -- ����Ŭ�� ���߰��� ������ �� ����. 
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT film_pk PRIMARY KEY(film_id),
    CONSTRAINT film_fk1 FOREIGN KEY(language_id) REFERENCES language(language_id),
    CONSTRAINT film_fk2 FOREIGN KEY(original_language_id) REFERENCES language(language_id),
    CONSTRAINT film_ck1 CHECK(rating IN('G', 'PG', 'PG-13', 'R', 'NC-17'))
);

-- 6)
CREATE TABLE film_text(
    film_id NUMBER(5) NOT NULL,  -- NOT NULL �����ȵ�
    title VARCHAR2(255) NOT NULL, -- 255byte �������ڿ�, �ִ� 4000byte���� varchar2(4000)  
    description long, -- mysql�� text�ڷ���(65,535byte)��  ���� ������ long ����Ŭ �ڷ��� ���
    CONSTRAINT film_text_pk PRIMARY KEY(film_id) -- PK����
);

-- 7) 
CREATE TABLE category (
    category_id NUMBER(5) NOT NULL,
    name VARCHAR2(25) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT category_pk PRIMARY KEY(category_id)
);

-- 8)
CREATE TABLE film_category (
    film_id NUMBER(5) NOT NULL,
    category_id NUMBER(5) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT film_category_pk PRIMARY KEY(film_id, category_id),
    CONSTRAINT film_category_fk1 FOREIGN KEY(film_id) REFERENCES film(film_id),
    CONSTRAINT film_category_fk2 FOREIGN KEY(category_id) REFERENCES category(category_id)
);
-- 9)
CREATE TABLE actor(   
    actor_id NUMBER(5) NOT NULL,   
    first_name VARCHAR2(45) NOT NULL,   
    last_name VARCHAR2(45) NOT NULL,   
    last_update TIMESTAMP NOT NULL,   
    CONSTRAINT actor_pk PRIMARY KEY(actor_id)
);

-- 10)
CREATE TABLE film_actor(   
    actor_id NUMBER(5) NOT NULL,   
    film_id NUMBER(5) NOT NULL,   
    last_update TIMESTAMP NOT NULL,   
    CONSTRAINT film_actor_pk PRIMARY KEY(actor_id,film_id),   
    CONSTRAINT film_actor_fk1 FOREIGN KEY(film_id) REFERENCES film(film_id),   
    CONSTRAINT film_actor_fk2 FOREIGN KEY(actor_id) REFERENCES actor(actor_id)
);

-- 11)
CREATE TABLE store (   
    store_id NUMBER(5) NOT NULL,   
    manager_staff_id NUMBER(5) NOT NULL,   
    address_id NUMBER(5) NOT NULL,   
    last_update TIMESTAMP NOT NULL,   
    CONSTRAINT store_pk PRIMARY KEY(store_id),   
    CONSTRAINT store_fk1 FOREIGN KEY(address_id) REFERENCES address(address_id)
);

-- 12) 
CREATE TABLE staff(   
    staff_id NUMBER(5) NOT NULL,   
    first_name VARCHAR2(45) NOT NULL,   
    last_name VARCHAR2(45) NOT NULL,   
    address_id NUMBER(5) NOT NULL,   
    picture BLOB,   
    email  VARCHAR2(50),   
    store_id NUMBER(5) NOT NULL,   
    active NUMBER(5) NOT NULL,   
    username VARCHAR2(16) NOT NULL,   
    password VARCHAR2(40),   
    last_update TIMESTAMP NOT NULL,   
    CONSTRAINT staff_pk PRIMARY KEY(staff_id),   
    CONSTRAINT staff_fk1 FOREIGN KEY(address_id) REFERENCES address(address_id),   
    CONSTRAINT staff_fk2 FOREIGN KEY(store_id) REFERENCES store(store_id)
);
-- store,staff ���̺� �ΰ��� ������ �⺻Ű�� �ܷ�Ű�� �������̶� store �ܷ�Ű�� ���̺� ���� ���� �߰�
ALTER TABLE store ADD CONSTRAINT store_fk2 FOREIGN KEY(manager_staff_id)REFERENCES staff(staff_id);

-- 13)
CREATE TABLE customer(   
    customer_id NUMBER(5) NOT NULL,   
    store_id NUMBER(5) NOT NULL,   
    first_name VARCHAR2(45) NOT NULL,   
    last_name VARCHAR2(45) NOT NULL,   
    email VARCHAR2(50),   
    address_id NUMBER(5) NOT NULL,   
    active NUMBER(5) NOT NULL,   
    create_date TIMESTAMP NOT NULL,   
    last_update TIMESTAMP NOT NULL,   
    CONSTRAINT customer_pk PRIMARY KEY(customer_id),   
    CONSTRAINT customer_fk1 FOREIGN KEY(store_id) REFERENCES store(store_id),   
    CONSTRAINT customer_fk2 FOREIGN KEY(address_id) REFERENCES address(address_id)
);
 
-- 14) 
CREATE TABLE inventory(   
    inventory_id NUMBER(8) NOT NULL,   
    film_id NUMBER(5) NOT NULL,   
    store_id NUMBER(3) NOT NULL,   
    last_update TIMESTAMP NOT NULL,   
    CONSTRAINT inventory_pk PRIMARY KEY(inventory_id),   
    CONSTRAINT inventory_fk1 FOREIGN KEY(film_id) REFERENCES film(film_id),   
    CONSTRAINT inventory_fk2 FOREIGN KEY(store_id) REFERENCES store(store_id)
);
 
-- 15)
CREATE TABLE rental(   
    rental_id INT NOT NULL,   
    rental_date TIMESTAMP NOT NULL,   
    inventory_id NUMBER(8) NOT NULL,   
    customer_id NUMBER(5) NOT NULL,   
    return_date TIMESTAMP,   
    staff_id NUMBER(3) NOT NULL,   
    last_update TIMESTAMP NOT NULL,   
    CONSTRAINT rental_pk PRIMARY KEY(rental_id),   
    CONSTRAINT rental_fk1 FOREIGN KEY(inventory_id) REFERENCES inventory(inventory_id),   
    CONSTRAINT rental_fk2 FOREIGN KEY(customer_id) REFERENCES customer(customer_id),   
    CONSTRAINT rental_fk3 FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

-- 16)
CREATE TABLE payment(payment_id NUMBER(5) NOT NULL,   
    customer_id NUMBER(5) NOT NULL,   
    staff_id NUMBER(3) NOT NULL,   
    rental_id INT,   
    amount NUMBER(5,2) NOT NULL,   
    payment_date TIMESTAMP NOT NULL,   
    last_update TIMESTAMP NOT NULL,   
    CONSTRAINT payment_pk PRIMARY KEY(payment_id),   
    CONSTRAINT payment_fk1 FOREIGN KEY(customer_id) REFERENCES customer(customer_id),   
    CONSTRAINT payment_fk2 FOREIGN KEY(staff_id) REFERENCES staff(staff_id),   
    CONSTRAINT payment_fk3 FOREIGN KEY(rental_id) REFERENCES rental(rental_id)
);


-- ������(seq)
CREATE SEQUENCE actor_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE address_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE category_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE city_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE country_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE customer_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE film_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE inventory_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE language_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE payment_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE rental_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE staff_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE

CREATE SEQUENCE store_seq
INCREMENT BY 1
MINVALUE 1
MAXVALUE 9999999
START WITH 1
NOCYCLE
NOCACHE
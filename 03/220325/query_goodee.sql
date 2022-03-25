-- 1) goodee ����� ���� <- DDL
-- 2) goodee ����� ���� �ο� < DCL
-- 3) goodee ����� ���� �� ���� ���� 
--      3-1) ERD���� �������� ��� �� PK ���� -> ������ ���� <- DDL
--      3-2) ���輱 ���� ���̺� ����
--      3-3) ���輱 �ִ� ���̺� ����(FK ���� ���̺���� ...)

-- -������ ����
CREATE SEQUENCE category_seq
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

-- -���̺� ����

SELECT * FROM NLS_DATABASE_PARAMETERS WHERE PARAMETER = 'NLS_CHARACTERSET';

-- 1)
CREATE TABLE file_text(
    film_id NUMBER(3), -- number -999 ~ 999
    title VARCHAR2(225) NOT NULL, -- 255byte ���� ���ڿ�, �ִ� 4000byte ���� varchar2(4000), NOT NULL �� ���ȵ�
    description LONG, -- mysql�� text �ڷ���(65, 535byte) varchar2 4000byte �����ϹǷ� ���� ������ long ����Ŭ �ڷ���
    CONSTRAINT film_text_fk PRIMARY KEY(film_id)
);
-- 2)
CREATE TABLE country (
    country_id NUMBER(5), -- -99999 ~ 99999, mysql�� smallint�� ���� ������ ����Ŭ Ÿ��
    country VARCHAR2(50) NOT NULL, -- 255byte ���� ���ڿ�, �ִ� 4000byte ���� varchar2(4000), ���� �� ���ڴ� 1byte, �ѱ��� ���ڵ��� ���� �ٸ����� 2byte�̻�...
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT country_pk PRIMARY KEY(country_id) -- FK ����
);
-- 3)
CREATE TABLE city (
    city_id NUMBER(5), 
    city VARCHAR2(50) NOT NULL,
    country_id NUMBER(5), -- country, country_id �����ϴ� �ܷ�Ű(FK)
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT city_pk PRIMARY KEY(city_id), -- PK ����
    CONSTRAINT city_fk1 FOREIGN KEY(country_id) REFERENCES country(country_id) -- FK ����
);
-- 4)
CREATE TABLE address (
    address_id NUMBER(5) NOT NULL,
    address VARCHAR2(50) NOT NULL,
    address2 VARCHAR2(50),
    district VARCHAR2(20) NOT NULL,
    city_id NUMBER(5) NOT NULL, 
    postal_code VARCHAR2(10),
    phone VARCHAR2(20) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT address_pk PRIMARY KEY(address_id),
    CONSTRAINT address_fk1 FOREIGN KEY(city_id) REFERENCES city(city_id)
);
-- 5)
CREATE TABLE language (
    language_id NUMBER(5) NOT NULL,
    name CHAR(20), -- CHARŸ�� ���� ���ڷ� 1byte ���ڰ� �ԷµǾ 20byte�� �����Ѵ�.
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT language_pk PRIMARY KEY(language_id)
);
-- 6)
CREATE TABLE film(
    film_id NUMBER(5) NOT NULL, -- PK
    title VARCHAR2(128) NOT NULL,
    description LONG,
    release_year CHAR(4), -- ����Ŭ���� mysql�� YEAR�� ������ Ÿ���� �������� �ʾƼ� 4�ڸ� ���� ���ڸ� ���
    language_id NUMBER(5) NOT NULL, -- FK
    original_language_id NUMBER(5), -- FK
    rental_duration NUMBER(5) NOT NULL,
    rental_rate NUMBER(4, 2) NOT NULL, -- -99.99 ~ 99.99 mysql�� DECIMAL(4, 2)�� ����
    length NUMBER(5),
    replacement_cost NUMBER(5, 2) NOT NULL, -- -999.99 ~ 999.99
    rating VARCHAR2(10), -- CHECK�������� : mysql�� ENUMŸ���� ����Ŭ���� ������������ ǥ��
    special_features VARCHAR2(128), -- mysql�� SET(�迭���)Ÿ���� ����Ŭ������ ��� �Ұ� -> �ټ��� ���� ������ �÷� -> ����ȭ�� �ʿ� 
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT film_pk PRIMARY KEY(film_id),
    CONSTRAINT film_fk1 FOREIGN KEY(language_id) REFERENCES language(language_id),
    CONSTRAINT film_fk2 FOREIGN KEY(original_language_id) REFERENCES language(language_id),
    CONSTRAINT film_ck1 CHECK(rating IN('G','PG','PG-13','R','NC-17'))
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
CREATE TABLE actor (
    actor_id NUMBER(5) NOT NULL,
    first_name VARCHAR2(45) NOT NULL,
    last_name VARCHAR2(45) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT actor_pk PRIMARY KEY(actor_id)
);
-- 10)
CREATE TABLE film_actor (
    actor_id NUMBER(5) NOT NULL,
    film_id NUMBER(5) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT film_actor_pk PRIMARY KEY(actor_id, film_id),
    CONSTRAINT film_actor_fk1 FOREIGN KEY(actor_id) REFERENCES actor(actor_id),
    CONSTRAINT film_actor_fk2 FOREIGN KEY(film_id) REFERENCES film(film_id)
);
-- 11)
CREATE TABLE store (
    store_id NUMBER(5) NOT NULL,
    manager_staff_id NUMBER(5) NOT NULL,
    address_id NUMBER(5) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT store_pk PRIMARY KEY(store_id)
);
-- 12)
CREATE TABLE staff (
    staff_id NUMBER(5) NOT NULL,
    first_name VARCHAR2(45) NOT NULL,
    last_name VARCHAR2(45) NOT NULL,
    address_id NUMBER(5) NOT NULL,
    picture blob,
    email VARCHAR2(50),
    store_id NUMBER(5) NOT NULL,
    active NUMBER(5) NOT NULL,
    username VARCHAR2(16) NOT NULL,
    password VARCHAR2(40),
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT staff_pk PRIMARY KEY(staff_id),
    CONSTRAINT staff_fk1 FOREIGN KEY(address_id) REFERENCES address(address_id),
    CONSTRAINT staff_fk2 FOREIGN KEY(store_id) REFERENCES store(store_id)
);
-- 12-1) �ܷ�Ű �߰�
alter table store add constraint store_fk1 foreign key(manager_staff_id) references staff(staff_id);
alter table store add constraint store_fk2 foreign key(address_id) references address(address_id);
-- 13)
CREATE TABLE inventory (
    inventory_id NUMBER(5) NOT NULL,
    film_id NUMBER(5) NOT NULL,
    store_id NUMBER(5) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT inventory_pk PRIMARY KEY(inventory_id),
    CONSTRAINT inventory_fk1 FOREIGN KEY(film_id) REFERENCES film(film_id),
    CONSTRAINT inventory_fk2 FOREIGN KEY(store_id) REFERENCES store(store_id)
);
-- 14)
CREATE TABLE customer (
    customer_id NUMBER(5) NOT NULL,
    store_id NUMBER(5) NOT NULL,
    first_name VARCHAR2(45) NOT NULL,
    last_name VARCHAR2(45) NOT NULL,
    email VARCHAR2(50),
    address_id NUMBER(5) NOT NULL,
    active NUMBER(5) NOT NULL,
    create_date DATE,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY(customer_id),
    CONSTRAINT customer_fk1 FOREIGN KEY(store_id) REFERENCES store(store_id),
    CONSTRAINT customer_fk2 FOREIGN KEY(address_id) REFERENCES address(address_id)
);
-- 15)
CREATE TABLE rental (
    rental_id NUMBER(5) NOT NULL,
    rental_date DATE NOT NULL,
    inventory_id NUMBER(5) NOT NULL,
    customer_id NUMBER(5) NOT NULL,
    return_date DATE,
    staff_id NUMBER(5) NOT NULL,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT rental_pk PRIMARY KEY(rental_id),
    CONSTRAINT rental_fk1 FOREIGN KEY(inventory_id) REFERENCES inventory(inventory_id),
    CONSTRAINT rental_fk2 FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    CONSTRAINT rental_fk3 FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);
-- 16)
CREATE TABLE payment (
    payment_id NUMBER(5) NOT NULL,
    customer_id NUMBER(5) NOT NULL,
    staff_id NUMBER(5) NOT NULL,
    rental_id NUMBER(5) NOT NULL,
    amount NUMBER(5, 2) NOT NULL,
    payment_date DATE,
    last_update TIMESTAMP NOT NULL,
    CONSTRAINT payment_pk PRIMARY KEY(payment_id),
    CONSTRAINT payment_fk1 FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    CONSTRAINT payment_fk2 FOREIGN KEY(staff_id) REFERENCES staff(staff_id),
    CONSTRAINT payment_fk3 FOREIGN KEY(rental_id) REFERENCES rental(rental_id)
);
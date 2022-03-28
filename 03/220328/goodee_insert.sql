insert into language (
    language_id, 
    name,
    last_update
) values (
    LANGUAGE_SEQ.nextval,
    'korean',
    SYSTIMESTAMP
);

select * from language;
commit;

desc film;
insert into film (
    film_id,
    title,
    description,
    release_year,
    language_id,
    original_language_id,
    rental_duration,
    rental_rate,
    length,
    replacement_cost,
    rating,
    special_features,
    last_update
) values (
    FILM_SEQ.nextval,
    'goodee academy',
    '샘플 영화 입니다',
    '2022',
    1,
    1,
    7,
    0.5,
    120,
    100.5,
    'G',
    null,
    SYSTIMESTAMP
);
select * from film;

insert into film_text (
    film_id,
    title,
    description
) values (
    1,
    'goodee academy',
    'goodee academy description 입니다'
);
select * from film_text;
commit; -- film과 film_text 같이 커밋 -> 트랜잭션

select f.film_id, f.title, f.release_year, ft.description
from film f inner join film_text ft
on f.film_id = ft.film_id;

desc country;
insert into country (
    country_id,
    country,
    last_update
) values (
    COUNTRY_SEQ.nextval,
    'Korea',
    SYSTIMESTAMP
);
select * from country;

desc city;
insert into city (
    city_id,
    city,
    country_id,
    last_update
) values (
    CITY_SEQ.nextval,
    'Seoul',
    1,
    SYSTIMESTAMP
);
select * from city;

select c.country_id, c.country, cc.city_id, cc.city
from country c inner join city cc
on c.country_id = cc.country_id;

desc address;
insert into address (
    address_id,
    address,
    address2,
    district,
    city_id,
    postal_code,
    phone,
    location,
    last_update
) values (
    ADDRESS_SEQ.nextval,
    '서울 특별시 서초구 반포대로 58',
    null,
    'Seocho-gu',
    1,
    59000,
    14033335,
    'Seoul',
    SYSTIMESTAMP
);
select * from address;

select a.address, c.city_id
from address a inner join city c
on a.city_id = c.city_id;

desc category;
insert into category (
    category_id,
    name,
    last_update
) values (
    CATEGORY_SEQ.nextval,
    'Action',
    SYSTIMESTAMP
);
select * from category;

desc film_category;
insert into film_category (
    film_id,
    category_id,
    last_update
) values (
    1,
    1,
    SYSTIMESTAMP
);
select * from film_category;

desc actor;
insert into actor (
    actor_id,
    first_name,
    last_name,
    last_update
) values (
    ACTOR_SEQ.nextval,
    'Arjun',
    'Saagar',
    SYSTIMESTAMP
);
select * from actor;

desc store;
insert into store (
    store_id,
    manager_staff_id,
    address_id,
    last_update
) values (
    STORE_SEQ.nextval,
    null,
    1,
    SYSTIMESTAMP
);
select * from store;

desc staff;
insert into staff (
    staff_id,
    first_name,
    last_name,
    address_id,
    picture,
    email,
    store_id,
    active,
    username,
    password,
    last_update
) values (
    STAFF_SEQ.nextval,
    'Nadeem',
    'Shravan',
    1,
    null,
    'abc@sakilastaff.com',
    7,
    1,
    'Nadeem',
    1234,
    SYSTIMESTAMP
);
select * from staff;

desc customer;
insert into customer (
    customer_id,
    store_id,
    first_name,
    last_name,
    email,
    address_id,
    active,
    create_date,
    last_update
) values (
    CUSTOMER_SEQ.nextval,
    7,
    'Lisa',
    'Wilson',
    'def@sakilacustomer.com',
    1,
    1,
    SYSTIMESTAMP,
    SYSTIMESTAMP
);
select * from customer;

desc inventory;
insert into inventory (
    inventory_id,
    film_id,
    store_id,
    last_update
) values (
    INVENTORY_SEQ.nextval,
    1,
    7,
    SYSTIMESTAMP
);
select * from inventory;

desc rental;
insert into rental (
    rental_id,
    rental_date,
    inventory_id,
    customer_id,
    return_date,
    staff_id,
    last_update
) values (
    RENTAL_SEQ.nextval,
    SYSTIMESTAMP,
    1,
    1,
    null,
    2,
    SYSTIMESTAMP
);
select * from rental;

desc payment;
insert into payment (
    payment_id,
    customer_id,
    staff_id,
    rental_id,
    amount,
    payment_date,
    last_update
) values (
    PAYMENT_SEQ.nextval,
    1,
    2,
    1,
    0.99,
    SYSTIMESTAMP,
    SYSTIMESTAMP
);
select * from payment;

commit;

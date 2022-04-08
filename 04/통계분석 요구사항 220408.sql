# 제일 많이(횟수) 빌려간 사람 누구?
SELECT *
FROM customer
WHERE customer_id = (SELECT customer_id
							FROM payment
							GROUP BY customer_id
							order by COUNT(*) DESC
							LIMIT 0, 1);
							
# 제일 많이(금액) 빌려간 사람 내림차순?
SELECT p.customer_id, CONCAT(c.first_name, ' ', c.last_name), SUM(p.amount)
FROM payment p INNER JOIN customer c
ON p.customer_id = c.customer_id
GROUP BY customer_id
HAVING SUM(p.amount) > 180
ORDER BY SUM(p.amount) DESC;

# rental_rate별 영화 개수 
SELECT rental_rate, COUNT(*)
FROM film
GROUP BY rental_rate
ORDER BY COUNT(*) DESC;

# rating별 영화 개수
SELECT rating, COUNT(*)
FROM film
GROUP BY rating;

# language별 영화 개수 
SELECT l.name, COUNT(*)
FROM film f INNER JOIN language l
ON f.language_id = l.language_id
GROUP BY l.name;

# length별 영화 개수 (구간, 기준을 정해서)
SELECT t.length2, COUNT(*)
FROM (SELECT title, LENGTH, 
		CASE WHEN LENGTH < 60 THEN 'less60'
			  WHEN LENGTH BETWEEN 61 AND 120 THEN 'between61and120' 
			  WHEN LENGTH BETWEEN 121 AND 180 THEN 'between121and180'
			  ELSE 'more180'
		END LENGTH2
		FROM film) t
GROUP BY t.length2;

# store 매장 요일별 매출 (월화수목금토일)
SELECT s.store_id, t.w, case t.w
					WHEN 0 THEN '월'
					WHEN 1 THEN '화'
					WHEN 2 THEN '수'
					WHEN 3 THEN '목'
					WHEN 4 THEN '금'
					WHEN 5 THEN '토'
					WHEN 6 THEN '일'
				END DAYOFWEEK, t.c
FROM (SELECT staff_id, WEEKDAY(payment_date) w,  COUNT(*) c
		FROM payment
		GROUP BY staff_id, WEEKDAY(payment_date)) t 
		INNER JOIN staff s
		ON t.staff_id = s.staff_id
ORDER BY s.store_id, t.w ASC;

CASE WEEKDAY(payment_date)
	WHEN 0 THEN '월'
	WHEN 1 THEN '화'
	WHEN 2 THEN '수'
	WHEN 3 THEN '목'
	WHEN 4 THEN '금'
	WHEN 5 THEN '토'
	WHEN 6 THEN '일'
END dayOfWeek
FROM payment;



# actor별 영화 출연 횟수 (top 5)
SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name), COUNT(*)
FROM film_actor fa INNER JOIN actor a
ON fa.actor_id = a.actor_id
GROUP BY a.actor_id
ORDER BY COUNT(*) DESC LIMIT 0, 5; 

SELECT actor_id, COUNT(*)
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT(*) DESC LIMIT 0, 5; 

# store별 영화 소지 개수 
SELECT s.store_id, COUNT(*)
FROM inventory i INNER JOIN store s
ON i.store_id = s.store_id
GROUP BY s.store_id;

# customer별 store를 이용한 횟수
SELECT r.customer_id, s.store_id, COUNT(*)
FROM rental r INNER JOIN staff s
ON r.staff_id = s.staff_id
GROUP BY r.customer_id, s.store_id;
							
# 스태프별(staff_id) 대여(rental_id)해준 횟수
SELECT s.staff_id, COUNT(*)
FROM staff s INNER JOIN rental r
ON s.staff_id = r.staff_id
GROUP BY s.store_id
ORDER BY COUNT(*) DESC;

# 각 스태프(staff_id)가 손님별(customer_id)로 대여(rental_id)해준 수 ex) 1번 스태프에게 1번손님이 대여한 횟수 
SELECT r.customer_id, s.staff_id, COUNT(*)
FROM staff s INNER JOIN rental r
ON s.staff_id = r.staff_id
INNER JOIN customer c
ON c.customer_id = r.customer_id
GROUP BY r.customer_id
ORDER BY COUNT(*) DESC;

# 영화(film)별 빌려간 횟수
SELECT f.film_id, f.title, COUNT(*)
FROM film f INNER JOIN inventory i
ON f.film_id = i.film_id
INNER JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY f.film_id;

# inventory별 빌려간 횟수
SELECT i.inventory_id, COUNT(*)
FROM inventory i INNER JOIN rental r
ON i.inventory_id = r.inventory_id
GROUP BY i.inventory_id;

# 나라(country)별 고객(customer) 수
SELECT c.country_id, c.country, COUNT(*)
FROM country c INNER JOIN city ci
ON c.country_id = ci.country_id
INNER JOIN address a
ON ci.city_id = a.city_id
INNER JOIN customer cu
ON a.address_id = cu.address_id
GROUP BY c.country_id;

# country별 대여(rental) 횟수 
SELECT c.country_id, c.country, COUNT(*)
FROM country c INNER JOIN city ci
ON c.country_id = ci.country_id
INNER JOIN address a
ON ci.city_id = a.city_id
INNER JOIN customer cu
ON a.address_id = cu.address_id
INNER JOIN rental r
ON cu.customer_id = r.customer_id
GROUP BY c.country_id;
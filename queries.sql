/*query 1- query used for first insight*/
SELECT film_title, category_name,
COUNT(*)
FROM
(SELECT f.title AS film_title, c.name AS category_name
FROM film f
JOIN film_category fc
ON f.film_id=fc.film_id
JOIN category c
ON c.category_id=fc.category_id
JOIN inventory i
ON f.film_id=i.film_id
JOIN rental r
ON i.inventory_id=r.inventory_id
WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music')
) sub
GROUP BY film_title, category_name
ORDER BY category_name, film_title;


/*query 2- query used for second insight*/
SELECT name, standard_quartile, COUNT(rental_duration)
FROM
(SELECT c.name AS name, rental_duration, NTILE(4) OVER (ORDER BY rental_duration) AS standard_quartile
FROM category c
JOIN film_category fc
ON fc.category_id=c.category_id
JOIN film f
ON f.film_id=fc.film_id
WHERE c.name IN ('Animation','Children','Classics','Comedy','Family','Music'))sub
GROUP BY name, standard_quartile
ORDER BY name, standard_quartile;



/*query 3- query used for third insight*/
SELECT s.store_id, DATE_PART('year',r.rental_date) Rental_year,
DATE_PART('month',r.rental_date) Rental_month, COUNT(r.rental_id) Count_rentals
FROM store s
JOIN staff st
ON s.store_id=st.store_id
JOIN rental r
ON r.staff_id=st.staff_id
GROUP BY s.store_id,Rental_year,Rental_month
ORDER BY Count_rentals DESC;

/*query 4- query used for fourth insight*/
WITH t1 AS(SELECT CONCAT(c.first_name, ' ', c.last_name) AS fullname,
SUM(p.amount) total_amount
FROM payment p
JOIN customer c
ON p.customer_id=c.customer_id
GROUP BY fullname
ORDER BY total_amount DESC LIMIT 10),

t2 AS(SELECT CONCAT(c.first_name, ' ', c.last_name) AS fullname,
DATE_TRUNC('month',p.payment_date) AS pay_mon,
SUM(amount) AS pay_amount,
COUNT(p.rental_id) pay_countpermonth
FROM payment p
JOIN customer c
ON p.customer_id=c.customer_id
GROUP BY fullname, pay_mon
ORDER BY fullname, pay_mon)

SELECT pay_mon,t1.fullname,pay_countpermonth,pay_amount
FROM t1
JOIN t2
ON t1.fullname=t2.fullname
LIMIT 10;

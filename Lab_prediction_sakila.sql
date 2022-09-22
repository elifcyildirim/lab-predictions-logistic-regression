use sakila;
select * from actor;
select * from film;
select * from film_actor;
select * from film_category;
select * from address;
select * from category;
select * from country;
select * from customer;
select * from inventory;
select * from language;
select * from payment;
select * from rental;
select * from staff;
select * from store;


-- query
select f.film_id, f.title, f.release_year, f.language_id,
       f.original_language_id, f.rental_rate, f.length, f.rating, l.name as 'language',
       c.name as 'category', r.rental_date, p.amount from film f
left join inventory i on f.film_id=i.film_id
left join film_category fc on f.film_id=fc.film_id
left join category c on c.category_id=fc.category_id
left join language l on l.language_id=f.language_id
left join rental r on r.inventory_id=i.inventory_id
left join payment p on p.rental_id=r.rental_id
ORDER BY f.film_id ASC;

-- query_1

SELECT film_id, COUNT(film_id) AS tot_numb_copies from inventory
GROUP BY film_id
ORDER BY film_id ASC;

-- query_2
SELECT f.film_id, COUNT(f.film_id) AS num_of_rental_May from film f
LEFT JOIN inventory i ON f.film_id=i.film_id
LEFT JOIN rental r ON r.inventory_id=i.inventory_id
WHERE r.rental_date BETWEEN '2005-05-01 00:00:00' AND '2005-06-01 00:00:00'
GROUP BY film_id
ORDER BY f.film_id ASC;

--
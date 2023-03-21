USE sakila;

#1. Get all pairs of actors that worked together.
SELECT f.title, fa1.actor_id AS actor_1, fa2.actor_id AS actor_2
FROM film_actor fa1
JOIN film_actor fa2
ON fa1.film_id = fa2.film_id
INNER JOIN film f
ON fa2.film_id = f.film_id
INNER JOIN actor a
ON fa1.actor_id = a.actor_id;

#2.Get all pairs of customers that have rented the same film more than 3 times.
SELECT inv.film_id, r1.customer_id AS customer_1, r2.customer_id AS customer_2, COUNT(*) AS n_rentals
FROM rental r1
JOIN rental r2
ON r1.rental_id = r2.rental_id
INNER JOIN inventory inv
ON r2.inventory_id = inv.inventory_id
GROUP BY inv.film_id, r1.customer_id, r2.customer_id
HAVING COUNT(*) >= 3;

# 3. Get all possible pairs of actors and films.
SELECT f.title, fa.actor_id
FROM film_actor fa
CROSS JOIN film f
ORDER BY f.title;
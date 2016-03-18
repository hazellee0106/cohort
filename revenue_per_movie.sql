DROP TEMPORARY TABLE IF EXISTS revenue_per_film;
CREATE TEMPORARY TABLE revenue_per_film
SELECT film.film_id,
		film.title,
		film.rental_rate*COUNT(*)"total_rental"
FROM rental, film, inventory
WHERE rental.inventory_id=inventory.inventory_id
		AND inventory.film_id=film.film_id
GROUP BY 1
;

SELECT actor.actor_id Actor_ID,
		CONCAT(actor.first_name,"",actor.last_name) Name,
		COUNT(film_actor.film_id),
		SUM(revenue_per_film.total_rental)Total_revenue
FROM actor, film_actor, revenue_per_film
WHERE actor.actor_id=film_actor.actor_id
		AND revenue_per_film.film_id=film_actor.film_id
GROUP BY 1
ORDER BY Total_revenue DESC
LIMIT 10
;


SELECT film.film_id,
		film.title,
		film.rental_rate*COUNT(*)"total_rental"
FROM rental, film, inventory
WHERE rental.inventory_id=inventory.inventory_id
		AND inventory.film_id=film.film_id
GROUP BY 1
;

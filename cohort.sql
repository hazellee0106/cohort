DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental
SELECT customer_id,
		MIN(rental_date) first_time
FROM rental
GROUP BY 1;
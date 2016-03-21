SELECT LEFT(rental_date,7),
		COUNT(customer_id)
FROM rental
GROUP BY 1;

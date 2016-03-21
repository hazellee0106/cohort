DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental
SELECT customer_id,
		MIN(rental_date) first_time
FROM rental
GROUP BY 1;

DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size
SELECT LEFT(first_time,7) month,
		COUNT(*) Num
FROM first_rental
GROUP BY 1;

SELECT r.*,
	LEFT(fr.first_time,7) cohort,
	p.amount
FROM rental r 

	JOIN first_rental fr
	ON r.customer_id=fr.customer_id
	
	JOIN cohort_size cs
	ON LEFT(fr.first_time,7)=cs.month
	
	JOIN payment p
	ON r.rental_id=p.rental_id;

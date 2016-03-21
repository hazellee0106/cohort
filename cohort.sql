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
FROM rental r,
	first_rental fr, 
	cohort_size cs,
	payment p
WHERE r.customer_id=fr.customer_id
	AND LEFT(fr.first_time,7)=cs.month
	AND r.rental_id=p.rental_id;
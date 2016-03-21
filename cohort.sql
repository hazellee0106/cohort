DROP TEMPORARY TABLE IF EXISTS first_rental;
CREATE TEMPORARY TABLE first_rental
SELECT customer_id,
		MIN(rental_date) first_time
FROM rental
GROUP BY 1;

DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size
SELECT LEFT(first_time,7) Month,
		COUNT(*) Num
FROM first_rental
GROUP BY 1;
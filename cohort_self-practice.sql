DROP TEMPORARY TABLE IF EXISTS first_rental_month;
CREATE TEMPORARY TABLE first_rental_month
SELECT customer_id, 
	MIN(rental_date) First_Rental
FROM rental
GROUP BY 1;

DROP TEMPORARY TABLE IF EXISTS cohort_size;
CREATE TEMPORARY TABLE cohort_size
SELECT LEFT(frm.First_Rental,7) rental_month,
		COUNT(*) NUM
FROM first_rental_month frm
GROUP BY 1
;

SELECT r.*,
	LEFT(frm.First_rental,7),
	p.amount
FROM rental r
	JOIN first_rental_month frm
		ON r.customer_id=frm.customer_id
	JOIN cohort_size cs
		ON LEFT(frm.First_rental,7)=cs.rental_month
	JOIN payment p
		ON p.rental_id=r.rental_id
;
	
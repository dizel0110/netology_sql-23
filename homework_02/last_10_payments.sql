--select * from payment

--select count(payment_id) from payment --14596
 
--select payment_id, payment_date from payment order by payment_date limit 10 offset 14586

SELECT
	payment_id,
	payment_date
FROM
	payment
ORDER BY
	payment_date DESC
LIMIT 10


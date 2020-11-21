SELECT 
	customer_id,
	first_name,
	last_name,
	active
FROM
	customer
WHERE
	active = 0;
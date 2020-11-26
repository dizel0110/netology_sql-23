SELECT DISTINCT (store_id)
FROM customer -- store_id - два магазина (store_id = 1, 2)

Выведите магазины, имеющие больше 300-от покупателей

SELECT store_id, COUNT (customer_id) customer_count
FROM customer c
GROUP BY store_id
HAVING COUNT (customer_id) > 300;
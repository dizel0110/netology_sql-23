
-- Homework 5.1
-- Сделайте запрос к таблице rental. Добавьте колонку
-- с порядковым номером аренды (сортировать по rental_date)
-- для каждого юзера.

SELECT
	customer_id,
	rental_id,
	ROW_NUMBER() OVER (PARTITION BY customer_id
ORDER BY
	rental_date DESC) row_n,
	rental_date
from
	rental;




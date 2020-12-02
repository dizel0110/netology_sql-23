
-- Homework 5.2
-- Для каждого пользователя подсчитайте сколько он брал в аренду фильмов
-- со специальным атрибутом Behind the Scenes

-- Написать этот запрос
-- Создать материализованное представление с этим запросом и обновить его
-- Написать три варианта поиска Behind the Scenes

CREATE MATERIALIZED VIEW n_rented AS
SELECT
	first_name,
	last_name,
	COUNT(sub.special_features) n_films
FROM
	(
	SELECT
		c.customer_id, c.first_name, c.last_name, f.film_id, f.special_features
	FROM
		customer c
	INNER JOIN rental r ON
		c.customer_id = r.customer_id
	INNER JOIN inventory i ON
		r.inventory_id = i.inventory_id
	INNER JOIN film f ON
		f.film_id = i.film_id
	WHERE
		'Behind the Scenes' = ANY(f.special_features)
--  WHERE
--      'Behind the Scenes' IN (SELECT unnest(f.special_features))
-- WHERE
--      f.title IS NOT NULL AND array_to_string(f.special_features, ',') like '%Behind the Scenes%'
) sub
GROUP BY
	customer_id,
	1,
	2
ORDER BY
	n_films DESC;
WITH NO DATA;

REFRESH MATERIALIZED VIEW n_rented;



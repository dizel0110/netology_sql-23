Выведите ФИО сотрудников и города магазинов, имеющих больше 300-от покупателей

staff - сотрудники

-- Будем использовать подзапрос первого задания, где выводили магазины,
-- имеющие больше 300-от покупателей,
-- выберем идентификатор магазина store_id.

SELECT staff.first_name, staff.last_name, city.city 
FROM staff
JOIN address a ON staff.address_id = a.address_id 
JOIN city ON a.city_id = city.city_id
WHERE staff.store_id IN (SELECT store_id FROM customer c GROUP BY store_id HAVING COUNT (customer_id) > 300);
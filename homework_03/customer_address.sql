Выведите у каждого покупателя город в котором он живёт 

SELECT c.first_name, c.last_name, a.address, city.city 
FROM customer c
JOIN address a ON c.address_id = a.address_id -- Условие совпадения по address_id в двух таблицах (однозначное)
JOIN city ON a.city_id = city.city_id         -- Условие совпадения по city_id в двух таблицах (однозначное)

-- Таблица customer связана с таблицей address с помощью address_id
-- Таблица address связана с таблицей city с помощью city_id
-- Таким образом  с помощью однозначной связи выполнили требуемый запрос

--        address-id         city-id 
-- custom            address         city
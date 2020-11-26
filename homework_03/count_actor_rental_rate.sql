-- �������� ���������� ������, ����������� � �������,
-- ������� ������� �� 2,99

SELECT  COUNT (actor.actor_id) as count_actor
FROM actor 
JOIN film_actor fa ON actor.actor_id = fa.actor_id 
JOIN film ON fa.film_id = film.film_id
WHERE film.film_id IN (SELECT f.film_id FROM film f WHERE f.rental_rate = 2.99); -- � ������� ���������� ������ �� ����� film_id ����� ���������
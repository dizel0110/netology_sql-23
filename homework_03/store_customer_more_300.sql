SELECT DISTINCT (store_id)
FROM customer -- store_id - ��� �������� (store_id = 1, 2)

�������� ��������, ������� ������ 300-�� �����������

SELECT store_id, COUNT (customer_id) customer_count
FROM customer c
GROUP BY store_id
HAVING COUNT (customer_id) > 300;
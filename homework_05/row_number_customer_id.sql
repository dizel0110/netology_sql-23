
-- Homework 5.1
-- �������� ������ � ������� rental. �������� �������
-- � ���������� ������� ������ (����������� �� rental_date)
-- ��� ������� �����.

SELECT
	customer_id,
	rental_id,
	ROW_NUMBER() OVER (PARTITION BY customer_id
ORDER BY
	rental_date DESC) row_n,
	rental_date
from
	rental;




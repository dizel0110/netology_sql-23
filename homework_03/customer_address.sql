�������� � ������� ���������� ����� � ������� �� ���� 

SELECT c.first_name, c.last_name, a.address, city.city 
FROM customer c
JOIN address a ON c.address_id = a.address_id -- ������� ���������� �� address_id � ���� �������� (�����������)
JOIN city ON a.city_id = city.city_id         -- ������� ���������� �� city_id � ���� �������� (�����������)

-- ������� customer ������� � �������� address � ������� address_id
-- ������� address ������� � �������� city � ������� city_id
-- ����� �������  � ������� ����������� ����� ��������� ��������� ������

--        address-id         city-id 
-- custom            address         city
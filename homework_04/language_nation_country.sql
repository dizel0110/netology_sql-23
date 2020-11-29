
-- Домашнее задание

-- Спроектируйте базу данных для следующих сущностей:
-- * Язык (в смысле английский, французский, и тп)
-- * Народность (в смысле славяне, англосаксы и тп)
-- * Страны (в смысле Россия, Германия и тп)

-- Правила следующие:
-- * На одном языке может говорить несколько народностей
-- * Одна народность может входить в несколько стран
-- * Каждая страна может состоять из несколько народностей

-- Суть задания - научиться проектировать архитектуру и работать с
-- ограничениями. Таким образом должно получиться 5 таблиц. Три
-- таблицы-справочинка и две таблицы со связями.
-- (Пример таблицы со связями - film_actor)
-- Пришлите скрипты создания таблиц и скрипты по добавлению в
-- каждую таблицу по 5 строк с данными

-- Дополнительная часть

-- Показать, как назначать внешние ключи краткой записью при
-- создании таблицы и как можно присвоить внешние ключи для
-- столбцов существующей таблицы

-- Добавить в получившиеся отношения несколько атрибутов со
-- следующими типами данных: timestamp, boolean, и text[].
-- Заполнить эти атрибуты данными.

CREATE SCHEMA hw_4

-- Таблицы-справочники

CREATE TABLE hw_4."language" (
    id serial PRIMARY KEY,
    "language" VARCHAR(80) NOT NULL UNIQUE,
    attrib TEXT []
);

CREATE TABLE hw_4.nation (
    id serial PRIMARY KEY, 
    nation VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE hw_4.country (
    id serial PRIMARY KEY, 
    country VARCHAR(80) NOT NULL UNIQUE,
    founded DATE NOT NULL, -- дата основания страны
    sea_access BOOLEAN NOT NULL -- есть ли выход к морю
);

-- Таблицы со связями (references)
-- по подобию с film_actor. 

CREATE TABLE hw_4.nation_country (
    nation_id INTEGER REFERENCES hw_4.nation(id),   -- на таблицу nation
    country_id INTEGER REFERENCES hw_4.country(id), -- на таблицу country
    PRIMARY KEY (nation_id, country_id) -- два первичных ключа
);

CREATE TABLE hw_4.nation_language (
        nation_id INTEGER REFERENCES hw_4.nation(id),
        language_id INTEGER REFERENCES hw_4."language"(id),
        PRIMARY KEY (nation_id, language_id)
    );

-- Заполняем данными
   
INSERT INTO hw_4.nation (nation) 
SELECT UNNEST(ARRAY['Russian', 'Hindi', 'Lithuanian', 'British', 'Dutch']);
	
INSERT INTO hw_4.country (country, founded, sea_access) 
VALUES 
	('Russia', '1991-12-25', TRUE), -- все страны имеют доступ к морю
	('India', '1947-08-15', TRUE),
	('Lithuanian', '1918-02-16', TRUE),
	('UK', '1922-01-01', TRUE), -- где-то в 1922
	('Netherlands', '2020-01-01', TRUE); -- Теперь уж точно Нидерланды :)

INSERT INTO hw_4.nation_country (nation_id, country_id) 
VALUES 
	(1, 1), -- условное соответствие.
	(2, 2),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 5),
	(5, 5);
	

INSERT INTO hw_4."language" ("language", attrib) 
VALUES 
	('Russian', ARRAY ['branch', 'Slavic']), 
	('Hindi', ARRAY ['branch', 'Germanic']),
	('Lithuanian', ARRAY ['branch', 'Baltic']),
	('English', ARRAY ['branch', 'Germanic']),
	('Dutch', ARRAY ['branch', 'Germanic']);

INSERT INTO hw_4.nation_language (nation_id, language_id) 
VALUES 
	(1, 1), 
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(1, 5),
	(2, 1),
	(4, 1);

INSERT INTO hw_4.nation_country (nation_id, country_id) 
VALUES 
	(3, 3), 
	(4, 4);

SELECT * FROM hw_4.country;

SELECT * FROM hw_4.nation;

SELECT * FROM hw_4."language";

SELECT c.country, n.nation
FROM hw_4.country c 
JOIN hw_4.nation_country nc ON c.id = nc.country_id 
JOIN hw_4.nation n ON nc.nation_id = n.id
ORDER BY c.country;

SELECT n.nation, l."language"
FROM hw_4."language" l 
JOIN hw_4.nation_language nl ON l.id = nl.language_id 
JOIN hw_4.nation n ON nl.nation_id = n.id
ORDER BY n.nation;

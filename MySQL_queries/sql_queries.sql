-- Данный пример основан на тренировочной базе данных menagerie-db
-- которая предоставлена на официальном сайте MySQL в разделе учебных материалов
-- Таблицы были заранее созданы и подготовлены
-- Данные загружены в MySQL с помощью команды LOAD DATA LOCAL INFILE

-- Загрузка данных в таблицу pet
LOAD DATA LOCAL INFILE 'C:/Users/xperi/OneDrive/Documents/menagerie-db/pet.txt'
INTO TABLE pet;

-- Загрузка данных в таблицу event
LOAD DATA LOCAL INFILE 'C:/Users/xperi/OneDrive/Documents/menagerie-db/event.txt'
INTO TABLE event;

-- Вывести все записи из таблицы pet
SELECT * FROM pet;

-- Вывести имена, вид и дату рождения всех собак
SELECT name, species, birth FROM pet WHERE species = 'dog';

-- Вывести имена и дату рождения питомцев, родившихся в мае
SELECT name, birth FROM pet WHERE MONTH(birth) = 5;

-- Вывести имена и вид живых питомцев (не умерших)
SELECT name, species FROM pet WHERE death IS NULL;

-- Вывести всю информацию о питомце по имени Fluffy
SELECT * FROM pet WHERE name = 'Fluffy';

-- Вывести питомцев, родившихся с 1995 по 1998 год
SELECT * FROM pet WHERE birth BETWEEN '1995-01-01' AND '1998-12-31';

-- Вывести все записи из таблицы event
SELECT * FROM event;

-- Вывести все события типа 'litter' (роды)
SELECT name, type, date FROM event WHERE type = 'litter';

-- Вывести посещения ветеринара до 1999 года
SELECT name, type, date FROM event WHERE type = 'vet' AND date < '1999-01-01';

-- Вывести события до 1995 года
SELECT name, type FROM event WHERE date < '1995-01-01';

-- Вывести список питомцев и их ветеринарные события
SELECT p.name, p.species, e.type, e.date
FROM pet p
JOIN event e ON p.name = e.name
WHERE e.type = 'vet';

-- Вывести всех питомцев и любые их события (или NULL если нет событий)
SELECT p.name, p.species, e.type, e.date
FROM pet p
LEFT JOIN event e ON p.name = e.name;
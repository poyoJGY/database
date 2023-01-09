USE market_db;
SELECT mem_id, mem_name, debut_date
	FROM member
	ORDER BY debut_date;
    
SELECT mem_id, mem_name, debut_date
	FROM member
	ORDER BY debut_date DESC;
    
SELECT mem_id, mem_name, debut_date, height
	FROM member
    WHERE height >= 164
	ORDER BY height DESC;
    
SELECT mem_id, mem_name, debut_date, height
	FROM member
    WHERE height >= 164
	ORDER BY height DESC, debut_date;
    
SELECT *
	FROM member
    LIMIT 3;
    
SELECT mem_name, debut_date
	FROM member
    ORDER BY debut_date
    LIMIT 3;
    
SELECT mem_name, height
	FROM member
    ORDER BY height DESC
    LIMIT 3, 2;
    
SELECT addr FROM member;

SELECT DISTINCT addr FROM member;

SELECT mem_id, amount FROM buy ORDER BY mem_id;

SELECT mem_id, SUM(amount) amount FROM buy GROUP BY mem_id;

SELECT mem_id "회원 아이디", SUM(amount) "총 구매 개수"
	FROM buy GROUP BY mem_id;
    
SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy GROUP BY mem_id;
    
SELECT AVG(amount) FROM buy;

SELECT mem_id, AVG(amount) "평균 구매 개수"
	FROM buy GROUP BY mem_id;
    
SELECT COUNT(*) FROM member;

SELECT COUNT(phone1) "연락처가 있는 회원" FROM member;

SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy
    WHERE SUM(price*amount) > 1000
    GROUP BY mem_id;
    
SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy
    GROUP BY mem_id
    HAVING SUM(price*amount) > 1000;
    
SELECT mem_id "회원 아이디", SUM(price*amount) "총 구매 금액"
	FROM buy
    GROUP BY mem_id
    HAVING SUM(price*amount) > 1000
    ORDER BY SUM(price*amount) DESC;
    
-- -------------------------------------
-- INSERT, UPDATE, DELETE
-- -------------------------------------

USE market_db;
CREATE TABLE hongong1 (toy_id INT, toy_name CHAR(4), age INT);
INSERT INTO hongong1 VALUES(1, '우디', 25);

INSERT INTO hongong1(toy_id, toy_name) VALUES (2, '버즈');

INSERT INTO hongong1(toy_name, age, toy_id) VALUES('제시', 20, 3);

CREATE TABLE hongong2 (
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age INT);

INSERT INTO hongong2 VALUES(NULL, '보핍', 25);
INSERT INTO hongong2 VALUES(NULL, '슬링키', 22);
INSERT INTO hongong2 VALUES(NULL, '렉스', 21);
SELECT * FROM hongong2;

SELECT LAST_INSERT_ID();

ALTER TABLE hongong2 AUTO_INCREMENT=100;
INSERT INTO hongong2 VALUES(NULL, '재남', 35);
SELECT * FROM hongong2;

CREATE TABLE hongong3 (
	toy_id INT AUTO_INCREMENT PRIMARY KEY,
    toy_name CHAR(4),
    age INT);
ALTER TABLE hongong3 AUTO_INCREMENT=1000;
SET @@auto_increment_increment=3;

INSERT INTO hongong3 VALUES(NULL, '토마스', 20);
INSERT INTO hongong3 VALUES(NULL, '제임스', 23);
INSERT INTO hongong3 VALUES(NULL, '고든', 25);
SELECT * FROM hongong3;

SELECT COUNT(*) FROM world.city;

DESC world.city;

SELECT * FROM world.city LIMIT 5;

CREATE TABLE city_popul(city_name CHAR(35), population INT);

INSERT INTO city_popul
	SELECT Name, Population FROM world.city;
    
USE market_db;

SELECT * FROM city_popul WHERE city_popul = 'Seoul';
UPDATE city_popul
	SET city_name = '서울'
    WHERE city_name = 'Seoul';

SELECT * FROM city_popul WHERE city_name = '서울';

UPDATE city_popul
	SET city_name = '뉴욕', population = 0
    WHERE city_name = 'New York';
    
SELECT * FROM city_popul WHERE city_name = '뉴욕';

-- UPDATE city_popul
-- 	  SET city_name = '서울'

UPDATE city_popul
	SET population = population / 10000;
SELECT * FROM city_popul LIMIT 5;

DELETE FROM city_popul
	WHERE city_name LIKE 'NEW%';
    
DELETE FROM city_popul
	WHERE city_name LIKE 'NEW%'
    LIMIT 5;

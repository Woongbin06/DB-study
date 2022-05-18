CREATE TABLE 극장 --테이블 명은 한글 가능
(
    극장번호 NUMBER,
    극장이름 VARCHAR2(40),
    위치 VARCHAR2(40),
    PRIMARY KEY(극장번호)
);

CREATE TABLE 상영관
(
    극장번호 NUMBER,
    상영관번호 NUMBER CHECK(상영관번호 BETWEEN 1 AND 10),
    영화제목 VARCHAR2(40),
    가격 NUMBER CHECK(가격 <= 20000),
    좌석수 NUMBER,
    PRIMARY KEY(극장번호, 상영관번호),
    FOREIGN KEY(극장번호) REFERENCES 극장(극장번호)
);

CREATE TABLE 예약
(
    극장번호 NUMBER,
    상영관번호 NUMBER CHECK(상영관번호 BETWEEN 1 AND 10),
    고객번호 NUMBER,
    좌석번호 NUMBER,
    날짜 DATE,
    PRIMARY KEY(극장번호, 상영관번호, 고객번호),
    FOREIGN KEY(극장번호) REFERENCES 극장(극장번호),
    FOREIGN KEY(극장번호, 상영관번호) REFERENCES 상영관(극장번호, 상영관번호),
    FOREIGN KEY(고객번호) REFERENCES 고객(고객번호)
    --UNIQUE(극장번호, 상영관번호, 고객번호, 좌석번호)
);
DROP TABLE 극장;
DROP TABLE 상영관;
DROP TABLE 고객;
DROP TABLE 예약;

CREATE TABLE 고객
(
    고객번호 NUMBER,
    이름 VARCHAR(40),
    주소 VARCHAR(40),
    PRIMARY KEY(고객번호)
);

INSERT INTO 극장 VALUES(1, '롯데', '잠실');
INSERT INTO 극장 VALUES(2, '메가', '강남');
INSERT INTO 극장 VALUES(3, '대한', '잠실');
INSERT INTO 상영관 VALUES(1, 1, '어려운 영화', 15000, 48);
INSERT INTO 상영관 VALUES(3, 1, '멋진 영화', 7500, 120);
INSERT INTO 상영관 VALUES(3, 2, '재밌는 영화', 8000, 110);
INSERT INTO 예약 VALUES(3, 2, 3, 15, '20200901'); --DATE 자료형은 ''사용
INSERT INTO 예약 VALUES(3, 1, 4, 16, '20200901');
INSERT INTO 예약 VALUES(1, 1, 9, 48, '20200901');
INSERT INTO 고객 VALUES(3, '홍길동', '강남');
INSERT INTO 고객 VALUES(4, '김철수', '잠실');
INSERT INTO 고객 VALUES(9, '박영희', '강남');

--1-1번 문제
SELECT 극장이름, 위치
FROM 극장;
--1-2번 문제
SELECT 극장이름
FROM 극장
WHERE 위치 LIKE '잠실';
--1-3번 문제
SELECT 이름
FROM 고객
WHERE 주소 LIKE '잠실'
ORDER BY 이름 ASC;
--1-4번 문제
SELECT 극장번호, 상영관번호, 영화제목
FROM 상영관
WHERE 가격 <= 8000;
--1-5번 문제
SELECT *
FROM 고객, 극장
WHERE 주소 LIKE 위치;
--2-1번 문제
SELECT COUNT(*)
FROM 극장;
--2-2번 문제
SELECT AVG(가격)
FROM 상영관;
--2-3번 문제
SELECT COUNT(*)
FROM 예약
WHERE 날짜 = '20200901';
--3-1번 문제
SELECT 영화제목
FROM 상영관
WHERE 극장번호 = (SELECT 극장번호
                FROM 극장
                WHERE 극장이름 LIKE '대한');
--3-2번 문제
SELECT 이름
FROM 고객
WHERE 고객번호 IN (SELECT 고객번호
                FROM 예약
                WHERE 극장번호 IN (SELECT 극장번호
                                FROM 극장
                                WHERE 극장이름 LIKE '대한'));
--3-3번 문제
SELECT SUM(가격)
FROM 상영관
WHERE 극장번호 IN (SELECT 극장번호
                    FROM 극장
                    WHERE 극장이름 LIKE '대한');
--4-1번 문제
SELECT 극장번호, COUNT(상영관번호)
FROM 상영관
GROUP BY 극장번호;
--4-2번 문제
SELECT *
FROM 상영관
WHERE 극장번호 IN (SELECT 극장번호
                    FROM 극장
                    WHERE 위치 LIKE '잠실');
--4-3번 문제
SELECT 극장번호, COUNT(*)
FROM 예약
WHERE 날짜 = '20200901'
GROUP BY 극장번호;
--4-4번 문제
SELECT MAX(상영관.영화제목)
FROM 상영관, 예약
WHERE 날짜 = '20200901' AND 상영관.극장번호 = 예약.극장번호 AND 상영관.상영관번호 = 예약.상영관번호
GROUP BY 예약.극장번호, 예약.상영관번호;
--5-1번 문제
INSERT INTO 극장 VALUES(1, '롯데', '잠실');
--5-2번 문제
UPDATE 상영관
SET
가격 = 가격 * 1.1;
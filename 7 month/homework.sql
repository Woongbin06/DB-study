CREATE TABLE 학반이름
(
    학반 NUMBER PRIMARY KEY,
    학년 NUMBER,
    반 NUMBER,
    번호 NUMBER,
    이름 VARCHAR(20)
);
INSERT INTO 학반이름 VALUES (1101, 1, 1, 1, '강*석');
INSERT INTO 학반이름 VALUES (1102, 1, 1, 2, '김*민');
INSERT INTO 학반이름 VALUES (1103, 1, 1, 3, '김*찬');
INSERT INTO 학반이름 VALUES (1201, 1, 2, 1, '강*제');
INSERT INTO 학반이름 VALUES (1202, 1, 2, 2, '강*훈');
INSERT INTO 학반이름 VALUES (1203, 1, 2, 3, '권*빈');
INSERT INTO 학반이름 VALUES (1301, 1, 3, 1, '고*영');
INSERT INTO 학반이름 VALUES (1302, 1, 3, 2, '김*건');
INSERT INTO 학반이름 VALUES (1303, 1, 3, 3, '김*우');
INSERT INTO 학반이름 VALUES (1401, 1, 4, 1, '강*빈');
INSERT INTO 학반이름 VALUES (1402, 1, 4, 2, '구*하');
INSERT INTO 학반이름 VALUES (1403, 1, 4, 3, '권*원');
INSERT INTO 학반이름 VALUES (2101, 2, 1, 1, '김*서');
INSERT INTO 학반이름 VALUES (2102, 2, 1, 2, '김*울');
INSERT INTO 학반이름 VALUES (2103, 2, 1, 3, '박*은');
INSERT INTO 학반이름 VALUES (2201, 2, 2, 1, '권*서');
INSERT INTO 학반이름 VALUES (2202, 2, 2, 2, '김*민');
INSERT INTO 학반이름 VALUES (2203, 2, 2, 3, '김*현');
INSERT INTO 학반이름 VALUES (2301, 2, 3, 1, '권*욱');
INSERT INTO 학반이름 VALUES (2302, 2, 3, 2, '김*형');
INSERT INTO 학반이름 VALUES (2303, 2, 3, 3, '김*현');
INSERT INTO 학반이름 VALUES (2401, 2, 4, 1, '김*수');
INSERT INTO 학반이름 VALUES (2402, 2, 4, 2, '김*진');
INSERT INTO 학반이름 VALUES (2403, 2, 4, 3, '김*은');
DROP TABLE 학반이름;
CREATE TABLE 학과
(
    학과번호 NUMBER PRIMARY KEY,
    학반 NUMBER,
    이름 VARCHAR(20),
    성별 VARCHAR(5),
    학과 VARCHAR(40),
    FOREIGN KEY(학반) REFERENCES 학반이름(학반)
);
DROP TABLE 학과;
INSERT INTO 학과 VALUES (1, 1101, '강*석', '남', NULL);
INSERT INTO 학과 VALUES (2, 1102, '김*민', '남', NULL);
INSERT INTO 학과 VALUES (3, 1103, '김*찬', '남', NULL);
INSERT INTO 학과 VALUES (4, 1201, '강*제', '남', NULL);
INSERT INTO 학과 VALUES (5, 1202, '강*훈', '남', NULL);
INSERT INTO 학과 VALUES (6, 1203, '권*빈', '남', NULL);
INSERT INTO 학과 VALUES (7, 1301, '고*영', '여', NULL);
INSERT INTO 학과 VALUES (8, 1302, '김*건', '남', NULL);
INSERT INTO 학과 VALUES (9, 1303, '김*우', '남', NULL);
INSERT INTO 학과 VALUES (10, 1401, '강*빈', '남', NULL);
INSERT INTO 학과 VALUES (11, 1402, '구*하', '여', NULL);
INSERT INTO 학과 VALUES (12, 1403, '권*원', '남', NULL);
INSERT INTO 학과 VALUES (13, 2101, '김*서','남', '소프트웨어개발과');
INSERT INTO 학과 VALUES (14, 2102, '김*울','여','소프트웨어개발과');
INSERT INTO 학과 VALUES (15, 2103, '박*은','여','소프트웨어개발과');
INSERT INTO 학과 VALUES (16, 2201, '권*서','남','소프트웨어개발과');
INSERT INTO 학과 VALUES (17, 2202, '김*민','남','소프트웨어개발과');
INSERT INTO 학과 VALUES (18, 2203, '김*현','남','소프트웨어개발과');
INSERT INTO 학과 VALUES (19, 2301, '권*욱','남','임베디드소프트웨어과');
INSERT INTO 학과 VALUES (20, 2302, '김*형','남','임베디드소프트웨어과');
INSERT INTO 학과 VALUES (21, 2303, '김*현','남','임베디드소프트웨어과');
INSERT INTO 학과 VALUES (22, 2401, '김*수','남','임베디드소프트웨어과');
INSERT INTO 학과 VALUES (23, 2402, '김*진','여', '임베디드소프트웨어과');
INSERT INTO 학과 VALUES (24, 2403, '김*은','여', '임베디드소프트웨어과');
CREATE TABLE 담임
(
    담임번호 NUMBER PRIMARY KEY,
    학반 NUMBER,
    담임 VARCHAR(20),
    부담임 VARCHAR(20),
    FOREIGN KEY(학반) REFERENCES 학반이름(학반)
);
DROP TABLE 담임;
INSERT INTO 담임 VALUES(1, 1101, '구*영', '이*숙');
INSERT INTO 담임 VALUES(2, 1102, '구*영', '이*숙');
INSERT INTO 담임 VALUES(3, 1103, '구*영', '이*숙');
INSERT INTO 담임 VALUES(4, 1201, '조*겸', '진*빈');
INSERT INTO 담임 VALUES(5, 1202, '조*겸', '진*빈');
INSERT INTO 담임 VALUES(6, 1203, '조*겸', '진*빈');
INSERT INTO 담임 VALUES(7, 1301, '김*영', '김*정');
INSERT INTO 담임 VALUES(8, 1302, '김*영', '김*정');
INSERT INTO 담임 VALUES(9, 1303, '김*영', '김*정');
INSERT INTO 담임 VALUES(10, 1401, '유*찬', '김*필');
INSERT INTO 담임 VALUES(11, 1402, '유*찬', '김*필');
INSERT INTO 담임 VALUES(12, 1403, '유*찬', '김*필');
INSERT INTO 담임 VALUES(13, 2101, '차*민', '이*영');
INSERT INTO 담임 VALUES(14, 2102, '차*민', '이*영');
INSERT INTO 담임 VALUES(15, 2103, '차*민', '이*영');
INSERT INTO 담임 VALUES(16, 2201, '박*현', '최*준');
INSERT INTO 담임 VALUES(17, 2202, '박*현', '최*준');
INSERT INTO 담임 VALUES(18, 2203, '박*현', '최*준');
INSERT INTO 담임 VALUES(19, 2301, '김*태', '정*진');
INSERT INTO 담임 VALUES(20, 2302, '김*태', '정*진');
INSERT INTO 담임 VALUES(21, 2303, '김*태', '정*진');
INSERT INTO 담임 VALUES(22, 2401, '김*봉', '서*희');
INSERT INTO 담임 VALUES(23, 2402, '김*봉', '서*희');
INSERT INTO 담임 VALUES(24, 2403, '김*봉', '서*희');

SELECT 학반이름.학년, 학반이름.반, 학반이름.번호, 학반이름.이름, 학과.성별, 학과.학과, 담임.담임, 담임.부담임
FROM 담임, 학과, 학반이름
WHERE 학반이름.학반 = 담임.학반 AND 학과.학반 = 학반이름.학반;
--정규화
SELECT *
FROM 담임;
SELECT *
FROM 학과;
SELECT *
FROM 학반이름;
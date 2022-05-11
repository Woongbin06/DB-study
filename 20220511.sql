--테이블 삭제
DROP TABLE newbook;
DROP TABLE newcustomer;
DROP TABLE neworder;
--테이블 생성
CREATE TABLE newbook
(
    bookid NUMBER,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price NUMBER
);
SELECT * 
FROM newbook;
--ALTER 문
--ALTER 속성 추가 기본 형식 : ALTER TABLE 테이블 이름 ADD 속성이름 자료형;
--1번 문제 : newbook테이블에 varchar2(13)의 자료형을 가진 isbn 속성 추가
ALTER TABLE newbook ADD isbn VARCHAR2(13);

--ALTER 속성 변경 기본 형식 : ALTER TABLE 테이블 이름 MODIFY 속성이름 바꾸고자하는 타입;
--2번 문제 : newbook테이블의 isbn 속성의 자료형을 NUMBER형으로 변경하시오.
ALTER TABLE newbook MODIFY isbn NUMBER;

--ALTER 속성 삭제 기본 형식 : ALTER TABLE 테이블 이름 DROP COLUMN 속성이름;
--3번 문제 : newbook테이블의 isbn 속성을 삭제 하시오.
ALTER TABLE newbook DROP COLUMN isbn;

--4번 문제 : newbook테이블의 bookid속성에 NOT NULL제약조건을 적용하시오.
ALTER TABLE newbook MODIFY bookid NUMBER NOT NULL; --테이블 제약조건 창에서 확인 | bookid를 NOT NULL로 변경

--5번 문제 : newbook테이블의 bookid속성을 기본키로 변경하시오.
ALTER TABLE newbook ADD PRIMARY KEY(bookid); --PK로 변경

--INSERT 문 기본 형식 :
--INSERT INTO 테이블이름(삽입하고자 하는 속성명1, 속성명2, ... 전체 속성명이 다 필요하면 생략가능)
--    VALUES(값들 적기 (위에 적은 속성의 순서랑 같아야함))
--1번 문제 : book테이블에 새로운 도서 '스포츠 의학'을 삽입하시오.
--스포츠 의학은 한솔의학서적에서 출간했으며 가격은 90,00원이다.
SELECT * FROM book;
INSERT INTO book -- 모든 속성을 다 사용해서 생략
    VALUES(11, '스포츠 의학', '한솔의학서적', 90000);

--2번 문제 : book테이블에 새로운 도서 '스포츠 의학'을 삽입하시오.
--스포츠 의학은 한솔의학서적에서 출간했으며 가격은 미정이다.
INSERT INTO book(bookid, bookname, publisher) --테이블 순서를 지킬 필요 X, 단 VALUES의 순서와는 같아야 함.
    VALUES(12, '스포츠 의학', '한솔의학서적');

--3번 문제 : 수입도서 목록(imported_book)을 book테이블에 모두 삽입하시오.
SELECT * FROM imported_book;
INSERT INTO book(bookid, bookname, price, publisher) --SLECT로 INSERT INTO 하는 방법
    SELECT bookid, bookname, price, publisher --삽입하고자 하는 자료명과 SLECET의 자료명이 같아야한다.
    FROM imported_book;

--UPDATE 문 : 미리 삽입되어있는 데이터 값을 변경할 때 사용.
--UPDATE 문 기본 형식 :

--UPDATE 테이블이름
--SET 속성이름 = '속성값'
--WHERE 조건;

--1번 문제 : customer테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하시오.
SELECT * FROM customer;
UPDATE customer
SET address = '대한민국 부산'
WHERE custid = 5;

--2번 문제 : customer테이블에서 박세리 고객를 주소를 김연아 고객의 주소로 변경하시오.
UPDATE customer
SET address = (SELECT address --부속지리문
                FROM customer
                WHERE name LIKE '김연아')
WHERE name LIKE '박세리';

--DELETE 문 : 현재 삽입되어있는 데이터들을 삭제하고 싶을 때 사용.
--DELETE 문 기본 형식 :
--DELETE
--FROM 테이블이름
--WHERE 조건;

--1번 문제 : customer테이블에서 고객번호가 5인 고객을 삭제한 후 결과 확인
SELECT * FROM customer;
DELETE
FROM customer
WHERE custid = 5;
--2번 문제 : 모든 고객을 삭제하시오.
DELETE
FROM customer; --전체를 삭제할 때는 WHERE 생략.

--UPDATE, DELETE, INSERT는 데이터 베이스를 반영할 수 없음.
--최종적으로 반영할려면 COMMIT을 해야 함.
COMMIT;
--COMMIT을 하면 ROLLBACK으로 돌릴 수 없음.
--ROLLBACK : 마지막으로 COMMIT한 때로 돌리기
ROLLBACK;
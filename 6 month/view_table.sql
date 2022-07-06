--내장 함수
SELECT ABS(-15) -- 절댓값 출력
FROM dual;
SELECT CEIL(15.7) -- 소수점 올림
FROM dual;
SELECT POWER(3, 2) -- 3의 2제곱을 출력(제곱 수)
FROM dual;
SELECT ROUND(15.7) -- 반올림
FROM dual;
SELECT LPAD('Page 1', 15, '*') -- 뒤에서부터 15글자 but 마지막은 Page 1로 끝남
FROM dual;
SELECT LTRIM('Page 1', 'ae') -- 왼쪽에서부터 같은 문자열 삭제(처음부터 a 또는 e가 아니면 그대로 출력)
FROM dual;
SELECT REPLACE('JACK', 'J', 'BL') -- 해당 글자를 원하는 글자로 바꿈
FROM dual;
SELECT RPAD('Page 1', 15, '*') -- 앞에서부터 15글자에 맞게 출력
FROM dual;
SELECT RTRIM('Page 1', 'ae') -- 뒤에서부터 같은 문자열 삭제
FROM dual;
SELECT SUBSTR('ABCDEF', 3, 4) -- 3번째 글자부터 4글자까지 출력
FROM dual;
SELECT ASCII('A') -- 아스키 코드로 변환
FROM dual;
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) -- 3번째 글자부터 2번째로 나오는 OR자리 출력
FROM dual;
SELECT SYSDATE -- 현재 날짜를 출력
FROM dual;
SELECT NULLIF(123, 345) -- 두 문자가 같은지 비교 후 같으면 NULL 아니면 첫 번째 문자 출력
FROM dual;
SELECT NVL(NULL, 123) -- 앞에 문자가 NULL이면 뒤에 문자 출력 아니면 앞에 문자 출력
FROM dual;

-- 뷰(view) 테이블
-- what is view table? 보기 전용 테이블(가상의 테이블)
-- 특징 : 1. 수정불가(마치 기존테이블이 한글파일이라면 뷰테이블은 PDF)
--       2. 내가 보여주고 싶은 정보만 따로 추출해서 보여줄 수 있다. (보안성 우수)
-- 형식 : CREATE VIEW 뷰이름 (내가 보여주고 싶은 열이름)
--       AS SELECT문 삽입

-- 문제 1. book테이블에서 '축구'라는 문구가 포함된 자료만 보여 주는 뷰를 만들자.
CREATE VIEW sc_book
AS SELECT *
   FROM book
   WHERE bookname LIKE '%축구%';

SELECT *
FROM sc_book;
-- 문제 2. 주소에 '대한민국'을 포함한 고객들로 구성된 뷰를 만들고 조회하시오.
CREATE VIEW korea_add
AS SELECT *
   FROM customer
   WHERE address LIKE '%대한민국%';
   
SELECT *
FROM korea_add;

INSERT INTO customer values(6, '이이경', '대한민국 부산', null);
-- 문제 3. 이름의 가운데 글자를 *로 만든 뷰 테이블 만드시오.
SELECT *
FROM customer;

DROP VIEW vw_customer;

CREATE VIEW vw_customer
AS SELECT custid, CONCAT(CONCAT(SUBSTR(name, 1, 1), '*'), SUBSTR(name, 3, 3)) as name, address, phone
   FROM customer;
   
SELECT *
FROM vw_customer;
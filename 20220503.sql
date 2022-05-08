-- CREATE 문--
CREATE TABLE NewBook
(
    bookid NUMBER PRIMARY KEY,
    bookname VARCHAR2(20) NOT NULL,
    publisher VARCHAR2(20) UNIQUE,
    price NUMBER DEFAULT 10000 CHECK (price > 1000)
);

CREATE TABLE NewOrder
(
    orderid NUMBER,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    PRIMARY KEY (orderid),
    FOREIGN KEY (custid) REFERENCES NewCustomer(custid)
);

-- ON DELETE CASCADE : 참조하고 있는 테이블의 기본키가 사라지면 참조하는 외래키 값도 같이 사라짐.
-- ON DELETE SET NULL : 참조하고 있는 테이블의 기본키가 사라지면 참조하는 외래키 값은 NULL이 삽입함.
-- ON DELETE RESTRICT : 삭제 자체를 거절함.

CREATE TABLE NewCustomer
(
    custid NUMBER PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(40),
    phone VARCHAR2(30)
);

DROP TABLE NewBook;
DROP TABLE NewCustomer;
DROP TABLE NewOrder;

-- NOT NULL 제약조건 : 데이터를 삽입할 때 해당 속성값에 NULL이 들어 가면 안됨.
-- UNIQUE 제약조건 : 해당 속성값에 동일한 두개 이상의 값이 들어가면 안됨.
-- DEFAULT 제약조건 : 만약 사용자가 그 속성값에 NULL을 삽입하려고 하면 DEFAULT 다음으로 넣은 값을 자동으로 삽입.
-- CHECK 제약조건 : 속성값의 도메인을 지정(속성값의 범위를 지정.)

ALTER TABLE NewBook
RENAME CONSTRAINT SYS_C008441 TO NewBook_PK;

-- CHAR(N), VARCHAR(N), VARCHAR2(N) : 글자 하나당 1BYTE씩 사용
-- CHAR(40) : 무조건 메모리에 40BYTE 할당. (고정형)
-- VARCHAR(40) | VARCHAR2(40) : 40BYTE를 만들지만 한글자만 가변형으로 메모리 공간 할당 가능. (가변형)
-- VARCHAR2 : VARCHAR의 상위호환 버전.
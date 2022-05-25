--테이블 생성
CREATE TABLE Salesperson
(
    name VARCHAR2(40), 
    age NUMBER,
    salary NUMBER,
    PRIMARY KEY(name)
);
CREATE TABLE Orders1
(
    numbers NUMBER,
    custname VARCHAR2(40),
    salesperson VARCHAR2(40),
    amount NUMBER,
    PRIMARY KEY(custname, salesperson),
    FOREIGN KEY(custname) REFERENCES Customers(name),
    FOREIGN KEY(salesperson) REFERENCES Salesperson(name)
);
CREATE TABLE Customers
(
    name VARCHAR2(40),
    city VARCHAR2(40),
    industrytype VARCHAR2(40),
    PRIMARY KEY(name)
);
--삽입
INSERT INTO Salesperson VALUES('일식', 1, 10);
INSERT INTO Salesperson VALUES('이식', 9, 5);
INSERT INTO Salesperson VALUES('삼식', 35, 25);
INSERT INTO Salesperson VALUES('사식', 17, 10);
INSERT INTO Salesperson VALUES('오식', 25, 15);

INSERT INTO Customers VALUES('육식', 'LA', '학생'); 
INSERT INTO Customers VALUES('칠식', 'UAS', '학생');
INSERT INTO Customers VALUES('팔식', '부산', '학생');
INSERT INTO Customers VALUES('TOM', '서울', '학생');
INSERT INTO Customers VALUES('십식', 'UAS', '학생');

INSERT INTO Orders1 VALUES(1, '육식', '이식', 2);
INSERT INTO Orders1 VALUES(2, '팔식', '일식', 5);
INSERT INTO Orders1 VALUES(3, '칠식', '이식', 3);
INSERT INTO Orders1 VALUES(4, 'TOM', '삼식', 4);
INSERT INTO Orders1 VALUES(5, '십식', '오식', 1);
INSERT INTO Orders1 VALUES(6, '육식', '사식', 4);
INSERT INTO Orders1 VALUES(7, '팔식', '삼식', 2);
INSERT INTO Orders1 VALUES(8, 'TOM', '이식', 3);

--문제 2번
SELECT name, salary
FROM Salesperson;
--문제 3번
SELECT name
FROM salesperson
WHERE age < 30;
--문제 4번
SELECT name
FROM customers
WHERE city LIKE '%S';
--문제 5번
SELECT custname, COUNT(*)
FROM orders1
GROUP BY custname;
--문제 6번
SELECT salesperson, COUNT(amount)
FROM orders1
GROUP BY salesperson;
--문제 7번
SELECT name, age
FROM salesperson
WHERE name IN (SELECT salesperson
                 FROM orders1
                 WHERE custname IN (SELECT name
                                    FROM customers
                                    WHERE city LIKE 'LA'));
--문제 8번
SELECT s.name, s.age
FROM salesperson s, orders1 o, customers c
WHERE s.name LIKE o.salesperson AND o.custname LIKE c.name AND c.city LIKE 'LA';
--문제 9번
SELECT salesperson
FROM orders1
GROUP BY salesperson
HAVING COUNT(*) >= 2;
--문제 10번
UPDATE salesperson
SET salary = 45000
WHERE name LIKE 'TOM';
commit;
--���̺� ����
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
--����
INSERT INTO Salesperson VALUES('�Ͻ�', 1, 10);
INSERT INTO Salesperson VALUES('�̽�', 9, 5);
INSERT INTO Salesperson VALUES('���', 35, 25);
INSERT INTO Salesperson VALUES('���', 17, 10);
INSERT INTO Salesperson VALUES('����', 25, 15);

INSERT INTO Customers VALUES('����', 'LA', '�л�'); 
INSERT INTO Customers VALUES('ĥ��', 'UAS', '�л�');
INSERT INTO Customers VALUES('�Ƚ�', '�λ�', '�л�');
INSERT INTO Customers VALUES('TOM', '����', '�л�');
INSERT INTO Customers VALUES('�ʽ�', 'UAS', '�л�');

INSERT INTO Orders1 VALUES(1, '����', '�̽�', 2);
INSERT INTO Orders1 VALUES(2, '�Ƚ�', '�Ͻ�', 5);
INSERT INTO Orders1 VALUES(3, 'ĥ��', '�̽�', 3);
INSERT INTO Orders1 VALUES(4, 'TOM', '���', 4);
INSERT INTO Orders1 VALUES(5, '�ʽ�', '����', 1);
INSERT INTO Orders1 VALUES(6, '����', '���', 4);
INSERT INTO Orders1 VALUES(7, '�Ƚ�', '���', 2);
INSERT INTO Orders1 VALUES(8, 'TOM', '�̽�', 3);

--���� 2��
SELECT name, salary
FROM Salesperson;
--���� 3��
SELECT name
FROM salesperson
WHERE age < 30;
--���� 4��
SELECT name
FROM customers
WHERE city LIKE '%S';
--���� 5��
SELECT custname, COUNT(*)
FROM orders1
GROUP BY custname;
--���� 6��
SELECT salesperson, COUNT(amount)
FROM orders1
GROUP BY salesperson;
--���� 7��
SELECT name, age
FROM salesperson
WHERE name IN (SELECT salesperson
                 FROM orders1
                 WHERE custname IN (SELECT name
                                    FROM customers
                                    WHERE city LIKE 'LA'));
--���� 8��
SELECT s.name, s.age
FROM salesperson s, orders1 o, customers c
WHERE s.name LIKE o.salesperson AND o.custname LIKE c.name AND c.city LIKE 'LA';
--���� 9��
SELECT salesperson
FROM orders1
GROUP BY salesperson
HAVING COUNT(*) >= 2;
--���� 10��
UPDATE salesperson
SET salary = 45000
WHERE name LIKE 'TOM';
commit;
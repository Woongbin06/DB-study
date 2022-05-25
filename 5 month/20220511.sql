--���̺� ����
DROP TABLE newbook;
DROP TABLE newcustomer;
DROP TABLE neworder;
--���̺� ����
CREATE TABLE newbook
(
    bookid NUMBER,
    bookname VARCHAR2(20),
    publisher VARCHAR2(20),
    price NUMBER
);
SELECT * 
FROM newbook;
--ALTER ��
--ALTER �Ӽ� �߰� �⺻ ���� : ALTER TABLE ���̺� �̸� ADD �Ӽ��̸� �ڷ���;
--1�� ���� : newbook���̺� varchar2(13)�� �ڷ����� ���� isbn �Ӽ� �߰�
ALTER TABLE newbook ADD isbn VARCHAR2(13);

--ALTER �Ӽ� ���� �⺻ ���� : ALTER TABLE ���̺� �̸� MODIFY �Ӽ��̸� �ٲٰ����ϴ� Ÿ��;
--2�� ���� : newbook���̺��� isbn �Ӽ��� �ڷ����� NUMBER������ �����Ͻÿ�.
ALTER TABLE newbook MODIFY isbn NUMBER;

--ALTER �Ӽ� ���� �⺻ ���� : ALTER TABLE ���̺� �̸� DROP COLUMN �Ӽ��̸�;
--3�� ���� : newbook���̺��� isbn �Ӽ��� ���� �Ͻÿ�.
ALTER TABLE newbook DROP COLUMN isbn;

--4�� ���� : newbook���̺��� bookid�Ӽ��� NOT NULL���������� �����Ͻÿ�.
ALTER TABLE newbook MODIFY bookid NUMBER NOT NULL; --���̺� �������� â���� Ȯ�� | bookid�� NOT NULL�� ����

--5�� ���� : newbook���̺��� bookid�Ӽ��� �⺻Ű�� �����Ͻÿ�.
ALTER TABLE newbook ADD PRIMARY KEY(bookid); --PK�� ����

--INSERT �� �⺻ ���� :
--INSERT INTO ���̺��̸�(�����ϰ��� �ϴ� �Ӽ���1, �Ӽ���2, ... ��ü �Ӽ����� �� �ʿ��ϸ� ��������)
--    VALUES(���� ���� (���� ���� �Ӽ��� ������ ���ƾ���))
--1�� ���� : book���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�.
--������ ������ �Ѽ����м������� �Ⱓ������ ������ 90,00���̴�.
SELECT * FROM book;
INSERT INTO book -- ��� �Ӽ��� �� ����ؼ� ����
    VALUES(11, '������ ����', '�Ѽ����м���', 90000);

--2�� ���� : book���̺� ���ο� ���� '������ ����'�� �����Ͻÿ�.
--������ ������ �Ѽ����м������� �Ⱓ������ ������ �����̴�.
INSERT INTO book(bookid, bookname, publisher) --���̺� ������ ��ų �ʿ� X, �� VALUES�� �����ʹ� ���ƾ� ��.
    VALUES(12, '������ ����', '�Ѽ����м���');

--3�� ���� : ���Ե��� ���(imported_book)�� book���̺� ��� �����Ͻÿ�.
SELECT * FROM imported_book;
INSERT INTO book(bookid, bookname, price, publisher) --SLECT�� INSERT INTO �ϴ� ���
    SELECT bookid, bookname, price, publisher --�����ϰ��� �ϴ� �ڷ��� SLECET�� �ڷ���� ���ƾ��Ѵ�.
    FROM imported_book;

--UPDATE �� : �̸� ���ԵǾ��ִ� ������ ���� ������ �� ���.
--UPDATE �� �⺻ ���� :

--UPDATE ���̺��̸�
--SET �Ӽ��̸� = '�Ӽ���'
--WHERE ����;

--1�� ���� : customer���̺��� ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� �����Ͻÿ�.
SELECT * FROM customer;
UPDATE customer
SET address = '���ѹα� �λ�'
WHERE custid = 5;

--2�� ���� : customer���̺��� �ڼ��� ���� �ּҸ� �迬�� ���� �ּҷ� �����Ͻÿ�.
UPDATE customer
SET address = (SELECT address --�μ�������
                FROM customer
                WHERE name LIKE '�迬��')
WHERE name LIKE '�ڼ���';

--DELETE �� : ���� ���ԵǾ��ִ� �����͵��� �����ϰ� ���� �� ���.
--DELETE �� �⺻ ���� :
--DELETE
--FROM ���̺��̸�
--WHERE ����;

--1�� ���� : customer���̺��� ����ȣ�� 5�� ���� ������ �� ��� Ȯ��
SELECT * FROM customer;
DELETE
FROM customer
WHERE custid = 5;
--2�� ���� : ��� ���� �����Ͻÿ�.
DELETE
FROM customer; --��ü�� ������ ���� WHERE ����.

--UPDATE, DELETE, INSERT�� ������ ���̽��� �ݿ��� �� ����.
--���������� �ݿ��ҷ��� COMMIT�� �ؾ� ��.
COMMIT;
--COMMIT�� �ϸ� ROLLBACK���� ���� �� ����.
--ROLLBACK : ���������� COMMIT�� ���� ������
ROLLBACK;
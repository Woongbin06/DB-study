--���� �Լ�
SELECT ABS(-15) -- ���� ���
FROM dual;
SELECT CEIL(15.7) -- �Ҽ��� �ø�
FROM dual;
SELECT POWER(3, 2) -- 3�� 2������ ���(���� ��)
FROM dual;
SELECT ROUND(15.7) -- �ݿø�
FROM dual;
SELECT LPAD('Page 1', 15, '*') -- �ڿ������� 15���� but �������� Page 1�� ����
FROM dual;
SELECT LTRIM('Page 1', 'ae') -- ���ʿ������� ���� ���ڿ� ����(ó������ a �Ǵ� e�� �ƴϸ� �״�� ���)
FROM dual;
SELECT REPLACE('JACK', 'J', 'BL') -- �ش� ���ڸ� ���ϴ� ���ڷ� �ٲ�
FROM dual;
SELECT RPAD('Page 1', 15, '*') -- �տ������� 15���ڿ� �°� ���
FROM dual;
SELECT RTRIM('Page 1', 'ae') -- �ڿ������� ���� ���ڿ� ����
FROM dual;
SELECT SUBSTR('ABCDEF', 3, 4) -- 3��° ���ں��� 4���ڱ��� ���
FROM dual;
SELECT ASCII('A') -- �ƽ�Ű �ڵ�� ��ȯ
FROM dual;
SELECT INSTR('CORPORATE FLOOR', 'OR', 3, 2) -- 3��° ���ں��� 2��°�� ������ OR�ڸ� ���
FROM dual;
SELECT SYSDATE -- ���� ��¥�� ���
FROM dual;
SELECT NULLIF(123, 345) -- �� ���ڰ� ������ �� �� ������ NULL �ƴϸ� ù ��° ���� ���
FROM dual;
SELECT NVL(NULL, 123) -- �տ� ���ڰ� NULL�̸� �ڿ� ���� ��� �ƴϸ� �տ� ���� ���
FROM dual;

-- ��(view) ���̺�
-- what is view table? ���� ���� ���̺�(������ ���̺�)
-- Ư¡ : 1. �����Ұ�(��ġ �������̺��� �ѱ������̶�� �����̺��� PDF)
--       2. ���� �����ְ� ���� ������ ���� �����ؼ� ������ �� �ִ�. (���ȼ� ���)
-- ���� : CREATE VIEW ���̸� (���� �����ְ� ���� ���̸�)
--       AS SELECT�� ����

-- ���� 1. book���̺��� '�౸'��� ������ ���Ե� �ڷḸ ���� �ִ� �並 ������.
CREATE VIEW sc_book
AS SELECT *
   FROM book
   WHERE bookname LIKE '%�౸%';

SELECT *
FROM sc_book;
-- ���� 2. �ּҿ� '���ѹα�'�� ������ ����� ������ �並 ����� ��ȸ�Ͻÿ�.
CREATE VIEW korea_add
AS SELECT *
   FROM customer
   WHERE address LIKE '%���ѹα�%';
   
SELECT *
FROM korea_add;

INSERT INTO customer values(6, '���̰�', '���ѹα� �λ�', null);
-- ���� 3. �̸��� ��� ���ڸ� *�� ���� �� ���̺� ����ÿ�.
SELECT *
FROM customer;

DROP VIEW vw_customer;

CREATE VIEW vw_customer
AS SELECT custid, CONCAT(CONCAT(SUBSTR(name, 1, 1), '*'), SUBSTR(name, 3, 3)) as name, address, phone
   FROM customer;
   
SELECT *
FROM vw_customer;
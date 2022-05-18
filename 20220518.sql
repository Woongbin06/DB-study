CREATE TABLE ���� --���̺� ���� �ѱ� ����
(
    �����ȣ NUMBER,
    �����̸� VARCHAR2(40),
    ��ġ VARCHAR2(40),
    PRIMARY KEY(�����ȣ)
);

CREATE TABLE �󿵰�
(
    �����ȣ NUMBER,
    �󿵰���ȣ NUMBER CHECK(�󿵰���ȣ BETWEEN 1 AND 10),
    ��ȭ���� VARCHAR2(40),
    ���� NUMBER CHECK(���� <= 20000),
    �¼��� NUMBER,
    PRIMARY KEY(�����ȣ, �󿵰���ȣ),
    FOREIGN KEY(�����ȣ) REFERENCES ����(�����ȣ)
);

CREATE TABLE ����
(
    �����ȣ NUMBER,
    �󿵰���ȣ NUMBER CHECK(�󿵰���ȣ BETWEEN 1 AND 10),
    ����ȣ NUMBER,
    �¼���ȣ NUMBER,
    ��¥ DATE,
    PRIMARY KEY(�����ȣ, �󿵰���ȣ, ����ȣ),
    FOREIGN KEY(�����ȣ) REFERENCES ����(�����ȣ),
    FOREIGN KEY(�����ȣ, �󿵰���ȣ) REFERENCES �󿵰�(�����ȣ, �󿵰���ȣ),
    FOREIGN KEY(����ȣ) REFERENCES ��(����ȣ)
    --UNIQUE(�����ȣ, �󿵰���ȣ, ����ȣ, �¼���ȣ)
);
DROP TABLE ����;
DROP TABLE �󿵰�;
DROP TABLE ��;
DROP TABLE ����;

CREATE TABLE ��
(
    ����ȣ NUMBER,
    �̸� VARCHAR(40),
    �ּ� VARCHAR(40),
    PRIMARY KEY(����ȣ)
);

INSERT INTO ���� VALUES(1, '�Ե�', '���');
INSERT INTO ���� VALUES(2, '�ް�', '����');
INSERT INTO ���� VALUES(3, '����', '���');
INSERT INTO �󿵰� VALUES(1, 1, '����� ��ȭ', 15000, 48);
INSERT INTO �󿵰� VALUES(3, 1, '���� ��ȭ', 7500, 120);
INSERT INTO �󿵰� VALUES(3, 2, '��մ� ��ȭ', 8000, 110);
INSERT INTO ���� VALUES(3, 2, 3, 15, '20200901'); --DATE �ڷ����� ''���
INSERT INTO ���� VALUES(3, 1, 4, 16, '20200901');
INSERT INTO ���� VALUES(1, 1, 9, 48, '20200901');
INSERT INTO �� VALUES(3, 'ȫ�浿', '����');
INSERT INTO �� VALUES(4, '��ö��', '���');
INSERT INTO �� VALUES(9, '�ڿ���', '����');

--1-1�� ����
SELECT �����̸�, ��ġ
FROM ����;
--1-2�� ����
SELECT �����̸�
FROM ����
WHERE ��ġ LIKE '���';
--1-3�� ����
SELECT �̸�
FROM ��
WHERE �ּ� LIKE '���'
ORDER BY �̸� ASC;
--1-4�� ����
SELECT �����ȣ, �󿵰���ȣ, ��ȭ����
FROM �󿵰�
WHERE ���� <= 8000;
--1-5�� ����
SELECT *
FROM ��, ����
WHERE �ּ� LIKE ��ġ;
--2-1�� ����
SELECT COUNT(*)
FROM ����;
--2-2�� ����
SELECT AVG(����)
FROM �󿵰�;
--2-3�� ����
SELECT COUNT(*)
FROM ����
WHERE ��¥ = '20200901';
--3-1�� ����
SELECT ��ȭ����
FROM �󿵰�
WHERE �����ȣ = (SELECT �����ȣ
                FROM ����
                WHERE �����̸� LIKE '����');
--3-2�� ����
SELECT �̸�
FROM ��
WHERE ����ȣ IN (SELECT ����ȣ
                FROM ����
                WHERE �����ȣ IN (SELECT �����ȣ
                                FROM ����
                                WHERE �����̸� LIKE '����'));
--3-3�� ����
SELECT SUM(����)
FROM �󿵰�
WHERE �����ȣ IN (SELECT �����ȣ
                    FROM ����
                    WHERE �����̸� LIKE '����');
--4-1�� ����
SELECT �����ȣ, COUNT(�󿵰���ȣ)
FROM �󿵰�
GROUP BY �����ȣ;
--4-2�� ����
SELECT *
FROM �󿵰�
WHERE �����ȣ IN (SELECT �����ȣ
                    FROM ����
                    WHERE ��ġ LIKE '���');
--4-3�� ����
SELECT �����ȣ, COUNT(*)
FROM ����
WHERE ��¥ = '20200901'
GROUP BY �����ȣ;
--4-4�� ����
SELECT MAX(�󿵰�.��ȭ����)
FROM �󿵰�, ����
WHERE ��¥ = '20200901' AND �󿵰�.�����ȣ = ����.�����ȣ AND �󿵰�.�󿵰���ȣ = ����.�󿵰���ȣ
GROUP BY ����.�����ȣ, ����.�󿵰���ȣ;
--5-1�� ����
INSERT INTO ���� VALUES(1, '�Ե�', '���');
--5-2�� ����
UPDATE �󿵰�
SET
���� = ���� * 1.1;
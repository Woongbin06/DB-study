CREATE TABLE �й��̸�
(
    �й� NUMBER PRIMARY KEY,
    �г� NUMBER,
    �� NUMBER,
    ��ȣ NUMBER,
    �̸� VARCHAR(20)
);
INSERT INTO �й��̸� VALUES (1101, 1, 1, 1, '��*��');
INSERT INTO �й��̸� VALUES (1102, 1, 1, 2, '��*��');
INSERT INTO �й��̸� VALUES (1103, 1, 1, 3, '��*��');
INSERT INTO �й��̸� VALUES (1201, 1, 2, 1, '��*��');
INSERT INTO �й��̸� VALUES (1202, 1, 2, 2, '��*��');
INSERT INTO �й��̸� VALUES (1203, 1, 2, 3, '��*��');
INSERT INTO �й��̸� VALUES (1301, 1, 3, 1, '��*��');
INSERT INTO �й��̸� VALUES (1302, 1, 3, 2, '��*��');
INSERT INTO �й��̸� VALUES (1303, 1, 3, 3, '��*��');
INSERT INTO �й��̸� VALUES (1401, 1, 4, 1, '��*��');
INSERT INTO �й��̸� VALUES (1402, 1, 4, 2, '��*��');
INSERT INTO �й��̸� VALUES (1403, 1, 4, 3, '��*��');
INSERT INTO �й��̸� VALUES (2101, 2, 1, 1, '��*��');
INSERT INTO �й��̸� VALUES (2102, 2, 1, 2, '��*��');
INSERT INTO �й��̸� VALUES (2103, 2, 1, 3, '��*��');
INSERT INTO �й��̸� VALUES (2201, 2, 2, 1, '��*��');
INSERT INTO �й��̸� VALUES (2202, 2, 2, 2, '��*��');
INSERT INTO �й��̸� VALUES (2203, 2, 2, 3, '��*��');
INSERT INTO �й��̸� VALUES (2301, 2, 3, 1, '��*��');
INSERT INTO �й��̸� VALUES (2302, 2, 3, 2, '��*��');
INSERT INTO �й��̸� VALUES (2303, 2, 3, 3, '��*��');
INSERT INTO �й��̸� VALUES (2401, 2, 4, 1, '��*��');
INSERT INTO �й��̸� VALUES (2402, 2, 4, 2, '��*��');
INSERT INTO �й��̸� VALUES (2403, 2, 4, 3, '��*��');
DROP TABLE �й��̸�;
CREATE TABLE �а�
(
    �а���ȣ NUMBER PRIMARY KEY,
    �й� NUMBER,
    �̸� VARCHAR(20),
    ���� VARCHAR(5),
    �а� VARCHAR(40),
    FOREIGN KEY(�й�) REFERENCES �й��̸�(�й�)
);
DROP TABLE �а�;
INSERT INTO �а� VALUES (1, 1101, '��*��', '��', NULL);
INSERT INTO �а� VALUES (2, 1102, '��*��', '��', NULL);
INSERT INTO �а� VALUES (3, 1103, '��*��', '��', NULL);
INSERT INTO �а� VALUES (4, 1201, '��*��', '��', NULL);
INSERT INTO �а� VALUES (5, 1202, '��*��', '��', NULL);
INSERT INTO �а� VALUES (6, 1203, '��*��', '��', NULL);
INSERT INTO �а� VALUES (7, 1301, '��*��', '��', NULL);
INSERT INTO �а� VALUES (8, 1302, '��*��', '��', NULL);
INSERT INTO �а� VALUES (9, 1303, '��*��', '��', NULL);
INSERT INTO �а� VALUES (10, 1401, '��*��', '��', NULL);
INSERT INTO �а� VALUES (11, 1402, '��*��', '��', NULL);
INSERT INTO �а� VALUES (12, 1403, '��*��', '��', NULL);
INSERT INTO �а� VALUES (13, 2101, '��*��','��', '����Ʈ����߰�');
INSERT INTO �а� VALUES (14, 2102, '��*��','��','����Ʈ����߰�');
INSERT INTO �а� VALUES (15, 2103, '��*��','��','����Ʈ����߰�');
INSERT INTO �а� VALUES (16, 2201, '��*��','��','����Ʈ����߰�');
INSERT INTO �а� VALUES (17, 2202, '��*��','��','����Ʈ����߰�');
INSERT INTO �а� VALUES (18, 2203, '��*��','��','����Ʈ����߰�');
INSERT INTO �а� VALUES (19, 2301, '��*��','��','�Ӻ�������Ʈ�����');
INSERT INTO �а� VALUES (20, 2302, '��*��','��','�Ӻ�������Ʈ�����');
INSERT INTO �а� VALUES (21, 2303, '��*��','��','�Ӻ�������Ʈ�����');
INSERT INTO �а� VALUES (22, 2401, '��*��','��','�Ӻ�������Ʈ�����');
INSERT INTO �а� VALUES (23, 2402, '��*��','��', '�Ӻ�������Ʈ�����');
INSERT INTO �а� VALUES (24, 2403, '��*��','��', '�Ӻ�������Ʈ�����');
CREATE TABLE ����
(
    ���ӹ�ȣ NUMBER PRIMARY KEY,
    �й� NUMBER,
    ���� VARCHAR(20),
    �δ��� VARCHAR(20),
    FOREIGN KEY(�й�) REFERENCES �й��̸�(�й�)
);
DROP TABLE ����;
INSERT INTO ���� VALUES(1, 1101, '��*��', '��*��');
INSERT INTO ���� VALUES(2, 1102, '��*��', '��*��');
INSERT INTO ���� VALUES(3, 1103, '��*��', '��*��');
INSERT INTO ���� VALUES(4, 1201, '��*��', '��*��');
INSERT INTO ���� VALUES(5, 1202, '��*��', '��*��');
INSERT INTO ���� VALUES(6, 1203, '��*��', '��*��');
INSERT INTO ���� VALUES(7, 1301, '��*��', '��*��');
INSERT INTO ���� VALUES(8, 1302, '��*��', '��*��');
INSERT INTO ���� VALUES(9, 1303, '��*��', '��*��');
INSERT INTO ���� VALUES(10, 1401, '��*��', '��*��');
INSERT INTO ���� VALUES(11, 1402, '��*��', '��*��');
INSERT INTO ���� VALUES(12, 1403, '��*��', '��*��');
INSERT INTO ���� VALUES(13, 2101, '��*��', '��*��');
INSERT INTO ���� VALUES(14, 2102, '��*��', '��*��');
INSERT INTO ���� VALUES(15, 2103, '��*��', '��*��');
INSERT INTO ���� VALUES(16, 2201, '��*��', '��*��');
INSERT INTO ���� VALUES(17, 2202, '��*��', '��*��');
INSERT INTO ���� VALUES(18, 2203, '��*��', '��*��');
INSERT INTO ���� VALUES(19, 2301, '��*��', '��*��');
INSERT INTO ���� VALUES(20, 2302, '��*��', '��*��');
INSERT INTO ���� VALUES(21, 2303, '��*��', '��*��');
INSERT INTO ���� VALUES(22, 2401, '��*��', '��*��');
INSERT INTO ���� VALUES(23, 2402, '��*��', '��*��');
INSERT INTO ���� VALUES(24, 2403, '��*��', '��*��');

SELECT �й��̸�.�г�, �й��̸�.��, �й��̸�.��ȣ, �й��̸�.�̸�, �а�.����, �а�.�а�, ����.����, ����.�δ���
FROM ����, �а�, �й��̸�
WHERE �й��̸�.�й� = ����.�й� AND �а�.�й� = �й��̸�.�й�;
--����ȭ
SELECT *
FROM ����;
SELECT *
FROM �а�;
SELECT *
FROM �й��̸�;
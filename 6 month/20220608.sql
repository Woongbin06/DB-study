--1�� ����
CREATE TABLE MyUser
(
    USER_SEQ NUMBER PRIMARY KEY,
    ID VARCHAR2(20),
    USER_NAME VARCHAR2(20),
    DATETIME DATE
);
INSERT INTO MyUser VALUES(1, 'lee1545', '�̼���', '2022/05/04');
INSERT INTO MyUser VALUES(2, 'lee1502', '��Ȳ', '2022/05/01');
INSERT INTO MyUser VALUES(3, 'lee1536', '����', '2022/05/02');
INSERT INTO MyUser VALUES(4, 'lee1597', '�������', '2022/05/03');
INSERT INTO MyUser VALUES(5, 'shin1504', '�Ż��Ӵ�', '2022/05/05');
--2�� ����
CREATE TABLE Category
(
    CATEGORY_SEQ NUMBER PRIMARY KEY,
    NAME VARCHAR2(20)
);
INSERT INTO Category VALUES(1, '����');
INSERT INTO Category VALUES(2, '����');
INSERT INTO Category VALUES(3, '��ȭ����');
--3�� ����
CREATE TABLE POST
(
    POST_SEQ NUMBER PRIMARY KEY,
    CATEGORY_SEQ NUMBER,
    USER_SEQ NUMBER,
    TITLE VARCHAR2(40),
    CONTENT VARCHAR2(4000),
    DATETIME DATE,
    FOREIGN KEY(CATEGORY_SEQ) REFERENCES Category(CATEGORY_SEQ),
    FOREIGN KEY(USER_SEQ) REFERENCES MyUser(USER_SEQ)
);
INSERT INTO POST VALUES(1, 1, 1, '������ ����', '�⺻�� ���翡�� ������������ ������ ��ġ�� ���(�ɼ� Ŭ�ο�)�� �������� ����ġ�� ��ġ�� 2���� �Ͽ� ��ȸ�� ������ ������ �����ϴ� ����̴�. �ѴϹ� �ٸ�ī�� ĭ���� �������� ����� �⵿ �⸶�� 2�δ븦 �̿��ϰ� �ڽ��� �������� ������� ���� ����Ͽ� �¸��� �ŵ״� �����̴�. �����ε��� �̸� ���� ���������� �θ����� ���� ������ �⺻�� ���񱺴� 2���� �߰��� ����Ͽ� �������� �ϼ���Ų ���´�. ��, �̰��� �������� ����� �⸶���� �⵿���� �̿��� ������ �����̶� ���̴�.', '1592/08/14');
INSERT INTO POST VALUES(2, 3, 4, '�ƹ�����', '�ƹ�����(��������)�� �鼺�� ����ġ�� �ٸ� �Ҹ���� ���̴�. �ƹ������̶�� �θ��� ����� �� ������ �ִµ�, �� �ϳ��� 1443�� ���� 12��(��� 1444�� 1��)�� ��������� ���� �ѱ����� ǥ�� ü��, �� ���ó��� �ѱ��� â�� ��ÿ� �θ� �̸��̰�, �� �ϳ��� 1446�� 9��[1]�� �߰��� å �̸��̴�. ���⼭�� ����, �� �ƹ������̶�� å�� �����Ѵ�.', '1583/01/01');
INSERT INTO POST VALUES(3, 1, 5, '�Ż��Ӵ翡 ����', '�Ż��Ӵ� [��������, 1504~1551] ������ ���(��ߣ)�̰�, ȣ�� ���Ӵ�(������:������:������)�����Ӵ�(�����)���ӻ���(�����)�̴�. ������ ����(˰��) ����̸�, ���� ����(���)�� ��Ӵ��̴�. ȿ���� �����ϰ� ������ �������� ��������� �湮(����)�� ������ ���塤ħ��(����)���ڼ�(��)�� ��������, Ư�� �ù�(����)�� �׸��� �پ ���� ���� �ѽ�(����) ��ǰ�� ��������. ���� �Ȱ�(��̱)�� ������ ���� ȭǳ(����)�� ���� Ư���� ���� �������� ���Ͽ� �ѱ� ������ ����ȭ����� ���� ��´�. ���(ߣ�)��������Ǯ������ ���� �� �׷ȴ�. �ڳ౳������ ���ٸ� ����� ��￩ �����ó(��ٽ����)�� �Ͱ�(Т��)�� �Ǿ���. ������ ��Ӵ��̴�.', '1504/10/29');
INSERT INTO POST VALUES(4, 2, 3, '�ʸ��纴��', '���̴� �������� 10�� �纴���� �����Ͽ� ������ �ݰ��� ��⵵ �Ͽ���.[19] �״� �Ϻ��� �����ô�� ����� ���̸�, �Ϻ��� ������ ����� �Ϻ� �� ���� �� ���� ��ȭ�� ���� ���ɻ縦 �ٸ� ������ ������ ���� �������� �̱��� ���� ������ ħ���� ���̶�� �����ߴ�. �Ϻ��� ���߿� ���� �������� �״� 10�� ���� ������ �缺�Ͽ� �Ϻ��� ħ���� ����� ���� �����Ͽ���. �׷��� ���� �̷��� ���ش� ���ο� ���� ���� ��Ȥ�ϱ� ���� �߾����� ġ�εǾ���, �������� ���� ������ ����ģ ���°� ����̶�� ȣ�������� �ʾҴ�. ���̰� 10�� �纴���� �����ϴ� ���, ������ �� ���¼��� ��λ����δ� 30�� ���� �Ѿ�����, ���� ���� ������ ���� ���ڴ� 1,000�� ������ �Ǿ��ٰ� �Ѵ�.[20] 1581�� ������ ���� �� �������� �����ϴ� ���濬�ϱ⡷�� �ϼ��� ���Ҵ�. �Ż��Ӵ��� �Ƶ��̴�.', '1446/10/09');
--4�� ����
CREATE TABLE Mycomment
(
    COMMENT_SEQ NUMBER PRIMARY KEY,
    POST_SEQ NUMBER,
    USER_SEQ NUMBER,
    CONTENT VARCHAR2(4000),
    DATETIME DATE,
    PARENT NUMBER,
    FOREIGN KEY(POST_SEQ) REFERENCES Post(POST_SEQ),
    FOREIGN KEY(USER_SEQ) REFERENCES MyUser(USER_SEQ),
    FOREIGN KEY(PARENT) REFERENCES Mycomment(COMMENT_SEQ)
);
INSERT INTO Mycomment VALUES(1, 1, 2, '�ѻ굵 ��ø(��ߣ������) Ȥ�� �߳�����ø(̸Ҭ������)�� 1592�� 8�� 14��(���� 25�� ���� 7�� 8��) �뿵 �ѻ굵 �չٴٿ��� ���� ������ �ֱ��� ũ�� ��� ����', '2022/05/01', NULL);
INSERT INTO Mycomment VALUES(2, 1, 3, '�� �������� �������� ����ϴ� ���� ���� ���� ������ �������� ó������ �������� ���ƴ�.', '2022/05/01', 1);
INSERT INTO Mycomment VALUES(3, 3, 2, '������ ��Ӵ� �Ż��Ӵ�', '2022/05/01', NULL);
INSERT INTO Mycomment VALUES(4, 2, 1, '�����ٶ󸶹ٻ�', '2022/05/01', NULL);
--6�� ����
SELECT name
FROM Category;
--7�� ����
SELECT comment_SEQ, content, parent
FROM Mycomment
WHERE parent IS NOT NULL;
--8�� ����
SELECT content, id, user_name
FROM post, myuser
WHERE post.user_seq = myuser.user_seq AND post.content LIKE '%�Ż��Ӵ�%' OR post.user_seq LIKE '�Ż��Ӵ�';
--9�� ����
SELECT category.name, post.post_seq, post.title, myuser.user_name, TO_CHAR(post.datetime, 'YYYY/MM/DD'), COUNT(*)
FROM post 
    JOIN category ON post.category_seq = category.category_seq
    JOIN myuser ON myuser.user_seq = post.user_seq
    JOIN mycomment ON mycomment.post_seq = post.post_seq
GROUP BY category.name, post.post_seq, post.title, myuser.user_name, post.datetime;
--10�� ����
UPDATE (SELECT category.name
        FROM category, post
        WHERE category.category_seq = post.category_seq AND post.post_seq = 3)
SET name = '��ȭ����';
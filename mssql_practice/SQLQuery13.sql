-- [1] �����ͺ��̽� ����
CREATE DATABASE TESTDB6;

-- [2] �۾� DB ����
USE TestDB6;

-- [3] ���̺� ����
-- ���� ���̺�
CREATE TABLE tbl_music (
		num			INT					PRIMARY KEY,
		title		NVARCHAR(30)		,
		singer		NVARCHAR(30)		,
		price		INT			
);

-- ��ȭ ���̺�
CREATE TABLE tbl_movie (
		id			INT					PRIMARY KEY,
		director	NVARCHAR(30)		,				--����
		title		NVARCHAR(30)		,				--��ȭ����
		release		SMALLINT			,				--�����⵵
		genre		VARCHAR(30)			,				--��ȭ�帣
		mark1		INT					,				--��������
		mark2		INT									--����������
);

-- [4] ������ �Է�
-- ���� ���̺� �Է�
INSERT INTO dbo.tbl_music
VALUES 
		( 1, N'��', N'�̷�', 22000),
		( 2, N'�Ϸ�', N'�����', 33000),
		( 3, N'Because of you', N'������', 44000),
		( 4, N'����ī', N'������', 19800),
		( 5, N'����ó���� �������', N'�Ѱ���', 27500);

-- ��ȭ ���̺� �Է�
INSERT INTO dbo.tbl_movie
VALUES 
		(1, N'����ȣ', N'����', 2006, '�׼�', 88, 75),
		(2, N'������ �Ŀ��', N'�� �ٵ�', 2014, '������', 90, 100),
		(3, N'���ӽ� ī�޷�', N'�ƹ�Ÿ', 2009, 'SF', 80, 70),
		(4, N'������ �Ŀ��', N'��ǳ�� Ÿ��', 2018, '������', 94, 100),
		(5, N'����ȣ', N'�����', 2019, '���', 92, 95),
		(6, N'���ӽ� ī�޷�', N'���̸��� Ŀ����Ʈ', 2017, 'SF', 84, 77),
		(7, N'���� �ζ�', N'��������(Galveston)', 2018, '���', 88, 100),
		(8, N'�ι�Ʈ ��Ʈ�ҹ���', N'�����Ǽ�Ʈ(MALEFICENT)',  2014, 'ȯŸ��(��뵿ȭ)', 95, 87),
		(9, N'ȫ�浿', N'�� ��Ʈ',  2006, '�׼�', 80, 70),
		(10, N'�̼���', N'�ػ罺 ������ ���λ��',  2019, '���', 94, 74);


-- [5] ������ ���
SELECT *
FROM tbl_music;

SELECT *
FROM tbl_movie;


-- �������� ��������2
-- Q1) ���� ���̺��� ��ü �� ��հ� ���� ��� ����� ����Ͻÿ�.
SELECT AVG(price)
FROM tbl_music;

SELECT *
FROM tbl_music
WHERE price > (
				SELECT AVG(price)
				FROM tbl_music
)
ORDER BY price;

-- Q2) �� �������� �������� ��հ� ���������� ����� ����Ͻÿ�.
SELECT *
FROM tbl_movie;

SELECT director AS '�����̸�', AVG(mark1) AS '��������', AVG(mark2) AS '����������'
FROM dbo.tbl_movie
GROUP BY director
ORDER BY director DESC;

-- Q3) �������� ��պ��� ���� ������ ��ȭ���� ����Ͻÿ� (�Ǵ� ī��Ʈ�� ���ÿ�)
SELECT *
FROM dbo.tbl_movie;

SELECT AVG(mark1) FROM dbo.tbl_movie;

--SELECT COUNT(*) AS '�������� ��պ��� ���� ��ȭ ��'
SELECT *
FROM dbo.tbl_movie
WHERE mark1 < (
				SELECT AVG(mark1) FROM dbo.tbl_movie
);

-- Q4) ��������(mark1)�� ����� ���Ͽ�,
--		�� �������� ���� ����������(mark2) �ְ��� ����� ���Ͽ� ���ų� ������ ������,
--		�� �������� �̸��� ����, �ְ� ������������ �̸������� ����Ͻÿ�.
SELECT *
FROM dbo.tbl_movie;

SELECT director '�����̸�', MIN(mark2) '���� ����������', MAX(mark2) '�ְ� ����������'
FROM tbl_movie
GROUP BY director
HAVING MAX(mark2) >= (
					SELECT AVG(mark1)
					FROM dbo.tbl_movie
)
ORDER BY director;

-- Q5) �� ��ȭ�� ����������(mark2)�� ������ ��������(mark1) ��պ��� ���� ��ȭ�� ����Ͻÿ�.
SELECT *
FROM dbo.tbl_movie

SELECT AVG(mark1)
FROM dbo.tbl_movie
WHERE director = '���ӽ� ī�޷�';

SELECT director '�����̸�', title '��ȭ����', mark1 '��������', mark2 '����������' 
FROM dbo.tbl_movie M1
WHERE mark2 > (
				SELECT AVG(mark1)
				FROM dbo.tbl_movie M2
				WHERE M2.director = M1.director
);

-- Q6) A. �ֱ� (2015�� �̻�) ��ȭ ���ַ� ��������(mark1) ����� ���Ͻÿ�.
--	   B. �ֱ� (2010���) ��ȭ�� ������ ��������(mark1) ����� ���Ͽ� �� ���� ���� ����������(mark2)�� ���� ��ȭ�� ����Ͻÿ�.
SELECT AVG(mark1)
FROM dbo.tbl_movie
WHERE release >= 2015;

SELECT director, AVG(mark1)
FROM dbo.tbl_movie M2
WHERE release >= 2010
GROUP BY M2.director;

SELECT *
FROM dbo.tbl_movie M1
WHERE mark2 > (
				SELECT AVG(mark1)
				FROM dbo.tbl_movie M2
				WHERE M1.release >= 2018 AND M2.director = M1.director
				GROUP BY M2.director
);

-- Q7) '���ӽ� ī�޷�'�� ��ȭ�� ����ϵ�,[ �� ��(����)�� ��������(mark1) ] ����� ���� ����Ͻÿ�.
--	(����� ��: ��� 'ȫ�浿'�� ������ ������̺��� ��������, �װ� ���� �μ��� ��� ������ ���� ����Ͻÿ�.)
SELECT * FROM dbo.tbl_movie


SELECT * , (
	SELECT AVG(mark1) FROM dbo.tbl_movie S WHERE S.release = M.release
) AS '��ȭ �����⵵�� �������'
FROM dbo.tbl_movie M
WHERE director = '���ӽ� ī�޷�';

-- �� �������� S, M ���� ��Ī�� ������ ����ϴ� ���� ����.
-- ������� �������̳� ��Ī ����� ���� ���Ḧ ���ؼ� ����. �ּ��� ���� ��Ī�� Ȯ���� ���ִ°� ����.

-- Q8) '���ӽ� ī�޷�'�� ��ȭ�� ����ϵ�, �� ��ȭ �帣�� ��������(mark1) ��հ� �������� �ְ����� ���� ����Ͻÿ�.
SELECT M.* , 
			(SELECT AVG(mark1) FROM dbo.tbl_movie S1 WHERE S1.genre = M.genre) AS '��ȭ �帣�� �������',
			(SELECT MAX(mark1) FROM dbo.tbl_movie S2 WHERE S2.genre = M.genre) AS '��ȭ �帣�� �������� �ְ���'
FROM dbo.tbl_movie M
WHERE director = '����ȣ';

-- Q9) '���ӽ� ī�޷�'�� ��ȭ�� ����ϵ�, ��������(mark1)�� ����������(mark2)�� ���յ� ���� ����Ͻÿ�.
SELECT *
FROM dbo.tbl_movie;

SELECT M.*, 
			(SELECT SUM(mark1+ mark2) FROM dbo.tbl_movie S WHERE S.id = M.id) AS '�������� + ����������'
FROM dbo.tbl_movie M
WHERE director = '���ӽ� ī�޷�'

-- Q10) ���ӽ� ī�޷� ������ ����ȣ ������ ������ ��������, ��ü �������� ����� ���� ������ ���� �� �ֵ��� ����Ͻÿ�.
SELECT * FROM dbo.tbl_movie;

-- SELECT * FROM dbo.tbl_movie WHERE (director = '���ӽ� ī�޷�') or (director = '����ȣ');
-- SELECT AVG(mark1) FROM dbo.tbl_movie;

-- ù��° ����
SELECT *, (SELECT AVG(mark1) FROM dbo.tbl_movie) AS '��ü �������� ���'
FROM dbo.tbl_movie
WHERE director = '���ӽ� ī�޷�' or director = '����ȣ';

-- �ι�° ����
SELECT *, (SELECT AVG(mark1) FROM dbo.tbl_movie) AS '��ü �������� ���'
FROM dbo.tbl_movie M
WHERE M.id IN (
				SELECT id FROM dbo.tbl_movie S WHERE (director = '���ӽ� ī�޷�') or (director = '����ȣ')
);

-- Q11) �������� ������ ������� �� ���� ��ȭ ������ ����Ͻÿ�.
--		(����� ��: �� ���̵𺰷� �ش� ���� ������ ��ǰ ��� ������ ����Ͻÿ�. SUM �Լ� ���)
SELECT *
FROM dbo.tbl_movie;

SELECT director '�����̸�', COUNT(director) '��ȭ ���� ����'
FROM dbo.tbl_movie
GROUP BY director
ORDER BY director ASC;

-- Q12) ���� ���� ����������(mark2)�� ���� ��ȭ�� ������ ����Ͻÿ�.
-- Ȥ �������� �ֽ� �������� ������ ����Ͻÿ�.
SELECT * FROM dbo.tbl_movie

SELECT * 
FROM dbo.tbl_movie
WHERE mark2 = (
				SELECT MAX(mark2) FROM dbo.tbl_movie
)
ORDER BY release ASC, director ASC;

-- Q13) 2006�� 2019�� �� �ؿ� ������ ��ȭ�� ������ ����Ͻÿ�. (IN, EXISTS ������ ���)
SELECT * FROM dbo.tbl_movie;

SELECT * 
FROM dbo.tbl_movie 
WHERE (release = 2006) or (release = 2019);

-- A (IN ������ ���)
SELECT *
FROM dbo.tbl_movie M
WHERE M.id IN (
				SELECT id 
				FROM dbo.tbl_movie
				WHERE release IN (2006, 2019)
);

-- �̷��� �ι��� ���ļ� ������ �ۼ��ϴ� ���� IN �����ڸ� ����ؼ� �ѹ��� ó��
--SELECT ID 
--FROM DBO.TBL_MOVIE
--WHERE RELEASE = (2006); -- 1. 9

--SELECT ID 
--FROM DBO.TBL_MOVIE
--WHERE RELEASE = (2019); -- 5, 10

-- B (EXISTS ������ ���)

SELECT *
FROM dbo.tbl_movie M
WHERE EXISTS (
				SELECT id 
				FROM dbo.tbl_movie S
				WHERE (S.id = M.id) AND S.release IN (2006, 2019)
);

-- EXISTS ����
USE pubs;

SELECT *
FROM dbo.stores;

SELECT *
FROM dbo.sales;

-- Ex1. ���� ���̺��� �ǸŽ����� �����ϴ� �������� ����Ͻÿ�.
-- dbo.stores(��������), dbo.sales(��������) <-- �� ���̺��� �����Ͽ� ������ �ۼ��Ѵ�.
SELECT stor_id '���� ID', stor_name '���� �̸�'
FROM dbo.stores M
WHERE EXISTS (	SELECT *
				FROM dbo.sales S
				WHERE qty >= 40
				AND S.stor_id = M.stor_id
);

-- Ex2. ���� �����ͺ��̽�(pubs)���� �Ǹż����� 40�� �̻���(=�ִ�, =�����ϴ�) �������� ����Ͻÿ�.
SELECT stor_id '���� ID', stor_name '�����̸�'
FROM dbo.stores M
WHERE EXISTS (
				SELECT * FROM dbo.sales S WHERE (S.stor_id = M.stor_id) AND (S.qty >=40)
);

-- Ex3. ���� �����ͺ��̽�(pubs)���� 1994�� ���Ŀ� �ǸŽ����� �ִ�(=�����ϴ�) �������� ����Ͻÿ�.
SELECT stor_id '���� ID', stor_name '�����̸�', city '����'
FROM dbo.stores M
WHERE EXISTS (
				SELECT * FROM dbo.sales WHERE (stor_id = M.stor_id) AND (ord_date > '1994')
);

USE TESTDB6; 

-- Q14) '���ӽ� ī�޷�' ������ ��ȭ�� ����ϵ�, �� ��ȭ �����⵵�� ���� ������ ��ȭ�鵵 ����Ͻÿ�.
-- �� ������ IN �������� ��Ȯ�� ������ ����.
SELECT *
FROM dbo.tbl_movie;

SELECT *
FROM dbo.tbl_movie M
WHERE release IN (
					SELECT release 
					FROM dbo.tbl_movie
					WHERE director = '���ӽ� ī�޷�'
);

-- Q15) '���ӽ� ī�޷�' ������ ���� ��ȭ �帣�� ��ȭ����, �������� ����Ͻÿ�.
--      (�� ������ ���� ����ؼ�)
SELECT * FROM dbo.tbl_movie

DECLARE @d_name VARCHAR(20);
SET @d_name = '���ӽ� ī�޷�';

SELECT @d_name + ' ������ ��ȭ �帣 --->' AS '������', M.genre '�帣', M.title '��ȭ����', M.release '�����⵵'
FROM dbo.tbl_movie M
WHERE M.id IN (
				SELECT id 
				FROM dbo.tbl_movie S
				WHERE S.director = @d_name
);

-- GROUP BY �÷���
-- Q1) ��ȭ ���̺��� �� �帣�� ��ȭ ������ ����Ͻÿ�.
SELECT * FROM dbo.tbl_movie;

SELECT genre ��ȭ�帣, COUNT(*) ��ȭ����
FROM dbo.tbl_movie
GROUP BY genre
ORDER BY COUNT(*) DESC;

-- Q2) ��ȭ ���̺��� �� �帣���� �׷�ȭ�Ͽ� ���� ����(�����Լ��� ����� ���� * ���, �ְ�, ����)�� ����Ͻÿ�.
SELECT *
FROM dbo.tbl_movie;

SELECT genre ��ȭ�帣, COUNT(*) ��ȭ��, 
	   AVG(mark1) '�������� ���', AVG(mark2) "���������� ���", 
	   MAX(mark1) '�������� �ְ�', MIN(mark1) '�������� ����', 
	   MAX(mark2) '���������� �ְ�', MIN(mark2) '���������� ����'
FROM dbo.tbl_movie
GROUP BY genre;

SELECT*
FROM dbo.tbl_movie;

-- Q3) �������� �׷��� ��� ���� ����(���, �ְ�, ����)�� ����Ͻÿ�.
SELECT release, COUNT(release) '����', AVG(mark1) '�������� ���', 
	   MAX(mark1) '�������� �ְ�', MIN(mark1) '�������� ����',
	   SUM(mark1) '�������� �հ�', SUM(mark2) '���������� �հ�'
FROM dbo.tbl_movie
GROUP BY release;

-- Q4) GROUP BY�� �̿��Ͽ� 2�� �÷� ����
SELECT release FROM dbo.tbl_movie GROUP BY release;

SELECT release '�����⵵', title '��ȭ����'
FROM dbo.tbl_movie
GROUP BY release, title
ORDER BY release DESC; -- �ֱټ�

SELECT * FROM dbo.tbl_movie;

UPDATE dbo.tbl_movie SET title = '�����'
WHERE id = 10;

-- Q5) ���� �׷��� �� �������???
-- ���� �׷�� ī��Ʈ ���
-- (��� ����) ���� �׷�ȭ���� ī��Ʈ�� ���ٴ°ǵ� �̰� �� ����???
-- ��) ��ȭ ���̺��� ������, �帣�� ������ ����Ͻÿ�.
SELECT * FROM dbo.tbl_movie;

SELECT release '��������', genre '��ȭ�帣', COUNT(*) '����'
FROM dbo.tbl_movie
GROUP BY release, genre
ORDER BY release DESC; -- �ֱټ�

-- Q6) ��ȭ, ���� �� ���̺��� ������ ������ �����ϴ� ����� �̸��� ����� ����Ͻÿ�.
SELECT * FROM dbo.tbl_music;
SELECT * FROM dbo.tbl_movie;

UPDATE dbo.tbl_movie
SET director='�̷�'
WHERE id=9;

UPDATE dbo.tbl_movie
SET director='������'
WHERE id=10;

UPDATE dbo.tbl_movie
SET director='�̷�'
WHERE id IN (1, 5);

INSERT INTO dbo.tbl_music VALUES (6, 'ũ��������', '�̷�', 44000);

-- A
SELECT A.director, B.title
FROM dbo.tbl_movie A, dbo.tbl_music B
WHERE A.director = B.singer
ORDER BY director;

-- B (�ߺ�����, DISTINCT)
SELECT DISTINCT A.director, B.title
FROM dbo.tbl_movie A, dbo.tbl_music B
WHERE A.director = B.singer
ORDER BY director;

-- C (�ߺ�����, GROUP BY)
SELECT A.director, B.title, '�� ������ ��ȭ ��ǰ �� --->', COUNT(*) '��ȭ ��ǰ ��'
FROM dbo.tbl_movie A, dbo.tbl_music B
WHERE A.director = B.singer
GROUP BY A.director, B.title;

-- [6] �����ͺ��̽� ����(����)
USE master;
DROP DATABASE TestDB6;


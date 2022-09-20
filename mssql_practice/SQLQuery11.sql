-- [!] �������� IN


-- [1] �����ͺ��̽� ����
CREATE DATABASE TESTDB5;

-- [2] �۾� DB ����
USE TESTDB5;

-- [3] ���̺� ����
-- ��ǰ ���̺�
CREATE TABLE dbo.productTbl(
	p_code		CHAR(10)		PRIMARY KEY,				-- ��ǰ �ڵ�
	p_name		NVARCHAR(16)	NOT NULL,					-- �����ڵ� ����
	p_date		DATE			NULL,						-- �԰���
	p_area		NVARCHAR(50)	DEFAULT N'����������',		-- ��������
	p_money		MONEY			NULL,						-- ���ް���
	p_num		INT				IDENTITY		NOT NULL	-- IDENTITY(1,1)�� ����
);

-- ���� ���̺�
-- [!] �ܷ�Ű ����
-- [!] [�÷���][����������] FOREIGN KEY REFERENCES [���̺��] ([�÷���])
CREATE TABLE dbo.salesTbl (
	s_code		CHAR(10)		PRIMARY KEY,									-- ���� �ڵ�
	s_branch	NVARCHAR(10)	NOT NULL,										-- ���� ����
	s_p_code	CHAR(10)		FOREIGN KEY REFERENCES dbo.productTbl(p_code),	-- ��ǰ �ڵ�
	s_qty		SMALLINT		NULL,											-- �Ǹ� ����
	s_date		DATE			NULL,											-- ������
	s_num		INT				IDENTITY		NOT NULL						-- IDENTITY(1,1)�� ����
);

-- [4] ������ �Է�
-- ��ǰ �Է�
--INSERT INTO ���̺�� (
--						�÷�1, �÷�2, �÷�3, �÷�4, �÷�5
--)
--VALUES
--					 ('��1', '��2', '��3', '��4', '��5'),
--					 ('��1', '��2', '��3', '��4', '��5'),
--					 ('��1', '��2', '��3', '��4', '��5'),
--					 ('��1', '��2', '��3', '��4', '��5');
			
-- ��ǰ �Է� [!�ǽ�]
INSERT INTO dbo.productTbl 
VALUES	('GD101', '����Ű', '2000-12-12', '�̱�', 900),
		('GD102', '�Ƶ�ٽ�', '2000-01-13', '����', 450),
		('GD103', '���ν��彺', '2000-02-14', '�ѱ�', 720),
		('GD104', 'FILA', '2000-03-15', '����', 500);




-- ��ǰ �Է�
INSERT INTO dbo.productTbl 
VALUES('GD101', '����Ű', '2000-12-12', '�̱�', 900);

INSERT INTO dbo.productTbl 
VALUES('GD102', '�Ƶ�ٽ�', '2000-01-13', '����', 450);

INSERT INTO dbo.productTbl 
VALUES('GD103', '���ν��彺', '2000-02-14', '�ѱ�', 720);

INSERT INTO dbo.productTbl 
VALUES('GD104', 'FILA', '2000-03-15', '����', 500);

-- ���� �Է�
INSERT INTO dbo.salesTbl 
VALUES ('ST001', '����', 'GD101', 1200, '2010-01-01');

INSERT INTO dbo.salesTbl 
VALUES ('ST002', '����', 'GD102', 700, '2008-01-02');

INSERT INTO dbo.salesTbl 
VALUES ('ST003', '����', 'GD103', 3600, '2022-01-03');

INSERT INTO dbo.salesTbl 
VALUES ('ST004', '�λ�', 'GD104', 2800, '2012-01-04');

INSERT INTO dbo.salesTbl
VALUES ('ST005', '����', 'GD101', 1400, '2011-01-05');

INSERT INTO dbo.salesTbl 
VALUES ('ST006', '����', 'GD103', 4400, '2002-01-06');

INSERT INTO dbo.salesTbl 
VALUES ('ST007', '����', 'GD104', 800, '2021-01-07');

INSERT INTO dbo.salesTbl 
VALUES ('ST008', '����', 'GD103', 1800, '2020-01-07');

INSERT INTO dbo.salesTbl 
VALUES ('ST009', '����', 'GD102', 1000, '2020-01-07');

INSERT INTO dbo.salesTbl 
VALUES ('ST010', '����', 'GD104', 2800, '2020-01-07');

INSERT INTO dbo.salesTbl 
VALUES ('ST011', '����', 'GD101', 200, '2022-12-14');

-- [5] ������ ���
SELECT *
FROM dbo.productTbl
ORDER BY p_num;

SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

-- ��������(IN)
-- IN �����ڴ� ���������� ����Ǿ����� ������ ��� ���ڵ�(��)�� �������� ����.
-- ��, ���������� ��ȯ�ϴ� ��� ���ڵ� ���� ���� ���̳� �ƴϳĿ� ���� ��뿩�ΰ� �����ȴ�.
-- ���������� ���� ��ȯ���� ��� IN �����ڸ� ����ص� �Ǵ� ���ص� �ȴ�. (= ���� ��Ÿ ������ ���)
-- ���� �������� ���� �� �̻� ��ȯ�ϴ� ��쿡�� �Ű��� �� ����Ѵ�.
-- ���� ������ DISTINCT ��뵵 �����ϴ�.
SELECT
		p_code											AS '��ǰ�ڵ�',
		p_name											AS '��ǰ��',
		p_area											AS '������',
		REPLACE(CONVERT(VARCHAR, p_money), '.00', '')	AS '���ް�'
FROM	dbo.productTbl
--WHERE p_code = 'GD101' or p_code = 'GD103';
WHERE	p_code IN (
		SELECT DISTINCT s_p_code
		FROM dbo.salesTbl
		WHERE s_qty >= 3000
);

-------------------------------------------------------------------------------
-- SELECT �̿ܿ��� �������� ���
-- Q) ���� ���̺��� �Ǹż����� ���� ���� �ּڰ� ���ڵ�(��)�� 0���� �����Ͻÿ�.
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

-- ���������� �𸣴� ���
-- 1. ���� �˻� > 2. �ش� ���ڵ� ������Ʈ
SELECT MIN(s_qty)
FROM dbo.salesTbl;

UPDATE dbo.salesTbl
SET s_qty = 300
WHERE s_qty = 0;

-- ���������� �ƴ� ���
UPDATE dbo.salesTbl
SET s_qty = 0
WHERE s_qty = (
				SELECT MIN(s_qty) FROM dbo.salesTbl
);
-------------------------------------------------------------------------------
-- Q) �������̺��� �Ǹż����� ���� ���� ���� ã�Ƽ� �����Ͻÿ�.
DELETE FROM dbo.salesTbl;

DELETE FROM dbo.productTbl;

-- �������� �ۼ�
DELETE FROM dbo.salesTbl
WHERE s_qty = (
				SELECT MAX(s_qty) FROM dbo.salesTbl
);

SELECT * FROM dbo.salesTbl
ORDER BY s_num;

-------------------------------------------------------------------------------
-- Q1) �������̺��� �������� ���� ������ ��¥�� ��ǰ�� ����Ͻÿ�.
-- (=��� ���̺��� �Ի����� ���� ������ ����� ���԰� �Ի����� ����Ͻÿ�)
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

SELECT MIN(s_date) 
FROM dbo.salesTbl;

SELECT *
FROM dbo.salesTbl
WHERE s_date = (
				SELECT MIN(s_date) FROM dbo.salesTbl
);

-- Q2) �������̺��� �� ���纰 ����Ǹ� ������ ����Ͻÿ�.
-- ����� �����̸��� ����ǸŸ� ������������ �Ͻÿ�.
SELECT * FROM dbo.salesTbl
ORDER BY s_num;

SELECT s_branch AS '�����̸�', AVG(s_qty) AS '��� �Ǹż���'
FROM dbo.salesTbl
GROUP BY s_branch
ORDER BY '��� �Ǹż���' DESC;

-- Q3) ���� ���̺��� �Ǹż����� ���� ������ �ּ� ���⺸�� ���� ����� ������, �Ǹż���, ���⳯¥�� ����Ͻÿ�.
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

SELECT MIN(s_qty)
FROM dbo.salesTbl
WHERE s_branch = '����';

SELECT s_branch AS '�����̸�', s_qty AS '�Ǹż���', s_date AS '���⳯¥'
FROM dbo.salesTbl
WHERE s_qty < ( SELECT MIN(s_qty)
				FROM dbo.salesTbl
				WHERE s_branch = '����'
)
ORDER BY '�Ǹż���' DESC;

-- Q4) �� ������ �Ǹż��� ����� ����Ͻÿ�.
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

SELECT s_branch '�����̸�', AVG(s_qty) '��� �Ǹż���'
FROM dbo.salesTbl
GROUP BY s_branch
ORDER BY '��� �Ǹż���' DESC;

-- Q5) ���� ���̺��� ��¥�� �Ǹż����� �� ������ ��պ��� ���� ������� ���⳯¥, �Ǹż����� ����Ͻÿ�.
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

SELECT s_branch '������', s_date '���⳯¥', s_qty '�Ǹż���'
FROM dbo.salesTbl S1
WHERE s_qty < ( SELECT AVG(s_qty) 
				FROM dbo.salesTbl S2
				WHERE S2.s_branch = s1.s_branch 
)
ORDER BY s_date ASC;



-------------------------------------------------------------------------------
-- [6] �����ͺ��̽� ����(����)
USE MASTER;
DROP DATABASE TESTDB5;



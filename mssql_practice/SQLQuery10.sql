-- [!] ��������
-- SELECT ������ �ȿ� �ٽ� �ѹ� SELECT �������� ����ִ� ���� �����̴�.
-- ���� SELECT ������ �����δ� � ���ǽ��� ����� ������ �� ����.
-- �Ǵ� ���� �ٸ� ���̺��� ������ ���� ��ȸ�Ͽ� �� ������ �������� ������ �� ���� ����Ѵ�.

-- [!] �⺻���� �ǽ� ����
-- 1. ��ǰ ���̺�� ���� ���̺��� ���� �����.
-- 2. �� ���̺� �ʿ��� ���� ���ǰ� ���� �⺻Ű�� �ܷ�Ű�� �����Ѵ�.
-- 3. ��ǰ ���̺� ��ǰ�� �Է��Ѵ�.
-- 4. ���� ���̺� ���� �����͸� ������ �Է��Ѵ�.
-- 5. ������ ���̺� ����ִ� ������ ��� ����غ��� �Ʒ��� �䱸 ������ �ۼ��Ͻÿ�.

-- [!] �䱸����(=�䱸����)
-- ���� ������ �� ����Ǵ��� Ȯ���Ͻÿ�.
-- ���ް��� ��� ��½ÿ��� �Ҽ��� ���� �����Ͻÿ�.(�Լ� ���)
-- ��ǰ�� �Ǹ� ������ 1,000�� �̻��� ��ǰ�� ���ؼ� ����Ͻÿ�.(���� ���� ���)

-- [1] �����ͺ��̽� ����
CREATE DATABASE TESTDB3;

-- [2] �۾� DB ����
USE TESTDB3;

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
INSERT INTO dbo.productTbl VALUES('GD101', '����Ű', '2000-12-12', '�̱�', 900);
INSERT INTO dbo.productTbl VALUES('GD102', '�Ƶ�ٽ�', '2000-01-13', '����', 450);
INSERT INTO dbo.productTbl VALUES('GD103', '���ν��彺', '2000-02-14', '�ѱ�', 720);
INSERT INTO dbo.productTbl VALUES('GD104', 'FILA', '2000-03-15', '����', 500);

-- ���� �Է�
INSERT INTO dbo.salesTbl VALUES ('ST001', '����', 'GD101', '1700', '2022-01-01');
INSERT INTO dbo.salesTbl VALUES ('ST002', '����', 'GD102', '1100', '2022-01-02');
INSERT INTO dbo.salesTbl VALUES ('ST003', '����', 'GD103', '1400', '2022-01-03');
INSERT INTO dbo.salesTbl VALUES ('ST004', '�λ�', 'GD104', '700', '2022-01-04');
INSERT INTO dbo.salesTbl VALUES ('ST005', '����', 'GD101', '2900', '2022-01-05');
INSERT INTO dbo.salesTbl VALUES ('ST006', '����', 'GD103', '2100', '2022-01-06');
INSERT INTO dbo.salesTbl VALUES ('ST007', '����', 'GD104', '300', '2022-01-07');

-- [5] ������ ���
SELECT *
FROM dbo.productTbl
ORDER BY p_num;

SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

-- ��������(IN)
SELECT
		'1,000�� �̻� �Ǹŵ� �귣�� -> '				AS '�÷���',
		p_code											AS '��ǰ�ڵ�',
		p_name											AS '��ǰ��',
		p_area											AS '������',
		REPLACE(CONVERT(VARCHAR, p_money), '.00', '')	AS '���ް�'
FROM	dbo.productTbl
WHERE	p_code IN (
		SELECT s_p_code
		FROM dbo.salesTbl
		WHERE s_qty >= 1000
);

-- [6] �����ͺ��̽� ����(����)
--USE MASTER;
--DROP DATABASE TESTDB3;







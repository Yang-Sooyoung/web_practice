---------------------------------------------------
-- [!] ��¥ �����ؼ� ���� �غ��ԵǴ� ������
---------------------------------------------------

-- ���̺� ����
CREATE TABLE dbo.tbl_date77
(
		-- �⺻Ű ������ �̸��� �˱⽱�� ���� ���� �����Ѵ�.
		cus_id		CHAR(10)		NOT NULL		CONSTRAINT		PK_CUSID		PRIMARY KEY,
		cus_name	NVARCHAR(20)	NOT NULL,
		cus_date	DATE			NOT NULL
)

EXEC sp_helpindex tbl_date77;

-- INSERT
INSERT INTO dbo.tbl_date77 VALUES ('aaa', N'���浿', '2000-01-01');
INSERT INTO dbo.tbl_date77 VALUES ('bbb', N'�ڱ浿', '2000-10-01');
INSERT INTO dbo.tbl_date77 VALUES ('ccc', N'��ȣ��', '2001-04-01');
INSERT INTO dbo.tbl_date77 VALUES ('ddd', N'������', '2001-12-01');
INSERT INTO dbo.tbl_date77 VALUES ('eee', N'������', '2002-03-01');
INSERT INTO dbo.tbl_date77 VALUES ('fff', N'�տ���', '2002-11-01');
INSERT INTO dbo.tbl_date77 VALUES ('ggg', N'��ȣ��', '2003-07-01');
INSERT INTO dbo.tbl_date77 VALUES ('hhh', N'�ڱ��', '2003-12-01');
INSERT INTO dbo.tbl_date77 VALUES ('kkk', N'�̰���', '2004-09-01');
INSERT INTO dbo.tbl_date77 VALUES ('mmm', N'�����', '2004-02-01');

-- SELECT
SELECT * FROM dbo.tbl_date77;


-- Q1. ȸ�� ���̵� mmm�� ���ؼ� ��¥�� 5�� �����ϰ� �ʹٸ�?
-- Error
UPDATE dbo.tbl_date77
SET	cus_date = (cus_date +5)
WHERE cus_id = 'mmm'

-----------------------------------------------------------------------------------------
-- [!] DATEADD �Լ�
-----------------------------------------------------------------------------------------
-- � ��¥�� �Ⱓ�� ���ϴ� �Լ��̴�.
-- ���� : DATEADD ( datepart, number, date )
-- ���� : DATEADD ( ���ҳ�¥����, ����(���Ҽ���), ��¥(�÷���) )
-----------------------------------------------------------------------------------------

-- ��(DAY) ����
SELECT DATEADD(DAY, 5, '2004-02-01');

-- ��(MONTH) ����
SELECT DATEADD(MONTH, 6, '2004-02-01');
SELECT DATEADD(MONTH, 12, '2004-02-01');

-- ��(YEAR) ����
SELECT DATEADD(YEAR, 1, '2004-02-01');

-- Q1. ȸ�� ���̵� mmm�� ���ؼ� ��¥�� 5�� �����ϰ� �ʹٸ�?

UPDATE dbo.tbl_date77
SET	cus_date = DATEADD(DAY, 5, [cus_date])
WHERE cus_id = 'mmm'

-- SELECT
SELECT * FROM dbo.tbl_date77;

-- Q2. ȸ�� �̸��� ���浿�� ���ؼ� ��¥�� 6���� �߰���Ű�� �ʹٸ�?
SELECT * FROM dbo.tbl_date77

UPDATE dbo.tbl_date77
SET cus_date = DATEADD(MONTH, 6, [cus_date]) -- 2000-07-01
WHERE cus_name = '���浿';

-- Q3. ���浿���� �ٽ� �ѹ� �� 6������ �����Ű�� �⵵�� �ٲ���� Ȯ���ϰ� �ʹٸ�?
-- �� ������ �ѹ� �� �����ϰ� ����� Ȯ������.

-- Q4. ȸ�� ���̵� eee�� ���ؼ� �Ⱓ�� 5�� ���� �ʹٸ�?
--		3/1 --> 3/1, 2/28, 27, 26, 25 �̷��� 5���� ���Ƿ� ���� ����� 2/24
SELECT * FROM dbo.tbl_date77

UPDATE dbo.tbl_date77
SET	cus_date = DATEADD(DAY, -5, [cus_date]) -- 2/24
WHERE cus_id = 'eee';

-- Q5. �����͸� �����̳� �������� �ʰ� 10�� �߰��� ����� ���� �ʹٸ�?
SELECT * FROM dbo.tbl_date77

SELECT DATEADD(DAY, 10, [cus_date]) AS '10�Ͼ� ��������'
FROM dbo.tbl_date77


-- Q6. ����(����) ������(2002-11-05) ���� 10�� ����� ��¥ ������ �ѱ� ȸ���� ������� �˰� �ʹٸ�?
SELECT *
FROM dbo.tbl_date77
WHERE cus_date > DATEADD(DAY, 10, '2002-11-05') --2002-11-15

-- B (���� ���)
DECLARE @aaa INT;			 -- ��������	@������		������Ÿ��
SET @aaa = 10;				 -- �� ����
-- SELECT @aaa AS ���������

DECLARE @bbb DATE;
SET @bbb = '2002-11-05';	 -- ���� ������
-- SELECT @bbb

-- ����� ������
DECLARE @duedate DATE = DATEADD(DAY, @aaa, @bbb);

SELECT COUNT(*) AS '���� �������� �ѱ� ȸ�� ��'
FROM dbo.tbl_date77
WHERE cus_date > @duedate;







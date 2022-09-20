-- CREATE DATABASE
CREATE DATABASE [9TO9];

-- CHANGE DB
USE [9TO9];

-- CREATE TABLE
CREATE TABLE dbo.tbl_customers
(
	cus_id		CHAR(10)		NOT NULL		PRIMARY KEY,
	cus_name	NVARCHAR(20)	NOT NULL		UNIQUE,
	cus_class	NVARCHAR(20)	NOT NULL		UNIQUE,
)

-- INSERT
INSERT INTO dbo.tbl_customers VALUES('CCC', N'ȫ�浿', N'����1');
INSERT INTO dbo.tbl_customers VALUES('BBB', N'��浿', N'����2');
INSERT INTO dbo.tbl_customers VALUES('AAA', N'��浿', N'����3');
INSERT INTO dbo.tbl_customers VALUES('ȫ�浿', 'HONG', N'����4'); -- �ѱ� �̸� �Է�
INSERT INTO dbo.tbl_customers VALUES('ParkGilDon', 'PARK', N'����5'); -- ���� ����(10����)
INSERT INTO dbo.tbl_customers VALUES('GangGilDon', 'KANG', N'����6');

DELETE FROM dbo.tbl_customers;


-- SELECT 
SELECT * 
FROM dbo.tbl_customers;

SELECT * 
FROM dbo.tbl_customers
ORDER BY cus_id DESC;

-- COLLATIONS ���� ����
SELECT * FROM ::fn_helpcollations();

-- �ε��� ����
--EXECUTE sp_helpindex tbl_customers;
--sp_helpindex tbl_customers;
EXEC sp_helpindex tbl_customers;

-- ������ ��ü ����
DELETE FROM dbo.tbl_customers;

SELECT * FROM dbo.tbl_customers;

-- �⺻ ������ ���� �Ӽ��� ����(COLLATE ������ �ǽ�)
-- [ 1 ] 
-- DATABASE COLLATION ���� ����
SELECT DATABASEPROPERTYEX('9TO9', 'COLLATION') AS COLLATION;
--SELECT DATABASEPROPERTYEX('9TO9', 'collation') AS COLLATION;
--SELECT DATABASEPROPERTYEX('9TO9', 'Collation') AS COLLATION;

-- [ 2 ]
-- DATABASE > TABLE COLLATION ���� ����
EXEC sp_help tbl_customers;

-- [ 3 ]
-- �⺻ ������ ���� �Ӽ� ����(DB)
-- �����ͺ��̽� COLLATION ������ �����Ѵٴ� ���� "�⺻ ������ ����" �Ӽ��� �����Ѵٴ� ���̴�.
-- �׷��ԵǸ� ���� ���Ŀ� �����Ǵ� �ű� ���̺���� ����� "�⺻ ������ ����" �Ӽ��� ���� �����ǰ� �ȴ�.
-- ���� �������� ������ ���̺���� �Ӽ��� ������ �ʴ´�. �������� �Ӽ� ���°� �����ȴ�.

-- ALTER(DB)
ALTER DATABASE [9TO9]
	  COLLATE Korean_Wansung_CI_AS;

SELECT DATABASEPROPERTYEX ('9TO9', 'COLLATION') AS COLLATION;

-- ALTER(TABLE > COLUMN)
ALTER TABLE dbo.tbl_customers
ALTER COLUMN cus_id CHAR(10)
COLLATE Korean_Wansung_CI_AS;






-- �⺻ ������ ���� �Ӽ��� ����(GUI)
-- �۾� DB ����
USE master;
DROP DATABASE [9TO9];






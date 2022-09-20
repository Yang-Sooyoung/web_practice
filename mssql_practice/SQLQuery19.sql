--------------------------------------------------------------------------------------
-- PK / UQ �Է°� ������ ���ϱ�
--------------------------------------------------------------------------------------

-- ���̺� ����
CREATE TABLE dbo.tbl_test
(
	cus_id		CHAR(10)		PRIMARY KEY,	--PK
	cus_name	CHAR(10)		UNIQUE,			--UQ
)

-- INSERT
INSERT INTO dbo.tbl_test VALUES ('AAA', 'AAA'); -- ����
INSERT INTO dbo.tbl_test VALUES ('',''); -- ����, �� ���� ����
INSERT INTO dbo.tbl_test VALUES ('NULL', 'BBB'); -- NULL�� �ƴ� ���ڰ����� �ν��ϴϱ� ����.
INSERT INTO dbo.tbl_test VALUES (NULL, 'CCC'); -- �Ұ���, �⺻Ű �������ǿ� NULL�� ����Ǳ� ������ �ȵ�.
INSERT INTO dbo.tbl_test VALUES ('CCC', NULL); -- ����, ����ũ�� NULL �Է��� ����. Ư���� NOT NULL�� ���� �������� ����.
INSERT INTO dbo.tbl_test VALUES ('DDD', 'NULL'); -- ����

-- SELECT
SELECT * FROM dbo.tbl_test

-- DROP TABLE
DROP TABLE dbo.tbl_test;

--------------------------------------------------------------------------------------
-- [!] �⺻Ű ���� ���� �ǽ��ϱ�
--------------------------------------------------------------------------------------

-- ���̺� ����1
CREATE TABLE dbo.tbl_pktset
(
	cus_id		CHAR(10)		NOT NULL	PRIMARY KEY,
	cus_name	NVARCHAR(20)	NOT NULL	,
)

-- ���̺� ����2
CREATE TABLE dbo.tbl_pktset2
(
	cus_id		CHAR(10)		NOT NULL	CONSTRAINT		PK_CUSID2		PRIMARY KEY,
	cus_name	NVARCHAR(20)	NOT NULL	,
)

-- �ε��� Ȯ��
EXEC sp_helpindex tbl_pktset2
















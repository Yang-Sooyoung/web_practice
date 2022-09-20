------------------------------------------------------------------------------
-- [!] �⺻Ű ���� �� Ȯ���ϴ� �ٸ� �����
------------------------------------------------------------------------------

-- [1] ���̺� ����
-- ���� �⺻Ű ��������, ����ũ �������� ���� ���̺��� �����غ���.
CREATE TABLE dbo.tbl_customers4
(
	cus_id		CHAR(10)		NOT NULL,
	cus_name	NVARCHAR(20)	NOT NULL,
	cus_class	NVARCHAR(20)	NOT NULL,
)

-- [2] �⺻Ű �������� �߰�
ALTER TABLE dbo.tbl_customers4
	  ADD
			CONSTRAINT PK_tbl_customers4 PRIMARY KEY CLUSTERED (cus_id)

EXEC sp_helpconstraint tbl_customers4;

-- [3] �⺻Ű ����
-- A
ALTER TABLE dbo.tbl_customers4
	  DROP
			CONSTRAINT PK_tbl_customers4

-- B
ALTER TABLE dbo.tbl_customers4
	  DROP PK_tbl_customers4

-- [4] �⺻Ű Ȯ��(�ý��ۺ�- ���� ��Ű�� ��)
-- �����ͺ��̽� ���ʿ� DB���� ������ �Ǿ� �ִ�.
-- ���̺� �� �÷��� ���� ������ ���ų� Ȱ���ϰ��� �� �� ����� �� �ִ�.
-- ���� ���� ���Ͽ� ���� ������ ��� Ȱ���� ���� �ִ�. 
-- FROM INFO~~.KEY~~ WHERE TABLE_NAME = ''
SELECT *
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'tbl_customers4'

------------------------------------------------------------------------------
-- [!] �⺻Ű(��������) ����� �����ϱ�
------------------------------------------------------------------------------

-- [ 1 ] ���̺� ����
CREATE TABLE dbo.tbl_customers6
(	
	cus_id		CHAR(10)		NOT NULL		PRIMARY KEY,
	cus_name	NVARCHAR(20)	NOT NULL		UNIQUE,
	cus_class	NVARCHAR(20)	NOT NULL		UNIQUE,
)

EXEC sp_helpconstraint tbl_customers6; -- ���� constraint_name �����Ҷ� ���

-- [2] �⺻Ű ����
ALTER TABLE dbo.tbl_customers6
	DROP
		CONSTRAINT PK_CUSID

-- [3] �⺻Ű(��������) �߰�
ALTER TABLE dbo.tbl_customers6
	ADD
		CONSTRAINT PK_CUSID PRIMARY KEY CLUSTERED (cus_id)

-- [4] ���̺� ����
DROP TABLE dbo.tbl_customers6;


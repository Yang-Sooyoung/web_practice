-- ���� ����
-- �����ͺ��̽� ����
CREATE DATABASE [9TO9];

-- �۾� DB ����
USE [9TO9]





------------------------------------------------------------------------------
-- [!] PRIMARY KEY CONSTRAINT ADD / DROP
------------------------------------------------------------------------------

-- [1] ���̺� ����
-- ���� �⺻Ű ��������, ����ũ �������� ���� ���̺��� �����غ���.
CREATE TABLE dbo.tbl_customers4
(
	cus_id		CHAR(10)		NOT NULL,
	cus_name	NVARCHAR(20)	NOT NULL,
	cus_class	NVARCHAR(20)	NOT NULL,
)

-- [2] �ε��� Ȯ��
-- �⺻Ű �����̳� ����ũ ������ ���߱� ������ �ε��� Ȯ���� �غ��� ���ٶ�� ���´�.
EXEC sp_helpindex tbl_customers4;
--sp_helpindex tbl_customers4;

-- [3] �⺻Ű �߰�(�������� �߰�)
sp_helpconstraint tbl_customers4; -- �������� Ȯ��

ALTER TABLE dbo.tbl_customers4
	  ADD	-- �������� �߰�
			CONSTRAINT PK_tbl_customers4 PRIMARY KEY CLUSTERED (cus_id) -- CLUSTERED�� �Ƚ��൵ �⺻���� Ŭ�����͵� �ε��� ��������.
GO

EXEC sp_helpindex tbl_customers4 -- �ε��� Ȯ��
GO


-- [4] �⺻Ű �������� ����
ALTER TABLE dbo.tbl_customers4
	   DROP	 -- unique �� UQ
			 CONSTRAINT PK_tbl_customers4;
GO

EXEC sp_helpindex tbl_customers4 -- �ε��� Ȯ��
GO

-- [5] ���̺� ����
DROP TABLE dbo.tbl_customers4;




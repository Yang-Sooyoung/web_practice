-- CREATE DATABASE
CREATE DATABASE [7TO7]

-- CHANGE DATABASE
USE [7TO7]

-- CREATE TABLE
----------------------------------------------------------
-- [1] dbo.tbl_members : ȸ�� ���̺�
----------------------------------------------------------
CREATE TABLE dbo.tbl_members
(
	m_id		CHAR(16)		NOT NULL		PRIMARY KEY,
	m_name		NVARCHAR(100)	NOT NULL		,
	m_address	NVARCHAR(100)	NULL			,	
	m_country	CHAR(50)		NULL			,
	m_tel		CHAR(50)		NULL			,
	m_email		CHAR(50)		NULL			
);

----------------------------------------------------------
-- [2] dbo.tbl_sales1 : ����(�ֹ�) ���̺�1
----------------------------------------------------------
CREATE TABLE dbo.tbl_sales1
(
	s1_num		INT				NOT NULL		PRIMARY KEY,
	s1_date		DATETIME		NOT NULL		,
	m_id		CHAR(16)		NOT NULL		,
)
----------------------------------------------------------
-- [3] dbo.tbl_sales2 : ����(�ֹ�) ���̺�2
----------------------------------------------------------
CREATE TABLE dbo.tbl_sales2
(
	s2_num		INT				NOT NULL,		-- 2�� �÷��� �⺻Ű�� �����ű� ������ ���⼭ �⺻Ű ������ ����.
	s2_ordertem	INT				NOT NULL,		-- ��ǰ ���� �ѹ�
	p_id		NVARCHAR(50)	NOT NULL,		-- PRODUCT ID (��ǰ���̺�)
	qty			INT				NOT NULL,		-- ����
	otem_price	MONEY			NOT NULL,		-- ����
	PRIMARY KEY CLUSTERED
	(
		s2_num,
		s2_ordertem
	)
)

----------------------------------------------------------
-- [4] dbo.tbl_products : ��ǰ ���̺�
----------------------------------------------------------
CREATE TABLE dbo.tbl_products
(
	p_id		NVARCHAR(50)	NOT NULL		PRIMARY KEY,
	p_name		NVARCHAR(300)	NOT NULL		,
	p_price		MONEY			NOT NULL		,
	p_detail	NVARCHAR(1000)	NULL			, -- ��ǰ�󼼼���
	v_id		NVARCHAR(25)	NOT NULL		, -- ������
)

----------------------------------------------------------
-- [5] dbo.tbl_vendors : ������
----------------------------------------------------------
CREATE TABLE dbo.tbl_vendors
(
	-- ���� ��������
);

----------------------------------------------------------
-- �ܷ�Ű(FOREIGN KEY) ����
----------------------------------------------------------
ALTER TABLE dbo.tbl_sales1
DROP CONSTRAINT FK_AAA_BBB;

-- [1]
ALTER TABLE dbo.tbl_sales2
	ADD 
		CONSTRAINT FK_tbl_sales2_sales1
			FOREIGN KEY (s2_num)
				REFERENCES tbl_sales1 (s1_num),
		CONSTRAINT FK_tbl_sales2_products
			FOREIGN KEY (p_id)
				REFERENCES tbl_products (p_id)

EXEC sp_helpconstraint tbl_sales2;

-- [2]
ALTER TABLE dbo.tbl_sales1
	ADD 
		CONSTRAINT FK_tbl_sales1_members
			FOREIGN KEY (m_id)
				REFERENCES tbl_members (m_id);

EXEC sp_helpconstraint tbl_sales1;

-- [3]
-- �Ʒ��� ������ tbl_vendors ���̺��� ���� ������ �����غ�����.
ALTER TABLE dbo.tbl_products
	ADD
		CONSTRAINT FK_tbol_products_vendors
			FOREIGN KEY (v_id)
				REFERENCES tbl_vendors (v_id);
		
----------------------------------------------------------
-- INSERT DATA
----------------------------------------------------------
-- [1] dbo.tbl_members
SELECT * FROM dbo.tbl_members

-- �⺻�Է�
-- ȸ�����̺� �Է�
INSERT INTO dbo.tbl_members VALUES('antman', '��Ʈ��', '����', 'US', '010-1234-5678', 'antman@antman.com');
INSERT INTO dbo.tbl_members VALUES('batman', '��Ʈ��', '�λ�', 'US', '010-1234-5678', 'batman@batman.com');

-- UPDATE dbo.tbl_members
-- SET m_country = 'America';

-- �������̺� �Է�
SELECT * FROM dbo.tbl_sales1

INSERT INTO dbo.tbl_sales1 VALUES(1001, '2000-12-25 15:22:10', 'batman');
INSERT INTO dbo.tbl_sales1 VALUES(1002, '2002-12-25 15:22:10', 'antman');
INSERT INTO dbo.tbl_sales1 VALUES(1003, '2004-12-25 15:22:10', 'batman');






















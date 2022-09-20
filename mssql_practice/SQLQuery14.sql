-- [1]
CREATE TABLE dbo.tbl_primarykey
(
		A		INT		NOT NULL	PRIMARY KEY,
		B		INT		NOT NULL,
		C		INT		NOT NULL
)

INSERT INTO dbo.tbl_primarykey VALUES (1001, 1, 101);
INSERT INTO dbo.tbl_primarykey VALUES (1002, 1, 201);
INSERT INTO dbo.tbl_primarykey VALUES (1002, 2, 301); -- Error

-- [2]
CREATE TABLE dbo.tbl_primarykey88
(
		A		INT		NOT NULL,
		B		INT		NOT NULL,		
		C		INT		NOT NULL
		PRIMARY KEY CLUSTERED
		(
			A,
			B
		)
);

INSERT INTO dbo.tbl_primarykey88 VALUES (1001, 1, 101);
INSERT INTO dbo.tbl_primarykey88 VALUES (1002, 1, 201);
INSERT INTO dbo.tbl_primarykey88 VALUES (1002, 2, 301);

SELECT * FROM dbo.tbl_primarykey88;

-- [3]
CREATE TABLE dbo.tbl_test99
(
		A		INT				NOT NULL,
		B		INT				NOT NULL,
		C		CHAR(10)		NOT NULL,
		PRIMARY KEY CLUSTERED
		(
				A,
				B
		)
);

INSERT INTO dbo.tbl_test99 VALUES (1, 1, 'GT101');
INSERT INTO dbo.tbl_test99 VALUES (1, 2, 'GR201');
INSERT INTO dbo.tbl_test99 VALUES (2, 1, 'GC301');
INSERT INTO dbo.tbl_test99 VALUES (2, 2, 'GT102');
INSERT INTO dbo.tbl_test99 VALUES (2, 3, 'GR202');
INSERT INTO dbo.tbl_test99 VALUES (2, 4, 'GR202'); 

SELECT * FROM dbo.tbl_test99;

-- CLUSTERED INDEX VS NONCLUSTERED INDEX

CREATE TABLE dbo.tbl_customers
(
	cus_id		CHAR(10)		NOT NULL	PRIMARY KEY,  
	cus_name	NVARCHAR(20)	NOT NULL	UNIQUE,
	cus_class	NVARCHAR(20)	NOT NULL	UNIQUE
)

-- CHECK INDEX
EXECUTE sp_helpindex tbl_customers; -- clustered (����, �ڵ�����),
EXEC sp_helpindex tbl_customers;

-- INSERT (1)
INSERT INTO dbo.tbl_customers VALUES ('CCC', 'ȫ�浿', '����1');
INSERT INTO dbo.tbl_customers VALUES ('BBB', '��浿', '����2');
INSERT INTO dbo.tbl_customers VALUES ('AAA', '��浿', '����3');

-- SELECT
SELECT * FROM dbo.tbl_customers;

-- INSERT (2)
INSERT INTO dbo.tbl_customers VALUES ('YYY', 'Ȳ�浿', '����4');
INSERT INTO dbo.tbl_customers VALUES ('DDD', '���浿', '����5');

-- SELECT
SELECT * FROM dbo.tbl_customers;

-- NO INDEX
CREATE TABLE dbo.tbl_customers2
(
		cus_id		CHAR(10)		NOT NULL,
		cus_name	NVARCHAR(20)	NOT NULL,
		cus_class	NVARCHAR(20)	NOT NULL
)

-- CHECK INDEX
EXEC sp_helpindex tbl_customers2;

-- INSERT(1)
INSERT INTO dbo.tbl_customers2 VALUES ('CCC', 'ȫ�浿', '����1');
INSERT INTO dbo.tbl_customers2 VALUES ('BBB', '��浿', '����2');
INSERT INTO dbo.tbl_customers2 VALUES ('AAA', '��浿', '����3');

-- SELECT
SELECT * FROM dbo.tbl_customers2;

-- INSERT(2)
INSERT INTO dbo.tbl_customers2 VALUES ('YYY', 'Ȳ�浿', '����4');
INSERT INTO dbo.tbl_customers2 VALUES ('DDD', '���浿', '����5');

-- ������ ���� ���� �ߺ��ؼ� �Է��ص� ��.
INSERT INTO dbo.tbl_customers2 VALUES ('YYY', 'Ȳ�浿', '����4');
INSERT INTO dbo.tbl_customers2 VALUES ('DDD', '���浿', '����5');

-- SELECT
SELECT * FROM dbo.tbl_customers2;
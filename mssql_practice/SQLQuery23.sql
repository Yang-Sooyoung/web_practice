-- CREATE DATABASE
CREATE DATABASE [7TO7]

-- CHANGE DATABASE
USE [7TO7]

-- CREATE TABLE
----------------------------------------------------------
-- [1] dbo.tbl_members : 회원 테이블
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
-- [2] dbo.tbl_sales1 : 매출(주문) 테이블1
----------------------------------------------------------
CREATE TABLE dbo.tbl_sales1
(
	s1_num		INT				NOT NULL		PRIMARY KEY,
	s1_date		DATETIME		NOT NULL		,
	m_id		CHAR(16)		NOT NULL		,
)
----------------------------------------------------------
-- [3] dbo.tbl_sales2 : 매출(주문) 테이블2
----------------------------------------------------------
CREATE TABLE dbo.tbl_sales2
(
	s2_num		INT				NOT NULL,		-- 2개 컬럼을 기본키로 잡을거기 때문에 여기서 기본키 지정을 안함.
	s2_ordertem	INT				NOT NULL,		-- 상품 정렬 넘버
	p_id		NVARCHAR(50)	NOT NULL,		-- PRODUCT ID (상품테이블)
	qty			INT				NOT NULL,		-- 수량
	otem_price	MONEY			NOT NULL,		-- 가격
	PRIMARY KEY CLUSTERED
	(
		s2_num,
		s2_ordertem
	)
)

----------------------------------------------------------
-- [4] dbo.tbl_products : 상품 테이블
----------------------------------------------------------
CREATE TABLE dbo.tbl_products
(
	p_id		NVARCHAR(50)	NOT NULL		PRIMARY KEY,
	p_name		NVARCHAR(300)	NOT NULL		,
	p_price		MONEY			NOT NULL		,
	p_detail	NVARCHAR(1000)	NULL			, -- 상품상세설명
	v_id		NVARCHAR(25)	NOT NULL		, -- 벤더사
)

----------------------------------------------------------
-- [5] dbo.tbl_vendors : 벤더사
----------------------------------------------------------
CREATE TABLE dbo.tbl_vendors
(
	-- 직접 만들어보세요
);

----------------------------------------------------------
-- 외래키(FOREIGN KEY) 정의
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
-- 아래는 위에서 tbl_vendors 테이블을 직접 생성후 정의해보세요.
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

-- 기본입력
-- 회원테이블에 입력
INSERT INTO dbo.tbl_members VALUES('antman', '앤트맨', '서울', 'US', '010-1234-5678', 'antman@antman.com');
INSERT INTO dbo.tbl_members VALUES('batman', '배트맨', '부산', 'US', '010-1234-5678', 'batman@batman.com');

-- UPDATE dbo.tbl_members
-- SET m_country = 'America';

-- 매출테이블에 입력
SELECT * FROM dbo.tbl_sales1

INSERT INTO dbo.tbl_sales1 VALUES(1001, '2000-12-25 15:22:10', 'batman');
INSERT INTO dbo.tbl_sales1 VALUES(1002, '2002-12-25 15:22:10', 'antman');
INSERT INTO dbo.tbl_sales1 VALUES(1003, '2004-12-25 15:22:10', 'batman');






















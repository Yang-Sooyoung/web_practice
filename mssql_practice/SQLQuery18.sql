------------------------------------------------------------------------------
-- [!] 기본키 삭제 및 확인하는 다른 방법들
------------------------------------------------------------------------------

-- [1] 테이블 생성
-- 먼저 기본키 제약조건, 유니크 제약조건 없이 테이블을 생성해본다.
CREATE TABLE dbo.tbl_customers4
(
	cus_id		CHAR(10)		NOT NULL,
	cus_name	NVARCHAR(20)	NOT NULL,
	cus_class	NVARCHAR(20)	NOT NULL,
)

-- [2] 기본키 제약조건 추가
ALTER TABLE dbo.tbl_customers4
	  ADD
			CONSTRAINT PK_tbl_customers4 PRIMARY KEY CLUSTERED (cus_id)

EXEC sp_helpconstraint tbl_customers4;

-- [3] 기본키 삭제
-- A
ALTER TABLE dbo.tbl_customers4
	  DROP
			CONSTRAINT PK_tbl_customers4

-- B
ALTER TABLE dbo.tbl_customers4
	  DROP PK_tbl_customers4

-- [4] 기본키 확인(시스템뷰- 정보 스키마 뷰)
-- 데이터베이스 뷰쪽에 DB마다 생성이 되어 있다.
-- 테이블 각 컬럼에 대한 정보를 보거나 활용하고자 할 때 사용할 수 있다.
-- 조인 등을 통하여 여러 정보를 묶어서 활용할 수도 있다. 
-- FROM INFO~~.KEY~~ WHERE TABLE_NAME = ''
SELECT *
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_NAME = 'tbl_customers4'

------------------------------------------------------------------------------
-- [!] 기본키(제약조건) 존재시 삭제하기
------------------------------------------------------------------------------

-- [ 1 ] 테이블 생성
CREATE TABLE dbo.tbl_customers6
(	
	cus_id		CHAR(10)		NOT NULL		PRIMARY KEY,
	cus_name	NVARCHAR(20)	NOT NULL		UNIQUE,
	cus_class	NVARCHAR(20)	NOT NULL		UNIQUE,
)

EXEC sp_helpconstraint tbl_customers6; -- 나온 constraint_name 삭제할때 사용

-- [2] 기본키 삭제
ALTER TABLE dbo.tbl_customers6
	DROP
		CONSTRAINT PK_CUSID

-- [3] 기본키(제약조건) 추가
ALTER TABLE dbo.tbl_customers6
	ADD
		CONSTRAINT PK_CUSID PRIMARY KEY CLUSTERED (cus_id)

-- [4] 테이블 삭제
DROP TABLE dbo.tbl_customers6;


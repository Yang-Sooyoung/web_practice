-- 사전 셋팅
-- 데이터베이스 생성
CREATE DATABASE [9TO9];

-- 작업 DB 변경
USE [9TO9]





------------------------------------------------------------------------------
-- [!] PRIMARY KEY CONSTRAINT ADD / DROP
------------------------------------------------------------------------------

-- [1] 테이블 생성
-- 먼저 기본키 제약조건, 유니크 제약조건 없이 테이블을 생성해본다.
CREATE TABLE dbo.tbl_customers4
(
	cus_id		CHAR(10)		NOT NULL,
	cus_name	NVARCHAR(20)	NOT NULL,
	cus_class	NVARCHAR(20)	NOT NULL,
)

-- [2] 인덱스 확인
-- 기본키 지정이나 유니크 지정을 안했기 때문에 인덱스 확인을 해보면 없다라고 나온다.
EXEC sp_helpindex tbl_customers4;
--sp_helpindex tbl_customers4;

-- [3] 기본키 추가(제약조건 추가)
sp_helpconstraint tbl_customers4; -- 제약조건 확인

ALTER TABLE dbo.tbl_customers4
	  ADD	-- 제약조건 추가
			CONSTRAINT PK_tbl_customers4 PRIMARY KEY CLUSTERED (cus_id) -- CLUSTERED는 안써줘도 기본으로 클러스터드 인덱스 생성해줌.
GO

EXEC sp_helpindex tbl_customers4 -- 인덱스 확인
GO


-- [4] 기본키 제약조건 삭제
ALTER TABLE dbo.tbl_customers4
	   DROP	 -- unique 는 UQ
			 CONSTRAINT PK_tbl_customers4;
GO

EXEC sp_helpindex tbl_customers4 -- 인덱스 확인
GO

-- [5] 테이블 삭제
DROP TABLE dbo.tbl_customers4;




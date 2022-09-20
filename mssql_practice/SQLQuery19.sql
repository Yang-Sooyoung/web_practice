--------------------------------------------------------------------------------------
-- PK / UQ 입력값 차이점 비교하기
--------------------------------------------------------------------------------------

-- 테이블 생성
CREATE TABLE dbo.tbl_test
(
	cus_id		CHAR(10)		PRIMARY KEY,	--PK
	cus_name	CHAR(10)		UNIQUE,			--UQ
)

-- INSERT
INSERT INTO dbo.tbl_test VALUES ('AAA', 'AAA'); -- 가능
INSERT INTO dbo.tbl_test VALUES ('',''); -- 가능, 빈 값도 값임
INSERT INTO dbo.tbl_test VALUES ('NULL', 'BBB'); -- NULL이 아닌 문자값으로 인식하니까 가능.
INSERT INTO dbo.tbl_test VALUES (NULL, 'CCC'); -- 불가능, 기본키 제약조건에 NULL은 위배되기 때문에 안됨.
INSERT INTO dbo.tbl_test VALUES ('CCC', NULL); -- 가능, 유니크라도 NULL 입력은 가능. 특별히 NOT NULL로 지정 안했으면 가능.
INSERT INTO dbo.tbl_test VALUES ('DDD', 'NULL'); -- 가능

-- SELECT
SELECT * FROM dbo.tbl_test

-- DROP TABLE
DROP TABLE dbo.tbl_test;

--------------------------------------------------------------------------------------
-- [!] 기본키 직접 지정 실습하기
--------------------------------------------------------------------------------------

-- 테이블 생성1
CREATE TABLE dbo.tbl_pktset
(
	cus_id		CHAR(10)		NOT NULL	PRIMARY KEY,
	cus_name	NVARCHAR(20)	NOT NULL	,
)

-- 테이블 생성2
CREATE TABLE dbo.tbl_pktset2
(
	cus_id		CHAR(10)		NOT NULL	CONSTRAINT		PK_CUSID2		PRIMARY KEY,
	cus_name	NVARCHAR(20)	NOT NULL	,
)

-- 인덱스 확인
EXEC sp_helpindex tbl_pktset2
















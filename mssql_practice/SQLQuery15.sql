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
INSERT INTO dbo.tbl_customers VALUES('CCC', N'홍길동', N'씨앗1');
INSERT INTO dbo.tbl_customers VALUES('BBB', N'김길동', N'씨앗2');
INSERT INTO dbo.tbl_customers VALUES('AAA', N'장길동', N'씨앗3');
INSERT INTO dbo.tbl_customers VALUES('홍길동', 'HONG', N'씨앗4'); -- 한글 이름 입력
INSERT INTO dbo.tbl_customers VALUES('ParkGilDon', 'PARK', N'씨앗5'); -- 길의 주의(10글자)
INSERT INTO dbo.tbl_customers VALUES('GangGilDon', 'KANG', N'씨앗6');

DELETE FROM dbo.tbl_customers;


-- SELECT 
SELECT * 
FROM dbo.tbl_customers;

SELECT * 
FROM dbo.tbl_customers
ORDER BY cus_id DESC;

-- COLLATIONS 정보 보기
SELECT * FROM ::fn_helpcollations();

-- 인덱스 보기
--EXECUTE sp_helpindex tbl_customers;
--sp_helpindex tbl_customers;
EXEC sp_helpindex tbl_customers;

-- 데이터 전체 삭제
DELETE FROM dbo.tbl_customers;

SELECT * FROM dbo.tbl_customers;

-- 기본 데이터 정렬 속성값 변경(COLLATE 쿼리문 실습)
-- [ 1 ] 
-- DATABASE COLLATION 정보 보기
SELECT DATABASEPROPERTYEX('9TO9', 'COLLATION') AS COLLATION;
--SELECT DATABASEPROPERTYEX('9TO9', 'collation') AS COLLATION;
--SELECT DATABASEPROPERTYEX('9TO9', 'Collation') AS COLLATION;

-- [ 2 ]
-- DATABASE > TABLE COLLATION 정보 보기
EXEC sp_help tbl_customers;

-- [ 3 ]
-- 기본 데이터 정렬 속성 변경(DB)
-- 데이터베이스 COLLATION 정보를 변경한다는 것은 "기본 데이터 정렬" 속성을 변경한다는 뜻이다.
-- 그렇게되면 변경 이후에 생성되는 신규 테이블들은 변경된 "기본 데이터 정렬" 속성을 따라서 생성되게 된다.
-- 물론 변경전에 생성된 테이블들의 속성은 변하지 않는다. 생성시의 속성 상태가 유지된다.

-- ALTER(DB)
ALTER DATABASE [9TO9]
	  COLLATE Korean_Wansung_CI_AS;

SELECT DATABASEPROPERTYEX ('9TO9', 'COLLATION') AS COLLATION;

-- ALTER(TABLE > COLUMN)
ALTER TABLE dbo.tbl_customers
ALTER COLUMN cus_id CHAR(10)
COLLATE Korean_Wansung_CI_AS;






-- 기본 데이터 정렬 속성값 변경(GUI)
-- 작업 DB 변경
USE master;
DROP DATABASE [9TO9];






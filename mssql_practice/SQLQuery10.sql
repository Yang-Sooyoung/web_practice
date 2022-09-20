-- [!] 서브쿼리
-- SELECT 쿼리문 안에 다시 한번 SELECT 쿼리문이 들어있는 쿼리 형태이다.
-- 단일 SELECT 쿼리문 만으로는 어떤 조건식을 만들기 복잡할 때 쓴다.
-- 또는 서로 다른 테이블에서 데이터 값을 조회하여 본 쿼리의 조건으로 쓰고자 할 때도 사용한다.

-- [!] 기본적인 실습 순서
-- 1. 상품 테이블과 매출 테이블을 각각 만든다.
-- 2. 두 테이블에 필요한 제약 조건과 각각 기본키와 외래키를 지정한다.
-- 3. 상품 테이블에 상품을 입력한다.
-- 4. 매출 테이블에 매출 데이터를 쿼리로 입력한다.
-- 5. 각각의 테이블에 들어있는 값들을 모두 출력해보고 아래의 요구 쿼리를 작성하시오.

-- [!] 요구쿼리(=요구사항)
-- 제약 조건이 잘 수행되는지 확인하시오.
-- 공급가의 경우 출력시에는 소숫점 이하 생략하시오.(함수 사용)
-- 상품의 판매 수량이 1,000개 이상인 상품에 대해서 출력하시오.(서브 쿼리 사용)

-- [1] 데이터베이스 생성
CREATE DATABASE TESTDB3;

-- [2] 작업 DB 변경
USE TESTDB3;

-- [3] 테이블 생성
-- 상품 테이블
CREATE TABLE dbo.productTbl(
	p_code		CHAR(10)		PRIMARY KEY,				-- 상품 코드
	p_name		NVARCHAR(16)	NOT NULL,					-- 유니코드 지원
	p_date		DATE			NULL,						-- 입고일
	p_area		NVARCHAR(50)	DEFAULT N'생산지미정',		-- 생산지역
	p_money		MONEY			NULL,						-- 공급가격
	p_num		INT				IDENTITY		NOT NULL	-- IDENTITY(1,1)과 동일
);

-- 매출 테이블
-- [!] 외래키 지정
-- [!] [컬럼명][데이터형식] FOREIGN KEY REFERENCES [테이블명] ([컬럼명])
CREATE TABLE dbo.salesTbl (
	s_code		CHAR(10)		PRIMARY KEY,									-- 매출 코드
	s_branch	NVARCHAR(10)	NOT NULL,										-- 매출 지사
	s_p_code	CHAR(10)		FOREIGN KEY REFERENCES dbo.productTbl(p_code),	-- 상품 코드
	s_qty		SMALLINT		NULL,											-- 판매 수량
	s_date		DATE			NULL,											-- 매출일
	s_num		INT				IDENTITY		NOT NULL						-- IDENTITY(1,1)과 동일
);

-- [4] 데이터 입력
-- 상품 입력
INSERT INTO dbo.productTbl VALUES('GD101', '나이키', '2000-12-12', '미국', 900);
INSERT INTO dbo.productTbl VALUES('GD102', '아디다스', '2000-01-13', '독일', 450);
INSERT INTO dbo.productTbl VALUES('GD103', '프로스펙스', '2000-02-14', '한국', 720);
INSERT INTO dbo.productTbl VALUES('GD104', 'FILA', '2000-03-15', '영국', 500);

-- 매출 입력
INSERT INTO dbo.salesTbl VALUES ('ST001', '서울', 'GD101', '1700', '2022-01-01');
INSERT INTO dbo.salesTbl VALUES ('ST002', '서울', 'GD102', '1100', '2022-01-02');
INSERT INTO dbo.salesTbl VALUES ('ST003', '세종', 'GD103', '1400', '2022-01-03');
INSERT INTO dbo.salesTbl VALUES ('ST004', '부산', 'GD104', '700', '2022-01-04');
INSERT INTO dbo.salesTbl VALUES ('ST005', '광주', 'GD101', '2900', '2022-01-05');
INSERT INTO dbo.salesTbl VALUES ('ST006', '제주', 'GD103', '2100', '2022-01-06');
INSERT INTO dbo.salesTbl VALUES ('ST007', '제주', 'GD104', '300', '2022-01-07');

-- [5] 데이터 출력
SELECT *
FROM dbo.productTbl
ORDER BY p_num;

SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

-- 서브쿼리(IN)
SELECT
		'1,000개 이상 판매된 브랜드 -> '				AS '컬럼명',
		p_code											AS '상품코드',
		p_name											AS '상품명',
		p_area											AS '생산지',
		REPLACE(CONVERT(VARCHAR, p_money), '.00', '')	AS '공급가'
FROM	dbo.productTbl
WHERE	p_code IN (
		SELECT s_p_code
		FROM dbo.salesTbl
		WHERE s_qty >= 1000
);

-- [6] 데이터베이스 삭제(주의)
--USE MASTER;
--DROP DATABASE TESTDB3;







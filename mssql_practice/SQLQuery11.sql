-- [!] 서브쿼리 IN


-- [1] 데이터베이스 생성
CREATE DATABASE TESTDB5;

-- [2] 작업 DB 변경
USE TESTDB5;

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
--INSERT INTO 테이블명 (
--						컬럼1, 컬럼2, 컬럼3, 컬럼4, 컬럼5
--)
--VALUES
--					 ('값1', '값2', '값3', '값4', '값5'),
--					 ('값1', '값2', '값3', '값4', '값5'),
--					 ('값1', '값2', '값3', '값4', '값5'),
--					 ('값1', '값2', '값3', '값4', '값5');
			
-- 상품 입력 [!실습]
INSERT INTO dbo.productTbl 
VALUES	('GD101', '나이키', '2000-12-12', '미국', 900),
		('GD102', '아디다스', '2000-01-13', '독일', 450),
		('GD103', '프로스펙스', '2000-02-14', '한국', 720),
		('GD104', 'FILA', '2000-03-15', '영국', 500);




-- 상품 입력
INSERT INTO dbo.productTbl 
VALUES('GD101', '나이키', '2000-12-12', '미국', 900);

INSERT INTO dbo.productTbl 
VALUES('GD102', '아디다스', '2000-01-13', '독일', 450);

INSERT INTO dbo.productTbl 
VALUES('GD103', '프로스펙스', '2000-02-14', '한국', 720);

INSERT INTO dbo.productTbl 
VALUES('GD104', 'FILA', '2000-03-15', '영국', 500);

-- 매출 입력
INSERT INTO dbo.salesTbl 
VALUES ('ST001', '서울', 'GD101', 1200, '2010-01-01');

INSERT INTO dbo.salesTbl 
VALUES ('ST002', '서울', 'GD102', 700, '2008-01-02');

INSERT INTO dbo.salesTbl 
VALUES ('ST003', '세종', 'GD103', 3600, '2022-01-03');

INSERT INTO dbo.salesTbl 
VALUES ('ST004', '부산', 'GD104', 2800, '2012-01-04');

INSERT INTO dbo.salesTbl
VALUES ('ST005', '광주', 'GD101', 1400, '2011-01-05');

INSERT INTO dbo.salesTbl 
VALUES ('ST006', '제주', 'GD103', 4400, '2002-01-06');

INSERT INTO dbo.salesTbl 
VALUES ('ST007', '제주', 'GD104', 800, '2021-01-07');

INSERT INTO dbo.salesTbl 
VALUES ('ST008', '강릉', 'GD103', 1800, '2020-01-07');

INSERT INTO dbo.salesTbl 
VALUES ('ST009', '서울', 'GD102', 1000, '2020-01-07');

INSERT INTO dbo.salesTbl 
VALUES ('ST010', '제주', 'GD104', 2800, '2020-01-07');

INSERT INTO dbo.salesTbl 
VALUES ('ST011', '강릉', 'GD101', 200, '2022-12-14');

-- [5] 데이터 출력
SELECT *
FROM dbo.productTbl
ORDER BY p_num;

SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

-- 서브쿼리(IN)
-- IN 연산자는 서브쿼리로 수행되어져서 나오는 결과 레코드(행)의 연관성이 높다.
-- 즉, 서브쿼리가 반환하는 결과 레코드 값이 단일 값이냐 아니냐에 따라 사용여부가 결정된다.
-- 서브쿼리가 단일 반환값인 경우 IN 연산자를 사용해도 또는 안해도 된다. (= 등의 기타 연산자 사용)
-- 하위 쿼리에서 값을 둘 이상 반환하는 경우에는 신경을 좀 써야한다.
-- 서브 쿼리에 DISTINCT 사용도 가능하다.
SELECT
		p_code											AS '상품코드',
		p_name											AS '상품명',
		p_area											AS '생산지',
		REPLACE(CONVERT(VARCHAR, p_money), '.00', '')	AS '공급가'
FROM	dbo.productTbl
--WHERE p_code = 'GD101' or p_code = 'GD103';
WHERE	p_code IN (
		SELECT DISTINCT s_p_code
		FROM dbo.salesTbl
		WHERE s_qty >= 3000
);

-------------------------------------------------------------------------------
-- SELECT 이외에서 서브쿼리 사용
-- Q) 매출 테이블에서 판매수량이 제일 적은 최솟값 레코드(행)를 0으로 수정하시오.
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

-- 서브쿼리를 모르는 경우
-- 1. 수량 검색 > 2. 해당 레코드 업데이트
SELECT MIN(s_qty)
FROM dbo.salesTbl;

UPDATE dbo.salesTbl
SET s_qty = 300
WHERE s_qty = 0;

-- 서브쿼리를 아는 경우
UPDATE dbo.salesTbl
SET s_qty = 0
WHERE s_qty = (
				SELECT MIN(s_qty) FROM dbo.salesTbl
);
-------------------------------------------------------------------------------
-- Q) 매출테이블에서 판매수량이 제일 많은 행을 찾아서 삭제하시오.
DELETE FROM dbo.salesTbl;

DELETE FROM dbo.productTbl;

-- 서브쿼리 작성
DELETE FROM dbo.salesTbl
WHERE s_qty = (
				SELECT MAX(s_qty) FROM dbo.salesTbl
);

SELECT * FROM dbo.salesTbl
ORDER BY s_num;

-------------------------------------------------------------------------------
-- Q1) 매출테이블에서 매출일이 가장 오래된 날짜의 상품을 출력하시오.
-- (=사원 테이블에서 입사일이 가장 오래된 사원의 직함과 입사일을 출력하시오)
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

SELECT MIN(s_date) 
FROM dbo.salesTbl;

SELECT *
FROM dbo.salesTbl
WHERE s_date = (
				SELECT MIN(s_date) FROM dbo.salesTbl
);

-- Q2) 매출테이블에서 각 지사별 평균판매 수량을 출력하시오.
-- 출력은 지점이름과 평균판매만 내림차순으로 하시오.
SELECT * FROM dbo.salesTbl
ORDER BY s_num;

SELECT s_branch AS '지점이름', AVG(s_qty) AS '평균 판매수량'
FROM dbo.salesTbl
GROUP BY s_branch
ORDER BY '평균 판매수량' DESC;

-- Q3) 매출 테이블에서 판매수량이 제주 지점의 최소 매출보다 적게 기록한 지점명, 판매수량, 매출날짜를 출력하시오.
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

SELECT MIN(s_qty)
FROM dbo.salesTbl
WHERE s_branch = '강릉';

SELECT s_branch AS '지점이름', s_qty AS '판매수량', s_date AS '매출날짜'
FROM dbo.salesTbl
WHERE s_qty < ( SELECT MIN(s_qty)
				FROM dbo.salesTbl
				WHERE s_branch = '제주'
)
ORDER BY '판매수량' DESC;

-- Q4) 각 지점별 판매수량 평균을 출력하시오.
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

SELECT s_branch '지점이름', AVG(s_qty) '평균 판매수량'
FROM dbo.salesTbl
GROUP BY s_branch
ORDER BY '평균 판매수량' DESC;

-- Q5) 매출 테이블에서 날짜별 판매수량이 각 지점별 평균보다 낮은 지점명과 매출날짜, 판매수량을 출력하시오.
SELECT *
FROM dbo.salesTbl
ORDER BY s_num;

SELECT s_branch '지점명', s_date '매출날짜', s_qty '판매수량'
FROM dbo.salesTbl S1
WHERE s_qty < ( SELECT AVG(s_qty) 
				FROM dbo.salesTbl S2
				WHERE S2.s_branch = s1.s_branch 
)
ORDER BY s_date ASC;



-------------------------------------------------------------------------------
-- [6] 데이터베이스 삭제(주의)
USE MASTER;
DROP DATABASE TESTDB5;



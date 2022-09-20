-- [1] 비교연산자
-- >, <, =, >=, <=, <>, !=, !>, !<
-- 내가 원하는 조건의 데이터만을 가져올 때 사용한다.
-- 판매수량이 25 이상인 수량의 행을 출력하시오.
SELECT *
FROM dbo.sales
WHERE qty >= 25
ORDER BY qty DESC;

-- [2] >(큼) 연산자 잘못쓰면 구문 에러가 난다.
SELECT *
FROM dbo.sales
WHERE qty >=25
ORDER BY qty DESC;

-- [3] BETWEEN A AND B : 두 값 사이에 있는 값을 출력
SELECT *
FROM dbo.sales
WHERE qty BETWEEN 25 AND 40
ORDER BY qty;

-- [4] BETWEEN에 NOT 사용
SELECT *
FROM dbo.sales
WHERE qty
NOT BETWEEN 25 AND 40
ORDER BY qty;

-- [5] BETWEEN에 날짜 사용 (쿼리 타이핑 방식, 세로로)
SELECT *
FROM dbo.sales
WHERE ord_date
BETWEEN '1993-09-13' AND '1994-09-14'
ORDER BY ord_date;

-- [6] 비교 연산자의 결과는 Boolean 데이터 형식이다.
-- 이 결과에는 TRUE, FALSE, UNKNOWN이라는 세 가지 값이 있다.

USE AdventureWorks2019;

DECLARE @p_id int;	-- INT 정수형 변수 선언
SET @p_id = 750;	-- 750 값 셋팅

IF (@p_id <> 0)
	SELECT productID, Name, ProductNumber
	FROM Production.Product
	WHERE productId = @p_id
;

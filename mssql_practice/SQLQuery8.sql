-- 집계함수
-- 전체 레코드가 몇 개인지? 전체 합이 얼마인지? 평균이 얼마인지? 등을 구해준다.
-- 즉, 각각의 행을 하나로 묶어서 하나의 단일 값을 반환해준다.
-- AVG(평균), COUNT(갯수), MAX(최댓값), MIN(최솟값), SUM(합계)

-- [1] AVG 함수
-- 예) titles 테이블의 책 가격들에 대해서 평균을 출력하시오.
SELECT AVG(price) 
FROM dbo.titles;

-- [2] COUNT 함수
-- 예) titles 테이블의 책들에 대해서 총 갯수를 출력하시오.
SELECT COUNT(*) 
FROM dbo.titles;


-- 예) titles 테이블의 책 값이 있는 것에 대해서만 갯수를 출력하시오.
SELECT COUNT(price) -- NULL은 제외하고 계산한다는 것을 알 수 있음.
FROM dbo.titles;

-- 비단 COUNT 함수 뿐만 아니라 계산이 필요한 AVG 함수도 NULL은 제외된다. (상식)


-- [3] NULL은 겁색시 중요한 변수로 작용한다.
-- 예를 들어, SUM 함수와 COUNT 함수를 같이 사용하는 경우를 보자.
-- 아래의 1번과 2번은 다른 결과 값을 출력한다.
-- 예1) 테이블의 책 값 평균을 구하시오.
-- 예2) 테이블의 책 값이 있는 책들의 평균을 구하시오.

-- 예제 2번의 경우는 2가지 방식이 있다.
-- AVG 함수를 쓰거나 SUM/COUNT 하면 된다. 단, 이때 열 지정을 주의해서 해야한다.
SELECT AVG(price)
FROM dbo.titles; -- 14.7662

SELECT SUM(price)/COUNT(price) -- 236.26 / 16 = 14.7662
FROM dbo.titles;

-- 각각의 값 비교
SELECT SUM(price) AS 총합
FROM dbo.titles; -- 총합

SELECT COUNT(price) AS '책 값이 있는 책의 갯수'
FROM dbo.titles; -- 16

SELECT COUNT(*) AS 총갯수 -- 모든 레코드를 반환
FROM dbo.titles; -- 18

-- [4] NULL 값을 제외시키는 쿼리 구성은 어떻게 하나?
-- WHERE 조건절을 붙여서 NULL 여부를 체크해주면 된다.
SELECT COUNT(*) 
FROM dbo.titles; -- 18

SELECT COUNT(*)
FROM dbo.titles
WHERE price IS NOT NULL; -- 16

-- [!] 아래의 두 쿼리를 잘 기억하자! ★★★★★
SELECT SUM(price) /COUNT(price)
FROM dbo.titles;  -- 236.26 / 16 = 14.7662

SELECT SUM(price) /COUNT(*)
FROM dbo.titles
WHERE price IS NOT NULL; -- 236.26 / 16 = 14.7662

-- [5] MAX, MIN 함수 사용
SELECT MAX(price) AS 최댓값 
FROM dbo.titles;

SELECT MIN(price) AS 최솟값
FROM dbo.titles;

















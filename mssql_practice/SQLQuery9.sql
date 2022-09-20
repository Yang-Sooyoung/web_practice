-- GROUP BY / HAVING
-- 집계 함수와 함께 많이 사용되는 절이 GROUP BY 절이다.
-- 예를 들면, 어떤 테이블에 카테고리 분류 열이 있다면 각 카테고리별로 그룹을 만들 수 이싿.
-- 각 카테고리별로 그룹을 묶으면 그룹별 평균 등을 집계하기 좋다.
-- GROUP은 결국 특정 컬럼(열)을 기준으로 집계를 낸다는 뜻이다.

-- [1] 기본형식
--SELECT [GROUP BY 절의 지정 컬럼] [집계할 값]
--FROM [테이블 명]
--GROUP BY [그룹 묶음 컬럼]

-- [2] titles 테이블에서 각 type 별로 카테고리를 그룹지어서 출력하시오.
SELECT type, AVG(price) AS 평균
FROM dbo.titles
GROUP BY type;

-- [3] 정렬도 가능하다.
-- 단, 평균으로 정렬시는 주의해야 한다. 특히 집계함수 사용시 주의.
SELECT type, AVG(price) AS '각 카테고리별 평균 책값'
FROM dbo.titles
GROUP BY type
ORDER BY type ASC;
--ORDER BY AVG(price) DESC


-- [4] 조건도 가능하다.
-- 이때 HAVING 절을 사용하면 된다.
-- HAVING은 GROUP BY로 가져온 결과 값에 대해서 조건을 붙여 원하는 값만 출력시킬 수 있다.
-- 예) 각 카테고리별로 그룹을 묶어서 출력시 평균 책값이 15달러 이상만 출력하시오.

SELECT type, AVG(price) AS '각 카테고리별 평균 책값'
FROM dbo.titles
GROUP BY type
HAVING AVG(price) >= 15;

-- HAVING절은 GROUP BY절 뒤에 쓴다.
-- GROUP BY절로 그룹지어 가져온 결과 값에 대해서 조건을 붙여주는 것이기 때문이다.


-- [4-1] 각 그룹별로 카운트
SELECT type AS t, COUNT(type) AS '그룹별 책 갯수', AVG(price) AS ap
FROM dbo.titles
GROUP BY type
ORDER BY ap DESC;

-- [4-2] 평균 책 값이 가장 큰 TOP 3 출력
SELECT TOP 3 type AS t, COUNT(type) AS '그룹별 책 갯수', AVG(price) AS ap
FROM dbo.titles
GROUP BY type
ORDER BY ap DESC;

-- [4-3] 평균 책 값이 가장 큰 TOP 3 출력 - 정수형으로 변환 // LEFT(AVG(price), 2)
SELECT TOP 3 type AS t, COUNT(type) AS '그룹별 책 갯수', CONVERT(INT, AVG(price)) AS ap
FROM dbo.titles
GROUP BY type
ORDER BY ap DESC;

-- [4-4] 평균 책 값이 가장 큰 TOP 3 출력 - 정수형으로 변환 - WITH TIES 사용
SELECT TOP 3 WITH TIES type AS t, COUNT(type) AS '그룹별 책 갯수', CONVERT(INT, AVG(price)) AS ap
FROM dbo.titles
GROUP BY type
ORDER BY ap DESC;

-- [5] WHERE절과 HAVING절을 같이 사용할 때는 주의해야 한다.
-- WHERE > GROUP BY > HAVING 절의 순서대로 기억하자.
-- 사실 상식적으로 생각해보면 당연한 순서이기 때문에 그렇게 어렵거나 복잡한건 아니다.
-- 예) 책 가격이 11달러 이상에서		각 카테고리 타입별로 묶어서			평균 가격이 17달러 이상만 출력하시오.
SELECT type, AVG(price) AS '각 카테고리별 평균 책값'
FROM dbo.titles
WHERE price >= 11			-- (1) 책값이 11달러 이상만 추려냄.
GROUP BY type				-- (2) 추려낸 것들에서 각 타입별로 그룹을 묶어줌.
HAVING AVG(price) >= 17;	-- (3) 묶은 그룹별로 조건을 또 붙인다.

-- [6] 위 쿼리에다 정렬을 적용하시오.
SELECT type, AVG(price) AS '각 카테고리별 평균 책값'
FROM dbo.titles
WHERE price >= 10
GROUP BY type
HAVING AVG(price) >= 17
ORDER BY AVG(price) ASC;

-- [7] GROUP BY ALL
-- GROUP BY로 각 카테고리별 평균을 구할 때 조건에 맞는 값이 없는 경우도 나올 수 있다.
-- 그럼 NULL 값을 가지는데 일반적인 경우 GROUP BY는 그런 NULL을 출력하지 않는다.
-- ALL은 반대로 그럴 때 사용하면 NULL을 그대로 출력시켜준다.
-- 따라서 ALL을 사용하면 조건에서 어떤 항목이 제외되었는지를 명확히 알 수 있게 된다.
-- 즉, 어떤 항목이 제외되었는지를 명확히 나타내고자 할 떄 사용한다.

-- 예1)
SELECT type, AVG(price) AS 평균가격
FROM dbo.titles
WHERE price >= 21
GROUP BY type;

-- 예2)
SELECT type, AVG(price) AS 평균가격
FROM dbo.titles
WHERE price >= 21
GROUP BY ALL type;

-- [8] GROUP BY ALL과 NOT IN 사용 쿼리
-- 예1) titles 테이블에서 카테고리별 평균 책값을 출력하시오. 단, 아래 카테고리는 제외하시오.
--		(제외 카테고리) mod_cook, psychology, trad_cook, UNDECIDED
-- 예2) 각 카테고리별 평균 책값을 출력시 위에서 제외된 카테고리도 모두 출력하시오.
--		(즉, NULL 값의 경우라도 목록을 제외시키지 말고 가져오라는 뜻이다.)

-- 예1)
SELECT type, AVG(price) AS 평균가격
FROM dbo.titles
WHERE type NOT IN ('mod_cook', 'psychology', 'trad_cook', 'UNDECIDED')
GROUP BY type
ORDER BY AVG(price) DESC;

-- 예2)
SELECT type, AVG(price) AS 평균가격
FROM dbo.titles
WHERE type NOT IN ('mod_cook', 'psychology', 'trad_cook', 'UNDECIDED')
GROUP BY ALL type
ORDER BY AVG(price) DESC;













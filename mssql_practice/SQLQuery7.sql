-- 논리 연산자
-- DB로 부터 데이터 검색 시 AND, OR, NOT 등을 사용한다.
-- AND는 '그리고', OR는 '또는'으로 해석된다.
-- NOT은 조건을 만족하지 않는 것을 검색하고자 할 때 사용한다.

-- [1] AND 연산자
-- 예) Price 열의 값이(가격) 15달러 이상이면서 Type이 psychology(심리학)를 출력하시오.

SELECT *
FROM dbo.titles
WHERE price > 15 AND type='psychology'
ORDER BY price;

-- [2] OR 연산자
-- 예) 그대로 위의 예제에 OR를 적용해보자.
SELECT *
FROM dbo.titles
WHERE price > 20 OR type='psychology'
ORDER BY price;

-- [3] NOT 연산자
-- 예) 그대로 위의 예제에 NOT을 적용해서 가격이 15달러 이상이 아닌 행들을 출력하시오.
SELECT *
FROM dbo.titles
WHERE NOT price > 15
ORDER BY price;


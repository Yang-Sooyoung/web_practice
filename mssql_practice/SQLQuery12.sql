-- 이때 메인쿼리는 서브쿼리로 한 행씩 넘긴다.
-- 서브쿼리에서는 한 행(여기선 상품코드)씩 받아서 조건을 수행한다. 이렇게 나온 결과를 다시 메인으로 넘긴다.
-- 메인쿼리에서 넘어온 값을 조건과 비교하여 최종 결과를 출력한다.

-- Q) 매출테이블에서 각 상품(브랜드)별 신발 판매수량이 각 상품별 평균 판매수량 보다 높은 매출을 출력하시오.
SELECT * FROM dbo.salesTbl ORDER BY s_num;

SELECT * FROM dbo.salesTbl AS S1
WHERE s_qty > (
			SELECT AVG(s_qty) FROM dbo.salesTbl AS S2 WHERE S2.s_p_code = S1.s_p_code
);


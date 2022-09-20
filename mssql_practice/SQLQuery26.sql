--------------------------------------------------------
--JOIN (3개 이상 테이블 조인 실습)
--------------------------------------------------------
-- 아래에서 조인은 결국 2개이고 마지막 AND 조건은 상품명에 대한 조건일 뿐이다.
-- 조인이 3개라고 생각하면 안된다. 조인은 2개이다.
-- 셀렉트절에 별칭을 안써주고 m_id 하면 명칭이 불확실하다고 구문에러 표시가 나온다.
-- 별칭은 DBMS 마다 다르다. SQL Server는 특별히 써줘도 안써줘도(AS) 상관없다.
-- Q. 김치냉장고(GS103)를 구매한 고객의 아이디와 이름을 알고 싶다면?
SELECT * FROM dbo.tbl_members;
SELECT * FROM dbo.tbl_sales1; --(m_id 회원아이디), (s1_num 주문코드)
SELECT * FROM dbo.tbl_sales2;

--JOIN
SELECT M.m_id, m_name, m_address, m_tel, m_email
	FROM 
		dbo.tbl_members AS M, dbo.tbl_sales1 AS S1, dbo.tbl_sales2 AS S2
	WHERE 
		S1.m_id = M.m_id
	AND
		S1.s1_num = S2.s2_num
	AND
		S2.p_id = 'GS103'

-- SUBQUERY
-- 조인은 보통 같은 결과물을 서브쿼리로도 만들 수 있다.
-- 조인과 서브쿼리중 어느쪽이 더 성능이 좋을지는 사실 정확한 답은 없다.
-- 다양한 조건 등이 영향을 미치기 때문에 다양한 테스트를 통해 판단하여야 한다.
-- 일반적으로 (상관)서브쿼리보다는 조인을 선호하고 더 좋게보는데 사실 조건이 다 다르므로 절대적인건 아니다.

SELECT m_id, m_name, m_address, m_tel, m_email
FROM dbo.tbl_members 
WHERE m_id IN (SELECT m_id 
			   FROM dbo.tbl_sales1 
			   WHERE s1_num IN (SELECT s2_num 
								FROM dbo.tbl_sales2 
								WHERE p_id = 'GS103'))













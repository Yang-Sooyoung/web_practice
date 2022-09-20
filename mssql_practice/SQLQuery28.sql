--------------------------------------------------------
-- [2] VIEW 생성 및 삭제 그리고 사용 : 재활용 ↑
--------------------------------------------------------
-- 뷰 생성
--CREATE VIEW MembersSales1Sales2
--	AS
--		-- 뷰로 묶을 쿼리문 작성
--		-- 뷰는 쿼리로 작성하는 가상 테이블이다.
--		SELECT M.m_id, m_name, m_address, m_tel, m_email
--			FROM
--				dbo.tbl_members M, dbo.tbl_sales1 S1, dbo.tbl_sales2 S2
--			WHERE
--				S1.m_id = M.m_id
--			AND
--				S1.s1_num = S2.s2_num
--			AND
--				S2.p_id = 'GS103'

-- 뷰 삭제
--DROP VIEW dbo.MembersSales1Sales2

-- 뷰 사용
--SELECT m_id, m_name
--FROM dbo.MembersSales1Sales2

--------------------------------------------------------
-- [3] VIEW 생성 및 삭제 그리고 사용 : 재활용 ↑
--------------------------------------------------------
/*
-- 뷰 생성
CREATE VIEW MS1S2
	AS
		-- 뷰로 묶을 쿼리문 작성
		-- 뷰는 쿼리로 작성하는 가상 테이블이다.
		SELECT M.m_id, m_name, m_address, m_tel, m_email, p_id
			FROM
				dbo.tbl_members M, dbo.tbl_sales1 S1, dbo.tbl_sales2 S2
			WHERE
				S1.m_id = M.m_id
			AND
				S1.s1_num = S2.s2_num

-- 뷰 삭제
DROP VIEW MS1S2
*/
-- 뷰 사용
-- 이런식으로 상품코드만 입력하면 손쉽게 결과물을 출력할 수 있도록 재활용할 수 있게 '뷰'를 만들면 좋다.
-- 신입사원이나 초보자라도 '뷰'만 있으면 복잡한 쿼리(조인)문을 못짜도 사용은 언제든 가능.
-- 이것이 뷰를 쓰는 이유이고 가장 큰 장점이다.
-- 주로 읽기 전용으로 활용된다.
SELECT m_id, m_name, m_address, m_tel, m_email
FROM dbo.MS1S2
WHERE p_id = 'GS103'

--------------------------------------------------------
-- [4] VIEW 활용 : 시스템뷰
--------------------------------------------------------
-- 뷰 확인
-- 뷰를 만들면 뷰의 이름이 sysobjects 테이블에 저장된다.
-- 뷰 열에 간한 정보는 syscolumns 테이블에 추가
-- 뷰 종속 관계에 관한 정보는 sysdepends 테이블에 추가.
-- CREATE VIEW 문의 텍스트는 syscomments 테이블에 추가.
--SELECT * FROM sysobjects
SELECT * FROM sys.objects

-- 시스템뷰 활용
-- 이러한 뷰를 활용하면 특정 객체를 찾는데 유용하다.
-- 고급 과정을 공부하는 과정에서는 이러한 뷰를 특히 많이 활용하게 된다.
-- Q. 특정 컬럼이 포함된 테이블을 찾고 싶다면 어떻게 할까?
SELECT *
	FROM 
		INFORMATION_SCHEMA.COLUMNS
	WHERE
		-- COLUMN_NAME = 's1_date';
		COLUMN_NAME LIKE '%_num%';






-- 회원테이블, 매출테이블을 각각 출력하면 원하는 정보를 보기가 어렵다.
SELECT * FROM dbo.tbl_members		-- 회원 정보를 볼 수 있다.
SELECT * FROM dbo.tbl_sales1		-- 매출 정보를 볼 수 있다.

-- ADD INSERT
INSERT INTO dbo.tbl_members VALUES('bookman', '도서맨', '전주', '한국', '010-1234-0000', 'bookman@bookman.com');
INSERT INTO dbo.tbl_members VALUES('flowerman', '화분맨', '청주', '한국', '010-1234-0000', 'flowerman@flowerman.com');

-- 결제한 회원에 대한 이름, 주소, 이메일을 보고자 한다면?
-- 바로 이러한 상황에서 조인이 아니고서는 손쉽게 볼 수 있는 방법이 없다.
-- 조인을 사용하면 이러한 정보들을 손쉽게 볼 수 있다.
SELECT m_name, m_address, m_email
	FROM 
		dbo.tbl_members, dbo.tbl_sales1
	WHERE 
		dbo.tbl_members.m_id = dbo.tbl_sales1.m_id

-- 위 쿼리를 별칭을 사용하여 출력해본다.
-- 이때 아이디 정보도 같이 출력한다.
SELECT M.m_id, m_name, m_address, m_email
	FROM
		dbo.tbl_members AS M, dbo.tbl_sales1 AS S
	WHERE
		M.m_id = S.m_id;


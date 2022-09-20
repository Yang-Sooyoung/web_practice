---------------------------------------------------
-- [!] 날짜 관련해서 많이 해보게되는 문제들
---------------------------------------------------

-- 테이블 생성
CREATE TABLE dbo.tbl_date77
(
		-- 기본키 지정시 이름을 알기쉽게 내가 직접 지정한다.
		cus_id		CHAR(10)		NOT NULL		CONSTRAINT		PK_CUSID		PRIMARY KEY,
		cus_name	NVARCHAR(20)	NOT NULL,
		cus_date	DATE			NOT NULL
)

EXEC sp_helpindex tbl_date77;

-- INSERT
INSERT INTO dbo.tbl_date77 VALUES ('aaa', N'강길동', '2000-01-01');
INSERT INTO dbo.tbl_date77 VALUES ('bbb', N'박길동', '2000-10-01');
INSERT INTO dbo.tbl_date77 VALUES ('ccc', N'장호랑', '2001-04-01');
INSERT INTO dbo.tbl_date77 VALUES ('ddd', N'성진길', '2001-12-01');
INSERT INTO dbo.tbl_date77 VALUES ('eee', N'유정걸', '2002-03-01');
INSERT INTO dbo.tbl_date77 VALUES ('fff', N'왕용인', '2002-11-01');
INSERT INTO dbo.tbl_date77 VALUES ('ggg', N'김호수', '2003-07-01');
INSERT INTO dbo.tbl_date77 VALUES ('hhh', N'박길산', '2003-12-01');
INSERT INTO dbo.tbl_date77 VALUES ('kkk', N'이공항', '2004-09-01');
INSERT INTO dbo.tbl_date77 VALUES ('mmm', N'오대산', '2004-02-01');

-- SELECT
SELECT * FROM dbo.tbl_date77;


-- Q1. 회원 아이디가 mmm에 대해서 날짜를 5일 연장하고 싶다면?
-- Error
UPDATE dbo.tbl_date77
SET	cus_date = (cus_date +5)
WHERE cus_id = 'mmm'

-----------------------------------------------------------------------------------------
-- [!] DATEADD 함수
-----------------------------------------------------------------------------------------
-- 어떤 날짜에 기간을 더하는 함수이다.
-- 형식 : DATEADD ( datepart, number, date )
-- 형식 : DATEADD ( 더할날짜단위, 간격(더할숫자), 날짜(컬럼명) )
-----------------------------------------------------------------------------------------

-- 일(DAY) 단위
SELECT DATEADD(DAY, 5, '2004-02-01');

-- 월(MONTH) 단위
SELECT DATEADD(MONTH, 6, '2004-02-01');
SELECT DATEADD(MONTH, 12, '2004-02-01');

-- 년(YEAR) 단위
SELECT DATEADD(YEAR, 1, '2004-02-01');

-- Q1. 회원 아이디가 mmm에 대해서 날짜를 5일 연장하고 싶다면?

UPDATE dbo.tbl_date77
SET	cus_date = DATEADD(DAY, 5, [cus_date])
WHERE cus_id = 'mmm'

-- SELECT
SELECT * FROM dbo.tbl_date77;

-- Q2. 회원 이름이 강길동에 대해서 날짜를 6개월 추가시키고 싶다면?
SELECT * FROM dbo.tbl_date77

UPDATE dbo.tbl_date77
SET cus_date = DATEADD(MONTH, 6, [cus_date]) -- 2000-07-01
WHERE cus_name = '강길동';

-- Q3. 강길동에게 다시 한번 더 6개월을 연장시키면 년도가 바뀌는지 확인하고 싶다면?
-- 위 퀴리를 한번 더 수행하고 결과를 확인하자.

-- Q4. 회원 아이디가 eee에 대해서 기간을 5일 뺴고 싶다면?
--		3/1 --> 3/1, 2/28, 27, 26, 25 이렇게 5일을 빼므로 최종 결과는 2/24
SELECT * FROM dbo.tbl_date77

UPDATE dbo.tbl_date77
SET	cus_date = DATEADD(DAY, -5, [cus_date]) -- 2/24
WHERE cus_id = 'eee';

-- Q5. 데이터를 수정이나 변경하지 않고 10일 추가된 결과만 보고 싶다면?
SELECT * FROM dbo.tbl_date77

SELECT DATEADD(DAY, 10, [cus_date]) AS '10일씩 연장적용'
FROM dbo.tbl_date77


-- Q6. 실제(원래) 마감일(2002-11-05) 보다 10일 연장된 날짜 마감을 넘긴 회원은 몇명인지 알고 싶다면?
SELECT *
FROM dbo.tbl_date77
WHERE cus_date > DATEADD(DAY, 10, '2002-11-05') --2002-11-15

-- B (변수 사용)
DECLARE @aaa INT;			 -- 변수선언	@변수명		데이터타입
SET @aaa = 10;				 -- 값 대입
-- SELECT @aaa AS 변수값출력

DECLARE @bbb DATE;
SET @bbb = '2002-11-05';	 -- 원래 마감일
-- SELECT @bbb

-- 연장된 마감일
DECLARE @duedate DATE = DATEADD(DAY, @aaa, @bbb);

SELECT COUNT(*) AS '연장 마감일을 넘긴 회원 수'
FROM dbo.tbl_date77
WHERE cus_date > @duedate;







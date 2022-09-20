--데이터베이스 생성
CREATE DATABASE TESTDB3;

--작업DB변경
USE TestDB3;

--테이블 생성
CREATE TABLE dbo.sampleTbl (
	COL1	INT				IDENTITY	PRIMARY KEY,	-- (1,1)의 경우는 IDENTITY로만 가능
	COL2	NVARCHAR(20)	DEFAULT N'★♥★'	NULL,
	COL3	NVARCHAR(20)						NULL,
	COL4	DATE			DEFAULT GETDATE(),		--현재날짜
	COL5	TIME			DEFAULT GETDATE()		--현재시각
);

--데이터 입력
INSERT INTO dbo.sampleTbl(COL3) 
VALUES(NULL);

INSERT INTO dbo.sampleTbl(COL2, COL3)
VALUES('대한민국', '서울');


--데이터 출력
SELECT *
FROM dbo.sampleTbl;


--데이터베이스 삭제(주의)
USE master
DROP DATABASE TESTDB3;

--USE DATABASE TESTDB3
;

--GETDATE()
SELECT GETDATE() AS 현재시각;

--CONVERT 함수 사용
--데이터형식을 다른 형식으로 바꿔주는 함수
--사용법 : CONVERT( 데이터타입, 변경대상, 변경하고자 하는 형식); 1, 사선 100 빈칸 101 사선 102 콤마 108 시간
--SELECT CONVERT(VARCHAR(8), GETDATE(), 108) AS 'CONVERT';

--8자리 또는 10자리로 입력 , 10자리는 날짜 8자리는 시간
SELECT CONVERT(VARCHAR(8), GETDATE(), 101) AS 'CONVERT';


SELECT CONVERT(VARCHAR(8), GETDATE(), 8) AS 'CONVERT';

--데이터 출력
SELECT * FROM dbo.sampleTbl;

-- LEFT 함수 사용해서 출력
SELECT COL1, COL2, COL3, COL4, LEFT(COL5, 8) AS '타임' FROM dbo.sampleTbl
;

--CONVERT 함수 사용
SELECT CONVERT(VARCHAR(8), COL5, 108) AS '시:분:초' FROM dbo.sampleTbl;


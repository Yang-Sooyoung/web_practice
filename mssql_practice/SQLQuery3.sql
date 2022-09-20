--[1]TestDB2 데이터베이스 생성
CREATE DATABASE TestDB2;

USE TestDB2
;

--[2]테이블 생성
CREATE TABLE dbo.testTable (
	mem_num smallint NOT NULL,
	mem_nation varchar(25) NOT NULL,
	mem_name varchar(30) NOT NULL,
	mem_birthday date,
	mem_income_tax money
)
;

EXEC sp_rename 'dbo.testTabel', 'testTable';

--[3]데이터 입력
INSERT dbo.testTable 
	VALUES
		(1, N'한국', N'홍길동★', '1977-07-07', '1500.00'),
		(2, N'미국', N'Jackson♥', '1980-08-08', '2500.00'),
		(3, N'태국', N'สวัสดี', '1982-12-25', 1700.00),
		(4, N'베트남', N'chào', '1990-11-11', 1400.00),
		(5, N'중국', N'你好', '1985-10-25', 1100.00),
		(6, N'일본', N'こんにちは', '1992-10-25', 2200.00)
;

--[4]데이터 출력
SELECT *
FROM dbo.testTable
;

DELETE
FROM dbo.testTable
;

--[5]테이블의 데이터형식을 변경
ALTER TABLE dbo.testTable
	ALTER COLUMN mem_name nvarchar(30);
;

--[6]데이터베이스 삭제
USE MASTER;

--[7] 
DROP DATABASE TestDB2;






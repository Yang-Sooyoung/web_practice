--[1] 데이터베이스 생성
CREATE DATABASE TESTDB3;

--[2] 작업DB 변경
USE TESTDB3;

--[3] 테이블 생성, 직원 입사/퇴사 테이블
CREATE TABLE dbo.employeeTbl (
	mem_idx		INT				IDENTITY	PRIMARY KEY,				--IDENTITY(1,1)과 동일
	mem_id		CHAR(16)		UNIQUE		NOT NULL,					--영문만 들어오는 경우
	mem_name	NVARCHAR(16)				NOT NULL,					--유니코드 지원
	mem_s_date	DATE						NULL,						--입사일
	mem_e_date	DATE						NULL,						--퇴사일
	mem_reason	NVARCHAR(50)				DEFAULT N'일신상의 사유',	--퇴사사유
	mem_email	VARCHAR(30)		UNIQUE		NOT NULL					--이메일
);

--[4] 데이터 입력(1)
INSERT INTO dbo.employeeTbl
VALUES ('fireman', '파이어맨', '2010-12-12', '2018-12-25', '해외이민', 'fireman@test.com');

INSERT INTO dbo.employeeTbl(mem_id, mem_name, mem_s_date, mem_email)
VALUES ('antman', '앤트맨', '2010-12-12', 'antman@test.com'); --NOT NULL만 입력

--[5] 데이터 입력(2)


--[6] 데이터 출력
SELECT *
FROM dbo.employeeTbl;

--[7] 데이터베이스 삭제(주의)
--USE master;
--DROP DATABASE TESTDB3;
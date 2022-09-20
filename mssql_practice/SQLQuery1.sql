CREATE TABLE dbo.memberTbl (

	mem_id		varchar(16)		PRIMARY KEY,
	mem_name	nchar(10)		NOT NULL,
	mem_gender	char(1)			NOT NULL,
	mem_join	date			NOT NULL,
	mem_email	varchar(90)


);


ALTER TABLE dbo.memberTbl 
ADD	mem_point int NULL
;


ALTER TABLE dbo.memberTb3 
ADD	mem_point77 int NULL
;

ALTER TABLE dbo.memberTb3
DROP COLUMN mem_point55
;

ALTER TABLE dbo.memberTb3
DROP COLUMN mem_point3
;

ALTER TABLE dbo.memberTb3
ADD mem_point int Null
;

/***** SSMS의 SelectTopNRows 명령 스크립트 *****/
SELECT TOP (1000) [mem_id]
	,[mem_name]
	,[mem_gender]
	,[mem_join]
	,[mem_email]
	,[mem_point]
FROM [TestDB].[dbo].[memberTb3]
;

ALTER TABLE dbo.memberTb3
ADD mem_point3 int DEFAULT'1' NOT NULL
;

ALTER TABLE dbo.memberTb3
ADD mem_point4 int IDENTITY(1,2) NOT NULL
;

ALTER TABLE dbo.memberTb1 
	DROP COLUMN
		mem_point2,
		mem_point3,
		mem_point4,
		mem_point5,
		mem_point6,
		mem_point7
;

EXEC sp_rename 'dbo.memberTbl.mem_point', 'mem_point77';

EXEC sp_rename 'dbo.memberTbl77', 'memberTbl';

SELECT * FROM sys.dm_sql_referencing_entities ('dbo.titleauthor','OBJECT');

SELECT name, type, type_desc FROM sys.objects;

SELECT a.referencing_schema_name, a.referencing_entity_name, b.name, b.type, b.type_desc
FROM sys.dm_sql_referencing_entities ('dbo.titleauthor','OBJECT') a INNER JOIN sys.objects b
ON a.referencing_id = b.object_id
;

ALTER TABLE dbo.memberTbl
ALTER COLUMN mem_point smallint;

ALTER TABLE dbo.memberTbl
ALTER COLUMN mem_point int;

EXEC sp_columns memberTbl;

EXEC sp_help memberTbl;

SELECT * FROM sys.columns ORDER BY name;

SELECT * FROM sys.tables;

SELECT	table_name, column_name, column_default, data_type, character_maximum_length
FROM	INFORMATION_SCHEMA.COLUMNS
ORDER BY character_maximum_length DESC;

SELECT	
		table_name AS '테이블명', 
		column_name AS' 컬럼명',
		column_default AS '기본값',
		data_type AS '데이터형식', 
		character_maximum_length AS '최대길이'
FROM	INFORMATION_SCHEMA.COLUMNS
ORDER BY character_maximum_length ASC;
;

ALTER TABLE dbo.memberTbl
	ADD
		mem_idt		char(1)		DEFAULT		NULL
;

ALTER TABLE dbo.memberTbl
	ADD
		mem_level	nchar(10)	DEFAULT N'Novice'	 NULL
;

EXEC sp_helpconstraint memberTbl; -- 1. 제약조건 확인

ALTER TABLE dbo.memberTbl -- 2. 제약조건 삭제
	DROP CONSTRAINT DF__memberTbl__mem_l__4222D4EF
;

ALTER TABLE dbo.memberTbl -- 3. 제약조건 있던 컬럼 삭제
	DROP COLUMN mem_level
;

UPDATE dbo.memberTbl 
	SET 
		mem_level = DEFAULT
;

UPDATE dbo.memberTbl 
	SET 
		mem_level = NULL
;

UPDATE dbo.memberTbl -- 특정 행에 값 변경
	SET 
		mem_level='EXPERT',
		mem_point=7000
	WHERE mem_id='hong'
;

UPDATE dbo.memberTbl -- 널값에 데이터 채우기
	SET
		mem_level=ISNULL(mem_level, N'Novice')
;

UPDATE dbo.memberTbl
	SET
		mem_level=UPPER(mem_level)
;

UPDATE dbo.memberTbl
	SET
		mem_level=LOWER(mem_level)
;

SELECT 
UPPER('korea seoul');


SELECT 
LOWER(mem_level) AS 회원레벨 FROM memberTbl;
 
UPDATE dbo.memberTbl 
	SET mem_level=NULL
	WHERE mem_level='Novice'
;

SELECT *, --mem_id, mem_name, mem_gender
ISNULL(mem_level, '값없음') AS 회원레벨 FROM dbo.memberTbl
;


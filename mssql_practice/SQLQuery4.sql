--�����ͺ��̽� ����
CREATE DATABASE TESTDB3;

--�۾�DB����
USE TestDB3;

--���̺� ����
CREATE TABLE dbo.sampleTbl (
	COL1	INT				IDENTITY	PRIMARY KEY,	-- (1,1)�� ���� IDENTITY�θ� ����
	COL2	NVARCHAR(20)	DEFAULT N'�ڢ���'	NULL,
	COL3	NVARCHAR(20)						NULL,
	COL4	DATE			DEFAULT GETDATE(),		--���糯¥
	COL5	TIME			DEFAULT GETDATE()		--����ð�
);

--������ �Է�
INSERT INTO dbo.sampleTbl(COL3) 
VALUES(NULL);

INSERT INTO dbo.sampleTbl(COL2, COL3)
VALUES('���ѹα�', '����');


--������ ���
SELECT *
FROM dbo.sampleTbl;


--�����ͺ��̽� ����(����)
USE master
DROP DATABASE TESTDB3;

--USE DATABASE TESTDB3
;

--GETDATE()
SELECT GETDATE() AS ����ð�;

--CONVERT �Լ� ���
--������������ �ٸ� �������� �ٲ��ִ� �Լ�
--���� : CONVERT( ������Ÿ��, ������, �����ϰ��� �ϴ� ����); 1, �缱 100 ��ĭ 101 �缱 102 �޸� 108 �ð�
--SELECT CONVERT(VARCHAR(8), GETDATE(), 108) AS 'CONVERT';

--8�ڸ� �Ǵ� 10�ڸ��� �Է� , 10�ڸ��� ��¥ 8�ڸ��� �ð�
SELECT CONVERT(VARCHAR(8), GETDATE(), 101) AS 'CONVERT';


SELECT CONVERT(VARCHAR(8), GETDATE(), 8) AS 'CONVERT';

--������ ���
SELECT * FROM dbo.sampleTbl;

-- LEFT �Լ� ����ؼ� ���
SELECT COL1, COL2, COL3, COL4, LEFT(COL5, 8) AS 'Ÿ��' FROM dbo.sampleTbl
;

--CONVERT �Լ� ���
SELECT CONVERT(VARCHAR(8), COL5, 108) AS '��:��:��' FROM dbo.sampleTbl;


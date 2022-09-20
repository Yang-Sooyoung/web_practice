--[1] �����ͺ��̽� ����
CREATE DATABASE TESTDB3;

--[2] �۾�DB ����
USE TESTDB3;

--[3] ���̺� ����, ���� �Ի�/��� ���̺�
CREATE TABLE dbo.employeeTbl (
	mem_idx		INT				IDENTITY	PRIMARY KEY,				--IDENTITY(1,1)�� ����
	mem_id		CHAR(16)		UNIQUE		NOT NULL,					--������ ������ ���
	mem_name	NVARCHAR(16)				NOT NULL,					--�����ڵ� ����
	mem_s_date	DATE						NULL,						--�Ի���
	mem_e_date	DATE						NULL,						--�����
	mem_reason	NVARCHAR(50)				DEFAULT N'�ϽŻ��� ����',	--������
	mem_email	VARCHAR(30)		UNIQUE		NOT NULL					--�̸���
);

--[4] ������ �Է�(1)
INSERT INTO dbo.employeeTbl
VALUES ('fireman', '���̾��', '2010-12-12', '2018-12-25', '�ؿ��̹�', 'fireman@test.com');

INSERT INTO dbo.employeeTbl(mem_id, mem_name, mem_s_date, mem_email)
VALUES ('antman', '��Ʈ��', '2010-12-12', 'antman@test.com'); --NOT NULL�� �Է�

--[5] ������ �Է�(2)


--[6] ������ ���
SELECT *
FROM dbo.employeeTbl;

--[7] �����ͺ��̽� ����(����)
--USE master;
--DROP DATABASE TESTDB3;
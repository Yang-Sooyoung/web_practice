 --[1] AAA��� �����ͺ��̽��� ����
 CREATE DATABASE AAA;
 
 --[2] AAA��� �����ͺ��̽����� �۾�
 USE AAA;

 --[3] AAATABLE ����
 CREATE TABLE AAATABLE (ID VARCHAR(16) NULL, PW VARCHAR(16) NULL, AGE TINYINT NULL);

 --[4] AAATABLE �ڷ��Է�
 INSERT INTO DBO.AAATABLE
 VALUES('HONGKILDONG', '123ABC', 30);

 --[5] AAATABLE �ڷ����
 SELECT ID AS ���̵�,PW AS ��й�ȣ, AGE AS ����
 FROM DBO.AAATABLE
 ;

 --[6] AAATABLE ����
 DROP TABLE dbo.AAATABLE 
 ;

 --[7] ��밡�� DB������ MASTER�� ����
 USE MASTER;

 --[8] �ٽ� AAA �����ͺ��̽� ����
 DROP DATABASE AAA;


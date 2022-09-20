--------------------------------------------------------------
-- Ʈ�����(TRANSACTION)
--------------------------------------------------------------
-- ���� SELECT�� �����͸� Ȯ��
SELECT * FROM dbo.tbl_sales2;

-- [1] ����� Ʈ�����
-- Ʈ����� �̸��� �����.
-- ������� ���� ���������� ��� ���������� AUTO COMMIT�� �ȴ�.
-- Ʈ����� ������ ������ �����ݷ�(;)�� �������̴�.
-- DELETE ������ ����� �����ؼ� �������ϸ� ���� �����Ǵ� ����!
-- �ݵ�� Ʈ����� ������ ��ü�� ������� �����ϰ� �����Ѵ�.
-- Ʈ����� ����
BEGIN TRANSACTION
	-- GS104 �Ǵ� GS105 ���Ż�ǰ ����
	-- ���� ������ �ۼ�
	INSERT INTO dbo.tbl_sales2 VALUES (1005, 3, 'GS104', 1, 220000);
	DELETE FROM dbo.tbl_sales2 WHERE p_id = 'GS102'
	SELECT * FROM dbo.tbl_sales2

-- ROLLBACK�� ó�� ����� �ǵ�������, COMMIT�� ���� ����ȴ�.
ROLLBACK TRANSACTION

-- [2] �پ��� Ʈ����� ǥ���
-- 1.BEGIN TRANSACTION - ROLLBACK(COMMIT)
-- 2.BEGIN TRAN - ROLLBACK(COMMIT) (TRAN)

-- [3] Ʈ����� ī��Ʈ
/*
BEGIN TRAN
	SELECT @@TRANCOUNT
	UPDATE dbo.tbl_sales2 SET qty=10 WHERE s2_num=1004
	SELECT * FROM dbo.tbl_sales2
COMMIT

SELECT @@TRANCOUNT
*/

-- [4] Ʈ����� TRY ~ CATCH ���� ���
-- TRY ... CATCH ������ ���� ��κ��� ������� ������ CATCH ���ش�.
-- TRY ��� ������ ��ٷ� CATCH ����� �̾ �ۼ��Ѵ�.
-- TRY ... CATCH ������ ���� �ϰ� ó���� ���� ����� �� ����.
-- ������ Ȯ��
SELECT * FROM dbo.tbl_sales2

BEGIN TRY
	BEGIN TRANSACTION;

		--DELETE	FROM dbo.tbl_sales2 WHERE p_id IN ('GS104', 'GS105');
		INSERT INTO dbo.tbl_sales2 VALUES (1005, 3, 'GS104', 1, 220000);
		INSERT INTO dbo.tbl_sales2 VALUES (1005, 4, 'GS105', 1, 330000);
		SELECT * FROM dbo.tbl_sales2;

		-- TRY ~ CATCH ������ ���� ������ ��Ƽ� �ѹ��Ű�� ������ �� �������� ����Ǿ� ����.
		SELECT 1/0; -- ERROR!!
	COMMIT TRANSACTION;	
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH

SELECT @@TRANCOUNT

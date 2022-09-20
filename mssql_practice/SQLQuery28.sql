--------------------------------------------------------
-- [2] VIEW ���� �� ���� �׸��� ��� : ��Ȱ�� ��
--------------------------------------------------------
-- �� ����
--CREATE VIEW MembersSales1Sales2
--	AS
--		-- ��� ���� ������ �ۼ�
--		-- ��� ������ �ۼ��ϴ� ���� ���̺��̴�.
--		SELECT M.m_id, m_name, m_address, m_tel, m_email
--			FROM
--				dbo.tbl_members M, dbo.tbl_sales1 S1, dbo.tbl_sales2 S2
--			WHERE
--				S1.m_id = M.m_id
--			AND
--				S1.s1_num = S2.s2_num
--			AND
--				S2.p_id = 'GS103'

-- �� ����
--DROP VIEW dbo.MembersSales1Sales2

-- �� ���
--SELECT m_id, m_name
--FROM dbo.MembersSales1Sales2

--------------------------------------------------------
-- [3] VIEW ���� �� ���� �׸��� ��� : ��Ȱ�� ��
--------------------------------------------------------
/*
-- �� ����
CREATE VIEW MS1S2
	AS
		-- ��� ���� ������ �ۼ�
		-- ��� ������ �ۼ��ϴ� ���� ���̺��̴�.
		SELECT M.m_id, m_name, m_address, m_tel, m_email, p_id
			FROM
				dbo.tbl_members M, dbo.tbl_sales1 S1, dbo.tbl_sales2 S2
			WHERE
				S1.m_id = M.m_id
			AND
				S1.s1_num = S2.s2_num

-- �� ����
DROP VIEW MS1S2
*/
-- �� ���
-- �̷������� ��ǰ�ڵ常 �Է��ϸ� �ս��� ������� ����� �� �ֵ��� ��Ȱ���� �� �ְ� '��'�� ����� ����.
-- ���Ի���̳� �ʺ��ڶ� '��'�� ������ ������ ����(����)���� ��¥�� ����� ������ ����.
-- �̰��� �並 ���� �����̰� ���� ū �����̴�.
-- �ַ� �б� �������� Ȱ��ȴ�.
SELECT m_id, m_name, m_address, m_tel, m_email
FROM dbo.MS1S2
WHERE p_id = 'GS103'

--------------------------------------------------------
-- [4] VIEW Ȱ�� : �ý��ۺ�
--------------------------------------------------------
-- �� Ȯ��
-- �並 ����� ���� �̸��� sysobjects ���̺� ����ȴ�.
-- �� ���� ���� ������ syscolumns ���̺� �߰�
-- �� ���� ���迡 ���� ������ sysdepends ���̺� �߰�.
-- CREATE VIEW ���� �ؽ�Ʈ�� syscomments ���̺� �߰�.
--SELECT * FROM sysobjects
SELECT * FROM sys.objects

-- �ý��ۺ� Ȱ��
-- �̷��� �並 Ȱ���ϸ� Ư�� ��ü�� ã�µ� �����ϴ�.
-- ��� ������ �����ϴ� ���������� �̷��� �並 Ư�� ���� Ȱ���ϰ� �ȴ�.
-- Q. Ư�� �÷��� ���Ե� ���̺��� ã�� �ʹٸ� ��� �ұ�?
SELECT *
	FROM 
		INFORMATION_SCHEMA.COLUMNS
	WHERE
		-- COLUMN_NAME = 's1_date';
		COLUMN_NAME LIKE '%_num%';






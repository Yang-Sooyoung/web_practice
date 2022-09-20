--------------------------------------------------------
--JOIN (3�� �̻� ���̺� ���� �ǽ�)
--------------------------------------------------------
-- �Ʒ����� ������ �ᱹ 2���̰� ������ AND ������ ��ǰ�� ���� ������ ���̴�.
-- ������ 3����� �����ϸ� �ȵȴ�. ������ 2���̴�.
-- ����Ʈ���� ��Ī�� �Ƚ��ְ� m_id �ϸ� ��Ī�� ��Ȯ���ϴٰ� �������� ǥ�ð� ���´�.
-- ��Ī�� DBMS ���� �ٸ���. SQL Server�� Ư���� ���൵ �Ƚ��൵(AS) �������.
-- Q. ��ġ�����(GS103)�� ������ ���� ���̵�� �̸��� �˰� �ʹٸ�?
SELECT * FROM dbo.tbl_members;
SELECT * FROM dbo.tbl_sales1; --(m_id ȸ�����̵�), (s1_num �ֹ��ڵ�)
SELECT * FROM dbo.tbl_sales2;

--JOIN
SELECT M.m_id, m_name, m_address, m_tel, m_email
	FROM 
		dbo.tbl_members AS M, dbo.tbl_sales1 AS S1, dbo.tbl_sales2 AS S2
	WHERE 
		S1.m_id = M.m_id
	AND
		S1.s1_num = S2.s2_num
	AND
		S2.p_id = 'GS103'

-- SUBQUERY
-- ������ ���� ���� ������� ���������ε� ���� �� �ִ�.
-- ���ΰ� ���������� ������� �� ������ �������� ��� ��Ȯ�� ���� ����.
-- �پ��� ���� ���� ������ ��ġ�� ������ �پ��� �׽�Ʈ�� ���� �Ǵ��Ͽ��� �Ѵ�.
-- �Ϲ������� (���)�����������ٴ� ������ ��ȣ�ϰ� �� ���Ժ��µ� ��� ������ �� �ٸ��Ƿ� �������ΰ� �ƴϴ�.

SELECT m_id, m_name, m_address, m_tel, m_email
FROM dbo.tbl_members 
WHERE m_id IN (SELECT m_id 
			   FROM dbo.tbl_sales1 
			   WHERE s1_num IN (SELECT s2_num 
								FROM dbo.tbl_sales2 
								WHERE p_id = 'GS103'))













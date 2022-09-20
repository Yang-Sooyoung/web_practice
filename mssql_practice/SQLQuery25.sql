-- ȸ�����̺�, �������̺��� ���� ����ϸ� ���ϴ� ������ ���Ⱑ ��ƴ�.
SELECT * FROM dbo.tbl_members		-- ȸ�� ������ �� �� �ִ�.
SELECT * FROM dbo.tbl_sales1		-- ���� ������ �� �� �ִ�.

-- ADD INSERT
INSERT INTO dbo.tbl_members VALUES('bookman', '������', '����', '�ѱ�', '010-1234-0000', 'bookman@bookman.com');
INSERT INTO dbo.tbl_members VALUES('flowerman', 'ȭ�и�', 'û��', '�ѱ�', '010-1234-0000', 'flowerman@flowerman.com');

-- ������ ȸ���� ���� �̸�, �ּ�, �̸����� ������ �Ѵٸ�?
-- �ٷ� �̷��� ��Ȳ���� ������ �ƴϰ��� �ս��� �� �� �ִ� ����� ����.
-- ������ ����ϸ� �̷��� �������� �ս��� �� �� �ִ�.
SELECT m_name, m_address, m_email
	FROM 
		dbo.tbl_members, dbo.tbl_sales1
	WHERE 
		dbo.tbl_members.m_id = dbo.tbl_sales1.m_id

-- �� ������ ��Ī�� ����Ͽ� ����غ���.
-- �̶� ���̵� ������ ���� ����Ѵ�.
SELECT M.m_id, m_name, m_address, m_email
	FROM
		dbo.tbl_members AS M, dbo.tbl_sales1 AS S
	WHERE
		M.m_id = S.m_id;


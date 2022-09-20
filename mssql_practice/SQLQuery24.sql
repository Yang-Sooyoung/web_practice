-- ���� ���Ἲ ����(����) �׽�Ʈ
-- ���̺�� ���̺��� ���踦 �ΰԵǸ�(�ܷ�Ű ����) �����ϴ� ���̺��� ���� �ƴ� �ٸ� ���� ���� �� ����.
-- ���� �Էµ� ���� �����ϴ� ���̺��� ���� �ƴ� �ٸ� ������ ����, ������ ���� ����.
-- ���� ���Ἲ�� ����ǹǷ� �̷��� ������ �� �� ����.
-- �����ͺ��̽�(RDBMS) �ý����� �ϰ����ְ� �����Ͱ� ������ �� �ֵ��� �����Ѵ�.

SELECT * FROM dbo.tbl_sales1

-- ����/����
UPDATE dbo.tbl_sales1
	SET
		m_id = 'batman'
	WHERE
		s1_num = '1001'

-- ���޽�Ű�� ���� ���� �߿��ϴ�.

------------------------------------------------------
-- INSERT DATA
------------------------------------------------------

-- [1] dbo.tbl_members
-- ���� ������ ��¥, ����Ʈ ���� �÷��� �ȸ�������Ƿ� ���� �ʿ信 ���� ������ ��.
SELECT * FROM dbo.tbl_members

-- �⺻�Է�
INSERT INTO dbo.tbl_members VALUES ('antman', '��Ʈ��', '����', 'America', ' 010-1234-5678', 'antman@antman.com');

-- �̷��� ���̺�� ���� �÷����� ��� �ȴ�. �÷��� ���� ����� �ȳ� �� ����.
INSERT INTO dbo.tbl_members (m_id, m_name, m_address, m_country, m_tel, m_email)
VALUES ('batman', '��Ʈ��', '��õ', 'Korea', ' 010-1234-5678', 'batman@batman.com');

-- �����Է�
INSERT INTO dbo.tbl_members (m_id, m_name, m_address, m_country,  m_tel, m_email)
VALUES ('superman', '���۸�', '��õ', 'Canada', ' 010-1234-5678', 'superman@superman.com'),
	   ('skyman', '�ϴø�', '����', 'Russia', ' 010-1234-5678', 'skyman@skyman.com'),
	   ('brickman', '������', '�λ�', 'China', ' 010-1234-5678', 'brickman@brickman.com');

--UPDATE dbo.tbl_members
--SET m_address = '��õ'
--WHERE m_id = 'batman';

-- [2] dbo.tbl_products
SELECT * FROM dbo.tbl_products

INSERT INTO dbo.tbl_products (p_id, p_name, p_price, p_detail, v_id)
VALUES ('GS101', '�ڷ�����', 990000, 'Ŀ������� �̷������� �ֽ��� ��', '��Ű�ݼ�'),
	   ('GS102', '�����', 770000, '�������� �󸰵��� �� ������ �����', '����'),
	   ('GS103', '��ġ�����', 550000, '��ġ�� ���� ��ġ����� �ְ�', '����'),
	   ('GS104', '�����', 440000, '������� ������ ���� �ְ��� �����', '��Ƽ��'),
	   ('GS105', '��ǻ��', 2200000, '���迡�� �ְ�� ������ ��ǻ�� �׷�', '�׷�');

--UPDATE dbo.tbl_products
--SET p_price= 2200000
--WHERE p_name = '��ǻ��';

-- [3] dbo.tbl_sales1
SELECT * FROM dbo.tbl_sales1
--DELETE FROM dbo.tbl_sales1

INSERT INTO dbo.tbl_sales1 (s1_num, s1_date, m_id)
VALUES (1001, '2000-12-25 15:22:10', 'batman'), -- ���ǿ��� ������ ���� �ϱ����ؼ� 1001�� �Է���.
	   (1002, '2000-12-26 17:12:04', 'antman'),
	   (1003, '2000-12-27 16:55:40', 'batman'),
	   (1004, '2000-12-28 20:21:20', 'skyman'),
	   (1005, '2000-12-29', 'brickman'); -- ��, ��, �� ������ ��� O

-- [4] dbo.tbl_sales2
SELECT * FROM dbo.tbl_sales2

INSERT INTO dbo.tbl_sales2 (s2_num, s2_ordertem, p_id, qty, otem_price)
VALUES (1001, 1, 'GS101', 1, 990000),
	   (1001, 2, 'GS102', 1, 770000),
	   (1001, 3, 'GS103', 1, 550000);

-- �����Է�
INSERT INTO dbo.tbl_sales2 VALUES (1002, 1, 'GS101', 1, 990000);
INSERT INTO dbo.tbl_sales2 VALUES (1003, 1, 'GS103', 1, 550000);
INSERT INTO dbo.tbl_sales2 VALUES (1004, 1, 'GS102', 1, 770000);
INSERT INTO dbo.tbl_sales2 VALUES (1005, 1, 'GS104', 1, 440000);
INSERT INTO dbo.tbl_sales2 VALUES (1005, 2, 'GS105', 1, 2200000);



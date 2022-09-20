-- [1] �񱳿�����
-- >, <, =, >=, <=, <>, !=, !>, !<
-- ���� ���ϴ� ������ �����͸��� ������ �� ����Ѵ�.
-- �Ǹż����� 25 �̻��� ������ ���� ����Ͻÿ�.
SELECT *
FROM dbo.sales
WHERE qty >= 25
ORDER BY qty DESC;

-- [2] >(ŭ) ������ �߸����� ���� ������ ����.
SELECT *
FROM dbo.sales
WHERE qty >=25
ORDER BY qty DESC;

-- [3] BETWEEN A AND B : �� �� ���̿� �ִ� ���� ���
SELECT *
FROM dbo.sales
WHERE qty BETWEEN 25 AND 40
ORDER BY qty;

-- [4] BETWEEN�� NOT ���
SELECT *
FROM dbo.sales
WHERE qty
NOT BETWEEN 25 AND 40
ORDER BY qty;

-- [5] BETWEEN�� ��¥ ��� (���� Ÿ���� ���, ���η�)
SELECT *
FROM dbo.sales
WHERE ord_date
BETWEEN '1993-09-13' AND '1994-09-14'
ORDER BY ord_date;

-- [6] �� �������� ����� Boolean ������ �����̴�.
-- �� ������� TRUE, FALSE, UNKNOWN�̶�� �� ���� ���� �ִ�.

USE AdventureWorks2019;

DECLARE @p_id int;	-- INT ������ ���� ����
SET @p_id = 750;	-- 750 �� ����

IF (@p_id <> 0)
	SELECT productID, Name, ProductNumber
	FROM Production.Product
	WHERE productId = @p_id
;

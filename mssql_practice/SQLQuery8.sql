-- �����Լ�
-- ��ü ���ڵ尡 �� ������? ��ü ���� ������? ����� ������? ���� �����ش�.
-- ��, ������ ���� �ϳ��� ��� �ϳ��� ���� ���� ��ȯ���ش�.
-- AVG(���), COUNT(����), MAX(�ִ�), MIN(�ּڰ�), SUM(�հ�)

-- [1] AVG �Լ�
-- ��) titles ���̺��� å ���ݵ鿡 ���ؼ� ����� ����Ͻÿ�.
SELECT AVG(price) 
FROM dbo.titles;

-- [2] COUNT �Լ�
-- ��) titles ���̺��� å�鿡 ���ؼ� �� ������ ����Ͻÿ�.
SELECT COUNT(*) 
FROM dbo.titles;


-- ��) titles ���̺��� å ���� �ִ� �Ϳ� ���ؼ��� ������ ����Ͻÿ�.
SELECT COUNT(price) -- NULL�� �����ϰ� ����Ѵٴ� ���� �� �� ����.
FROM dbo.titles;

-- ��� COUNT �Լ� �Ӹ� �ƴ϶� ����� �ʿ��� AVG �Լ��� NULL�� ���ܵȴ�. (���)


-- [3] NULL�� �̻��� �߿��� ������ �ۿ��Ѵ�.
-- ���� ���, SUM �Լ��� COUNT �Լ��� ���� ����ϴ� ��츦 ����.
-- �Ʒ��� 1���� 2���� �ٸ� ��� ���� ����Ѵ�.
-- ��1) ���̺��� å �� ����� ���Ͻÿ�.
-- ��2) ���̺��� å ���� �ִ� å���� ����� ���Ͻÿ�.

-- ���� 2���� ���� 2���� ����� �ִ�.
-- AVG �Լ��� ���ų� SUM/COUNT �ϸ� �ȴ�. ��, �̶� �� ������ �����ؼ� �ؾ��Ѵ�.
SELECT AVG(price)
FROM dbo.titles; -- 14.7662

SELECT SUM(price)/COUNT(price) -- 236.26 / 16 = 14.7662
FROM dbo.titles;

-- ������ �� ��
SELECT SUM(price) AS ����
FROM dbo.titles; -- ����

SELECT COUNT(price) AS 'å ���� �ִ� å�� ����'
FROM dbo.titles; -- 16

SELECT COUNT(*) AS �Ѱ��� -- ��� ���ڵ带 ��ȯ
FROM dbo.titles; -- 18

-- [4] NULL ���� ���ܽ�Ű�� ���� ������ ��� �ϳ�?
-- WHERE �������� �ٿ��� NULL ���θ� üũ���ָ� �ȴ�.
SELECT COUNT(*) 
FROM dbo.titles; -- 18

SELECT COUNT(*)
FROM dbo.titles
WHERE price IS NOT NULL; -- 16

-- [!] �Ʒ��� �� ������ �� �������! �ڡڡڡڡ�
SELECT SUM(price) /COUNT(price)
FROM dbo.titles;  -- 236.26 / 16 = 14.7662

SELECT SUM(price) /COUNT(*)
FROM dbo.titles
WHERE price IS NOT NULL; -- 236.26 / 16 = 14.7662

-- [5] MAX, MIN �Լ� ���
SELECT MAX(price) AS �ִ� 
FROM dbo.titles;

SELECT MIN(price) AS �ּڰ�
FROM dbo.titles;

















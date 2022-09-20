-- �� ������
-- DB�� ���� ������ �˻� �� AND, OR, NOT ���� ����Ѵ�.
-- AND�� '�׸���', OR�� '�Ǵ�'���� �ؼ��ȴ�.
-- NOT�� ������ �������� �ʴ� ���� �˻��ϰ��� �� �� ����Ѵ�.

-- [1] AND ������
-- ��) Price ���� ����(����) 15�޷� �̻��̸鼭 Type�� psychology(�ɸ���)�� ����Ͻÿ�.

SELECT *
FROM dbo.titles
WHERE price > 15 AND type='psychology'
ORDER BY price;

-- [2] OR ������
-- ��) �״�� ���� ������ OR�� �����غ���.
SELECT *
FROM dbo.titles
WHERE price > 20 OR type='psychology'
ORDER BY price;

-- [3] NOT ������
-- ��) �״�� ���� ������ NOT�� �����ؼ� ������ 15�޷� �̻��� �ƴ� ����� ����Ͻÿ�.
SELECT *
FROM dbo.titles
WHERE NOT price > 15
ORDER BY price;


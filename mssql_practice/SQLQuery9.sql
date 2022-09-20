-- GROUP BY / HAVING
-- ���� �Լ��� �Բ� ���� ���Ǵ� ���� GROUP BY ���̴�.
-- ���� ���, � ���̺� ī�װ� �з� ���� �ִٸ� �� ī�װ����� �׷��� ���� �� �̚�.
-- �� ī�װ����� �׷��� ������ �׷캰 ��� ���� �����ϱ� ����.
-- GROUP�� �ᱹ Ư�� �÷�(��)�� �������� ���踦 ���ٴ� ���̴�.

-- [1] �⺻����
--SELECT [GROUP BY ���� ���� �÷�] [������ ��]
--FROM [���̺� ��]
--GROUP BY [�׷� ���� �÷�]

-- [2] titles ���̺��� �� type ���� ī�װ��� �׷���� ����Ͻÿ�.
SELECT type, AVG(price) AS ���
FROM dbo.titles
GROUP BY type;

-- [3] ���ĵ� �����ϴ�.
-- ��, ������� ���Ľô� �����ؾ� �Ѵ�. Ư�� �����Լ� ���� ����.
SELECT type, AVG(price) AS '�� ī�װ��� ��� å��'
FROM dbo.titles
GROUP BY type
ORDER BY type ASC;
--ORDER BY AVG(price) DESC


-- [4] ���ǵ� �����ϴ�.
-- �̶� HAVING ���� ����ϸ� �ȴ�.
-- HAVING�� GROUP BY�� ������ ��� ���� ���ؼ� ������ �ٿ� ���ϴ� ���� ��½�ų �� �ִ�.
-- ��) �� ī�װ����� �׷��� ��� ��½� ��� å���� 15�޷� �̻� ����Ͻÿ�.

SELECT type, AVG(price) AS '�� ī�װ��� ��� å��'
FROM dbo.titles
GROUP BY type
HAVING AVG(price) >= 15;

-- HAVING���� GROUP BY�� �ڿ� ����.
-- GROUP BY���� �׷����� ������ ��� ���� ���ؼ� ������ �ٿ��ִ� ���̱� �����̴�.


-- [4-1] �� �׷캰�� ī��Ʈ
SELECT type AS t, COUNT(type) AS '�׷캰 å ����', AVG(price) AS ap
FROM dbo.titles
GROUP BY type
ORDER BY ap DESC;

-- [4-2] ��� å ���� ���� ū TOP 3 ���
SELECT TOP 3 type AS t, COUNT(type) AS '�׷캰 å ����', AVG(price) AS ap
FROM dbo.titles
GROUP BY type
ORDER BY ap DESC;

-- [4-3] ��� å ���� ���� ū TOP 3 ��� - ���������� ��ȯ // LEFT(AVG(price), 2)
SELECT TOP 3 type AS t, COUNT(type) AS '�׷캰 å ����', CONVERT(INT, AVG(price)) AS ap
FROM dbo.titles
GROUP BY type
ORDER BY ap DESC;

-- [4-4] ��� å ���� ���� ū TOP 3 ��� - ���������� ��ȯ - WITH TIES ���
SELECT TOP 3 WITH TIES type AS t, COUNT(type) AS '�׷캰 å ����', CONVERT(INT, AVG(price)) AS ap
FROM dbo.titles
GROUP BY type
ORDER BY ap DESC;

-- [5] WHERE���� HAVING���� ���� ����� ���� �����ؾ� �Ѵ�.
-- WHERE > GROUP BY > HAVING ���� ������� �������.
-- ��� ��������� �����غ��� �翬�� �����̱� ������ �׷��� ��ưų� �����Ѱ� �ƴϴ�.
-- ��) å ������ 11�޷� �̻󿡼�		�� ī�װ� Ÿ�Ժ��� ���			��� ������ 17�޷� �̻� ����Ͻÿ�.
SELECT type, AVG(price) AS '�� ī�װ��� ��� å��'
FROM dbo.titles
WHERE price >= 11			-- (1) å���� 11�޷� �̻� �߷���.
GROUP BY type				-- (2) �߷��� �͵鿡�� �� Ÿ�Ժ��� �׷��� ������.
HAVING AVG(price) >= 17;	-- (3) ���� �׷캰�� ������ �� ���δ�.

-- [6] �� �������� ������ �����Ͻÿ�.
SELECT type, AVG(price) AS '�� ī�װ��� ��� å��'
FROM dbo.titles
WHERE price >= 10
GROUP BY type
HAVING AVG(price) >= 17
ORDER BY AVG(price) ASC;

-- [7] GROUP BY ALL
-- GROUP BY�� �� ī�װ��� ����� ���� �� ���ǿ� �´� ���� ���� ��쵵 ���� �� �ִ�.
-- �׷� NULL ���� �����µ� �Ϲ����� ��� GROUP BY�� �׷� NULL�� ������� �ʴ´�.
-- ALL�� �ݴ�� �׷� �� ����ϸ� NULL�� �״�� ��½����ش�.
-- ���� ALL�� ����ϸ� ���ǿ��� � �׸��� ���ܵǾ������� ��Ȯ�� �� �� �ְ� �ȴ�.
-- ��, � �׸��� ���ܵǾ������� ��Ȯ�� ��Ÿ������ �� �� ����Ѵ�.

-- ��1)
SELECT type, AVG(price) AS ��հ���
FROM dbo.titles
WHERE price >= 21
GROUP BY type;

-- ��2)
SELECT type, AVG(price) AS ��հ���
FROM dbo.titles
WHERE price >= 21
GROUP BY ALL type;

-- [8] GROUP BY ALL�� NOT IN ��� ����
-- ��1) titles ���̺��� ī�װ��� ��� å���� ����Ͻÿ�. ��, �Ʒ� ī�װ��� �����Ͻÿ�.
--		(���� ī�װ�) mod_cook, psychology, trad_cook, UNDECIDED
-- ��2) �� ī�װ��� ��� å���� ��½� ������ ���ܵ� ī�װ��� ��� ����Ͻÿ�.
--		(��, NULL ���� ���� ����� ���ܽ�Ű�� ���� ��������� ���̴�.)

-- ��1)
SELECT type, AVG(price) AS ��հ���
FROM dbo.titles
WHERE type NOT IN ('mod_cook', 'psychology', 'trad_cook', 'UNDECIDED')
GROUP BY type
ORDER BY AVG(price) DESC;

-- ��2)
SELECT type, AVG(price) AS ��հ���
FROM dbo.titles
WHERE type NOT IN ('mod_cook', 'psychology', 'trad_cook', 'UNDECIDED')
GROUP BY ALL type
ORDER BY AVG(price) DESC;













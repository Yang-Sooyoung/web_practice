-- �̶� ���������� ���������� �� �྿ �ѱ��.
-- �������������� �� ��(���⼱ ��ǰ�ڵ�)�� �޾Ƽ� ������ �����Ѵ�. �̷��� ���� ����� �ٽ� �������� �ѱ��.
-- ������������ �Ѿ�� ���� ���ǰ� ���Ͽ� ���� ����� ����Ѵ�.

-- Q) �������̺��� �� ��ǰ(�귣��)�� �Ź� �Ǹż����� �� ��ǰ�� ��� �Ǹż��� ���� ���� ������ ����Ͻÿ�.
SELECT * FROM dbo.salesTbl ORDER BY s_num;

SELECT * FROM dbo.salesTbl AS S1
WHERE s_qty > (
			SELECT AVG(s_qty) FROM dbo.salesTbl AS S2 WHERE S2.s_p_code = S1.s_p_code
);


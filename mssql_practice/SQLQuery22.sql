-----------------------------------------------------
-- [3] MONEY, SUBSTRING ����� ��ȯ
-----------------------------------------------------
-- �ʺ��ڿ��Դ� REPLACE �Լ��� ����ϴ� �ͺ��� ���� ��ƴ�.
-- SUBSTRING, CONVERT, LEN �Լ� ���� ������ �����Ѵ�.

-- SUBSTRING (expressing, start, length)
SELECT (123456789);
SELECT CONVERT (MONEY, '123456789');
SELECT CONVERT (VARCHAR, CONVERT (MONEY, '123456789'), 1); -- 123,456,789,00
SELECT SUBSTRING (CONVERT (VARCHAR, CONVERT (MONEY, '123456789'), 1), 1, 11); -- ���� ���� �ʿ�

-- LEN
SELECT CONVERT(VARCHAR, CONVERT( MONEY, 123456789 ), 1);
SELECT LEN(CONVERT(VARCHAR, CONVERT( MONEY, 123456789 ), 1));
SELECT LEN(CONVERT(VARCHAR, CONVERT( MONEY, 123456789 ), 1)) -3;

SELECT SUBSTRING (CONVERT (VARCHAR, CONVERT (MONEY, '123456789'), 1), 1, LEN(CONVERT(VARCHAR, CONVERT( MONEY, 123456789 ), 1)) -3); -- ���� ���� �ʿ�

-- SUBSTRING + CONVERT + LEN
-- �������� ���ؼ� �Լ� ����� �Ʒ��� ���� ������ �ƴ� �����ٿ� ���� ����ص� �ȴ�.

SELECT SUBSTRING
(
		CONVERT(VARCHAR, CONVERT(MONEY, 123456789), 1),			-- SUBSTRING 1��° ��
		1,															-- SUBSTRING 2��° ��
		LEN(CONVERT(VARCHAR, CONVERT(MONEY, 123456789), 1)) -3	-- SUBSTRING 3��° ��
) AS '00 ����'
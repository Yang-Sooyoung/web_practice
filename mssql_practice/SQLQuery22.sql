-----------------------------------------------------
-- [3] MONEY, SUBSTRING 사용한 변환
-----------------------------------------------------
-- 초보자에게는 REPLACE 함수를 사용하는 것보다 조금 어렵다.
-- SUBSTRING, CONVERT, LEN 함수 등의 사용법을 숙지한다.

-- SUBSTRING (expressing, start, length)
SELECT (123456789);
SELECT CONVERT (MONEY, '123456789');
SELECT CONVERT (VARCHAR, CONVERT (MONEY, '123456789'), 1); -- 123,456,789,00
SELECT SUBSTRING (CONVERT (VARCHAR, CONVERT (MONEY, '123456789'), 1), 1, 11); -- 좀더 개선 필요

-- LEN
SELECT CONVERT(VARCHAR, CONVERT( MONEY, 123456789 ), 1);
SELECT LEN(CONVERT(VARCHAR, CONVERT( MONEY, 123456789 ), 1));
SELECT LEN(CONVERT(VARCHAR, CONVERT( MONEY, 123456789 ), 1)) -3;

SELECT SUBSTRING (CONVERT (VARCHAR, CONVERT (MONEY, '123456789'), 1), 1, LEN(CONVERT(VARCHAR, CONVERT( MONEY, 123456789 ), 1)) -3); -- 좀더 개선 필요

-- SUBSTRING + CONVERT + LEN
-- 가독성을 위해서 함수 사용을 아래와 같이 한줄이 아닌 여러줄에 걸쳐 사용해도 된다.

SELECT SUBSTRING
(
		CONVERT(VARCHAR, CONVERT(MONEY, 123456789), 1),			-- SUBSTRING 1번째 값
		1,															-- SUBSTRING 2번째 값
		LEN(CONVERT(VARCHAR, CONVERT(MONEY, 123456789), 1)) -3	-- SUBSTRING 3번째 값
) AS '00 제거'
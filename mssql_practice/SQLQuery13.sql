-- [1] 데이터베이스 생성
CREATE DATABASE TESTDB6;

-- [2] 작업 DB 변경
USE TestDB6;

-- [3] 테이블 생성
-- 음악 테이블
CREATE TABLE tbl_music (
		num			INT					PRIMARY KEY,
		title		NVARCHAR(30)		,
		singer		NVARCHAR(30)		,
		price		INT			
);

-- 영화 테이블
CREATE TABLE tbl_movie (
		id			INT					PRIMARY KEY,
		director	NVARCHAR(30)		,				--감독
		title		NVARCHAR(30)		,				--영화제목
		release		SMALLINT			,				--개봉년도
		genre		VARCHAR(30)			,				--영화장르
		mark1		INT					,				--관객평점
		mark2		INT									--전문가평점
);

-- [4] 데이터 입력
-- 음악 테이블 입력
INSERT INTO dbo.tbl_music
VALUES 
		( 1, N'흰눈', N'이루', 22000),
		( 2, N'하루', N'김범수', 33000),
		( 3, N'Because of you', N'백지영', 44000),
		( 4, N'레베카', N'양준일', 19800),
		( 5, N'지금처럼만 사랑하자', N'한경일', 27500);

-- 영화 테이블 입력
INSERT INTO dbo.tbl_movie
VALUES 
		(1, N'봉준호', N'괴물', 2006, '액션', 88, 75),
		(2, N'오리올 파울로', N'더 바디', 2014, '스릴러', 90, 100),
		(3, N'제임스 카메룬', N'아바타', 2009, 'SF', 80, 70),
		(4, N'오리올 파울로', N'폭풍의 타임', 2018, '스릴러', 94, 100),
		(5, N'봉준호', N'기생충', 2019, '드라마', 92, 95),
		(6, N'제임스 카메룬', N'에이리언 커버넌트', 2017, 'SF', 84, 77),
		(7, N'멜라니 로랑', N'갤버스턴(Galveston)', 2018, '드라마', 88, 100),
		(8, N'로버트 스트롬버그', N'말레피센트(MALEFICENT)',  2014, '환타지(어른용동화)', 95, 87),
		(9, N'홍길동', N'더 볼트',  2006, '액션', 80, 70),
		(10, N'이순신', N'텍사스 전기톱 살인사건',  2019, '드라마', 94, 74);


-- [5] 데이터 출력
SELECT *
FROM tbl_music;

SELECT *
FROM tbl_movie;


-- 서브쿼리 연습문제2
-- Q1) 뮤직 테이블의 전체 곡 평균값 보다 비싼 곡들을 출력하시오.
SELECT AVG(price)
FROM tbl_music;

SELECT *
FROM tbl_music
WHERE price > (
				SELECT AVG(price)
				FROM tbl_music
)
ORDER BY price;

-- Q2) 각 감독들의 관객평점 평균과 전문가평점 평균을 출력하시오.
SELECT *
FROM tbl_movie;

SELECT director AS '감독이름', AVG(mark1) AS '관객평점', AVG(mark2) AS '전문가평점'
FROM dbo.tbl_movie
GROUP BY director
ORDER BY director DESC;

-- Q3) 관객평점 평균보다 낮은 점수의 영화들을 출력하시오 (또는 카운트를 세시오)
SELECT *
FROM dbo.tbl_movie;

SELECT AVG(mark1) FROM dbo.tbl_movie;

--SELECT COUNT(*) AS '관객평점 평균보다 낮은 영화 수'
SELECT *
FROM dbo.tbl_movie
WHERE mark1 < (
				SELECT AVG(mark1) FROM dbo.tbl_movie
);

-- Q4) 관객평점(mark1)의 평균을 구하여,
--		각 감독별로 받은 전문가평점(mark2) 최고값과 평균을 비교하여 높거나 같은게 있으면,
--		그 감독들의 이름과 최저, 최고 전문가평점을 이름순으로 출력하시오.
SELECT *
FROM dbo.tbl_movie;

SELECT director '감독이름', MIN(mark2) '최저 전문가평점', MAX(mark2) '최고 전문가평점'
FROM tbl_movie
GROUP BY director
HAVING MAX(mark2) >= (
					SELECT AVG(mark1)
					FROM dbo.tbl_movie
)
ORDER BY director;

-- Q5) 각 영화의 전문가평점(mark2)이 감독별 관객평점(mark1) 평균보다 높은 영화를 출력하시오.
SELECT *
FROM dbo.tbl_movie

SELECT AVG(mark1)
FROM dbo.tbl_movie
WHERE director = '제임스 카메룬';

SELECT director '감독이름', title '영화제목', mark1 '관객평점', mark2 '전문가평점' 
FROM dbo.tbl_movie M1
WHERE mark2 > (
				SELECT AVG(mark1)
				FROM dbo.tbl_movie M2
				WHERE M2.director = M1.director
);

-- Q6) A. 최근 (2015년 이상) 영화 위주로 관객평점(mark1) 평균을 구하시오.
--	   B. 최근 (2010년대) 영화의 감독별 관객평점(mark1) 평균을 구하여 그 보다 높은 전문가평점(mark2)을 받은 영화를 출력하시오.
SELECT AVG(mark1)
FROM dbo.tbl_movie
WHERE release >= 2015;

SELECT director, AVG(mark1)
FROM dbo.tbl_movie M2
WHERE release >= 2010
GROUP BY M2.director;

SELECT *
FROM dbo.tbl_movie M1
WHERE mark2 > (
				SELECT AVG(mark1)
				FROM dbo.tbl_movie M2
				WHERE M1.release >= 2018 AND M2.director = M1.director
				GROUP BY M2.director
);

-- Q7) '제임스 카메룬'의 영화를 출력하되,[ 그 해(연도)의 관객평점(mark1) ] 평균을 같이 출력하시오.
--	(비슷한 예: 사원 '홍길동'의 정보를 사원테이블에서 가져오되, 그가 속한 부서의 평균 연봉을 같이 출력하시오.)
SELECT * FROM dbo.tbl_movie


SELECT * , (
	SELECT AVG(mark1) FROM dbo.tbl_movie S WHERE S.release = M.release
) AS '영화 개봉년도의 관객평균'
FROM dbo.tbl_movie M
WHERE director = '제임스 카메룬';

-- 위 쿼리에서 S, M 등의 별칭은 가급적 사용하는 것이 좋다.
-- 명시적인 쿼리문이나 별칭 사용은 나와 동료를 위해서 좋다. 최소한 메인 별칭은 확실히 써주는게 좋다.

-- Q8) '제임스 카메룬'의 영화를 출력하되, 그 영화 장르의 관객평점(mark1) 평균과 관객평점 최곳값을 같이 출력하시오.
SELECT M.* , 
			(SELECT AVG(mark1) FROM dbo.tbl_movie S1 WHERE S1.genre = M.genre) AS '영화 장르의 관객평균',
			(SELECT MAX(mark1) FROM dbo.tbl_movie S2 WHERE S2.genre = M.genre) AS '영화 장르의 관객평점 최곳값'
FROM dbo.tbl_movie M
WHERE director = '봉준호';

-- Q9) '제임스 카메룬'의 영화를 출력하되, 관객평점(mark1)과 전문가평점(mark2)의 총합도 같이 출력하시오.
SELECT *
FROM dbo.tbl_movie;

SELECT M.*, 
			(SELECT SUM(mark1+ mark2) FROM dbo.tbl_movie S WHERE S.id = M.id) AS '관객평점 + 전문가평점'
FROM dbo.tbl_movie M
WHERE director = '제임스 카메룬'

-- Q10) 제임스 카메룬 감독과 봉준호 감독의 정보를 가져오되, 전체 관객평점 평균을 같이 가져와 비교할 수 있도록 출력하시오.
SELECT * FROM dbo.tbl_movie;

-- SELECT * FROM dbo.tbl_movie WHERE (director = '제임스 카메룬') or (director = '봉준호');
-- SELECT AVG(mark1) FROM dbo.tbl_movie;

-- 첫번째 쿼리
SELECT *, (SELECT AVG(mark1) FROM dbo.tbl_movie) AS '전체 관객평점 평균'
FROM dbo.tbl_movie
WHERE director = '제임스 카메룬' or director = '봉준호';

-- 두번째 쿼리
SELECT *, (SELECT AVG(mark1) FROM dbo.tbl_movie) AS '전체 관객평점 평균'
FROM dbo.tbl_movie M
WHERE M.id IN (
				SELECT id FROM dbo.tbl_movie S WHERE (director = '제임스 카메룬') or (director = '봉준호')
);

-- Q11) 감독별로 연도에 상관없이 총 만든 영화 갯수를 출력하시오.
--		(비슷한 예: 고객 아이디별로 해당 고객이 구매한 상품 목록 갯수를 출력하시오. SUM 함수 사용)
SELECT *
FROM dbo.tbl_movie;

SELECT director '감독이름', COUNT(director) '영화 제작 갯수'
FROM dbo.tbl_movie
GROUP BY director
ORDER BY director ASC;

-- Q12) 가장 높은 전문가평점(mark2)을 받은 영화의 정보를 출력하시오.
-- 혹 여러개면 최신 개봉연도 순으로 출력하시오.
SELECT * FROM dbo.tbl_movie

SELECT * 
FROM dbo.tbl_movie
WHERE mark2 = (
				SELECT MAX(mark2) FROM dbo.tbl_movie
)
ORDER BY release ASC, director ASC;

-- Q13) 2006년 2019년 두 해에 개봉한 영화의 정보를 출력하시오. (IN, EXISTS 연산자 사용)
SELECT * FROM dbo.tbl_movie;

SELECT * 
FROM dbo.tbl_movie 
WHERE (release = 2006) or (release = 2019);

-- A (IN 연산자 사용)
SELECT *
FROM dbo.tbl_movie M
WHERE M.id IN (
				SELECT id 
				FROM dbo.tbl_movie
				WHERE release IN (2006, 2019)
);

-- 이렇게 두번에 걸쳐서 쿼리를 작성하는 수고를 IN 연산자를 사용해서 한번에 처리
--SELECT ID 
--FROM DBO.TBL_MOVIE
--WHERE RELEASE = (2006); -- 1. 9

--SELECT ID 
--FROM DBO.TBL_MOVIE
--WHERE RELEASE = (2019); -- 5, 10

-- B (EXISTS 연산자 사용)

SELECT *
FROM dbo.tbl_movie M
WHERE EXISTS (
				SELECT id 
				FROM dbo.tbl_movie S
				WHERE (S.id = M.id) AND S.release IN (2006, 2019)
);

-- EXISTS 연습
USE pubs;

SELECT *
FROM dbo.stores;

SELECT *
FROM dbo.sales;

-- Ex1. 상점 테이블에서 판매실적이 존재하는 서점들을 출력하시오.
-- dbo.stores(상점정보), dbo.sales(매출정보) <-- 두 테이블을 연관하여 쿼리를 작성한다.
SELECT stor_id '상점 ID', stor_name '상점 이름'
FROM dbo.stores M
WHERE EXISTS (	SELECT *
				FROM dbo.sales S
				WHERE qty >= 40
				AND S.stor_id = M.stor_id
);

-- Ex2. 샘플 데이터베이스(pubs)에서 판매수량이 40권 이상인(=있는, =존재하는) 상점들을 출력하시오.
SELECT stor_id '상점 ID', stor_name '상점이름'
FROM dbo.stores M
WHERE EXISTS (
				SELECT * FROM dbo.sales S WHERE (S.stor_id = M.stor_id) AND (S.qty >=40)
);

-- Ex3. 샘플 데이터베이스(pubs)에서 1994년 이후에 판매실적이 있는(=존재하는) 상점들을 출력하시오.
SELECT stor_id '상점 ID', stor_name '상점이름', city '도시'
FROM dbo.stores M
WHERE EXISTS (
				SELECT * FROM dbo.sales WHERE (stor_id = M.stor_id) AND (ord_date > '1994')
);

USE TESTDB6; 

-- Q14) '제임스 카메룬' 감독의 영화를 출력하되, 그 영화 개봉년도에 같이 개봉한 영화들도 출력하시오.
-- 이 예제는 IN 연산자의 정확한 사용법을 복습.
SELECT *
FROM dbo.tbl_movie;

SELECT *
FROM dbo.tbl_movie M
WHERE release IN (
					SELECT release 
					FROM dbo.tbl_movie
					WHERE director = '제임스 카메룬'
);

-- Q15) '제임스 카메룬' 감독이 만든 영화 장르의 영화제목, 개봉일을 출력하시오.
--      (위 예제를 변수 사용해서)
SELECT * FROM dbo.tbl_movie

DECLARE @d_name VARCHAR(20);
SET @d_name = '제임스 카메룬';

SELECT @d_name + ' 감독의 영화 장르 --->' AS '감독명', M.genre '장르', M.title '영화제목', M.release '개봉년도'
FROM dbo.tbl_movie M
WHERE M.id IN (
				SELECT id 
				FROM dbo.tbl_movie S
				WHERE S.director = @d_name
);

-- GROUP BY 플러스
-- Q1) 영화 테이블에서 각 장르별 영화 갯수를 출력하시오.
SELECT * FROM dbo.tbl_movie;

SELECT genre 영화장르, COUNT(*) 영화갯수
FROM dbo.tbl_movie
GROUP BY genre
ORDER BY COUNT(*) DESC;

-- Q2) 영화 테이블에서 각 장르별로 그룹화하여 여러 정보(집계함수를 사용한 정보 * 평균, 최고, 최저)를 출력하시오.
SELECT *
FROM dbo.tbl_movie;

SELECT genre 영화장르, COUNT(*) 영화수, 
	   AVG(mark1) '관객평점 평균', AVG(mark2) "전문가평점 평균", 
	   MAX(mark1) '관객평점 최고', MIN(mark1) '관객평점 최저', 
	   MAX(mark2) '전문가평점 최고', MIN(mark2) '전문가평점 최저'
FROM dbo.tbl_movie
GROUP BY genre;

SELECT*
FROM dbo.tbl_movie;

-- Q3) 연도별로 그룹을 묶어서 각종 정보(평균, 최고, 최저)를 출력하시오.
SELECT release, COUNT(release) '갯수', AVG(mark1) '관객평점 평균', 
	   MAX(mark1) '관객평점 최고', MIN(mark1) '관객평점 최저',
	   SUM(mark1) '관객평점 합계', SUM(mark2) '전문가평점 합계'
FROM dbo.tbl_movie
GROUP BY release;

-- Q4) GROUP BY를 이용하여 2개 컬럼 묶기
SELECT release FROM dbo.tbl_movie GROUP BY release;

SELECT release '개봉년도', title '영화제목'
FROM dbo.tbl_movie
GROUP BY release, title
ORDER BY release DESC; -- 최근순

SELECT * FROM dbo.tbl_movie;

UPDATE dbo.tbl_movie SET title = '기생충'
WHERE id = 10;

-- Q5) 다중 그룹은 왜 사용하지???
-- 다중 그룹시 카운트 사용
-- (잠깐 생각) 다중 그룹화시켜 카운트를 쓴다는건데 이건 왜 하지???
-- 예) 영화 테이블에서 연도별, 장르별 갯수를 출력하시오.
SELECT * FROM dbo.tbl_movie;

SELECT release '개봉연도', genre '영화장르', COUNT(*) '갯수'
FROM dbo.tbl_movie
GROUP BY release, genre
ORDER BY release DESC; -- 최근순

-- Q6) 영화, 음악 두 테이블에서 가수와 감독을 겸직하는 사람의 이름과 곡명을 출력하시오.
SELECT * FROM dbo.tbl_music;
SELECT * FROM dbo.tbl_movie;

UPDATE dbo.tbl_movie
SET director='이루'
WHERE id=9;

UPDATE dbo.tbl_movie
SET director='양준일'
WHERE id=10;

UPDATE dbo.tbl_movie
SET director='이루'
WHERE id IN (1, 5);

INSERT INTO dbo.tbl_music VALUES (6, '크리스마스', '이루', 44000);

-- A
SELECT A.director, B.title
FROM dbo.tbl_movie A, dbo.tbl_music B
WHERE A.director = B.singer
ORDER BY director;

-- B (중복제거, DISTINCT)
SELECT DISTINCT A.director, B.title
FROM dbo.tbl_movie A, dbo.tbl_music B
WHERE A.director = B.singer
ORDER BY director;

-- C (중복제거, GROUP BY)
SELECT A.director, B.title, '이 감독의 영화 작품 수 --->', COUNT(*) '영화 작품 수'
FROM dbo.tbl_movie A, dbo.tbl_music B
WHERE A.director = B.singer
GROUP BY A.director, B.title;

-- [6] 데이터베이스 삭제(주의)
USE master;
DROP DATABASE TestDB6;


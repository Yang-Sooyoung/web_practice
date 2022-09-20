--------------------------------------------------------------
-- 트랜잭션(TRANSACTION)
--------------------------------------------------------------
-- 먼저 SELECT로 데이터를 확인
SELECT * FROM dbo.tbl_sales2;

-- [1] 명시적 트랜잭션
-- 트랜잭션 이름을 명시함.
-- 명시하지 않은 쿼리문들은 사실 내부적으로 AUTO COMMIT이 된다.
-- 트랜잭션 쿼리문 끝에서 세미콜론(;)은 선택적이다.
-- DELETE 구문만 블록을 지정해서 실행을하면 완전 삭제되니 주의!
-- 반드시 트랜잭션 쿼리문 전체를 블록으로 지정하고 실행한다.
-- 트랜잭션 시작
BEGIN TRANSACTION
	-- GS104 또는 GS105 구매상품 삭제
	-- 복합 쿼리문 작성
	INSERT INTO dbo.tbl_sales2 VALUES (1005, 3, 'GS104', 1, 220000);
	DELETE FROM dbo.tbl_sales2 WHERE p_id = 'GS102'
	SELECT * FROM dbo.tbl_sales2

-- ROLLBACK은 처리 결과가 되돌려지고, COMMIT은 최종 적용된다.
ROLLBACK TRANSACTION

-- [2] 다양한 트랜잭션 표기법
-- 1.BEGIN TRANSACTION - ROLLBACK(COMMIT)
-- 2.BEGIN TRAN - ROLLBACK(COMMIT) (TRAN)

-- [3] 트랜잭션 카운트
/*
BEGIN TRAN
	SELECT @@TRANCOUNT
	UPDATE dbo.tbl_sales2 SET qty=10 WHERE s2_num=1004
	SELECT * FROM dbo.tbl_sales2
COMMIT

SELECT @@TRANCOUNT
*/

-- [4] 트랜잭션 TRY ~ CATCH 구문 사용
-- TRY ... CATCH 구문은 거의 대부분의 실행시의 오류를 CATCH 해준다.
-- TRY 블록 다음에 곧바로 CATCH 블록을 이어서 작성한다.
-- TRY ... CATCH 구문은 여러 일괄 처리에 걸쳐 사용할 수 없다.
-- 데이터 확인
SELECT * FROM dbo.tbl_sales2

BEGIN TRY
	BEGIN TRANSACTION;

		--DELETE	FROM dbo.tbl_sales2 WHERE p_id IN ('GS104', 'GS105');
		INSERT INTO dbo.tbl_sales2 VALUES (1005, 3, 'GS104', 1, 220000);
		INSERT INTO dbo.tbl_sales2 VALUES (1005, 4, 'GS105', 1, 330000);
		SELECT * FROM dbo.tbl_sales2;

		-- TRY ~ CATCH 구문을 통해 오류를 잡아서 롤백시키지 않으면 위 쿼리들이 적용되어 버림.
		SELECT 1/0; -- ERROR!!
	COMMIT TRANSACTION;	
END TRY
BEGIN CATCH
	ROLLBACK TRANSACTION;
END CATCH

SELECT @@TRANCOUNT

-- 참조 무결성 수정(변경) 테스트
-- 테이블과 테이블간의 관계를 맺게되면(외래키 지정) 참조하는 테이블열의 값이 아닌 다른 갑이 들어올 수 없다.
-- 역시 입력된 값도 참조하는 테이블열의 값이 아닌 다른 값으로 수정, 변경할 수도 없다.
-- 참조 무결성에 위배되므로 이러한 수정이 될 수 없다.
-- 데이터베이스(RDBMS) 시스템이 일관성있게 데이터가 유지될 수 있도록 관리한다.

SELECT * FROM dbo.tbl_sales1

-- 수정/변경
UPDATE dbo.tbl_sales1
	SET
		m_id = 'batman'
	WHERE
		s1_num = '1001'

-- 숙달시키는 것이 가장 중요하다.

------------------------------------------------------
-- INSERT DATA
------------------------------------------------------

-- [1] dbo.tbl_members
-- 강의 예제상 날짜, 포인트 등의 컬럼은 안만들었으므로 추후 필요에 따라 구성할 것.
SELECT * FROM dbo.tbl_members

-- 기본입력
INSERT INTO dbo.tbl_members VALUES ('antman', '앤트맨', '서울', 'America', ' 010-1234-5678', 'antman@antman.com');

-- 이렇게 테이블명 옆에 컬럼명을 적어도 된다. 컬럼이 많아 기억이 안날 때 유용.
INSERT INTO dbo.tbl_members (m_id, m_name, m_address, m_country, m_tel, m_email)
VALUES ('batman', '배트맨', '춘천', 'Korea', ' 010-1234-5678', 'batman@batman.com');

-- 다중입력
INSERT INTO dbo.tbl_members (m_id, m_name, m_address, m_country,  m_tel, m_email)
VALUES ('superman', '슈퍼맨', '인천', 'Canada', ' 010-1234-5678', 'superman@superman.com'),
	   ('skyman', '하늘맨', '제주', 'Russia', ' 010-1234-5678', 'skyman@skyman.com'),
	   ('brickman', '벽돌맨', '부산', 'China', ' 010-1234-5678', 'brickman@brickman.com');

--UPDATE dbo.tbl_members
--SET m_address = '춘천'
--WHERE m_id = 'batman';

-- [2] dbo.tbl_products
SELECT * FROM dbo.tbl_products

INSERT INTO dbo.tbl_products (p_id, p_name, p_price, p_detail, v_id)
VALUES ('GS101', '텔레비전', 990000, '커브드형의 미래지향적 최신형 모델', '럭키금성'),
	   ('GS102', '냉장고', 770000, '얼음물에 얼린듯한 그 느낌의 냉장고', '애플'),
	   ('GS103', '김치냉장고', 550000, '김치는 역시 김치냉장고가 최고', '엘지'),
	   ('GS104', '오디오', 440000, '오디오의 명가에서 만든 최고의 오디오', '불티나'),
	   ('GS105', '컴퓨터', 2200000, '세계에서 최고로 가벼운 컴퓨터 그램', '그램');

--UPDATE dbo.tbl_products
--SET p_price= 2200000
--WHERE p_name = '컴퓨터';

-- [3] dbo.tbl_sales1
SELECT * FROM dbo.tbl_sales1
--DELETE FROM dbo.tbl_sales1

INSERT INTO dbo.tbl_sales1 (s1_num, s1_date, m_id)
VALUES (1001, '2000-12-25 15:22:10', 'batman'), -- 강의에서 설명한 예로 하기위해서 1001로 입력함.
	   (1002, '2000-12-26 17:12:04', 'antman'),
	   (1003, '2000-12-27 16:55:40', 'batman'),
	   (1004, '2000-12-28 20:21:20', 'skyman'),
	   (1005, '2000-12-29', 'brickman'); -- 시, 분, 초 없으면 모두 O

-- [4] dbo.tbl_sales2
SELECT * FROM dbo.tbl_sales2

INSERT INTO dbo.tbl_sales2 (s2_num, s2_ordertem, p_id, qty, otem_price)
VALUES (1001, 1, 'GS101', 1, 990000),
	   (1001, 2, 'GS102', 1, 770000),
	   (1001, 3, 'GS103', 1, 550000);

-- 단일입력
INSERT INTO dbo.tbl_sales2 VALUES (1002, 1, 'GS101', 1, 990000);
INSERT INTO dbo.tbl_sales2 VALUES (1003, 1, 'GS103', 1, 550000);
INSERT INTO dbo.tbl_sales2 VALUES (1004, 1, 'GS102', 1, 770000);
INSERT INTO dbo.tbl_sales2 VALUES (1005, 1, 'GS104', 1, 440000);
INSERT INTO dbo.tbl_sales2 VALUES (1005, 2, 'GS105', 1, 2200000);



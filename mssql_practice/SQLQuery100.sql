
-- 2개 짜고 1개 짜서 union
USE TESTDB

SELECT *
FROM (

SELECT *
FROM TB_MngOrgInfo A LEFT JOIN TB_MngOrgSvRInfo B 
ON A.OrganCode = B.OrganCode
WHERE B.ServerType = 'PBX'
UNION
SELECT *
FROM TB_MngOrgInfo C LEFT JOIN TB_MngOrgSvRInfo D
ON C.OrganCode = D.OrganCode 
WHERE ServerType = '서버'	
) E
WHERE EXISTS (SELECT * FROM TB_MngOrgSvRInfo)
;

--  () 괄호 안에 있는거 다 꺼내는건 됐음.
--  OrganCode 랑 ServerSeq를 비교해서 중복이면 삭제하고 앞에 IP ServerType이 PBX 일때만 뿌리고 싶음
--  ON을 잘모르나??

--  테이블 구조를 잘못짠거 같다......

SELECT B.*
FROM TB_MngOrgInfo A LEFT JOIN 
    TB_MngOrgSvRInfo B LEFT JOIN ( SELECT C.*, D.OrganCode AS OC, D.ServerType, D.ServerSeq, D.IpAddress,D.SocketPort, D.ServerClass, D.Remark AS DR
									FROM TB_MngOrgInfo C LEFT JOIN TB_MngOrgSvRInfo D
														 ON C.OrganCode = D.OrganCode  ) E
						 ON E.OrganCode = B.OrganCode 
						-- WHERE E.ServerSeq = B.ServerSeq AND E.ServerType ='PBX'
					  ON A.OrganCode = B.OrganCode
WHERE B.ServerSeq = E.ServerSeq AND B.IpAddress <> E.IpAddress AND B.ServerType = 'PBX' AND EXISTS (SELECT OrganCode, ServerSeq FROM TB_MngOrgSvRInfo)
;

SELECT *
FROM TB_MngOrgInfo A LEFT JOIN TB_MngOrgSvRInfo B
ON A.OrganCode = B.OrganCode --A.ServerSeq = B.ServerSeq
WHERE ServerType = '서버'
;


SELECT OI.OrganCode, OI.OrganName, 
      SI.ServerType, CH.CodeName,
	  Si.ServerSeq, Si.IpAddress, Si.ServerClass, Si.Remark
from TB_MngOrgInfo OI,
     TB_MngOrgSvrInfo SI,
	 TB_MngCodeHouse CH
where SI.OrganCode = OI.OrganCode
and CH.MasterCode = '20'
and CH.DetailCode = SI.ServerType
and OI.OrganCode = 'UCS024'
and SI.ServerType = 'PBX'


-------------- 소장님 쿼리 ------------

SELECT OI.OrganCode, OI.OrganName, 
      SI.ServerType as pcxServerType,
	  CH.CodeName as pbxServerTypeName,
	  '' as svrServerType,
	  '' as svrServerTypeName,
	  Si.ServerSeq, Si.IpAddress, Si.ServerClass, Si.Remark
from TB_MngOrgInfo OI
     left outer join TB_MngOrgSvrInfo SI on (SI.OrganCode = OI.OrganCode)
	 join TB_MngCodeHouse CH on (CH.MasterCode = '20' and CH.DetailCode = SI.ServerType)
where 
       OI.OrganCode = 'UCS024'
and Servertype = 'PBX'

union 

SELECT '' as OrganCode, '' as OrganName, 
	  '' as pcxServerType,
	  '' as pbxServerTypeName,
      SI.ServerType as svrServerType,
	  CH.CodeName  as svrServerTypeName,
	  Si.ServerSeq, Si.IpAddress, Si.ServerClass, Si.Remark
from TB_MngOrgInfo OI
     left outer join TB_MngOrgSvrInfo SI on (SI.OrganCode = OI.OrganCode)
	 join TB_MngCodeHouse CH on (CH.MasterCode = '20' and CH.DetailCode = SI.ServerType)
where 
       OI.OrganCode = 'UCS024'
and Servertype = 'SVR'

order by OrganCode desc, OrganName desc

select * from TB_MngOrgInfo




select OI.OrganCode,
       OI.OrganName,
	   (select top 1 IpAddress  from TB_MngOrgSvrInfo where OrganCode = OI.OrganCode and ServerType = 'PBX' ) as aaaa,
	   (select count(IpAddress) as pbxCnts  from TB_MngOrgSvrInfo where OrganCode = OI.OrganCode and ServerType = 'PBX' ) as bbb,
	   (select top 1 IpAddress  from TB_MngOrgSvrInfo where OrganCode = OI.OrganCode and ServerType = 'SVR' ) as cccc,
	   (select count(IpAddress) as pbxCnts  from TB_MngOrgSvrInfo where OrganCode = OI.OrganCode and ServerType = 'SVR' ) as dddd,
	   OI.MngObsID,
	   OI.MngObsPasswd,
	   OI.Remark, OI.RegstDate
from TB_MngOrgInfo OI
where OI.OrganCode = 'UCS024'


select CH.CodeName, SI.IpAddress, SI.ServerClass
from TB_MngOrgSvrInfo SI,
TB_MngCodeHouse CH
where CH.MasterCode = '20'
and CH.DetailCode = SI.ServerType
and SI.OrganCode = 'UCS024'
and SI.ServerType = 'SVR'
order by SI.ServerSeq

-------------- 소장님 쿼리 ------------
-------------- 다시 짜보기 -------------------------------------------------------------------------------------------------------------
-- 코드 조회
CREATE VIEW SVRINFO_SC AS
DECLARE @code VARCHAR(6);
SELECT *
FROM (
SELECT M.OrganCode 'O', M.ServerType 'T', M.IpAddress 'I', M.ServerSeq 'S', S1.ServerType 'TT', S1.IpAddress 'II', S1.ServerSeq 'SS'
FROM TB_MngOrgSvrInfo M JOIN TB_MngOrgSvrInfo S1
						ON M.OrganCode = S1.OrganCode
WHERE M.OrganCode = @code AND M.ServerType = 'PBX' 
AND M.ServerType <> S1.ServerType AND M.ServerSeq = S1.ServerSeq
UNION
SELECT DISTINCT M.OrganCode 'O', M.ServerType 'T', M.IpAddress 'I', M.ServerSeq 'S', '' 'TT', '' 'II', '' 'SS'
FROM TB_MngOrgSvrInfo M LEFT OUTER JOIN TB_MngOrgSvrInfo S1
						ON M.OrganCode = S1.OrganCode		
WHERE M.OrganCode = @code AND M.ServerType = 'PBX' AND M.ServerType <> S1.ServerType
AND M.ServerSeq NOT IN (SELECT M.ServerSeq 'S'
						FROM TB_MngOrgSvrInfo M JOIN TB_MngOrgSvrInfo S1
												ON M.OrganCode = S1.OrganCode
						WHERE M.OrganCode = @code AND M.ServerType = 'PBX' 
						AND M.ServerType <> S1.ServerType AND M.ServerSeq = S1.ServerSeq)
UNION
SELECT DISTINCT M.OrganCode 'O', '' 'T', '' 'I', '' 'S', S1.ServerType 'TT', S1.IpAddress 'II', S1.ServerSeq 'SS'
FROM TB_MngOrgSvrInfo M JOIN TB_MngOrgSvrInfo S1
						ON M.OrganCode = S1.OrganCode		
WHERE M.OrganCode = @code AND M.ServerType = 'PBX' AND M.ServerType <> S1.ServerType
AND S1.ServerSeq NOT IN (SELECT M.ServerSeq 'S'
						 FROM TB_MngOrgSvrInfo M JOIN TB_MngOrgSvrInfo S1
												 ON M.OrganCode = S1.OrganCode
						 WHERE M.OrganCode = @code AND M.ServerType = 'PBX' 
						 AND M.ServerType <> S1.ServerType AND M.ServerSeq = S1.ServerSeq)
) N
ORDER BY N.O, CASE WHEN N.S = 0 THEN 1 ELSE 0 END, N.S, N.SS
-------------------------------------------------------------------------------------------------------------------------------------------
-- 전체 조회
--CREATE VIEW SVRINFO AS
SELECT TOP 100 PERCENT *
FROM (
		SELECT M.OrganCode 'O', M.ServerType 'T', M.IpAddress 'I', M.ServerSeq 'S', S1.ServerType 'TT', S1.IpAddress 'II', S1.ServerSeq 'SS'
		FROM TB_MngOrgSvrInfo M JOIN TB_MngOrgSvrInfo S1
								ON M.OrganCode = S1.OrganCode
		WHERE M.ServerType = 'PBX' 
		AND M.ServerType <> S1.ServerType AND M.ServerSeq = S1.ServerSeq

		UNION

		SELECT DISTINCT M.OrganCode 'O', M.ServerType 'T', M.IpAddress 'I', M.ServerSeq 'S', '' 'TT', '' 'II', '' 'SS'
		FROM TB_MngOrgSvrInfo M LEFT OUTER JOIN TB_MngOrgSvrInfo S1
								ON M.OrganCode = S1.OrganCode		
		WHERE M.ServerType = 'PBX' AND M.ServerType <> S1.ServerType
		AND M.OrganCode + CAST(M.ServerSeq AS VARCHAR(2)) NOT IN (SELECT M.OrganCode + CAST(M.ServerSeq AS VARCHAR(2))											 
																	FROM TB_MngOrgSvrInfo M JOIN TB_MngOrgSvrInfo S1
																	ON M.OrganCode = S1.OrganCode
																	WHERE M.ServerType = 'PBX' 
																	AND M.ServerType <> S1.ServerType AND M.ServerSeq = S1.ServerSeq)
		UNION

		SELECT DISTINCT M.OrganCode 'O', '' 'T', '' 'I', '' 'S', S1.ServerType 'TT', S1.IpAddress 'II', S1.ServerSeq 'SS'
		FROM TB_MngOrgSvrInfo M JOIN TB_MngOrgSvrInfo S1
								ON M.OrganCode = S1.OrganCode		
		WHERE M.ServerType = 'PBX' AND M.ServerType <> S1.ServerType
--		GROUP BY S1.ServerType, S1.IpAddress
		AND S1.OrganCode + CAST(S1.ServerSeq AS VARCHAR(2)) NOT IN (SELECT M.OrganCode + CAST(M.ServerSeq AS VARCHAR(2))											 
																	FROM TB_MngOrgSvrInfo M JOIN TB_MngOrgSvrInfo S1
																	ON M.OrganCode = S1.OrganCode
																	WHERE M.ServerType = 'PBX' 
																	AND M.ServerType <> S1.ServerType AND M.ServerSeq = S1.ServerSeq)
) N
ORDER BY N.O, CASE WHEN N.S = 0 THEN 1 ELSE 0 END, N.S, N.SS
----------------------------------------------------------------------------------------------------------------------------------------------





SELECT S3.ServerType, S3.IpAddress, S3.ServerSeq
						  FROM TB_MngOrgSvrInfo S3
						  WHERE S3.OrganCode = 'UCS052' AND S3.ServerType = 'SVR'


(SELECT S2.ServerType 'T' , S2.IpAddress 'I', S2.ServerSeq 'S'
FROM TB_MngOrgSvrInfo S2						
WHERE S2.OrganCode = 'UCS024' AND S2.ServerType = 'PBX')

union

(SELECT S3.ServerType 'TT', S3.IpAddress 'II', S3.ServerSeq 'SS'
FROM TB_MngOrgSvrInfo S3
WHERE S3.OrganCode = 'UCS024' AND S3.ServerType = 'SVR')



select * from TB_MngCodeHouse
where MasterCode = '20'


update TB_MngOrgSvrInfo
set ServerType = 'SVR'
where ServerType = '서버'

update TB_MngCodeHouse
set CodeName = '교환기'
where MasterCode ='20'
and DetailCode = 'PBX'


SELECT *
FROM TB_MngOrgInfo A LEFT JOIN TB_MngOrgSvRInfo B 
ON A.OrganCode = B.OrganCode
WHERE B.ServerType = 'PBX'
;

SELECT *
FROM TB_MngOrgInfo A LEFT JOIN TB_MngOrgSvRInfo B
ON A.OrganCode = B.OrganCode --A.ServerSeq = B.ServerSeq
WHERE ServerType = '서버'
;






------------------------------------------------------------------------------------------

UPDATE TB_MngOrgInfo
SET Remark = ''
WHERE OrganCode = 'UCS023'
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS023', '당진시 석문', 'ucs10023', 'ucs10087', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS025', '정읍시', 'ucs10025', 'ucs10085', '대070-4465-8891, KT010-9866-1449', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS011', '경주 양동마을', 'ucs10011', 'ucs10099', '최상호 010-9577-8588', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS022', '영덕군', 'ucs10022', 'ucs10088', '054-036-1841(회선번호)', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS027', '남원시', 'ucs10027', 'ucs10083', '1435 --> forward --> 1433', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS024', '강북구', 'ucs10027', 'ucs10086', '1435 --> forward --> 1433', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS028', '울릉군', 'segi3388', '#segi4488', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS035', '문의면', 'ucs10035', 'ucs10065', '010-2060-3441', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS037', '용산구', 'ucs10037', 'ucs10063', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS039', '청원현도', 'ucs10039', 'ucs10061', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS040', '경주시', 'ucs10040', 'ucs10060', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS040', '경주시', 'ucs10040', 'ucs10060', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS041', '부안지사', 'ucs10041', 'ucs10059', '1433', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS044', '의성군', 'ucs10044', 'ucs10056', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS045', '인천 동구청', 'ucs10045', 'ucs10055', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS046', '국회의원회관', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS047', '알펜시아', '', '', '세기서버개발', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS048', '거제시', '', '', '세기서버데모', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS049', '소근만권역', '', '', '160824 IP 변경', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS050', '예천군', 'ucs10050', 'ucs10060', '012-2314-8195', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS051', '청량산도립공원', 'ucs10051', 'ucs10049', '054-0040-9613 / 070-447-4380', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS052', '강릉시', 'ucs10052', 'ucs10048', 'KT 010-2775-1476', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS053', '평택시', 'segi3388', '#segi4488', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS033', '옥천군 이원면', 'ucs10033', 'ucs10067', 'KT 010-7292-9614', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS034', '영양군', 'ucs10034', 'ucs10066', 'KT 김태광 010-9778-7875 / 010-3073-7830', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS054', '울주군', 'ucs10042', 'ucs10058', 'KT 윤병선 010-9667-0525', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS055', '곡성군', 'ucs10055', 'ucs10045', 'KT 이관도 010-2680-5633', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS056', '평창군', 'pss10055', 'pss10045', 'KT 안중현 010-3451-2721 / 070-4226-1269', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS057', '문경시', 'ucs10058', 'ucs10042', '010-3073-7830 / KT 김창섭 070-7770-4269', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS058', '예천군 은풍면', 'ucs10057', 'ucs10043', '010-3073-7830 / KT 김창섭 070-7770-4269', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS059', '처인구 남사면', 'ucs10059', 'ucs10041', '031-1082-6650 / KT 조용일 010-7274-8538', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS060', '고령군', 'ucs10060', 'ucs10040', '070-4257-1396 / KT 박영규 010-9547-8000', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS061', '정읍시 산림과', 'ucs10061', 'ucs10049', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS062', '춘천시', 'ucs10062', 'ucs10048', '033-066-7928', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS063', '울산남구청', 'ucs10063', 'ucs10047', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS064', '경남고성군', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS065', '보은군', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS066', '봉화군', 'ucs10066', 'ucs10044', '회선번호 054-040-9009', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS067', '안동시', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS068', '여주시', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS069', '영주시', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS070', '충주시', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS071', '포천시', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS072', '광주광역시', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS073', '제주도 제주시', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS074', '정읍시 건설과', 'ucs10074', 'ucs10036', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS075', '양양군', '', '', '', GETDATE())
;

INSERT INTO TB_MngOrgInfo
VALUES('UCS076', '보령시', '', '', '', GETDATE())
;

------------------------------------------------------------------------------------------

UPDATE TB_MngOrgSvrInfo
SET ServerClass = 'NVR'
WHERE OrganCode = 'UCS052' and ServerSeq = 8
;

SELECT * 
FROM TB_MngOrgInfo
;

SELECT *
FROM TB_MngOrgSvrInfo
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS023', 'PBX', 1, '183.107.86.141', '', '', 'admin/ //hs7042')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS023', '서버', 1, '183.107.86.142', '', '', 'admin/ //hs7042')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS025', 'PBX', 1, '203.234.111.131', '', '', 'admin/ snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS025', '서버', 1, '203.234.111.132', '', '', 'admin/ snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS025', 'PBX', 2, '203.234.111.140', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS011', 'PBX', 1, '220.81.143.87', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS011', '서버', 1, '220.81.143.87', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS022', 'PBX', 1, '221.166.207.88', '', '', 'admin/ !snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS022', '서버', 1, '221.166.207.89', '', '', 'admin/ !snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS022', 'PBX', 2, '121.180.130.36', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS022', '서버', 2, '121.180.130.35', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS022', 'PBX', 3, '121.180.130.37', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS022', '서버', 3, '121.180.130.34', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS022', 'PBX', 4, '121.180.130.38', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS022', '서버', 3, '121.180.130.33', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS027', 'PBX', 1, '112.184.108.123', '', '', 'admin/ hosun$2!')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS027', '서버', 1, '112.184.108.124', '', '', 'admin/ hosun$2!')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS027', 'PBX', 2, '121.154.119.249', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS027', '서버', 2, '112.184.108.124', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS024', 'PBX', 1, '59.5.136.2', '', '', '1435 --> forward --> 1443')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS024', '서버', 1, '59.5.136.1', '', '', '1435 --> forward --> 1443')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS024', '서버', 2, '59.5.136.19', '', '웹 서버', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS024', '서버', 3, '59.5.136.20', '', 'UTM', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS028', 'PBX', 1, '119.196.46.190', '', '', 'ktvoip / snnsc#01, admin99 / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS028', '서버', 1, '119.196.46.146', '', '', 'ktvoip / snnsc#01, admin99 / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS035', 'PBX', 1, '118.44.150.7', '', '', 'ktvoip / !giga2600')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS035', '서버', 1, '118.44.150.8', '', '', 'ktvoip / !giga2600')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS037', 'PBX', 1, '61.73.149.131', '', '', 'ktvoip / 용산13@@, dydtks13@@')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS037', '서버', 1, '61.73.149.130', '', '', 'ktvoip / 용산13@@, dydtks13@@')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS039', 'PBX', 1, '112.165.218.150', '', '', 'ktvoip / !giga2600')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS039', '서버', 1, '112.165.218.149', '', '', 'ktvoip / !giga2600')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', 'PBX', 1, '121.180.154.205', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', '서버', 1, '121.180.154.204', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', 'PBX', 2, '121.180.154.221', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', '서버', 2, '121.180.154.201', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', 'PBX', 3, '121.151.189.113', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', '서버', 3, '121.151.189.120', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', 'PBX', 4, '121.151.189.114', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', 'PBX', 5, '121.151.189.115', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', 'PBX', 6, '121.151.189.122', '', '', 'AhnLab 121.151.189.121:50005')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', '서버', 6, '121.151.189.119', '', '', 'AhnLab 121.151.189.121:50005')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', 'PBX', 7, '121.151.189.123', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS040', 'PBX', 8, '121.151.189.124', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS041', 'PBX', 1, '220.87.253.218', '', '', 'ktvoip / buan3600!')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS041', '서버', 1, '220.87.253.219', '', '', 'ktvoip / buan3600!')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS043', 'PBX', 1, '119.196.46.190', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS043', '서버', 1, '119.196.46.146', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS044', 'PBX', 1, '211.195.4.7', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS044', '서버', 1, '211.195.4.8', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS044', 'PBX', 2, '220.122.241.17', '', '', '추가서버')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS044', '서버', 2, '211.195.4.10', '', '', '추가서버')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS044', 'PBX', 3, '220.122.241.18', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS044', '서버', 3, '211.195.4.19', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS045', 'PBX', 1, '220.126.161.251', '', '', 'admin / donggu123')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS045', '서버', 1, '220.126.161.252', '', '', 'admin / donggu123')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS046', 'PBX', 1, '192.168.3.1', '', '', 'ktvoip / voipgw')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS046', '서버', 1, '192.168.3.51', '', '', 'ktvoip / voipgw')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS049', 'PBX', 1, '220.89.175.230', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS049', '서버', 1, '220.89.175.231', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS050', 'PBX', 1, '59.23.126.78', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS050', '서버', 1,'59.23.126.83', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS050', 'PBX', 2, '59.23.126.79', '', '웹 서버', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS050', '서버', 2,'59.23.126.84', '', '웹 서버', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS050', 'PBX', 3, '59.23.126.86', '', 'UTM', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS050', '서버', 3,'59.23.126.85', '', 'UTM', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS050', 'PBX', 4, '59.23.126.73', '', '은풍', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS050', '서버', 4,'59.23.126.72', '', '은풍', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS051', 'PBX', 1, '222.121.253.178', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS051', '서버', 1,'222.121.253.179', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', 'PBX', 1, '211.218.158.174', '', '', 'ktvoip / snnsc#01 / ktsoip1')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', '서버', 1,'211.218.158.170', '', '', 'ktvoip / snnsc#01 / ktsoip1')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', 'PBX', 2, '211.218.158.177', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', '서버', 2,'211.218.158.179', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', 'PBX', 3, '211.218.158.185', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', 'PBX', 4, '211.218.158.163', '', '웹 서버', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', '서버', 5,'211.218.158.169', '', '수집 서버', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', '서버', 6,'211.218.158.180', '', '', 'AhnLab admin / qwe123!@#')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', '서버', 7,'152.99.143.8', '', '', 'TEAM VIEWER :: 1-292-617-688, 통신@&00')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS052', '서버', 8,'59.30.115.166', '8081', '', 'admin/1q2w3e4r!')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS053', 'PBX', 1, '119.196.46.190', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS053', '서버', 1,'119.196.46.146', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS033', 'PBX', 1, '220.125.115.242', '', '', 'ktvoip / !giga2600')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS033', '서버', 1, '119.196.46.146', '', '', 'ktvoip / !giga2600')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS033', '서버', 2, '220.125.115.243', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS034', 'PBX', 1, '220.89.117.39', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS034', '서버', 1, '220.89.117.52', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS034', '서버', 2, '220.89.117.51', '', 'UTM', 'Admin / 영양70b!')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 1, '210.123.176.3', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', '서버', 1, '210.123.176.24', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 2, '210.123.176.10', '', '', 'admin / !@#12ulipcs')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', '서버', 2, '210.123.176.25', '', '', 'admin / !@#12ulipcs')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 3, '210.123.176.13', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 4, '210.123.176.19', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 5, '210.123.176.22', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 6, '210.123.176.23', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 7, '210.123.176.54', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', '서버', 7, '210.123.176.35', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 8, '210.123.176.55', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 9, '210.123.176.56', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 10, '210.123.176.57', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', '서버', 10, '210.123.176.36', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 11, '210.123.176.58', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', 'PBX', 12, '210.123.176.59', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS054', '서버', 13, '113.192.69.5', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS055', 'PBX', 1, '218.149.9.80', '', '', 'ktvoip / gj!1soip')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS055', '서버', 1, '218.149.9.81', '', '', 'ktvoip / gj!1soip')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS056', 'PBX', 1, '118.44.121.162', '', '', 'admin / !bswjn007')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS056', '서버', 1, '121.155.11.105', '', '', 'admin / !bswjn007')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS056', 'PBX', 2, '222.113.8.26', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS056', 'PBX', 3, '222.113.8.27', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS056', '서버', 4, '121.155.11.98', '', '웹 서버', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS056', '서버', 5, '121.155.11.99', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', 'PBX', 1, '220.122.241.39', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', '서버', 1, '220.122.241.38', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', 'PBX', 2, '220.122.241.40', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', '서버', 2, '220.122.241.42', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', 'PBX', 3, '220.122.241.41', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', '서버', 3, '220.122.241.43', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', 'PBX', 4, '220.122.241.44', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', 'PBX', 5, '220.122.241.46', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS057', 'PBX', 6, '220.122.241.47', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS058', 'PBX', 1, '59.23.126.73', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS058', '서버', 1, '59.23.126.72', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS059', 'PBX', 1, '121.169.59.133', '', '', 'ktvoip / nbgw**01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS059', '서버', 1, '121.169.59.132', '', '', 'ktvoip / nbgw**01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS060', 'PBX', 1, '121.151.124.79', '', '', 'admin / ~ ktdgn7!')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS060', '서버', 1, '121.151.124.73', '', '', 'admin / ~ ktdgn7!')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS061', 'PBX', 1, '59.2.147.5', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS061', '서버', 1, '59.2.147.7', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS062', '서버', 1, '59.30.131.241', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS062', '서버', 2, '59.30.131.240', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS062', '서버', 3, '152.99.141.128', '', '', 'AnyDesk 100 847 832 --> 통신@&00')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS063', 'PBX', 1, '211.197.166.181', '', '', 'ktvoip / snnsc#0001')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS063', '서버', 1, '211.197.166.184', '', '', 'ktvoip / snnsc#0001')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS063', 'PBX', 2, '211.197.166.182', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS063', 'PBX', 3, '211.197.166.183', '', '', 'admin / qwe123!@#')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS063', '서버', 3, '211.197.166.185', '', 'UTM', 'admin / qwe123!@#')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS066', 'PBX', 1, '220.89.163.46', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS066', '서버', 1, '220.89.163.56', '', '', 'ktvoip / snnsc#01')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS066', '서버', 2, '220.89.163.57', '', '기상수집', 'KT 비즈지원 010-3073-7830')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS066', '서버', 3, '220.89.163.55', '', '', '업체 010-2523-8138')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS066', '서버', 4, '111.21.109.110', '', '재산면 셋톱', '589 011 662(any)')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS074', '서버', 1, '59.2.147.201', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS074', '서버', 2, '59.2.147.202', '', 'WEB', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS074', '서버', 3, '59.2.147.200', '', 'UTM', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS075', '서버', 1, '59.30.33.85', '', '', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS075', '서버', 2, '59.30.33.84', '', 'UTM', '')
;

INSERT INTO TB_MngOrgSvrInfo
VALUES('UCS076', '서버', 1, '221.158.112.159', '', '', '')
;

-----------------------------------------------------------------------
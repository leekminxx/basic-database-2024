-- 문제 1번 
SELECT Email
	,  Mobile
	,  Names
	,  Addr
  FROM membertbl
 ORDER BY Addr DESC, Email ASC, Mobile DESC;


-- 문제 2번
SELECT DISTINCT Names AS '도서명'
              , Author AS '저자'
              , ISBN
              , price AS '정가'
		   FROM bookstbl
	   ORDER BY price DESC;


 -- 문제 3번 
SELECT m.Names AS '회원명',
       m.Levels AS '회원등급',
       m.Addr AS '회원주소',
       r.rentalDate AS '대여일'
  FROM membertbl m LEFT OUTER JOIN rentaltbl r
	ON r.memberIdx = m.memberIdx
 WHERE rentalDate IS NULL
   AND m.Levels = 'A';


-- 문제 4번
SELECT d.Names AS '책 장르'
	 ,  FORMAT(SUM(b.Price), '#,#') + '원' AS '총 합계 금액'
 FROM divtbl d, bookstbl b
 WHERE d.Division = b.Division
 GROUP BY d.Division, d.Names


-- 문제 5번
SELECT ISNULL(d.Names, '--합계--') AS '책 장르'
	 , COUNT(*) AS '권수'
	 ,  FORMAT(SUM(b.Price), '#,#') + '원' AS '총 합계 금액'
 FROM divtbl d, bookstbl b
 WHERE d.Division = b.Division
 GROUP BY d.Names WITH ROLLUP;
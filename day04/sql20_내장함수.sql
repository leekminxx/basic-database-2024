-- 내장함수
-- 수학함수 들
-- 함수의 결과값은 (열 이름 없음) 이름지정 필요 
SELECT ABS(-5) , ABS(5)
-- 올림 , 내림 , 반올림 , N승
SELECT CEILING(4.01) , FLOOR(4,4), ROUND(4,4,0) , POWER(2,10);

-- 고객별 평균주문 금액
SELECT custid 
     , SUM(saleprice) AS '고객별 총 주문금액'   
     , AVG(saleprice) AS '고객별 주문평균금액'
     , COUNT(*) AS '고객별 주문수' 
     , ROUND(SUM(slaeprice) / COUNT(*),0) AS '계산한 평균금액'
   FROM Orders
   GROUP BY custid;

-- 문자열함수 들
-- 책제목에 야구를 농구로 바꿔서 출력
-- FROMAT(VAR , ' 포멧값')
SELECT bookid
     , REPLACE(bookname, '야구' ,  '농구')  AS bookname
     , publisher
     , FORMAT(price , '#,#') AS price
     FROM Book;

SELECT bookname AS '제목'
     , LEN(bookname) AS [제목별 길이]
     FROM Book
     WHERE publisher = '굿스포츠';

-- 영문자 단어 , 코드 변환시 유용하게 많이 사용
SELECT LOWER('HELLO') , UPPER('hello');

-- LTR , RTRIM , TRIM(!!)
SELECT '|' + LTRIM('       HELLO          ')+ '|'
      , '|' + LTRIM('       HELLO          ')+ '|'
      , '|' + LTRIM('       HELLO          ')+ '|'

-- LEFT() , RIGHT()
SELECT LEFT('HELLO WORLD!', 5)
     , RIGHT('HELLO WORLD!', 5)
     , SUBSTRING('HELLO WORLD!',7, 6);

--CHARINDEX() 문자 찾기 
SELECT CHARINDEX('sql', 'Microsoft SQL Server 2022'); 

-- SUBSTRING() 연계
SELECT SUBSTRING ('Microsoft SQL Server 2022',
                 CHARINDEX('sql', 'Microsoft SQL Server 2022'),
                 LEN('sql'));






    -- 날짜 및 시간함수
SELECT GETDATE();

SELECT MONTH(GETDATE())

SELECT YEAR(GETDATE());

SELECT FORMAT(GETDATE() , 'yyyy-MM-dd');
SELECT FORMAT(GETDATE() , 'HH:mm:ss');

-- 주문 테이블에서 주문 10일 후에 각주문을 확정짓는다 . 확정일자 출력 
-- dd(날짜) , mm(달) , yy(년) , qq(분기) , wk(주)
SELECT orderid
     , saleprice
     , orderdate AS '주문일자' 
     , DATEADD(dd, 10 , orderdate) AS '확정일자'
     , DATEADD(mm , 1, orderdate) AS '통계일자'
     FROM ORders;



































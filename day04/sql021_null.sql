-- NULL에 대한 고찰 
-- MyBook 데이블에서 시작
SELECT bookid
     , price + 100
  FROM MyBook;

-- 합계 , 전체의 COUNT는 문제 x , 평균에서와 price COUNT는 NULL값이 빠짐.
SELECT SUM(price) , AVG(price) , COUNT(*) , COUNT(price)
  FROM MyBook;

SELECT (10000 + 20000 + 0) / 3;

--bookid 가 없는 데이터로 통계를 낼때는 NULL이 나와야 함 
SELECT SUM(price) , AVG(price) , COUNT(*) , COUNT(price)
  FROM MyBook;
 WHERE bookid >= 4;

-- NULL 비교(!)
-- NULL 은 일반 비교연산자로 비교 x
-- IS / IS NOT
SELECT *
  FROM MyBook
 WHERE price  IS NOT NULL;

 -- ISNULL() 함수 : NULL인 데이터를 다른 값으로 치환
 -- 사전 작업 (Customer 테이블)
 SELECT *
    FROM Customer
  WHERE phone IS NULL;

UPDATE Customer
   SET phone = NULL
 WHERE custid =2;
--표기만 연란처없음 으로 바뀜 null 값으로 되는것은 아니고
 SELECT custid
     , [name]
     , [address]
     , ISNULL(phone, '연락처없음') AS phone
   FROm Customer;

-- TOP n (함수느낌으로 보면됨)  
SELECT TOP 3 orderid , custid , saleprice
  FROM Orders
 ORDER BY saleprice DESC;
-- TOP은 내장된 키워드 (함수 x)  
SELECT TOP 3 orderid , custid , saleprice
  FROM Orders
  
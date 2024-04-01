SELECT [name]
  FROM Customer
EXCEPT
SELECT [name]
  FROM Customer
 WHERE custid IN (SELECT DISTINCT custid FROM Orders);
-- 합집합 중복을 허용안함
SELECT [name]
  FROM Customer
 UNION
SELECT [name]
  FROM Customer
 WHERE custid IN (SELECT DISTINCT custid FROM Orders);

-- 합집합 중복을 허용
SELECT [name]
  FROM Customer
 UNION ALL
SELECT [name]
  FROM Customer
 WHERE custid IN (SELECT DISTINCT custid FROM Orders);


--교집합
   SELECT [name]
     FROM Customer
INTERSECT
   SELECT [name]
     FROM Customer
    WHERE custid IN (SELECT DISTINCT custid FROM Orders);

--UNION -각 컬럼의 타입형이 각각 일치해야 함
SELECT bookid    --int
     , bookname   --VARCHAR(40)
  FROM book
 UNION
SELECT custid    --int
    , [name]
 FROM Customer;

--EXIST 하나의 테이블에 존재하는 값만 보고싶다.
SELECT * 
    ,  c.address
  FROM Customer AS c
 WHERE EXISTS (SELECT*       --서브쿼리 
                FROM Orders AS o
                WHERE o.custid = c.custid);

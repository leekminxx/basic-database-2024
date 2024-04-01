-- 1. 주문하지 않은 고객의 이름(서브쿼리 사용)
/*SELECT *
  FROM Book AS b
 WHERE b.bookid NOT IN(SELECT o.bookid
                         FROM Orders AS o , Customer AS C
                        WHERE o.custid = c.custid
                          AND ); */
---------------------------------------

SELECT [name]
  FROM Customer
 WHERE custid NOT IN (SELECT DISTINCT custid 
                                FROM Orders);--주문경로 찾기 DISTINCT로 ?
   -- FROM Orders  -- 주문이니깐 Orders에서 찾아봄



-- 2. 주문 금액의 총액과 주문의 평균 금액
/* SELECT *
  FROM Orders AS o1
 WHERE o1.price > (SELECT AVG(o2.price)
                     FROM orders AS o2
                    WHERE 
 )  */
--
 SELECT SUM(saleprice) AS '추문총액'
       ,AVG(saleprice) AS '주문평균 금액'
    FROM Orders
-- 3. 고객의 이름과 고객별 구매액
/*SELECT *
    FROM Book
    WHERE bookid IN(
                    SELECT bookid
                      FROM Orders
                     WHERE Custid = (SELECT custid
                                       FROM Customer
                                      WHERE [])) */
------------------------------------------------------
SELECT (SELECT [name] FROM Customer c WHere c.custid = o.custid)
      ,SUM(o.saleprice) AS ' 고객별 구매액 '
  FROM Orders AS o
 GROUP BY o.custid

-- 4. 고객의 이름과 고객이 구매한 도서 목록
/*SELECT *
  FROM Book */
--------------------------------------------------
SELECT c.[name], b.bookname
  FROM Customer c, Orders o, Book b
 WHERE c.custid = o.custid
   AND o.bookid = b.bookid
 ORDER BY o.custid;



-- 5. 도서의 가격(Book테이블)과 판맥가격(Orders테이블)의 차이가 가장 많은 구문 
/*SELECT b.publisher , b.price , o.saleprice
       ,(b.price - o.price) AS '도서가격 판매가격 차이'
    FROM Book AS b , Orders AS o , Customer AS c
   WHERE b.bookid = o.bookid


SELECT *
  FROM Book AS b1
 WHERE b1.price > */

-----------------------------------------------------

SELECT TOP 1 o.orderid --1
     , o.saleprice --2
     , b.price --3
     , (b.price - o.saleprice) AS '금액차 ' --4
  FROM Orders AS o , Book AS b
 WHERE o.bookid = b.bookid
-- ORDER BY (b.price - o.slaeprice) DESC;
ORDER BY 4 DESC;


-- 6. 도서 판매액 평균보다 자신의구매액 평균이 더 높은 고객의 이름
SELECT *
  FROM Book AS b1
 WHERE b1.price > (SELECT AVG(o1.saleprice)
                     FROM Orders AS o ) 

-------------------------------
SELECT b.AVG AS '구매액 평균'
     , c.[name]
  FROM(SELECT AVG(o1.saleprice)) AS avg
            , o1.custid 
         FROM Orders AS o1
        GROUP BY o1.custid) AS b, Customer AS c
WHERE b.custid = c.custid 
  AND b.avg >= (SELECT AVG(saleprice)
                  FROM Orders);
        
-- 두가지 방법
SELECT (SELECT [name] FROM Customer WHERE custid = base.custid) AS '고객명'
      ,base.Average
  FROM (SELECT o.custid 
              ,AVG(o.saleprice) AS Average
          FROM Orders AS o 
         GROUP By o.custid ) AS base
  WHERE base.Average > = (SELECT AVG(saleprice)
                    FROM Orders)
                    
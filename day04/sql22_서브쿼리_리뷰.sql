-- WHERE 절
-- Order테이블에서 평균 주문금액 이하의 주문에 대해 주문번호, 금액 표시
-- 서브쿼리(소괄호 내의 쿼리부터) 먼저 작성 
-- 11800원 이하만 출력
SELECT orderid
     , saleprice
  FROM Orders
 WHERE saleprice < (SELECT AVG(saleprice)
                      FROM Orders);

-- 각 고객의 평균 주문금액보다 큰 금액의 주문 내역 주문번호 , 고객번호 , 금액표시
-- 다른 방식으로 쿼리를 작성하기 어려움
-- 1번 평균 13000원 
-- 2번 평균 7500원
-- 3번 평균 10333원
-- 4번 평균 16500월
SELECT o2.custid
     , AVG(saleprice) AS avg_saleprice
  FROM Orders AS o2
 GROUP BY o2.custid

-- 메인쿼리의 컬럼을 서브쿼리의 컬럼과 비교할 때 사용.
-- 난이도가 높음.
SELECT o1.*
  FROM Orders AS o1
 WHERE o1.saleprice > (SELECT AVG(saleprice) AS avg_saleprice
                         FROM Orders AS o2
                        WHERE o1.custid = o2.custid);

-- IN , NOT IN 
-- 대한민국에 거주하는 고객에게 판매한 도서이 총 판매액
-- 118000 - 460000 = 72000(박지성 , 추신수 구매한 금액)
SELECT FORMAT(SUM(saleprice), '#,#') AS ' 대한민국 고객 총판매액'
  FROm Orders
 WHERE custid NOT IN(SELECT custid
                   FROM Customer
                  WHERE [address] LIKE '%대한민국%');

 
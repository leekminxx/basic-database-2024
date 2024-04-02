--1. 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구새한 고객 이름
SELECT DISTINCT  Custid
    FROM Orders
    WHERE bookid IN (
    SELECT bookid
    FROM Book
    WHERE  publisher IN (SELECT b.publisher
                                       FROM Cutomer AS c, Orders AS o , Book AS b 
                                       WHERE c.custid = o.custid 
                                       AND o.bookid = b.bookid 
                                       AND c.[name] = '박지성'));
    
SELECT b.custid 
       , CONVERT(float, b.custCount)  /  b.totalCount AS '구매율'
    FROM (SELECT custid
                , COUNT(custid) AS custCount
                , (SELECT COUNT(custid) FROM Orders) AS totalcount
            FROM Orders
            GROUP BY custid) AS b
    WHERE CONVERT(float,b.custCount) / b.totalCount >= 0.3;
                
-- 4-1. 새 도서 추가 
INSERT INTO Book
    VALUES(14, '스포츠 세계' , '대한미디어', 10000);

-- 4-2. 삼성당 도서 삭제
DELETE FROM Book
 WHERE publisher = '삼성당';

DELETE FROM Book
WHERE publisher = ' 이상미디어';

-- 4-4 출판사 대한미디어를 대한출판사로 바꾸씨오
UPDATE Book
   SET publisher = '대한출판사'
 WHERE bookid IN(SELECT bookid
                   FROM Book
                   WHERE publisher = '대한미디어')

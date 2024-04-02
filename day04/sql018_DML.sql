-- 삽임(INSERT)
INSERT INTO Book(bookid , bookname , publisher , price)
    VALUES (11, '스포츠 의학' ,'한솔의학서적' , 90000);

-- 속성리스트를 생략가능
INSERT INTO Book 
    VALUES (12, '스포츠 의학2' , '한솔의학서적' , 90000);

-- 속성리스트를 생략가능
INSERT INTO Book
    VALUES (12 ,'스포츠 의학2' , '한솔의학서적' , 90000);

-- 값은 생략가능(단 , 값을 생략하면 컬럼을 다 지정해줘야함)
INSERT INTO Book(bookid , bookname , publisher)
    VALUES (13 ,'스포츠 의학' , ' 한솔의학서적');

--새 테이블 생성
-- 여기는 3장에서 사용되는 Imported_book테이블
CREATE TABLE Imported_Book (
  bookid      INT,
  bookname    VARCHAR(40),
  publisher   VARCHAR(40),
  price       INT 
);
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

-- 특수 INSERT INTO ... SELECT ...
INSERT INTO Book(bookid , bookname , publisher , price)
     SELECT bookid , bookname , publisher , price 
       FROM Imported_Book;

-- 수정(UPDATE)
-- 사전 준비 , 이전의 Customer 테이블 내용을 CustomerNew로 복사
SELECT custid , name , address , phone 
  INTO CustomerNew
  FROM Customer;

-- Customer 테이블에서 고객번호가 5인 고객의 주소를 대한민국 부산으로 변경 
UPDATE Customer 
   SET [address] = '대한민국 부산'
 WHERE custid = 5;


-- CustomerNew 에서 고객번호가 5인 고객의 주소를 대한민국 광주로 변경 
UPDATE CustomerNew
   SET [address] = '대한민국 광주'
 WHERE custid = 5;

-- Customer 테이블에서 박세리 고객의 주소를 김연아 주소로 변경
UPDATE Customer 
   SET [address] = (SELECT [address]
                      FROM Customer
                     WHERE [name] ='김연아')
  WHERE [name]  = ' 박세리';

-----
UPDATE CustomerNew
   SET [name] = '박채리'
    ,  [address] = '미국 보스턴'
    ,  phone = ' + 01 010-9999-9999'
 WHERE custid = 5;       --key

--수정은 여러컬럼(속성) 같이 가능
UPDATE Customer
   SET [name] = '박채리'
    ,  [address] = '미국 보스턴'
    ,  Phone = '+01 010-9999-9999'
 WHERE custid = 5;

 --- 삭제 
 DELETE FROM CustomerNew
   WHERE custid = 5;

-- 수정 , 삭제는 항상 트랜잭션과 같이 실행해야 함 

-- 연습문제 풀이 
-- 3. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
--(1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
SELECT [name] = '박지성'
  FROM Orders
 WHERE bookid = (SELECT [Orders]
                   FROM Book 
                  WHERE publisher = '박지성')



--(2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
SELECT DISTINCT o.customer_name 
           FROM customers c






--(3) 전체 고객의 30% 이상이 구매한 도서
SELECT *
  FROM Book AS b1
 WHERE b1.Orders
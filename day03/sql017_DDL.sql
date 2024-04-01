-- DDL -데이터 정의 언어 
-- 객체 생성, 수정 , 삭제 

-- 1. NewBook 이라는 테이블 생성하라 
/*

    bookid(도서번호: 기본키) -int 
    bookname(도서이름) -varchar(20)
    publisher(출판사)  - varchar(20)
    price(가격) - int

    -- 타입종류
    int(정수) , BIGINT(인트보다 큰 사이즈, 큰정수) , BINARY(이진 타입 50사이즈 부터 시작 ) , Bit[0|1] 또는 1 , 
    CHAR (n 의 사이즈 , 고정문자 ) | VARCHAR(n) [가변 , 문자열] , NCHAR(N) , NVARCHAR(n) [유니코드], 파일이름에 N - 붙어서 나오면 유니코드
    EX) username : CHAR (20) ) 'LKM'
    char(20)  = 'lkm          '  이름을 넣고 10개의 자리중 빈곳은 전부 스페이스 입력   
    VARCHAR(10) = 'lkm' 이름을 넣고 10개의 자리중 빈곳은 전부 없애버림 
    DATE[날짜] , DATETIME[날짜시간] , DECIMAL (18 , 0) [소수점표현실수] , FLOAT[실수],
    IMAGE[이미지 바이러리] , SMALLINT[255까지의 정수] , TEXT[2GB까지의 텍스트] , NTEXT[유니코드 2G]

    -- 가장 많이 쓰는 타입
    INT , CHAR , VARCHAR , DATETIME , DECIMAL , FLOAT , TEXT 외에는 잘 안씀

*/
DROP TABLE NewBook; -- 에이블 삭제                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                


CREATE TABLE NewBook (
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
    PRIMARY KEY (bookid)  -- 기본키로 bookid 지정
);

-- 기본키를 통합
CREATE TABLE NewBook (
    bookid INT PRIMARY KEY,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
);

-- 기본키가 두개이상이면 ,
CREATE TABLE NewBook (
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
    PRIMARY KEY (bookid , bookname)  -- 기본키로 bookid 지정
);

-- 각 컬럼에 제약조건을 걸면
CREATE TABLE NewBook (
    bookname VARCHAR(20) NOT NULL , 
    publisher VARCHAR(20) UNIQUE,
    price INT DEFAULT 10000 CHECK(price > 1000) -- check 900을 넣고 데이터를 넣으려고 하면 닫아버림
    PRIMARy KEY(bookname, publisher) -- 개체 무결성 제약조건
);

-- 새 고객테이블
CREATE TABLE NewCustomer (
    custid INT PRIMARY KEY,
    custname VARCHAR(40),
    custaddress VARCHAR(255),
    phone VARCHAR(30) 
);

-- 새 주문테이블 (기본키 + 외래키)
CREATE TABLE NewOrder (
    orderid INT, 
    custid INT NOT NULL,
    bookid INT NOT NULL,
    saleprice INT,
    orderdate DATE,
    PRIMARY KEY (orderid),
    FOREIGN KEY (custid) REFERENCES NewCustomer(custid)ON DELETE CASCADE 
);

--2. 테이블 변경/수정 ALTER
CREATE TABLE MyBook (
    bookid       INT,
    bookidname   VARCHAR(20),
    publisher    VARCHAR(20),
    price        INT,
);

-- MyBook에 isbn이라는 컬럼을 추가 
ALTER TABLE MyBook ADD isbm VARCHAR(13);

-- isbn을 INT형으로 변경 
ALTER TABLE MyBook ALTER COLUMN isbm INT;

-- isbn을 컬럼 삭제
ALTER TABLE MyBook DROP COLUMN isbm 

-- bookname 을 NOT NULL로 제약조건 적용
ALTER TABLE MyBook ALTER COLUMN bookname INT NOT NULL;

-- bookid에 기본키 설정 
ALTER TABLE MyBook ALTER COLUMN bookid INT NOT NULL;
ALTER TABLE MyBook ADD PRIMARY KEY(bookid);


-- 3. 테이블 삭제 
DROP TABLE MyBook;

-- 자식테이블을 삭제하기 전에는 절대 안지워짐
DROP TABLE NewOrder;
DROP TABLE NewCustomer;
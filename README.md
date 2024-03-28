# basic-database-2024
iot 개발자과정 SQLServer 학습 리포지토리

## 1일차
- MS SQL Server설치 |: https://www.microsoft.com/ko-kr/sql-server/sql-server-downloads 최신버전
    - DBMS 엔진 -개발자 버전
        - iso 다운로드 후 설치 추천
        - SQL Server에 대한 Azure 확장 비활성화 
        - 데이터베이스 엔진 구성부터 중요
            - Wintdows 인증모드로 하면 외부에서 접근불가
            - 혼합모드(sa) 에 대한 암호를 지정해줘야 함  /mssql_p@ss (8자 이상[대소문자구분]특수문자 1자 이상) 
            - 데이터루트 디렉토리는 변경 
    - 개발툴 설치 
        - SSMS(Sql Server Mangement Studio) DB에 접근 , 여러개발 작업목표

- 데이터베이스 개념
    - 데이터를 보관 , 간뢰 , 서비스하는 시스템
    - Data , Information , Knowlege 개념
    - DBms > Database , Data(Model)

- DB 언어 
    - SQL(Structured Query Language) : 구조화된 질의 언어
        - DDL(Data Definition Lang) - 데이터베이스 , 테이블 , 인덱스 생성
        - DML (Data Manipulation Lang) - 검색(SELECT) , 삽입(INSERT) , 수성(UPDATA), 삭제(DELECT) 등 기능 (중요!)
        - DCL (data control Lang) 

- SQL 기본 학습
    -SSMS 실행

- DML 학습
    - SQL 명령어 키워드 ,: SELECT , INSERT , UPDAET , DELETE
    - IT 개발 표현언어 : REQUEST , Create , UPdate , DElete(CRUD로 부름 , CPU 개발 뜻은 INSERT , UPDATA , SELECT 를 할 수 있는 끼능을 개발)
    - SELECT
    '''sql
     SELECT[ALL | DISTINCT] 속성이름(들)
        FROM 테이블이름 (들)
        [WHERE 검색조건(들)]
        [GROUP BY 속성이름(들)]
        [HAVING 검색조건(들)]
        [ORDER BY 속성이름(들)[ASC|DESC)]]
    '''
    SELECT 문 학습
        - 기본 , 조건검색 학습 중 



## 2일차

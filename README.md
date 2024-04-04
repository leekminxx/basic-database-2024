# basic-database-2024
iot 개발자과정 SQLServer 학습 리포지토리

## 1일차(24.03.23)
- MS SQL Server설치 |: https://www.microsoft.com/ko-kr/sql-server/sql-server-downloads 최신버전
    - DBMS 엔진 -개발자 버전
        - iso 다운로드 후 설치 추천
        - SQL Server에 대한 Azure 확장 비활성화 
        ![기능선택](https://github.com/leekminxx/basic-database-2024/blob/main/images/db001.png)
        - 데이터베이스 엔진 구성부터 중요
            - Wintdows 인증모드로 하면 외부에서 접근불가
            - 혼합모드(sa) 에 대한 암호를 지정해줘야 함  /mssql_p@ss (8자 이상[대소문자구분]특수문자 1자 이상) 
            - 데이터루트 디렉토리는 변경 
    - [개발툴 설치]
    - 개발툴 설치 
        - SSMS(Sql Server Mangement Studio) DB에 접근 , 여러개발 작업목표

- 데이터베이스 개념
    - 데이터를 보관 , 간뢰 , 서비스하는 시스템
    - Data , Information , Knowlege 개념
    - DBms > Database , Data(Model)

- 외부 스키마
    - 일반 사용자나 응용 프로그래머가 접근하는 계층 , 전체 데이터베이스 중에서 하나의 논리적인 부분을 의미
    - 여러 개의 외부 스키마 가 있을 수 있음
    - 서브 스키마 라고도 하며 , 뷰(VIEW)의 개념

- 개념 스키마
    - 전체 테이터베이스의 정의를 의미
    - 통합 조직별로 하나만 존재하며 DBA가 관리함
    - 하나의 데이터베이스에는 하나의 개념 스키마가 있음

- 내부 스키마 
    - 물리적 저장 장치에 데이터 베이스가 실제로 저장되는 방법의 표현
    - 내부 스키마는 하나
    - 인덱스 , 데이터 레코드의 배치 방법 , 데이터 압축 등에 관한 사항이 포함됨

- DB 언어 
    - SQL(Structured Query Language) : 구조화된 질의 언어
        - DDL(Data Definition Lang) - 데이터베이스 , 테이블 , 인덱스 생성 , CREATE  , ALTER , DROP
        - DML (Data Manipulation Lang) - 검색(SELECT) , 삽입(INSERT) , 수성(UPDATA), 삭제(DELECT) 등 기능 (중요!)
        - DCL (data control Lang) -권한 , 트랜스액션 부여/ 제거 기능 , GRANT , REVOKE
        - TCL (Transaction control Lang)  - 트랜스액션(트랜잭션) 제어하는 기능 COMMIT , ROLLBACK , 원래는 DCL의 일부 , 기능이 특이해서 TCL로 분리

- SQL 기본 학습
    -SSMS 실행
    ![SSMs로그인](https://github.com/leekminxx/basic-database-2024/blob/main/images/db002.png)

    -특이사항 - SSMs 쿼리창에서 소스코드 작성시 빨간색 오류 밑줄이 가끔 표현(전부 오류는 아님!)

- DML 학습
    - SQL 명령어 키워드 ,: SELECT , INSERT , UPDAET , DELETE
    - IT 개발 표현언어 : REQUEST , Create , UPdate , DElete(CRUD로 부름 , CPU 개발 뜻은 INSERT , UPDATA , SELECT 를 할 수 있는 끼능을 개발)
    - SELECT
        ```sql
        SELECT [ALL | DISTINCT] 속성이름(들)
          FROM 테이블이름 (들)
         [WHERE 검색조건(들)]
         [GROUP BY 속성이름(들)]
         [HAVING 검색조건(들)]
         [ORDER BY 속성이름(들)[ASC|DESC]]
        ```
    - SELECT 문 학습
        - 기본 , 조건검색 학습 중 
## 2일차
- Database 학습
    - DB 개발시 사용할 수 있는 틀
        - SSMS(기본) 
        - Visual Studio - 아무런 설치 없이 개발 가능 
        - VS Code에서 DB개발하기 - SQL Server(mssqql) 플러그인 설치하고 개발
    - ServerName(HostName) - 본인 컴퓨터 이름 | 본인 네트워크 주소 | 127.0.0.1 (LoopBack)| (localhost URL) 중에서 선호하는거 아무거나
    - 관계 데이터 모델
    - 행 , 레코드 , 열 , 정렬 , 정렬이름 , 데이터 
    - 카디날리티 - 튜플의 수

    - 릴레이션 특징
    1. 속성은 단일값을 가짐(책이름이 여러개 들어가면 안됨)
    2. 속성은 다른 이름으로 구성 (책이름이라는 속성이 두번있으면 안됨)
    3. 속성의 값은 정의된 도메인값만 가짐(대학교 학년에 5학년이 있으면 안됨)
    4. 속성의 순서는 상관없음
    5. 릴레이션내 중복된 튜플 허용안함(같은 책 정보를 두번 넣을 수 없음)
    6. 튜플 순서는 상관없음(1,2,3,5,2,6)

   관계 데이터 모델은 아래의 요소로 구성됨
    - 릴레이션(Relation)
    - 제약조건(Contraints)
    - 관계대수((Relation) algebra)

    
- DML 학습
    - SELECT문
        - 복합조건 , 정렬 
        - 집계함수와 GROUP BY
            - SUM(총합) , AVG(평균) , COUNT(개수), MIN(최소) , MAX(최대값)
            - 집계함수 외 일반 컬럼은 Group By 절에 속한 SELECT문에 사용가능
            - HAVING은 집계함수의 필터로 GRROUP BY 뒤에 작성. WHERE 절과 필터링이 다르다.
        - 두개 이상의 테이블 질의(Query)
            - 관계형 DB에서 가장 중요한 기법중 하나 : JOIN!
            - INNER JOIN(내부 조인)
            - LEFT|RIGHT OUTER JOIN(외부 조인) - 어느 테이블이 기준인지에 따라서 결과가 상이함

        ![외부조인](https://github.com/leekminxx/basic-database-2024/blob/main/images/db004.png)


        - 부속질의(SubQuery)
	        - 쿼리 내에 다시 쿼리를 작성하는것 
	        - 서브쿼리를 쓸 수 있는 장소
		        - SELECT절 - 한컬럼에 하나의 값만 
		        - FROM절 - 가상의 테이블로 사용
		        - WHERE - 여러 조건에 많이 사용
	    - 집합연산 -JOIN도 집합이지만 , 속성별로 가로로 병합하기 때문에 집합이라 부르지 않음. 집합은 데이터를 세로로 합치는 것을 뜻함
		    - 차집합(UNION , 진짜 많이 사용) -UNION(중복제거) , UNION ALL(중복허용)
		    - 합집합(EXCEPT , 거의 사용안함) -하나의 테이블에서 교집합 값을 뺀 나머지
		    - 교집합(INTERSECT, 거의 사용안함) -두 테이블에 모두 조재하는 값
		    - EXISTS - 데이터 자체의 존재여부로 

## 3일차 
- DDL 학습 -SSMS에서 마우스로 조작이 편리
	- CREATE -개체(데이터베이스 , 테이블 , 뷰 , 사용자 , 등)를 생성하는 구문
	```sql
	    -- 테이블 생성에 한정
	CREATE TABLE 테이블명 
	({ 속성이름 데이터타입 
		[NOT NULL]
		[UNIQUE]
		[DEFAULT 기본값]
		[CHECK 체크조건]
	}
		[PRIMARY KEY 속성이름(들)]
		{[FORIEGN KEY 속성이름 REFERENCES 테이블이름(속성이름)]
			[ON UPDATE [NO ACTION | CASCADE | SET NULL | SET DEFAULT]]
        }
    )
     ```    
    - ALTER - 개체를 변경(수정) 하는 구문
    ```sql
    ALTER TABLE 테이블명
        [ADD 속성이름 데이터타입]
        [DROP COLUMN 속성이름]
        [ALTER COLUMN 속성이름 데이터타입]
        [ALTER COLUMN 속성이름 [NULL | NOT NULL]]
        [ADD PRIMARY KEY(속성이름)]
        [[ADD | DROP]제약조건이름];
    ```
- DROP - 개체를 삭제하는 구문
    ```sql
    DROP TABLE 테이블명;
    ```

    -외래키로 사용되는 기본키가 있으면 , 외래키를 사용하는 테이블 삭제 후 , 기본키의 테이블 삭제 해야함!

## 4일차 

- 관계 데이터 모델
    - 관계대수 - 릴레이션에서 원하는 결과를 얻기위한 수학의 대수와 같은 연산 사용  기술하는 언어
    - 셀렉션 , 프로젝션 , 집합 , 조인 , 카티션 프로덕트 , etc ... 

- DML 학습(SELECT외)
    - INSERT

        ```sql
        INSERT INTO 테이블이름[(속성리스트)]
            VALUES(값리스트);
        
    - UPDATE

        ```sql
        -- 트랜잭션을 걸어서 복구를 대비 
        UPDATE 테이블이름
            SET 속성이름1 = 값[, 속성이름2=값, ...]
            [WHERE < 검색조건 >] -- 실무에서는 빼면 안됨.
        ```
    - DELETE 

        ```sql
        --트랜잭션을 걸어서 복구를 대비 
        DELETE FROM 테이블이름
            WHERE <검색조건> -- 실무에서는 빼면 큰일남

- SQL 고급 
    - 내장함수
        - 수학함수 , 문자열함수 , 날짜/시간함수 , 변환함수 , 커서함수(!),
        보안함수 , 시스템함수 등
        - NULL(!)
    - 서브쿼리 리뷰 
        - SELECT - 단일행 , 단일열 (스칼라 서브쿼리)
        - FROM - 다수행 , 다수열 
        - WHERE - 다수행 , 단일열(보통)
            - 비교연산 , 집합연산 , 한정연산 , 존재연산 가능
    - 뷰
    - 인덱스 

## 5일차
 - SQL 고급 
    - 서브쿼리 리뷰
    - 뷰 - 복잡한 쿼리로 생성되는 결과를 자주 사용하기 위해서 만드는 개체
        - 편리하고 , 보안에 강하며 , 논리적 독립성을 띰
        - 원본데이터가 변경되면 같이 변경되고 , 인덱스 생성은 어렵 , CUD 연산에 제약이 있음 

        ```sql
        CREATE VIEW 뷰이름 [(열이름 [, ...])]
        AS <SELECT 쿼리문>;

        -- 수정
        ALTER VIEW 뷰이름[(열이름[, ...])]
        -- 삭제
        DROP VIEW 뷰이름;
        ```

    - 인덱스

        ```sql
        -- 생성
        create[UNIQUE][CLUSTERED|NONCLUSTERED]INDEX 인덱스이름
        ON 테이블명 (속성이름[ASC|DESC] [,...n]);

        -- 수정
        ALTER INDEX {인덱스 이름 | ALL}
        ON 테이블명 {REBUILD | DISABLE | REORGANIZE};

        -- 삭제 
        DROP INDEX 인덱스이름 ON 테이블명 ;
        ```
        - SSMS 에서 실행계획을 가지고 쿼리 실행 성능을 체크할 수 있음 
        n

- 파이썬 Server 연동프로그래밍
    - Madang   DB 관리 프로그램
        - PyQT GUI 생성
        - SQL Server 데이터 핸들링
            - Pymysql 라이브러리 설치

        ```shell
        > pip install pymssql
        ```

        - DB연결 설정 - Oracle , MySQL 등은 설정이 없음 . 구성관리자에서 TCP?IP 로 접근을 허용하지 않으면 접속 안됨
            1. 시작메뉴 > 모든 앱 > Microsofr SQL Server 20xx > SQL Server 20xx 구성관리자 실행
            2. SQL Server 네트워크 구성 > MSSQL Server 에 대한 프로토콜 클릭
            3. TCP/IP 프로토콜 상태 가 사용안함(최초) > TCP/IP 를 더블클릭 
            4. 프로토콜 사용 > 예, 로 변경 
            5. IP주소 탭 > IP주소가 본인 아이피인 것 > 사용 > 예 , 로 변경 
            6. 127.0.0.1 로 된 주소 > 사용 > 예 , 로 변경
            7. SQL Server 서비스 > SQL Server (MSSQLSERVER) 더블클릭 후 , **다시시작** 버튼 클릭 , 재시작 필요 
            ![구성관리자](https://github.com/leekminxx/basic-database-2024/blob/main/images/db005.png)
- 데이터베이스 모델fld


## 6일차 
- 파이썬 Server 연동프로그래밍
    - Madang   DB 관리 프로그램
        - PyQt5 + pymssql
    
    - 문제점 - 한글 깨짐문제
        1. DB 테이블의 varchar(ASCII) -> nvarchar(UTF-8) 변경
        2. Python에서 pymss로 접속할 때 , charset을 'UTF8'로 설정
        3. INSERT 쿼리에 한글 입력되는 컬럼은 N''을 붙여줌(유니코드로 입력하라는 뜻)
- 데이터베이스 모델링
- 실행화면
  https://github.com/leekminxx/basic-database-2024/assets/158007500/3b8a75c7-64c2-4d22-a200-3a444a2934bf



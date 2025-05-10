# 📌 eGovFrame 게시판 

Java 기반의 eGovFrame + JSP (JSTL) + iBATIS + Oracle

## 주요 기능

- 글 작성 (비밀번호 포함)
- 글 목록 보기
- 글 수정 (비밀번호 확인)
- 글 삭제 (비밀번호 확인)
- 검색 기능 (제목, 내용, 작성자)
- 페이지네이션 (10개 단위)

## 기술 스택
- eGovFramework 3.10
- Java 8
- JSP + JSTL
- iBATIS 
- Oracle 11g 
- Apache Tomcat 9.x 
- Eclipse IDE (eGovFrame Dev 환경)

## 데이터베이스 테이블
```sql
CREATE TABLE NBOARD (
    UNQ     NUMBER PRIMARY KEY,
    TITLE   VARCHAR2(100) NOT NULL,
    PASS    VARCHAR2(100) NOT NULL,
    NAME    VARCHAR2(20),
    CONTENT VARCHAR2(4000),
    HITS    NUMBER DEFAULT 0,
    REGDATE TIMESTAMP DEFAULT SYSTIMESTAMP
);

## 게시판 목록
http://localhost:9080/myproject_new/boardList.do

![image](https://github.com/user-attachments/assets/9d56e616-4bdb-4096-9314-4ce8ff211227)


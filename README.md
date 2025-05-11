
## 기술 스택
Java 기반의 eGovFrame + JSP (JSTL) + iBATIS + Oracle

- eGovFramework 3.10
- Java 8
- JSP + JSTL
- iBATIS 
- Oracle 11g 
- Apache Tomcat 9.x 
- Eclipse IDE (eGovFrame Dev 환경)


## 1. 게시판 주요 기능
- 글 작성 (비밀번호 포함)
- 글 목록 보기
- 글 수정 (비밀번호 확인)
- 글 삭제 (비밀번호 확인)
- 검색 기능 (제목, 내용, 작성자)
- 페이지네이션 (10개 단위)


## 2. 네이버 지도 시각화 주요 기능
- 구군 및 연도 선택 UI
- 공공데이터 데이터 수신 (위도, 경도, 장소명, 사고건수)
  ( 도로교통공단 API : https://www.data.go.kr/data/15057732/openapi.do ) 
- 네이버 지도 시각화 (마커 표시 + 툴팁 표시 (Overlay), 마커 클릭시 상세 정보 표시)


## URL
- HOME : http://localhost:9080/myproject_new/
- 게시판 : http://localhost:9080/myproject_new/boardList.do
- 네이버지도 : http://localhost:9080/myproject_new/bikeMap.do?gugun=140&year=2023


## images 
docs/home.png
docs/board.png
docs/board_detail.png
docs/bikeMap.png


## 데이터베이스 테이블 (게시판)
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


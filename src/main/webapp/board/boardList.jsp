<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/board/board_list.css'/>"/>
    <!-- 무료 웹폰트: Noto Sans KR -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
	<c:if test="${not empty deleteMsg}">
	    <script>alert('${deleteMsg}');</script>
	</c:if>
    <div class="container-base">
        <h2 class="heading">게시글 목록</h2>

		<div class="top-bar">
		    <div class="btn-area list">
		        <a href="boardWrite.do" class="btn-write">글쓰기</a>
		    </div>
		
		    <form action="boardList.do" method="get" class="search-form">
		        <select name="searchType">
		            <option value="">전체</option>
		            <option value="title" ${searchType == 'title' ? 'selected' : ''}>제목</option>
		            <option value="content" ${searchType == 'content' ? 'selected' : ''}>내용</option>
		            <option value="name" ${searchType == 'name' ? 'selected' : ''}>작성자</option>
		        </select>
		        <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="검색어 입력" />
		        <button type="submit">검색</button>
		    </form>
		</div>
		        
		<div>총 : ${totalCount}개</div>	
	    <!-- 게시판 테이블 -->
		<div class="table-wrapper">
		    <div class="table-header">
		        <div>번호</div>
		        <div>제목</div>
		        <div>작성자</div>
		        <div>조회수</div>
		        <div>작성일</div>
		    </div>
			<c:set var="startIndex" value="${(currentPage - 1) * 10}" />
		    <c:forEach var="result" items="${resultList}" varStatus="status">
		        <div class="table-row">
		            <div>${startIndex + status.index + 1}</div>
		            <div><a href="boardDetail.do?unq=${result.unq}">${result.title}</a></div>
		            <div>${result.name}</div>
		            <div>${result.hits}</div>
		            <div>${fn:substring(result.regdate,0,10)}</div>
		        </div>
		    </c:forEach>
		</div>
		
		<c:set var="startPage" value="${currentPage - 2 < 1 ? 1 : currentPage - 2}" />
		<c:set var="endPage" value="${currentPage + 2 > totalPages ? totalPages : currentPage + 2}" />
		
		<!-- 페이징 -->
		<div class="pagination-container">
		    <div class="pagination">
		        <c:if test="${currentPage > 1}">
		            <a href="boardList.do?page=${currentPage - 1}" class="page-btn">&lt;</a>
		        </c:if>
		
				<c:forEach begin="${startPage}" end="${endPage}" var="i">
				    <c:choose>
				        <c:when test="${i == currentPage}">
				            <strong>${i}</strong>
				        </c:when>
				        <c:otherwise>
				            <a href="boardList.do?page=${i}">${i}</a>
				        </c:otherwise>
				    </c:choose>
				</c:forEach>
		
		        <c:if test="${currentPage < totalPages}">
		            <a href="boardList.do?page=${currentPage + 1}" class="page-btn">&gt;</a>
		        </c:if>
		    </div>
		</div>
	</div>
	
	<script>
	function fn_delete(unq) {
	    if (confirm("정말 삭제하시겠습니까?")) {
	        location.href = "boardDelete.do?code=" + unq;
	    }
	}

	</script>
</body>
</html>

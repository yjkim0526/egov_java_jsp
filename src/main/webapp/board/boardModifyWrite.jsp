<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 수정</title>
    <link rel="stylesheet" href="<c:url value='/css/board/board_form.css'/>" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
</head>
<body>
<div class="container-form">
    <h2 class="form-heading">게시글 수정</h2>

    <form action="boardUpdate.do" method="post">
        <!-- 글 고유번호 -->
        <input type="hidden" name="unq" value="${result.unq}" />

        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" id="title" name="title" value="${result.title}" required />
        </div>

        <div class="form-group">
            <label for="name">작성자</label>
            <input type="text" id="name" name="name" value="${result.name}" readonly />
        </div>

        <div class="form-group">
            <label for="content">내용</label>
            <textarea id="content" name="content" rows="10" required>${result.content}</textarea>
        </div>

        <div class="form-buttons">
            <button type="submit" class="btn">저장</button>
            <a href="boardList.do" class="btn btn-secondary">목록</a>
        </div>
    </form>
</div>

</body>
</html>

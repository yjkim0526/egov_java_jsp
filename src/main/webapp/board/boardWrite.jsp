<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>게시판 등록</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<c:url value='/css/board/board.css'/>"/>
    <!-- 무료 웹폰트: Noto Sans KR -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<script>
function fn_submit() {
	if ($.trim($('#title').val()) === "") {
        alert("title을 입력하세요.");
        $('#title').focus();
        return false;
    }

    if ($.trim($('#pass').val()) === "") {
        alert("pass를 입력하세요.");
        $('#pass').focus();
        return false;
    }

    if ($.trim($('#name').val()) === "") {
        alert("name을 입력하세요.");
        $('#name').focus();
        return false;
    }

    if ($.trim($('#content').val()) === "") {
        alert("content를 입력하세요.");
        $('#content').focus();
        return false;
    }

    // 유효성 검사 통과 시 폼 제출
    $('form[name="frm"]').submit();
    
}

function validateContent() {
    const textarea = document.getElementById('content');
    const warning = document.getElementById('content-warning');
    const content = textarea.value;
    
    // 정규식: 금지할 특수문자 또는 태그 (예: <script>, <iframe>, 등)
    const forbiddenPattern = /<script.*?>.*?<\/script>|<iframe.*?>.*?<\/iframe>/gi;
    if (content.trim().length === 0) {
        warning.innerText = "내용을 입력해주세요.";
        warning.style.display = "block";
    } else if (content.length > 2000) {
        warning.innerText = "내용은 최대 2000자까지만 입력할 수 있습니다.";
        warning.style.display = "block";
    } else if (forbiddenPattern.test(content)) {
        warning.innerText = "스크립트 또는 위험한 태그는 입력할 수 없습니다.";
        warning.style.display = "block";
    } else {
        warning.innerText = "";
        warning.style.display = "none";
    }
}

</script>
<body class="page-body">

    <div class="form-container">
        <h2 class="form-title">게시판 등록</h2>
         <form name="frm" method="post" action="boardInsert.do" class="board-form">
            <div class="form-group">
                <label for="title" class="form-label">제목</label>
                <input type="text" name="title" id="title" class="form-input">
            </div>

            <div class="form-row">
                <div class="form-group half">
                    <label for="pass" class="form-label">암호</label>
                    <input type="text" name="pass" id="pass" class="form-input">
                </div>
                <div class="form-group half">
                    <label for="name" class="form-label">글쓴이</label>
                    <input type="text" name="name" id="name" class="form-input">
                </div>
            </div>

            <div class="form-group">
                <label for="content" class="form-label">내용</label>
                <textarea name="content" id="content" class="form-textarea" oninput="validateContent()"></textarea>
                <div id="content-warning" class="warning-message"></div>
            </div>

            <div class="form-buttons">
                <button type="submit" class="btn btn-primary" onclick="fn_submit(); return false;">저장</button>
                <button type="reset" class="btn btn-secondary">취소</button>
                <button type="button" class="btn btn-list" onclick="location.href='boardList.do'">목록</button>
            </div>

        </form>
    </div>

</body>
</html>
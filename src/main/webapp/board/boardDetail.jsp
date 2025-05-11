<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="<c:url value='/css/board/board_detail.css'/>" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet" />
</head>
<script>
	// localStorage 저장 
    document.addEventListener('DOMContentLoaded', function () {
        var postId = ${result.unq}; 
        var viewedKey = 'viewed_' + postId;
        if (!localStorage.getItem(viewedKey)) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "increaseHit.do?unq=" + encodeURIComponent(postId), true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    localStorage.setItem(viewedKey, "true");
                }
            };
            xhr.send();
        }
    });
</script>

<body>

	<c:if test="${not empty errorMsg}">
	    <script>alert('${errorMsg}');</script>
	</c:if>

    <div class="container-detail">
        <h2 class="detail-heading">게시글 상세보기</h2>

		<div class="detail-item">
		    <label class="detail-label">제목</label>
		    <div class="detail-box">${result.title}</div>
		</div>
		
		<div class="meta-row">
		    <div class="meta-item">
		        <div class="label">작성자</div>
		        <div class="value">${result.name}</div>
		    </div>
		    <div class="meta-item">
		        <div class="label">등록일</div>
		        <div class="value">${result.regdate}</div>
		    </div>
		    <div class="meta-item">
		        <div class="label">조회수</div>
		        <div class="value">${result.hits}</div>
		    </div>
		</div>
		
		<div class="detail-item">
		    <label class="detail-label">내용</label>
		    <div class="detail-box content">${result.content}</div>
		</div>
		

        <div class="btn-area">
            <a href="boardList.do" class="btn">목록</a>
            <button type="button" class="btn" onclick="checkPassword(${result.unq},'edit')">수정</button>
            <button type="button" class="btn" onclick="checkPassword(${result.unq},'delete')">삭제</button>
        </div>
    </div>
    
<script>
function checkPassword(unq, mode) {
    const pass = prompt("비밀번호를 입력하세요:");
    if (pass !== null && pass.trim() !== "") {
        const form = document.createElement("form");
        form.method = "post";
        form.action = "checkPassword.do";

        const unqInput = document.createElement("input");
        unqInput.type = "hidden";
        unqInput.name = "unq";
        unqInput.value = unq;

        const passInput = document.createElement("input");
        passInput.type = "hidden";
        passInput.name = "pass";
        passInput.value = pass;

        const modeInput = document.createElement("input");
        modeInput.type = "hidden";
        modeInput.name = "mode";
        modeInput.value = mode;
        
        form.appendChild(unqInput);
        form.appendChild(passInput);
        form.appendChild(modeInput);

        if (mode === "edit" || mode === "delete" ){
            document.body.appendChild(form);
            form.submit();
        }
    }
}

</script>
    
</body>
</html>

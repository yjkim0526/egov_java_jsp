<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyProject 메인 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="<c:url value='/css/home/home_style.css' />" rel="stylesheet" />
</head>
<body>

    <!-- Header -->
    <div class="header">
        <h2>MyProject</h2>
        <h3>eGovFrame + Java + Jsp + iBatis + Oracle</h3>
    </div>

    <!-- Top Menu -->
    <div class="top-menu">
        <ul>
            <li><a href="/myproject_new/home.do">홈</a></li>
            <li><a href="/myproject_new/boardList.do" target="_blank">게시판</a></li>
            <li><a href="/myproject_new/bikeMap.do" target="_blank">네이버 지도</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main">
        <div class="container">
            <img src="<c:url value='/images/main.jpg' />" style="max-width: 100%; height: 350px; border-radius: 10px; margin-bottom: 10px;" alt="메인 이미지">
            <p class="subtitle">
                                들러 주셔서 감사 합니다 ^^<br>
            </p>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        &copy; 2025 MyProject. All rights reserved.
    </div>

</body>

</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코드 목록</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        padding: 20px;
        background-color: #f8f9fa;
    }

    .container {
        max-width: 800px;
        margin: auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    h2 {
        text-align: center;
        color: #333;
    }

    .total {
        margin: 10px 0;
        font-size: 14px;
        color: #666;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        table-layout: fixed;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 12px;
        text-align: center;
        word-wrap: break-word;
    }

    th {
        background-color: #f0f0f0;
        font-weight: bold;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    a {
        display: inline-block;
        margin-top: 20px;
        padding: 10px 20px;
        text-decoration: none;
        background-color: #007bff;
        color: white;
        border-radius: 5px;
        text-align: center;
    }

	.btn-area.list {
	    text-align: right;
	    margin-top: 10px;
	}

    a:hover {
        background-color: #0056b3;
    }

    /* 반응형 */
    @media (max-width: 600px) {
        .container {
            padding: 10px;
        }

        table, th, td {
            font-size: 12px;
            padding: 8px;
        }

        h2 {
            font-size: 18px;
        }

        a {
            font-size: 14px;
            padding: 8px 16px;
        }
    }
</style>
</head>
<script>
function fn_delete(code){
	alert(code);
	console.log(">>code:"+code);
}

</script>
<body>
    <div class="container">
        <h2>코드 목록</h2>
        <div class="total">Total : ${resultTotal}개</div>

		<div class="btn-area list">
		    <a href="codeWrite.do">Write</a>
		</div>
		<table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>그룹명</th>
                    <th>코드명</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:set var="count" value="1" />
                <c:forEach var="result" items="${resultList}" varStatus="status">
                    <tr>
                        <td><c:out value="${count}" /> (${result.code})</td>
                        <td><c:out value="${result.gid}" /></td>
                        <td><c:out value="${result.name}" /></td>
                        <td>
							<button type="button">수정</button>
							<button type="button" onclick="fn_delete('${result.code}');">삭제</button>
						</td>
                    </tr>
                    <c:set var="count" value="${count+1}" />
                </c:forEach>
            </tbody>
        </table>

        
    </div>
</body>
</html>

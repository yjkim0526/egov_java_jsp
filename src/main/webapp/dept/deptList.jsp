<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
table {
	width: 400px;
	border-collapse:collapse; /* cell 간격 제거 */
}
th, td {
	border: 1px solid #cccccc;
	padding: 5px;
}
</style>

<body>

	<!-- errorMessage 출력 -->
	<c:if test="${not empty errorMessage}">
		<%--
		<div style="color: red; font-weight: bold;">
			${errorMessage}
		</div> 
		--%>
		<script type="text/javascript">
        	alert("${errorMessage}");
    	</script>
	</c:if>

	<table>
		<caption>부서 목록</caption>
		<tr>
			<th>deptno</th>
			<th>dname</th>
			<th>loc</th>
		</tr>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td>${result.deptno}</td>
				<td><a href="deptDetail.do?deptno=${result.deptno}">${result.dname}</a></td>
				<td>${result.loc}</td>					
			</tr>	
		</c:forEach>
	</table>
	<a href="deptWrite.do" >Write</a>

</body>
</html>

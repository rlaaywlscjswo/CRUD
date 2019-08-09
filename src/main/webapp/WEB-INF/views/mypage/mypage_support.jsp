<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 후원 현황</title>
<style>
body {
	width: 1000px;
}

div {
	margin: 10px;
	padding: 2px;
	width: 300px;
	height: 150px;
	border : 1px solid;
	background-color: chartreuse;
	color: dodgerblue;
	border-radius: 10px;
	display: inline-block;
	border: 1px solid;
}
</style>
</head>
<body>

	<c:forEach var="slist" items="${supportList}">
		<div>
			후원 일자 :
			<c:out value="${slist.da}" /> <br>
			썸네일 이미지 :
			<c:out value="${slist.project_photo}" /> <br>
			후원 진행 사항 :
			<c:out value="${slist.support_status}" /> <br>
			프로젝트 이름 :
			<c:out value="${slist.project_title}" /> <br>
			선택한 옵션 :
			<c:out value="${slist.option_no}" /> <br>
			후원 금액 :
			<c:out value="${slist.option_price}" />
		</div>
	</c:forEach>


</body>
</html>
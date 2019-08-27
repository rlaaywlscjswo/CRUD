<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
 <c:forEach var="opt" items="${option }">
<c:out value="${opt.option_no }"/><br>
<c:out value="${opt.option_name}"/><br>
<c:out value="${opt.option_price }"/><br>
<c:out value="${opt.option_contents }"/><br>
<c:out value="${opt.option_quantity }"/><br>
<c:out value="${opt.project_no }"/>
<form action="pay" method="post">
	<input type="hidden" name="option_no" value="${opt.option_no }">
	<input type="hidden" name="option_name" value="${opt.option_name }">
	<input type="hidden" name="option_price" value="${opt.option_price }">
	<input type="hidden" name="option_contents" value="${opt.option_contents }">
	<input type="hidden" name="option_quantity" value="${opt.option_quantity }">
	<button>구매하기</button>
</form>
</c:forEach>
</body>
</html>
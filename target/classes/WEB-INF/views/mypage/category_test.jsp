<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리 테스트 페이지</title>
</head>
<body>
	<ul>
		<li><label for="main_category">대분류</label> <select
			id="main_category" name="main_category">
				<c:forEach var="main" items="${mainlist }">
					<option value="${main.main_category }">${main.main_category }</option>
				</c:forEach>
		</select></li>

		<li><label for="sub_category">소분류</label> <select
			id="sub_category" name="sub_category">
				<c:forEach var="sub" items="${sublist}">
					<option value="${sub.sub_category }">${sub.sub_category }</option>
				</c:forEach>
		</select></li>
	</ul>
</body>
</html>
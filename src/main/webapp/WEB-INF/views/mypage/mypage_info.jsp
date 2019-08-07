<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>이름</th>
				<th>이메일</th>
			</tr>
		</thead>
		<tbody>

			<c:forEach var="myPage" items="${list}">
				<tr>
					<td><c:out value="${myPage.name}" /></td>
					<td><c:out value="${myPage.email}" /></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>



</body>
</html>
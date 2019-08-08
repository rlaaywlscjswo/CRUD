<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 정보</title>
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

			<c:forEach var="list" items="${infoList}">
				<tr>
					<td><c:out value="${list.name}" /></td>
					<td><c:out value="${list.email}" /></td>
				</tr>
			</c:forEach>

		</tbody>
	</table>



</body>
</html>
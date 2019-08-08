<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 후원 현황</title>
</head>
<body>

	<table>
		<thead>
			<tr>
				<th>후원 번호</th>
				<th>후원 일자</th>
				<th>처리 상태</th>
				<th>회원 번호</th>
				<th>옵션 번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="slist" items="${supportList}">
				<tr>
					<td><c:out value="${slist.support_no}" /></td>
					<td><c:out value="${slist.support_date}" /></td>
					<td><c:out value="${slist.support_status}" /></td>
					<td><c:out value="${slist.no}" /></td>
					<td><c:out value="${slist.option_no}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>
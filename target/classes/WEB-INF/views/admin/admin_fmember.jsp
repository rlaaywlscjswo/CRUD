<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀딩 회원 관리</title>
</head>
<body>

	<!-- 회원 번호, 이름, 이메일, 펀딩 이름, 달성 금액 / 목표 금액, 성공 여부 / 달성률, 계약서 -->
	
	<article>
		<table>
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>회원 이름</th>
					<th>이메일</th>
					<th>프로젝트 이름</th>
					<th>달성 금액 / 목표 금액</th>
					<th>성공 여부 / 달성률</th>
					<th>계약서</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="fmlist" items="${fmemberList}">
					<tr>
						<td>${fmlist.no}</td>
						<td>${fmlist.name}</td>
						<td>${fmlist.email}</td>
						<td>${fmlist.project_title}</td>
						<td>${fmlist.targetprice}</td>
						<td>${fmlist.project_status}</td>
						<td>${fmlist.project_contract}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</article>

</body>
</html>
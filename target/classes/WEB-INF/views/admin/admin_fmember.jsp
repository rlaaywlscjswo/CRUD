<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀딩 회원 관리</title>
<style>
	table, th, td {
		border: 1px solid silver;
		border-collapse: collapse;
	}
</style>
</head>
<body>
	
		<table>
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>회원 이름</th>
					<th>이메일</th>
					<th>프로젝트 이름</th>
					<th>현재 후원금 / 목표 후원금</th>
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
						
						<td>
						<c:set var="pt" value="${fmlist.project_title}" />
						<c:choose>
						<c:when test="${pt == null}">등록 된 프로젝트가 없..</c:when>
						<c:otherwise>${fmlist.project_title}</c:otherwise>
						</c:choose>
						
						</td>
						<td>
						<c:set var="sop" value="${fmlist.sumop}" />
						<c:set var="ntp" value="${fmlist.ntargetprice}" />
						<c:choose>
						<c:when test="${ntp == null}">등록 된 프로젝트가 없..</c:when>
						<c:when test="${sop == null}">아직 후원을 받지 못했.. / ${fmlist.ntargetprice}원</c:when>
						<c:when test="${sop > ntp}"><span style="font-size: 2em;">${fmlist.sumop}원</span> / ${fmlist.ntargetprice}원</c:when>
						<c:otherwise>${fmlist.sumop}원 / ${fmlist.ntargetprice}원</c:otherwise>
						</c:choose>						
						</td>
						
						<td>
						<c:set var="rper" value="${fmlist.reachper}" />
						<c:choose>
						<c:when test="${rper > 100}"><span style="color: dodgerblue; font-size: 3em;">프로젝트 성공! </span> <span style="font-size: 2em;"> / </span> <span style="color: lime; font-size: 2em;"> ${fmlist.reachper}%</span></c:when>
						<c:when test="${rper == null}">아직염.. / 0%</c:when>
						<c:otherwise>아직염.. / ${fmlist.reachper}%</c:otherwise>
						</c:choose>
						</td>
						
						<td>${fmlist.project_contract}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀딩 회원 관리</title>
<style>

	*{
		margin: 0;
		padding: 0;
	}
	table, th, td {
		border: 1px solid silver;
		border-collapse: collapse;
	}
	
	th, td {
		height: 60px;
	}
	
	table {
		display: inline-block;
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
					<th>평균 평점</th>
					<th>프로젝트 번호</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="fmlist1" items="${fmemberList1}">
					<tr>
						<td>${fmlist1.no}</td>
						<td>${fmlist1.name}</td>
						<td>${fmlist1.email}</td>
						<td>${fmlist1.project_title}
						<td>${fmlist1.arating}</td>
						<td>${fmlist1.project_no}</td>
					</tr>				
				</c:forEach>
			
				
			</tbody>
		</table>
		
		<table>
			<thead>	
				<tr>			
					<th>프로젝트 번호</th>
					<th>현재 후원금 / 목표 후원금</th>
					<th>성공 여부 / 달성률</th>
					<th>계약서</th>
				</tr>
			</thead>
			
			<tbody>
				<c:forEach var="fmlist2" items="${fmemberList2}">
					<tr>						
						
						<td>${fmlist2.project_no}</td>
						
						<td>
						<c:set var="sop" value="${fmlist2.sumop}" />
						<c:set var="ntp" value="${fmlist2.ntargetprice}" />
						<c:choose>
						<c:when test="${sop == null}">아직 후원을 받지 못했.. / ${fmlist2.ntargetprice}원</c:when>
						<c:when test="${sop > ntp}"><span style="font-size: 2em;">${fmlist2.sumop}원</span> / ${fmlist2.ntargetprice}원</c:when>
						<c:otherwise>${fmlist2.sumop}원 / ${fmlist2.ntargetprice}원</c:otherwise>
						</c:choose>						
						</td>
						
						<td>
						<c:set var="rper" value="${fmlist2.reachper}" />
						<c:choose>
						<c:when test="${rper > 100}"><span style="color: dodgerblue; font-size: 3em;">프로젝트 성공! </span> <span style="font-size: 2em;"> / </span> <span style="color: lime; font-size: 2em;"> ${fmlist2.reachper}%</span></c:when>
						<c:when test="${rper == null}">아직염.. / 0%</c:when>
						<c:otherwise>아직염.. / ${fmlist2.reachper}%</c:otherwise>
						</c:choose>
						</td>
						
						<td>${fmlist2.project_contract}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
		<div>
			<h3>펀딩 회원 명</h3>
			<table>
				<thead>
					<tr>
						<th>성공 횟수 / 총 펀딩 횟수</th>
						<th>평균 달성률</th>
						<th>평균 평가점수</th>
					</tr>
				</thead>
				
			</table>
		</div>
		
		<form name="excelForm" id="excelForm" method="post" action="./excelDown.do">
			<input type="submit" id="excelDown" value="Excel 다운">
		</form>

</body>
</html>
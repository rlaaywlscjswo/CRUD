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
		border: 1px solid crimson;
		border-collapse: collapse;
	}
	
	th, td {
		height: 60px;
	}
	
</style>
</head>
<body>

		<div id="fmember_searching">
			<form method="get" action="fmember?currPage=${dto.firstPageOfBlock}">
				<label for="fmember_search" id="fmember_label"></label>
				<input type="text" id="fmember_search" name="fmember_search" placeholder="  프로젝트 이름으로 검색해주세요 :)">
				<input type="submit" value="찾아줘!!" id="fmember_find">
			</form>
		</div>

		<table>
			<thead>
				<tr>
					<th>회원 번호</th>
					<th>회원 이름</th>
					<th>이메일</th>
					<th>프로젝트 이름</th>
					<th>평균 평점</th>
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
						<td>${fmlist.project_title}
						<td>${fmlist.arating}</td>
						<td>
						<c:set var="sop" value="${fmlist.sumop}" />
						<c:set var="ntp" value="${fmlist.ntargetprice}" />
						<c:choose>
						<c:when test="${sop == null}">아직 후원을 받지 못했.. / ${fmlist.ntargetprice}원</c:when>
						<c:when test="${sop > ntp}"><span>${fmlist.sumop}원</span> / ${fmlist.ntargetprice}원</c:when>
						<c:otherwise>${fmlist.sumop}원 / ${fmlist.ntargetprice}원</c:otherwise>
						</c:choose>						
						</td>
						
						<td>
						<c:set var="rper" value="${fmlist.reachper}" />
						<c:choose>
						<c:when test="${rper > 100}"><span style="color: dodgerblue;">프로젝트 성공! </span> <span> / </span> <span style="color: lime;"> ${fmlist.reachper}%</span></c:when>
						<c:when test="${rper == null}">아직염.. / 0%</c:when>
						<c:otherwise>아직염.. / ${fmlist.reachper}%</c:otherwise>
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
				<tbody>
					<tr>
						<td>${successCount}회 / ${regipro}회</td>
						<td>${avgdal}%</td>
						<td>${avgRating}점</td>
					</tr>
				</tbody>
			</table>
		</div>
		
			<div id="fmember_paging">
		
			<c:if test="${dto.prev}">
				<a href="fmember?currPage=${dto.firstPageOfBlock-1}&fmember_search=${fmember_search}">
				<c:out value="이전" /></a>
			</c:if>

			<c:forEach var="index" begin="${dto.firstPageOfBlock}" end="${dto.lastPageOfBlock}">
				<a href="fmember?currPage=${index}&fmember_search=${support_search}">
				<c:out value="${index}" /></a>
			</c:forEach>

			<c:if test="${dto.next}">
				<a href="fmember?currPage=${dto.lastPageOfBlock+1}&fmember_search=${fmember_search}">
				<c:out value="다음" /></a>
			</c:if>
			
		</div> <!-- #support_paging -->
		
		<form name="excelForm" id="excelForm" method="post" action="./excelDown.do">
			<input type="submit" id="excelDown" value="Excel 다운">
		</form>

</body>
</html>
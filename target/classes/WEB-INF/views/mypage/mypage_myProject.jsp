<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 프로젝트</title>
<link href="\resources\css/admin.css" rel="stylesheet">
</head>
<body>

	<div class="wrap">

		<div id="theNumbersOfMyProject">내가 만든 프로젝트 개수 :
			${theNumbersOfMyProject}개</div>


		<!-- 검색 -->
		<div id="search">
			<form method="get" action="mypro?currPage=${dto.firstPageOfBlock}">
				<label for="project_search" id="project_label"></label> <input
					class="form-control form-control-sm" type="text"
					id="bh_search" name="project_search"
					placeholder="  프로젝트 이름으로 검색해주세요 :)" style="width: 400px;">
				<input type="submit" value="찾아줘!!" id="project_find"
					class="btn btn-primary">
			</form>
		</div>

		<!-- 내가 만든 프로젝트 목록 -->
		<c:forEach var="myProject_list" items="${myProject_list}">
			<div class="card mb-3" style="max-width: 540px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="${myProject_list.project_photo}" alt="썸네일 이미지">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">${myProject_list.project_title}</h5>
							<p class="card-text">
							
								<c:set var="moin" value="${myProject_list.sumop}" />
								<c:if test="${moin == null}">후원 받은 금액 : 후원 받은 금액이 없습니다. <br></c:if>
								<c:if test="${moin != null}">후원 받은 금액 : ${myProject_list.sumop}원<br></c:if>
								
								<c:set var="rd" value="${myProject_list.remainingDay}" />
								<c:choose>
									<c:when test="${rd < 2 && rd > -1}">남은 시간 : ${myProject_list.nam}시간<br>
									</c:when>
									<c:when test="${rd < -1}">남은 날 : 이미 종료된 프로젝트입니다. <br></c:when>
									<c:otherwise>남은 날 : ${myProject_list.remainingDay}일<br>
									</c:otherwise>
								</c:choose>
								<c:set var="dal" value="${myProject_list.reachper}"/>
								<c:if test="${dal == null}">달성률 : 후원 받은 금액이 없습니다.<br></c:if>
								<c:if test="${dal != null}">달성률 : ${myProject_list.reachper}% <br></c:if>
								<button onclick="window.open('${myProject_list.project_contract}')">계약서</button>									
								<br>


							</p>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<!-- 내가 만든 프로젝트 목록 끝 -->


		<!-- 페이징 -->
		<div class="col-12" id="paging">
			<div class="pagination-area d-sm-flex mt-15">
				<nav aria-label="#">
					<ul class="pagination">
						<li class="page-item"><c:if test="${dto.prev}">
								<a class="page-link"
									href="mypro?currPage=${dto.firstPageOfBlock-1}&project_search=${project_search}">
									<c:out value="이전" />
								</a>
							</c:if></li>

						<c:forEach var="index" begin="${dto.firstPageOfBlock}"
							end="${dto.lastPageOfBlock}">
							<li class="page-item"><a class="page-link"
								href="mypro?currPage=${index}&project_search=${project_search}">
									<c:out value="${index}" />
							</a></li>
						</c:forEach>

						<li class="page-item"><c:if test="${dto.next}">
								<a class="page-link"
									href="mypro?currPage=${dto.lastPageOfBlock+1}&project_search=${project_search}">
									<c:out value="다음" />
								</a>
							</c:if></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- 페이징 끝 -->


	</div>

</body>
</html>
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
								모인 금액 : ${myProject_list.sumop}원<br>
								<c:set var="rd" value="${myProject_list.remainingDay}" />
								<c:choose>
									<c:when test="${rd < 2}">남은 시간 : ${myProject_list.nam}시간<br>
									</c:when>
									<c:otherwise>남은 날 : ${myProject_list.remainingDay}일<br>
									</c:otherwise>
								</c:choose>
								달성 퍼센트 : ${myProject_list.reachper}%<br> 계약서 :
								${myProject_list.project_contract}<br>


							</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
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
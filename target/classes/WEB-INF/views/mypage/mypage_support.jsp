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

	<div class="mypage_support_wrap">

		<!-- filter -->
		<div id="support_filter">
			<span id="filter_all">모두 보기</span> <span id="filter_ing">진행 중인
				프로젝트</span> <span id="filter_complete">목표 금액을 달성한 프로젝트</span>
		</div>
		
		
		<!-- 검색 -->
		<div id="support_searching">
			<form method="get" action="support?currPage=${dto.firstPageOfBlock}">
				<label for="support_search" id="search_label"></label> <input
					class="form-control form-control-sm" type="text"
					id="support_search" name="support_search"
					placeholder="  프로젝트 이름으로 검색해주세요 :)" style="width: 400px;">
				<input type="submit" value="찾아줘!!" id="support_find"
					class="btn btn-primary">
			</form>
		</div>

		<!-- 내가 후원 한 프로젝트 목록 -->
		<c:forEach var="mySupport_list" items="${mySupport_list}">

			<div class="card mb-3" style="max-width: 540px;">
				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="${mySupport_list.project_photo}" alt="썸네일 이미지">
					</div>
					<div class="col-md-8">
						<div class="card-body">
							<h5 class="card-title">
								<c:out value="${mySupport_list.project_title}" />
							</h5>
							<p class="card-text">
								후원 일자 :
								<c:out value="${mySupport_list.da}" />
								<br> 후원 진행 사항 :
								<c:out value="${mySupport_list.support_status}" />
								<br> 선택한 옵션 :
								<c:out value="${mySupport_list.option_name}" />
								<br> 후원 금액 :
								<c:out value="${mySupport_list.option_price}" />

							</p>
							<p class="card-text">
								<small class="text-muted">Last updated 3 mins ago</small>
							</p>
						</div>
					</div>
				</div>
			</div>

		</c:forEach>


		<!-- 페이징 -->
		<div class="col-12">
			<div class="pagination-area d-sm-flex mt-15">
				<nav aria-label="#">
					<ul class="pagination">
						<li class="page-item"><c:if test="${dto.prev}">
								<a class="page-link"
									href="support?currPage=${dto.firstPageOfBlock-1}&support_search=${support_search}">
									<c:out value="이전" />
								</a>
							</c:if></li>

						<c:forEach var="index" begin="${dto.firstPageOfBlock}"
							end="${dto.lastPageOfBlock}">
							<li class="page-item"><a class="page-link"
								href="support?currPage=${index}&support_search=${support_search}">
									<c:out value="${index}" />
							</a></li>
						</c:forEach>

						<li class="page-item"><c:if test="${dto.next}">
								<a class="page-link"
									href="support?currPage=${dto.lastPageOfBlock+1}&support_search=${support_search}">
									<c:out value="다음" />
								</a>
							</c:if></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- 페이징 끝 -->

	</div>
	<!-- .mypage_support_wrap -->

</body>
</html>
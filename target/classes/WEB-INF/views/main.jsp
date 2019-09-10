<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>temp</title>

<!-- Bootstrap core CSS -->
<link href="resources\vendor\bootstrap\css\bootstrap.min.css"
	rel="stylesheet">

<!-- Custom fonts for this template -->
<link href="resources\vendor\fontawesome-free\css\all.min.css"
	rel="stylesheet">
<link
	href="resources\vendor\simple-line-icons\css\simple-line-icons.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Bree+Serif&display=swap"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="resources\css\landing-page.min.css" rel="stylesheet">
<link rel="stylesheet" href="\resources\css/main.css">
<style type="text/css">
#cate1 {
	background-color: yellow;
}

#cate2 {
	background-color: green;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="\resources\js/main.js"></script>

</head>


<body>
	<!-- Navigation -->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="container">
			<a class="navbar-brand" href="main">CRUD</a>


			<!-- 병훈쓰가 추가 함 -->
			<sec:authorize access="isAnonymous()">
				<a id="logButton" href="/sec_login">로그인</a>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<form action="/customLogout" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}">
					<button id="logButton">로그아웃</button>
				</form>
			</sec:authorize>

			
			
				<nav class="bh_nav">
					<ul>
					<sec:authorize access="isAuthenticated()">
						<li>
							<h5><a href="#">마이 페이지</a></h5>
								<div class="my hide">
									<ul>
										<li><a href="/info">내 프로필</a></li>
										<li><a href="/support">내 후원 내역</a></li>
										<li><a href="/mypro">내가 만든 프로젝트</a>
									</ul>
								</div>
						</li>
					</sec:authorize>
					
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li>
							<h5><a href="#">관리 페이지</a></h5>
								<div class="admin hide">
									<ul>
										<li><a href="/fmember">펀딩 회원 관리</a></li>
										<li><a href="/spro">펀딩 현황 목록</a></li>
										<li><a href="#">고객 문의</a></li>
									</ul>
								</div>
						</li>
					</sec:authorize>
					</ul>
				</nav>
				
			



		</div>
	</nav>

	<!-- Masthead -->
	<header class="masthead text-white text-center">
		<div class="container">
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h1 class="mb-5">
						CRUD<br> Connect Reality<br> Unlimited Dream
					</h1>
				</div>
				<div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
					<form method="get"
						action="/projectlist?currPage=${page.startBlock }">
						<div class="form-row">
							<div class="col-12 col-md-9 mb-2 mb-md-0">
								<input type="text" class="form-control form-control-lg"
									id="searchtxt" name="searchtxt" class="searchform"
									placeholder="검색하세요!">
							</div>
							<div class="col-12 col-md-3">
								<button type="submit" class="btn btn-block btn-lg btn-primary">Search</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</header>
	<!-- nav bar  -->
	<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="#">Navbar</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Dropdown </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">Disabled</a></li>
			</ul>
			<sec:authorize access="isAuthenticated()">
				<a href="projectinsert"><button type="button"
						class="btn btn-light">프로젝트 등록하러가기</button></a>
				<button type="button" class="btn btn-light">쪽지함</button>
			</sec:authorize>
			<button type="button" class="btn btn-light">고객센터</button>
		</div>
	</nav>




	<!-- 병훈쓰가 뿌려주고 묘진쓰가 캐러셀로 만들어 줄 메인 본문 -->
	<!-- 인기 프로젝트 -->
	<div
		style="border: 1px solid silver; display: inline-block; width: 1000px;">
		<span style="display: inline-block;">인기 프로젝트</span>
		<c:forEach var="popularProject" items="${popularProject}">
			<div id="popularProject">
				썸네일 이미지 : ${popularProject.project_photo} <br> 프로젝트 이름 :
				${popularProject.project_title} <br> 작성자 :
				${popularProject.name} <br> 남은 시간 : ${popularProject.nam}일 <br>
				모인 금액 : ${popularProject.sumop}원 <br> 달성률 :
				${popularProject.ntargetprice}% <br>
			</div>
		</c:forEach>
	</div>

	<!-- 새로운 프로젝트 -->
	<!-- 계속 돌릴 거면 prepend, append // 끝낼 거면 width 잡아서 -->
	<div
		style="border: 1px solid silver; display: inline-block; width: 1000px;">
		<span style="display: inline-block;">새로운 프로젝트</span>
		<c:forEach var="newProject" items="${newProject}">
			<div id="newProject">
				썸네일 이미지 : ${newProject.project_photo} <br> 프로젝트 이름 :
				${newProject.project_title} <br> 작성자 : ${newProject.name} <br>
				남은 시간 : ${newProject.nam}일 <br> 모인 금액 : ${newProject.sumop}원 <br>
				달성률 : ${newProject.ntargetprice}% <br>
			</div>
		</c:forEach>
	</div>

	<!-- 성공 임박 프로젝트 -->
	<div
		style="border: 1px solid silver; display: inline-block; width: 1000px;">
		<span style="display: inline-block;">성공 임박 프로젝트</span>
		<c:forEach var="successApproach" items="${successApproach}">
			<div id="successApproach">
				썸네일 이미지 : ${successApproach.project_photo} <br> 프로젝트 이름 :
				${successApproach.project_title} <br> 작성자 :
				${successApproach.name} <br> 남은 시간 : ${successApproach.nam}일 <br>
				모인 금액 : ${successApproach.sumop}원 <br> 달성률 :
				${successApproach.ntargetprice}% <br>
			</div>
		</c:forEach>
	</div>





	<!-- Footer -->
	<footer class="footer bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a href="#">About</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Contact</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
					</ul>
					<p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
						2019. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-right my-auto">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-facebook fa-2x fa-fw"></i>s
						</a></li>
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-twitter-square fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-instagram fa-2x fa-fw"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="resources\vendor\jquery\jquery.min.js"></script>
	<script src="resources\vendor\bootstrap\js\bootstrap.bundle.min.js"></script>

</body>

</html>
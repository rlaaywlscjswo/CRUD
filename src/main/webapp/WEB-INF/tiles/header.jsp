<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>

#logButton, #myPage, #adminPage {
	position: relative;
	width: 150px;
}

#logButton, #myButton, #myProfile, #mySupport, #madeByMe, #adminButton, #fmem, #spr, #cus {
	background-color: dodgerblue;
	border: 1px solid;
	border-radius: 5px;
	color: #fff;
	display: inline-block;
	position: relative;
	text-align: center;
	width: 200px;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() { //주소목록 팝업 호출
		$('#talk').on('click', function() { //인코딩 문제 방지
			let uri = encodeURI("/talk");
			console.log(uri);
			let pop = window.open(uri, "pop", "width=750,height=495, scrollbars=yes, resizable=yes");
		});
	
		// 마이 페이지, 관리자 페이지 jQuery
		$('#myHide').hide();
		$('#adminHide').hide();

		$('#myButton').on('click', function() {

			$('#myHide').slideDown(function() {
				$('#myButton').on('click', function() {
					$('#myHide').slideUp();
				}); // end on
			}); // end slideDown

		}); // end on
		
		$('#adminButton').on('click', function() {
			
			$('#adminHide').slideDown(function() {
				$('#adminButton').on('click', function() {
					$('#adminHide').slideUp();
				}); // end on
			}); // end slideDown
			
		}); // end on
	
	}); // end ready
</script>
</head>
<body>
	<!--**********************************
            Header start
        ***********************************-->
	<div class="header" style="height: 200px;">
		<div class="header-content clearfix">
			<div class="header-left">
				<a class="navbar-brand" href="/main">CRUD</a>
			</div>
			<div class="header-right">
				<ul class="clearfix">

					<li class="icons dropdown">
						<!-- 병훈쓰가 만든 로그인 버튼 -->
						<div
							style="display: inline-block; left: -30px; position: relative; top: 10px;">

							<sec:authorize access="isAnonymous()">
								<a href="/sec_login" class="btn btn-sm btn-outline-secondary">로그인</a>
							</sec:authorize>

							<sec:authorize access="isAuthenticated()">
								<form action="/customLogout" method="post">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}">
									<button class="btn btn-sm btn-outline-secondary">로그아웃</button>
								</form>
							</sec:authorize>

						</div> <sec:authorize access="isAuthenticated()">
							<div id="myPage">
								<a id="myButton" href="#">마이 페이지</a>
								<div id="myHide">
									<a id="myProfile" href="/info">내 프로필</a> <a id="mySupport"
										href="/support">내 후원 내역</a> <a id="madeByMe" href="/mypro">내가
										만든 프로젝트</a>
								</div>
							</div>
						</sec:authorize> <sec:authorize access="hasRole('ROLE_ADMIN')">
							<div id="adminPage">
								<a id="adminButton" href="#">관리자 페이지</a>
								<div id="adminHide">
									<a id="fmem" href="/fmember">펀딩 회원 관리</a> <a id="spr"
										href="/spro">펀딩 현황 목록</a> <a id="cus" href="#">고객 문의</a>
								</div>
							</div>
						</sec:authorize>



						<div class="user-img c-pointer position-relative"
							data-toggle="dropdown">
							<span class="activity active"></span> <img
								src="/resources/img/1.jpg" height="100" width="100" alt="">
						</div>


					</li>
				</ul>
			</div>
		</div>
	</div>
	<!--**********************************
            Header end ti-comment-alt
            
        ***********************************-->

	<nav class="navbar navbar-light bg-light">
		<form class="form-inline" method="get"
			action="/projectlist?currPage=${page.startBlock }">
			<input type="text" id="searchtxt" name="searchtxt" class="searchform"
				placeholder="검색하세요!">
			<button class="btn btn-sm btn-outline-secondary" type="submit">Search</button>

		</form>
	</nav>



	<nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-primary">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">


				<li class="nav-item"><a class="nav-link"
					href="/projectcategorylist=게임">게임</a></li>

				<li class="nav-item"><a class="nav-link"
					href="/projectcategorylist=패션">패션</a></li>

			</ul>
			<sec:authorize access="isAuthenticated()">
				<a href="/projectinsert"><button type="button"
						class="btn btn-light">프로젝트 등록하러가기</button></a>
				<button type="button" id="talk" class="btn btn-light">쪽지함</button>
			</sec:authorize>
			<button type="button" class="btn btn-light">고객센터</button>
		</div>
	</nav>


</body>
</html>
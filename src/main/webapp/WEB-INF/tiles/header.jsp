<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
#c{
	width: 60px;
	position: relative;
    bottom: 7px;
    right: 5px;
}
</style>
<script>
$(document).ready(function(){
	$('#logout').on('click', function() {
		document.logout.submit();
	});	
	
});
</script>
</head>
<body>
<!-- Background Pattern Swither -->
    <sec:authorize access="isAuthenticated()">
     <a href="/projectinsert">
    <div id="pattern-switcher">
  	 프로젝트 등록
    </div>
    </a>
    <div id="patter-close">
        <i class="fa fa-times" aria-hidden="true"></i>
    </div>
    </sec:authorize>
<!-- ****** Top Header Area Start ****** -->
    <div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-sm-6">
                    <!--  Top Social bar start -->
                    <div class="top_social_bar">
                        <a href="#" id="talk"><img src="/resources/img/mailbox.png" alt="쪽지함"></a>
                        <ul>
                        <sec:authorize access="isAuthenticated()">
                        <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <img src="/resources/img/user-account-box.png" alt="마이페이지">
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="/info">내 프로필</a>
                                        <a class="dropdown-item" href="/support">내 후원 내역</a>
                                        <a class="dropdown-item" href="/mypro">내가 만든 프로젝트</a>                                       
                                    </div>
                        </li>
                        </sec:authorize>
                        </ul>
                        <ul>
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                        <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">관리 페이지</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="/fmember">펀딩 회원 관리</a>
                                        <a class="dropdown-item" href="/spro">펀딩 현황 목록</a>
                                        <a class="dropdown-item" href="/adcs">고객 문의</a>                                       
                                    </div>
                        </li>
                        </sec:authorize>
                        </ul>
                        <a href="/cs">고객센터</a>  
                        <sec:authorize access="isAnonymous()">                     
                        <a href="/sec_login">로그인</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
						<a href="#" id="logout">로그아웃</a>
                        <form action="/customLogout" name="logout" method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
                        </sec:authorize>
                    </div>
                </div>
                <!--  Login Register Area -->
                <div class="col-7 col-sm-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <!-- Search Button Area -->
                        <div class="search_button">
                            <a class="searchBtn" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                        </div>
                        <!-- Search Form -->
                        <div class="search-hidden-form">
                            <form method="get"
							action="/projectlist?currPage=${page.startBlock }" autocomplete="off">
                                <input type="text" name="searchtxt" id="search-anything" id="searchtxt" placeholder="검색하세요!">
                                <input type="submit" value="" class="d-none">
                                <span class="searchBtn"><i class="fa fa-times" aria-hidden="true"></i></span>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->

    <!-- ****** Header Area Start ****** -->
    <header class="header_area">
        <div class="container">
            <div class="row">
                <!-- Logo Area Start -->
                <div class="col-12">
                    <div class="logo_area text-center">
                        <a href="/main" class="yummy-logo"><img id="c"alt="c" src="http://localhost:8080/resources/yummy/img/B_02.png">RUD</a>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#yummyfood-nav" aria-controls="yummyfood-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i>Menu</button>
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="yummyfood-nav">
                            <ul class="navbar-nav" id="yummy-nav">
                                <li class="nav-item active">
                                    <a class="nav-link" href="/main">Home <span class="sr-only">(current)</span></a>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="/projectcategorylist=게임" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">게임</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="/projectcategorylist=pc게임">PC 게임</a>
                                        <a class="dropdown-item" href="/projectcategorylist=모바일게임">모바일 게임</a>
                                        <a class="dropdown-item" href="/projectcategorylist=비디오게임">비디오 게임</a>                                       
                                    </div>
                                </li>
                                 <li class="nav-item dropdown">
                                  <a class="nav-link dropdown-toggle" href="/projectcategorylist=패션" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">패션</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="/projectcategorylist=의류">의류</a>
                                        <a class="dropdown-item" href="/projectcategorylist=액서서리">액세서리</a>
                                        <a class="dropdown-item" href="/projectcategorylist=패션잡화">패션 잡화</a>     
                                    </div>                                    
                                </li>
                               <li class="nav-item dropdown">
                                   <a class="nav-link dropdown-toggle" href="/projectcategorylist=도서" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">도서</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="/projectcategorylist=만화">만화</a>
                                        <a class="dropdown-item" href="/projectcategorylist=웹툰">웹툰</a>
                                        <a class="dropdown-item" href="/projectcategorylist=소설">소설</a>     
                                        <a class="dropdown-item" href="/projectcategorylist=시집">시집</a>     
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="/projectcategorylist=IT" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">IT</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">                                     
                                        <a class="dropdown-item" href="/projectcategorylist=모바일앱">모바일 앱</a>                                        
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="/projectcategorylist=도서번역" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">도서 번역</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="/projectcategorylist=영미권">영미권</a>
                                        <a class="dropdown-item" href="/projectcategorylist=일본">일본</a>
                                        <a class="dropdown-item" href="/projectcategorylist=프랑스">프랑스</a>     
                                    </div>
                                </li>                                                             
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </header>
    <!-- ****** Header Area End ****** -->
</body>
</html>
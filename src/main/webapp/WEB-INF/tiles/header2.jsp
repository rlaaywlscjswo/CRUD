<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<!-- Background Pattern Swither -->
    <div id="pattern-switcher">
    <a href="/projectinsert">프로젝트 등록</a>
    </div>
    <div id="patter-close">
        <i class="fa fa-times" aria-hidden="true"></i>
    </div>
<!-- ****** Top Header Area Start ****** -->
    <div class="top_header_area">
        <div class="container">
            <div class="row">
                <div class="col-5 col-sm-6">
                    <!--  Top Social bar start -->
                    <div class="top_social_bar">
                        <a href="#" id="talk">쪽지함</a>
                        <ul>
                        <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">마이페이지</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="/info">내프로필</a>
                                        <a class="dropdown-item" href="/support">내후원내역</a>
                                        <a class="dropdown-item" href="/mypro">내가만든프로젝트</a>                                       
                                    </div>
                        </li>
                        </ul>
                        <a href="/cs">고객센터</a>                       
                        <a href="/sec_login">로그인</a>
                        <a href="/customLogout">로그아웃</a>
                    </div>
                </div>
                <!--  Login Register Area -->
                <div class="col-7 col-sm-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">
                            <div class="login">
                                <a href="/sec_login">Sing in</a>
                            </div>
                            <div class="register">
                                <a href="/customLogout">Logout</a>
                            </div>
                        </div>
                        <!-- Search Button Area -->
                        <div class="search_button">
                            <a class="searchBtn" href="#"><i class="fa fa-search" aria-hidden="true"></i></a>
                        </div>
                        <!-- Search Form -->
                        <div class="search-hidden-form">
                            <form method="get"
							action="/projectlist?currPage=${page.startBlock }">
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
                        <a href="/yummy" class="yummy-logo">CRUD</a>
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
                                    <a class="nav-link" href="/yummy">Home <span class="sr-only">(current)</span></a>
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
                                    <a class="nav-link dropdown-toggle" href="/projectcategorylist=패션" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">도서</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="archive.html">만화</a>
                                        <a class="dropdown-item" href="archive.html">웹툰</a>
                                        <a class="dropdown-item" href="archive.html">소설</a>     
                                        <a class="dropdown-item" href="archive.html">시집</a>     
                                    </div>
                                </li>
                               <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="projectcategorylist=패션" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">패션</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="projectcategorylist=의류">의류</a>
                                        <a class="dropdown-item" href="projectcategorylist=액서서리">액세서리</a>
                                        <a class="dropdown-item" href="projectcategorylist=패션잡화">패션 잡화</a>     
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">IT</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">                                     
                                        <a class="dropdown-item" href="archive.html">모바일 앱</a>
                                        <a class="dropdown-item" href="archive.html">게임</a>     
                                    </div>
                                </li>
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="yummyDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">도서 번역</a>
                                    <div class="dropdown-menu" aria-labelledby="yummyDropdown">
                                        <a class="dropdown-item" href="archive.html">영미권</a>
                                        <a class="dropdown-item" href="archive.html">일본</a>
                                        <a class="dropdown-item" href="archive.html">프랑스</a>     
                                    </div>
                                </li> 
                               <li class="nav-item">
                                    <a class="nav-link" href="archive.html">일단 살려둠</a>
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
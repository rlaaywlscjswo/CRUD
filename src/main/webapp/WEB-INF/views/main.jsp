<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>temp</title>

  <!-- Bootstrap core CSS -->
  <link href="resources\vendor\bootstrap\css\bootstrap.min.css" rel="stylesheet">

  <!-- Custom fonts for this template -->
  <link href="resources\vendor\fontawesome-free\css\all.min.css" rel="stylesheet">
  <link href="resources\vendor\simple-line-icons\css\simple-line-icons.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template -->
  <link href="resources\css\landing-page.min.css" rel="stylesheet">

	<style type="text/css">
	#cate1{
	background-color: yellow;
	}
	
	#cate2{
	background-color: green;
	}
	</style>

</head>


<body>
  <!-- Navigation -->
  <nav class="navbar navbar-light bg-light static-top">
    <div class="container">
      <a class="navbar-brand" href="main">CRUD</a>
      <sec:authorize access="isAuthenticated()">
      <a class="btn btn-primary" href="/mypage" style="left: 630px; position: relative;">마이 페이지</a>
      </sec:authorize>
      <!-- 병훈쓰가 추가 함 -->
      <sec:authorize access="isAnonymous()">
      	<a class="btn btn-primary" href="/sec_login">로그인</a>
      </sec:authorize>
      <sec:authorize access="isAuthenticated()">
        <form action="/customLogout" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			<button class="btn btn-primary">로그아웃</button>
		</form>
      </sec:authorize>
      
      
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead text-white text-center">  
    <div class="container">
      <div class="row">
        <div class="col-xl-9 mx-auto">
          <h1 class="mb-5">CRUD<br>
            Connect Reality<br> Unlimited Dream</h1>
        </div>
        <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
          <form method="get" action="/projectlist?currPage=${page.startBlock }" >
            <div class="form-row">
              <div class="col-12 col-md-9 mb-2 mb-md-0">
                <input type="text" class="form-control form-control-lg" id="searchtxt" name="searchtxt" class="searchform" placeholder="검색하세요!">
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
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Dropdown
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
                </li>
            </ul>
            <sec:authorize access="isAuthenticated()">
            <a href="projectinsert"><button type="button" class="btn btn-light">프로젝트 등록하러가기</button></a>            
           <button type="button" class="btn btn-light">쪽지함</button>
           </sec:authorize>
           <button type="button" class="btn btn-light">고객센터</button>
        </div>
    </nav>

<div class="container-fluid"> 
    <div id="myCarousel" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner row w-100 mx-auto">       
            <c:forEach var="item" items="${list }">                   
           	 <div class="col-lg-4 col-md-6 mb-4">
            	<div class="card h-100">
              <a href="projectdetail=${item.project_no }"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">       				
              	이름:<c:out value="${item.name}"></c:out><br>
				프로젝트번호:<c:out value="${item.project_no }"></c:out><br>
				프로젝트제목:<c:out value="${item.project_title }"></c:out><br>
				카테고리번호:<c:out value="${item.category_no }"></c:out><br>
				조회수:<c:out value="${item.project_views }"></c:out><br>		
				사진:<c:out value="${item.project_photo }"></c:out><br>
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          	</div>            	 
       	  </c:forEach>   
    </div>
  </div>
  </div>
  









  		
       	  
  		
  		
  		
  		
  		
  		
  			
  
  		
  				 
         
        
		
          
           
       

  <!-- Footer -->
  <footer class="footer bg-light">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
          <ul class="list-inline mb-2">
            <li class="list-inline-item">
              <a href="#">About</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Contact</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Terms of Use</a>
            </li>
            <li class="list-inline-item">&sdot;</li>
            <li class="list-inline-item">
              <a href="#">Privacy Policy</a>
            </li>
          </ul>
          <p class="text-muted small mb-4 mb-lg-0">&copy; Your Website 2019. All Rights Reserved.</p>
        </div>
        <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
          <ul class="list-inline mb-0">
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-facebook fa-2x fa-fw"></i>s
              </a>
            </li>
            <li class="list-inline-item mr-3">
              <a href="#">
                <i class="fab fa-twitter-square fa-2x fa-fw"></i>
              </a>
            </li>
            <li class="list-inline-item">
              <a href="#">
                <i class="fab fa-instagram fa-2x fa-fw"></i>
              </a>
            </li>
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
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
  <!--**********************************
            Header start
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                            
                <div class="header-right">
                    <ul class="clearfix">
                        
                        <li class="icons dropdown">
                        	
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                               <img src="/resources/img/1.jpg" height="100" width="100" alt="">
                            </div>
              
                            <div class="drop-down dropdown-profile   dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                        </li>
                                        <li>
                                            <a href="email-inbox.html"><i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill badge-primary">3</div></a>
                                        </li>
                                        
                                        <hr class="my-2">
                                        <li>
                                            <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                        </li>
                                        <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                                    </ul>
                                </div>
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
            <form  class="form-inline" method="get" action="/projectlist?currPage=${page.startBlock }">                        
                <input type="text" id="searchtxt" name="searchtxt" class="searchform" placeholder="검색하세요!">
                <button class="btn btn-sm btn-outline-secondary" type="submit">Search</button> 
                 
          </form>
</nav>
 
  
  
  <nav class="navbar sticky-top navbar-expand-lg navbar-dark bg-primary">      
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">  
                       
                
                <li class="nav-item">
                    <a class="nav-link" href="projectcategorylist=게임">게임</a>
                </li>	
			  
                  <li class="nav-item">
                    <a class="nav-link" href="projectcategorylist=패션">패션</a>
                </li>	         
               
            </ul>
            <a href="projectin"><button type="button" class="btn btn-light">프로젝트 등록하러가기</button></a>
           <button type="button" class="btn btn-light">쪽지함</button>
           <button type="button" class="btn btn-light">고객센터</button>
        </div>
    </nav>  
	
  
</body>
</html>
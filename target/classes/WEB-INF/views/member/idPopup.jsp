<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원찾기 - CRUD</title>
<link type="text/css" rel="stylesheet" href="https://ssl.pstatic.net/static.pay/u/c/static/20190841616/css/setting/popup_setting.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#list{
	width:90%;
	border-top:1px solid black;
	margin: 0px auto;
}
#listtitle ul li{
	font-weight: bold;
	text-align: -internal-center;
	font-family: Georgia, "맑은 고딕", 'serif';
}
.sen{
	border-top: 1px solid #ebebeb;
}
.sen:last-child{
	border-bottom: 1px solid #ebebeb;
}		
#list ul li{
	display: inline-block;
	padding:10px;
}
.name, .names{
	width: 20%;
}
.email, .emails{
	width: 35%;
}
.name, .email{
	position: relative;
	top: 4px;
}
.btns, .mid{
	width: 10%;
}
.btn{
	margin-top: 40px;
}
.green{
	padding: -1px 13px;
	margin-top: -5px;
	border-radius: 5px;
}
body{
	align-content: center;
	text-align: center;
}
#pop_footer {
	margin-top:-30px;
    padding: 0px 0 32px;
    text-align: center;
}
.button{
	width: 90%;
	border-radius:10px;
}
.green, .btn, .icon{
	cursor:pointer;
}
.box{
	margin: 30px auto;
  	width: 300px;
  	height: 50px;
}
.container-4{
  overflow: hidden;
  width: 300px;
  vertical-align: middle;
  white-space: nowrap;
}
.container-4 input#search{
  width: 300px;
  height: 50px;
  background: #2b303b;
  border: none;
  font-size: 10pt;
  float: left;
  color: #fff;
  padding-left: 15px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}
.container-4 input#search::-webkit-input-placeholder {
   color: #65737e;
}
 
.container-4 input#search:-moz-placeholder { /* Firefox 18- */
   color: #65737e;  
}
 
.container-4 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #65737e;  
}
 
.container-4 input#search:-ms-input-placeholder {  
   color: #65737e;  
}
.container-4 button.icon{
  -webkit-border-top-right-radius: 5px;
  -webkit-border-bottom-right-radius: 5px;
  -moz-border-radius-topright: 5px;
  -moz-border-radius-bottomright: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
 
  border: none;
  background: #232833;
  height: 50px;
  width: 50px;
  color: #4f5b66;
  opacity: 1;
  font-size: 10pt;
 
  -webkit-transition: all .55s ease;
  -moz-transition: all .55s ease;
  -ms-transition: all .55s ease;
  -o-transition: all .55s ease;
  transition: all .55s ease;
}
.container-4:hover button.icon, .container-4:active button.icon, .container-4:focus button.icon{
    outline: none;
    opacity: 1;
    margin-left: -50px;
  }
 
  .container-4:hover button.icon:hover{
    background: white;
  }
</style>
<script>
$(document).ready(function(){
	$('.sen').on('mouseover', function() {
		$(this).css('background-color', '#d3d3d3');
	});
	$('.sen').on('mouseout', function() {
		$(this).css('background-color', '');
	});
	
	$('.btn').on('click', function() {
		self.close();
	});
	
	$('.green').on('click', function() {
		let checkbtn = $(this).parent().parent();
		let name = checkbtn.find('li.alias');
		let road = checkbtn.find('li.road');
		let pho  = checkbtn.find('li.photo');
		
		let alias = name.children().eq(0).text();
		let address_name = name.children().eq(2).text();
		let zipno = road.children().eq(0).text();
		let roadaddrPart1 = road.children().eq(2).text();
		let roadaddrPart2 = road.children().eq(4).text();
		let addrDetail = road.children().eq(3).text();
		let address_photo = pho.text();
		window.opener.addrCallBack(roadaddrPart1, addrDetail, roadaddrPart2, zipno, alias, address_name, address_photo);
		self.close();
	});
});
</script>
</head>
<body>
<div>
	<div id="pop_header">
		<h1 class="h1">회원 찾기</h1>
		<button type="button" class="popup_img popup_close btn" ><span class="blind">팝업 닫기</span></button>
	</div>
	
	<div class="box">
	  <div class="container-4">
	  <form action="idsearch" method="post">
		<input type="search" id="search" name="search" placeholder="Search..." />
		<button class="icon"><i class="fa fa-search"></i></button>
	   </form>
	  </div>
	</div>
	
	<div id="list">
		<ul id="listtitle">
			<li class="names">이름</li>
			<li class="emails">이메일</li>
			<li class="mid">선택</li>
		</ul>
		<%-- <c:forEach var="list" items="${addrlist }"> --%>
		<ul class="sen">
			<li class="name"><span>이찬영</span><br></li>
			<li class="email"><span>joy23456@naver.com</span></li>
			<li class="btns"><input type="button" class="_select setting_btn type_h green" value="선택"></li>
		</ul>
		<%-- </c:forEach> --%>
	</div>
	<div id="pop_footer">
        <button type="button" class="button btn" >닫기</button>
    </div>
</div>
</body>
</html>
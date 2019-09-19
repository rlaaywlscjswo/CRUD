<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원찾기 - CRUD</title>
<link type="text/css" rel="stylesheet" href="https://ssl.pstatic.net/static.pay/u/c/static/20190841616/css/setting/popup_setting.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/resources/css/idpopup.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
		let names = checkbtn.find('li.name');
		
		let email = checkbtn.find('li.email').text();
		let name = names.children().eq(0).text();
		let recipient = names.children().eq(1).text();
		
		window.opener.idCallBack(name, recipient, email);
		self.close();
	});
});

</script>
</head>
<body>
<div>
	<div id="pop_header">
		<h1 class="h1">회원 찾기</h1>
		<button type="button" class="popup_img popup_close btn"  id="btns"><span class="blind">팝업 닫기</span></button>
	</div>
	
	<div class="box">
	  <div class="container-4">
	  <form action="/idPopup" method="post">
		<input type="search" id="search" name="search" placeholder="이름 또는 이메일 입력해주세요." />
		<button class="icon"><i class="fa fa-search"></i></button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	   </form>
	  </div>
	</div>
	<div id="searchcount"><span >검색 결과가 ${fn:length(list)}개 있습니다.</span></div>
	<div id="list">
		<ul id="listtitle">
			<li class="names">이름</li>
			<li class="emails">이메일</li>
			<li class="mid">선택</li>
		</ul>
		<c:forEach var="list" items="${list}">
		<ul class="sen">
			<li class="name"><span>${list.name }</span><span class="no_none">${list.no}</span></li>
			<li class="email"><span>${list.email}</span></li>
			<li class="btns"><input type="button" class="_select setting_btn type_h green" value="선택"></li>
		</ul>
		</c:forEach>
	</div>
	<div id="pop_footer">
        <button type="button" class="button btn" >닫기</button>
    </div>
</div>
</body>
</html>
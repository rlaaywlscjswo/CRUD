<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD 주소록</title>
<link type="text/css" rel="stylesheet" href="https://ssl.pstatic.net/static.pay/u/c/static/20190841616/css/setting/popup_setting.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#list{
	width:90%;
	border-top:1px solid black;
	margin: 50px auto;
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
.alias{
	width: 8%;
}
.road{
	text-align: left;
	width: 50%;
}
.roads{
	width: 50%;
}
.photo{
	width: 15%;
}
.btns{
	width: 5%;
}
.photos{
	position: relative;
	top: -5px;
}
.green{
	margin-top: -15px;
}
.zip{
	color: #666;
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
.green, .btn{
	cursor:pointer;
}
.setting_btn.green{
	border-color: #007bff;
	color: #007bff;
}
.setting_btn.green:hover {
	background-color : #007bff;
	color:#fff;
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
		<h1 class="h1">배송지 목록</h1>
		<button type="button" class="popup_img popup_close btn" ><span class="blind">팝업 닫기</span></button>
	</div>
	<div id="list">
		<ul id="listtitle">
			<li class="alias">배송지</li>
			<li class="roads">주소</li>
			<li class="photo">연락처</li>
			<li class="btns">선택</li>
		</ul>
		<c:forEach var="list" items="${addrlist }">
		<ul class="sen">
			<li class="alias"><span>${list.alias}</span><br><span class="name">${list.address_name}</span></li>
			<li class="road"><span class="zip">${list.zipno}</span><br> <span>${list.roadaddrPart1}</span>, <span>${list.addrDetail}</span> <span>${list.roadaddrPart2}</span></li>
			<li class="photo"><span class="photos">${list.address_photo}</span></li>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CRUD 주소록</title>
<link type="text/css" rel="stylesheet" href="https://ssl.pstatic.net/static.pay/u/c/static/20190841616/css/setting/popup_setting.css">
<script>
$(document).ready(function(){
	
	let no = $('#no').val();
	console.log("회원 번호 : "+no);
	$.ajax({
		method:"post",
		url:"/addrlist",
		data:no,
		contentType:"application/json;charset=UTF-8",
		success:function(data){
			console.log(data);
		}
	});
});
</script>
</head>
<body>
<input type="hidden" id="id">
<div id="pop_header">
	<h1 class="h1">배송지 목록</h1>
	<button type="button" class="popup_img popup_close" onclick="javascript:window.close();return false;"><span class="blind">팝업 닫기</span></button>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 정보</title>
</head>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>
$(function () {
	$("#updatebtn").click(function(){
		
		
				
		
		
		
		
	});
	
	
	
	
	
	
});
</script>
<body>

	<c:forEach var="myProfile" items="${myProfile}">
	
		이름 : ${myProfile.email} <br>
		비밀번호 : ${myProfile.password} <br>
		<form action="/updatephoto" method="post" enctype="multipart/form-data">		
		<label for="photo">프로필사진:</label>
		<img alt="프로필사진" src="${myProfile.photo }"><br>
		<input type="hidden" id="email" name="email" value="${myProfile.email}">
		<input type="file" id="photo" name="photo">
		<input type="submit" value="수정하기">
		</form>
		전화번호 : ${myProfile.phone} <br>
		생년월일 : ${myProfile.birth} <br>
	
	</c:forEach>
	
	<a href="" rel="dpdp"><span>회원 탈퇴</span></a> <br>
	<span>수정하기?</span>

</body>
</html>
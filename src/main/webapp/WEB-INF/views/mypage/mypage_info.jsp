<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 정보</title>
<style>
	.wrap {
		margin: 0 auto;
		margin-top: 50px;
		width: 1500px;
	} 
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	jQuery.noConflict();
	jQuery(document).ready(function($) {
		alert('진입 완료');
	});
</script>
</head>
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script>
$(function () {
	$("#updatebtn").click(function(){
		
		
				
		
		
		
		
	});
	
	
	
	
	
	
});






</script> -->
<body>

	<div class="wrap">
		<form>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="${myProfile.name}" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; width: 300px;"> <br>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="${myProfile.email}" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; width: 300px;"> <br>
			<label for="pwd">비밀 번호</label>
			<input type="password" name="pwd" id="pwd" placeholder=" 수정 할 비밀 번호를 입력해주세요 :)" class="form-control form-control-sm" style="display: inline-block; width: 300px;">
			<input type="button" class="btn btn-primary" value="비밀 번호 수정"> <br>
			<label>사진</label><br>
			<label for="phone">전화 번호</label>
			<c:set value="${myProfile.phone}" var="myphone" />
			<c:if test="${myphone == null}">
				<input type="text" name="phone" id="phone" placeholder=" 전화 번호를 입력해주세요 :)" class="form-control form-control-sm" style="display: inline-block; width: 300px;">
			</c:if>
			<c:if test="${myphone != null}">
				<input type="text" name="phone" id="phone" value="${myProfile.phone}" class="form-control form-control-sm" style="display: inline-block; width: 300px;">
			</c:if>
			
			<input type="button" class="btn btn-primary" value="전화 번호 수정"> <br>
		</form>
	</div>

<%-- 	<c:forEach var="myProfile" items="${myProfile}">
	
		이름 : ${myProfile.email} <br>
		비밀번호 : ${myProfile.password} <br>
		<form action="/updatephoto" method="post" enctype="multipart/form-data">		
		<label for="photo">프로필사진:</label>
		<img alt="프로필사진" src="${myProfile.photo }"><br>
		<input type="hidden" id="email" name="email" value="${myProfile.email}">
		<input type="file" id="photo" name="photo">
		<input type="submit" value="수정하기">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
		전화번호 : ${myProfile.phone} <br>
		생년월일 : ${myProfile.birth} <br>
	
	</c:forEach>
	
	<a href="" rel="dpdp"><span>회원 탈퇴</span></a> <br>
	<span>수정하기?</span> --%>

</body>
</html>
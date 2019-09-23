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
		$('form').find('input:eq(3)').on('click', function() {
			var phone = $(this).prev().val();
			$.ajax({
				url: "updatephone",
				data: "phone=" + phone,
				success: function(data) {
					alert('성공임 ㅋㅋㅋㅋ : ' + phone)
				}, error: function() {
					alert('실패임 ㅋㅋㅋㅋ');
				}
			}); // end ajax
			
		}); // end on
		
		$('form').find('input:eq(4)').on('click', function() {
			$(this).css('background-color', 'crimson');
			alert('진짜 탈퇴 할거야?! 진짜아아아아아아아앙?!');
			var email = $(this).prev().val();
			$.ajax({
				url: "deleteMember",
				data: "email=" + email,
				success: function(data) {
					if (data == 1) {
						// console(data);
						$('form').next().submit();
					} else {
						alert('바보');
					}
					
				}, error: function(data) {
					alert('ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 탈퇴 실패 ㅋㅋㅋㅋ 못 벗어남' + data);
				}
			}); // end ajax
		}); // end on
		
		
		
	}); // end ready
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
			<label>사진</label><br>
			<label for="name">이름</label>
			<input type="text" name="name" id="name" value="${myProfile.name}" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; width: 300px;"> <br>
			<label for="email">이메일</label>
			<input type="text" name="email" id="email" value="${myProfile.email}" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; width: 300px;"> <br>
			<label for="auth">회원 등급</label>
			<c:set value="${myProfile.auth}" var="auth" />
			<c:if test="${auth == 'ROLE_ADMIN'}">
				<input type="text" name="auth" id="auth" value="관리자" readonly="readonly" 
				class="form-control form-control-sm" style="display: inline-block; width: 300px;">
			</c:if>
			<c:if test="${auth == 'ROLE_MANAGER'}">
				<input type="text" name="auth" id="auth" value="창작자" readonly="readonly" 
				class="form-control form-control-sm" style="display: inline-block; width: 300px;">
			</c:if>
			<c:if test="${auth == 'ROLE_MEMBER'}">
				<input type="text" name="auth" id="auth" value="일반 회원" readonly="readonly" 
				class="form-control form-control-sm" style="display: inline-block; width: 300px;">
			</c:if> <br>
			<label for="phone">전화 번호</label>
			<c:set value="${myProfile.phone}" var="myphone" />
			<c:if test="${myphone == null}">
				<input type="tel" name="phone" id="phone" placeholder=" 전화 번호를 입력해주세요 :)" class="form-control form-control-sm" style="display: inline-block; width: 300px;">
			</c:if>
			<c:if test="${myphone != null}">
				<input type="tel" name="phone" id="phone" value="${myProfile.phone}" class="form-control form-control-sm" style="display: inline-block; width: 300px;">
			</c:if>
			
			<input type="button" class="btn btn-primary" value="전화 번호 수정">
			<input type="button" class="btn btn-primary" value="회원 탈퇴" style="display: inline-block; left: 30%; position: relative;">
			<a href="/passwordfind"><input type="button" class="btn btn-primary" style="display: inline-block; position: relative; top: -5.5px;">비밀번호 찾기</button></a>
		</form>
		
		 <form action="/customLogout" method="post" id="logoutbtn">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
	</div>
	


	
<%-- 		<form action="/updatephoto" method="post" enctype="multipart/form-data">		
		<label for="photo">프로필사진:</label>
		<img alt="프로필사진" src="${myProfile.photo }"><br>
		<input type="hidden" id="email" name="email" value="${myProfile.email}">
		<input type="file" id="photo" name="photo">
		<input type="submit" value="수정하기">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form> --%>

</body>
</html>
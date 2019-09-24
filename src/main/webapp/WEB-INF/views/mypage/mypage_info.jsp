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
	
/* 	.card-text a input {
		left: 47%;
		top: 115px;
	} */
	
	.card-text input:nth-child(11) {
		left: 90%;
		top: 115px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	jQuery.noConflict();
	jQuery(document).ready(function($) {

		// $('.card-text').find('input:eq(8)').css('background-color', 'crimson');
		
			$('.card-text').find('input:eq(6)').on('click', function() {
				var phone = $(this).prev().val(); // 전화 번호
					
				console.log(phone);						

					$.ajax({
						url: "updatephone",
						data: "phone=" + phone,
						success: function(data) {
							alert(phone + ' 으로 변경 성공');
						}, error: function() {
							alert('실패임 ㅋㅋㅋㅋ');
						}
					}); // end ajax

			}); // end on

		
		$('.card-text').find('input:eq(8)').on('click', function() { // 회원 탈퇴
			// $(this).css('background-color', 'crimson');
			
			if (confirm('정말 탈퇴 하시겠습니까?')) {
	 			$.ajax({
					url: "deleteMember",
					success: function(data) {
						$('form').submit();				
					}, error: function(data) {
						alert('ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ 탈퇴 실패 ㅋㅋㅋㅋ 못 벗어남' + data);
					}
				}); // end ajax
			} else {
				alert('탈퇴가 취소 되었습니다.');
			}
 
		}); // end on		
		
	}); // end ready
</script>
</head>
<body>

	<div class="wrap">
	
<div class="card mb-3" style="height: 405px; margin: 0 auto; max-width: 810px;">
  <div class="row no-gutters" style="margin: 0 auto;">
<!--     <div class="col-md-4">
      <img src="..." class="card-img" alt="...">
    </div> -->
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">
        	<input type="text" name="name" id="name" value="이름" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; margin-top: 50px; width: 50px;">
        	<input type="text" name="name" id="name" value="${myProfile.name}" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; width: 105px;">
        </h5>
        <p class="card-text" style="width: 500px;">
        	<input type="text" name="email" id="email" value="이메일" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; width: 60px;">
        	<input type="text" name="email" id="email" value="${myProfile.email}" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; width: 200px;"> <br>
			<c:set value="${myProfile.auth}" var="auth" />
			<input type="text" name="auth" id="auth" value="회원 등급" readonly="readonly" 
				class="form-control form-control-sm" style="display: inline-block; margin-top: 10px; width: 80px;">
			<c:if test="${auth == 'ROLE_ADMIN'}">
				<input type="text" name="auth" id="auth" value="관리자" readonly="readonly" 
				class="form-control form-control-sm" style="display: inline-block; margin-top: 10px; width: 65px;">
			</c:if>
			<c:if test="${auth == 'ROLE_MANAGER'}">
				<input type="text" name="auth" id="auth" value="창작자" readonly="readonly" 
				class="form-control form-control-sm" style="display: inline-block; margin-top: 10px; width: 65px;">
			</c:if>
			<c:if test="${auth == 'ROLE_MEMBER'}">
				<input type="text" name="auth" id="auth" value="일반 회원" readonly="readonly" 
				class="form-control form-control-sm" style="display: inline-block; margin-top: 10px; width: 82px;">
			</c:if> <br>  
			<input type="tel" name="phone" id="phone" value="전화 번호" readonly="readonly" class="form-control form-control-sm" style="display: inline-block; margin-top: 10px; width: 80px;">
			<c:set value="${myProfile.phone}" var="myphone" />
			<c:if test="${myphone == null}">
				<input type="tel" name="phone" id="phone" placeholder=" 전화 번호를 입력해주세요 :)" class="form-control form-control-sm" style="display: inline-block; margin-top: 10px; width: 220px;">
			</c:if>
			<c:if test="${myphone != null}">
				<input type="tel" name="phone" id="phone" value="${myProfile.phone}" class="form-control form-control-sm" style="display: inline-block; margin-top: 10px; width: 200px;">
			</c:if> 
			<input type="button" class="btn btn-primary" value="전화 번호 수정">
			<a href="/passwordfind"><input type="hidden" class="btn btn-primary" value="비밀 번호 수정" style="display: inline-block; position: relative;"></a>
			<input type="button" class="btn btn-primary" value="회원 탈퇴" style="display: inline-block; position: relative;">
			
        </p>
 			<form action="/customLogout" method="post" id="logoutbtn">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
			</form> 	
      </div>
    </div>
  </div>
</div>

	</div> <!-- end .wrap -->

</body>
</html>
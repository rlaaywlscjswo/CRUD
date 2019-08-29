<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 정보</title>
</head>
<body>

	<c:forEach var="myProfile" items="${myProfile}">
		이름 : ${myProfile.email} <br>
		비밀번호 : ${myProfile.password} <br>
		사진 : ${myProfile.photo} <br>
		전화번호 : ${myProfile.phone} <br>
		생년월일 : ${myProfile.birth} <br>
	</c:forEach>
	
	<a href="" rel="dpdp"><span>회원 탈퇴</span></a> <br>
	<span>수정하기?</span>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<sec:authorize access="hasRole('ROLE_MEMBER')">
		<h1>ㅋㅋㅋㅋㅋㅋㅋㅋ 권한 없어서 못 봄 ㅋㅋㅋㅋ</h1> <br>
		<h1>admin 계정으로 다시 로그인 하셈 ㅋㅋㅋㅋ</h1>
		
		<h1><a href="/customLogout">로그아웃 하기</a></h1>
		
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_MANAGER')">
		<h2>매니저셈??</h2>
	</sec:authorize>
	
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<h1>올ㅋ<br>
		admin 어서오세용</h1>
	</sec:authorize>	
	
</body>
</html>
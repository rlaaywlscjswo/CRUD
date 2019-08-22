<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드어드 어드민</title>
</head>
<body>

	<h1>여기 관리자 페이지가 될 예정이야</h1>

	<h2>할 사람은 여기다 해주세요.</h2>
	
	<p>principal : <sec:authentication property="principal" /></p>
	<p>MemberDTO : <sec:authentication property="principal.member" /></p>
	<p>사용자 이메일 : <sec:authentication property="principal.member.email" /></p>
	<p>사용자 권한 리스트 : <sec:authentication property="principal.member.authList" /></p>

	<sec:authorize access="hasRole([ROLE_ADMIN])">
		이건 관리자만 보임
	</sec:authorize>

	<sec:authorize access="hasRole([ROLE_MANAGER])">
		이건 매니저만 보임
	</sec:authorize>

	<sec:authorize access="hasRole([ROLE_MEMBER])">
		이건 회원이면 다 보임
	</sec:authorize>

	<sec:authorize access="permitAll">
		이건 다 보임
	</sec:authorize>

</body>
</html>
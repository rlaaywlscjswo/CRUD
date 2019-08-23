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

	<div style="border: 1px solid crimson; width: 1000px; height: 500px;">
	
		<form method="post" action="changeAuth">
			<input type="submit" value="승인">
		</form>
		
		아.. 이건 현재 로그인 한 회원의 권한 변경이고..
		쪽지를 보낸 사람의 권한 변경은.. 그 값 가지고 와서.. 아..
	
		승인(누르면 ROLE_MEMBER -> ROLE_MANAGER 로 변경)
		누르는 건 자바 스크립트로 구현한다고 치고..
		일단 쿼리부터 만들어서 mapper.xml에 넣어주고 service, controller까지 해주면 끝
	
	</div>

	<h1>이메일을 보여줘 : <c:out value="${needemail}" /></h1>

	<h1>여기 관리자 페이지가 될 예정이야</h1>

	<h2>할 사람은 여기다 해주세요.</h2>
	
  	<p>principal : <sec:authentication property="principal" /></p>
 	<%-- <p>MemberDTO : <sec:authentication property="principal.dto" /></p> --%>
	<%-- <p>사용자 이메일 : <sec:authentication property="principal.dto.email" /></p>
	<p>사용자 권한 리스트 : <sec:authentication property="principal.dto.authList" /></p> --%>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		이건 관리자만 보임
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_MANAGER')">
		이건 매니저만 보임
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_MEMBER')">
		이건 회원이면 다 보임
	</sec:authorize>

	<sec:authorize access="permitAll">
		이건 다 보임
	</sec:authorize>

</body>
</html>
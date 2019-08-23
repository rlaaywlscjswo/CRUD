<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>병훈쓰가 만든 임시 로그인 페이지</h1>
	
	<form action="/login" method="post">
	
		<div>
			<label for="username">이메일</label>
			<input type="text" name="username" id="username" value="@test.com">
		</div>
		
		<div>
			<label for="password">비밀번호</label>
			<input type="password" name="password" id="password" value="123123123">
		</div>
		
		<div>
			<input type="submit">
		</div>
		
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
	</form>
	
</body>
</html>
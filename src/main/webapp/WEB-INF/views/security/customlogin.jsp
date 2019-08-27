<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0 auto;
	padding: 0;
}

.wrap {
	display: inline-block;
	height: 600px;
	left: 465px;
	position: absolute;
	top: 100px;
	width: 1000px;
}

h1 {
	display: inline-block;
	left: 240px;
	position: absolute;
	top: 100px;
}

span {
	display: inline-block;
	left: 280px;
	position: absolute;
	top: 200px;
}

form {
	display: inline-block;
	height: 200px;
	left: 280px;
	position: absolute;
	top: 270px;
	width: 400px;
	position: absolute;
}

input[type=text], [type=password] {
	border: 2px solid dodgerblue;
	border-radius: 10px;
}

input[type=submit] {
	border: none;
}

#email {
	display: inline-block;
	font-size: 1em;
	margin-bottom: 10px;
	position: relative;
}

#username {
	display: inline-block;
	font-size: 1em;
	height: 35px;
	margin-bottom: 15px;
	position: relative;
	width: 400px;
}

#pwd {
	display: inline-block;
	font-size: 1em;
	margin-bottom: 10px;
	position: relative;
}

#password {
	display: inline-block;
	font-size: 1em;
	height: 35px;
	position: relative;
	width: 400px;
}

#login_button {
	display: inline-block;
	font-size: 1em;
	position: relative;
	top: 50px;
	width: 150px;
}

#signup {
	background-color: #f5f5f5;
	border: 1px solid silver;
	display: inline-block;
	height: 25px;
	left: 520px;
	position: relative;
	text-align: center;
	top: 477px;
	width: 150px;
}
</style>
</head>
<body>
	<div class="wrap">

		<h1>병훈쓰가 만든 임시 로그인 페이지</h1>

		<span>Enter your email address and your password to sign in.</span>

		<form action="/login" method="post">

			<div>
				<label for="username" id="email"><strong>Email
						address</strong></label> <input type="text" name="username" id="username" value="adadad@test.com">
			</div>

			<div>
				<label for="password" id="pwd"><strong>Password</strong></label> <input
					type="password" name="password" id="password" value="123123123">
			</div>

			<div>
				<input type="submit" value="로그인" id="login_button">
			</div>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">

		</form>
		
			<a href="/signup"><div id="signup">회원 가입</div></a>

	</div>

</body>
</html>
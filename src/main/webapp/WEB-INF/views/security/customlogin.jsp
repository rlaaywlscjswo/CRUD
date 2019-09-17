<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Cache-Control" content="no-store, no-cache, must-revalidate">
<meta http-equiv="Cache-Control" content="post-check=0, pre-check=0">
<meta http-equiv="Pragma" content="No-Cache">
<meta name="format-detection" content="telephone=no">
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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

#login_button{
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
#naver_id_login{
	display: inline-block;
}
</style>
<script>
$(document).ready(function(){
	let email = "${email}";
	if(email != ""){
		console.log("이프문");
		$('#username').val(email);
	}
});
</script>
</head>
<body>
	<div class="wrap">
		<div>
		<h1>병훈쓰가 만든 임시 로그인 페이지</h1>

		<span>Enter your email address and your password to sign in.</span>

		<form action="/login" method="post">
			<div>

				<label for="username" id="email"><strong>Email
						address</strong></label> <input type="text" name="username" id="username">
			</div>

			<div>
				<label for="password" id="pwd"><strong>Password</strong></label> <input
					type="password" name="password" id="password" value="123123123">
			</div>

			<div>
				<input type="submit" value="로그인" id="login_button">
			</div>
			
			<div>
				<input type="checkbox" name="remember-me" checked="checked"> 로그인 유지하기
			</div>

			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}">
		</form>
			</div>
			<div id="signup"><a href="/signup">회원 가입</a></div>
			<div id="naver_id_login"></div>
			<div id="pwd"><a href="/passwordfind">패스워드 찾기</a> </div>
	</div>

<script type="text/javascript">
	//&svctype=0
  	var naver_id_login = new naver_id_login("TuceI6ryHcQLt78CA67C", "http://localhost:8080/naverlogin");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 4,50);
  	naver_id_login.setDomain("http://localhost:8080/yummy");
  	naver_id_login.setState(state);
  	/* naver_id_login.setPopup(false); */
  	naver_id_login.init_naver_id_login();
  	//window.close();
  </script>
</body>
</html>
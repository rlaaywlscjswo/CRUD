<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
}

.wrap {
	display: inline-block;
	height: 600px;
	left: 400px;
	position: absolute;
	top: 170px;
	width: 1000px;
}

#congratulation {
	display: inline-block;
	left: 250px;
	position: relative;
	top: 80px;
}

h1 {
	font-size: 3em;
}

#guide {
	border: 1px solid silver;
	display: inline-block;
	height: 200px;
	left: 140px;
	width: 800px;
	position: relative;
	text-align: center;
	top: 120px;
}

#cong-button {
	display: inline-block;
	left: 340px;
	position: relative;
	top: 220px;
}

a {
	background-color: #007bff;
	border-radius: 10px;
	color: #fff;
	padding: 15px;
	text-decoration: none;
}

a:nth-child(2) {
	margin-left: 160px;
	position: relative;
}
</style>
</head>
<body>
	<div class="wrap">

		<div id="congratulation">
			<h1>회원 가입을 축하드립니다!!</h1>
		</div>
		
		<div id="guide"><br><br><br><br>넘나 허전쓰.. 사이트 이용 가이드 넣으면 좋을 듯</div>

		<div id="cong-button">
			<a href="/sec_login">로그인 하기</a> <a href="/yummy">메인으로 돌아가기</a>
		</div>

	</div>

</body>
</html>
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

			
			<div>
				<input type="checkbox" name="remember-me" checked="checked"> 로그인 유지하기
			</div>

			
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
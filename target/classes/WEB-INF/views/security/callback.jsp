<%@page import="java.util.ArrayList"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
  </head>
  <body>
  
  
  <a href="main" > 로그인 성공!</a>
  <script type="text/javascript">
  var naver_id_login = new naver_id_login("TuceI6ryHcQLt78CA67C", "http://localhost:8080/naverlogin");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	let id = naver_id_login.getProfileData('id'); //아이디
	let email = naver_id_login.getProfileData('email'); //이메일
	let name = naver_id_login.getProfileData('name'); //이름
	let birth = naver_id_login.getProfileData('birthday'); //생일
	let photo = naver_id_login.getProfileData('profile_image'); //프로필 사진
	// 로그인 -> 아이디 체크 -> 없으면 가입 및 로그인 or 있으면 로그인
	console.log(id);
	console.log(email);
	console.log(name);
	console.log(birth);
	console.log(photo);
	/* location.href = "naverlogincheck.do?id=" +id + "&pwd=0" + "&naverid=1"; // 아이디 패스워드가 맞으면 로그인 및 세션 저장, 틀리면 로그인 페이지 */
	
	//location.href = "signup?email" + email + "&name=" + name + "&pwd=0" + "&confirmPassword=0" +"&naverid=1" ; // 이미 가입 되어 있으면, 회원가입 폼으로
	
	// email로 중복체크 -> 이미 가입된 아이디면 로그인
	//					-> 가입되지 않은 아이디면 가입 동시에 로그인 (패스워드는 개별 설정해야함(사이트내에 비밀번호))
	
	
	opener.location.href="naverlogincheck?id=" +id + "&pwd=0";
	window.close();
  }
</script>
<form action="/login">
<div>
<!-- <label for="username" id="email"><strong>Email
	address</strong></label> <input type="text" name="username" id="username">
</div> -->
	<input type="hidden" name="username">
</form>

  
  </body>
</html>
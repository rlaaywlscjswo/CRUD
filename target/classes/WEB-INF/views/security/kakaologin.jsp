<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
    <title>Login Demo - Kakao JavaScript SDK</title>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    </head>
    <body>
    <a id="kakao-login-btn"></a><br>
    <a href="http://developers.kakao.com/logout"></a>
    <script type='text/javascript'>
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('41cbec1c23b41e600b02352bdebe13d6');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
        	container: '#kakao-login-btn',
        	success: function(authObj) {
        		Kakao.API.request({
        			url: '/v1/user/me',
        			success: function(res) {
        				alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
        				alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
        				console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
        				console.log(res.kaccount_email); // 이메일
        				console.log(res.properties['nickname']);// 닉네임
        				console.log(res.properties['name']);// 이름
        				console.log("이름");// 이름
        				console.log(authObj.birthday);
        				console.log(authObj.gender);
        	         // res.properties.nickname으로도 접근 가능 )
        				console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
        			}
        		})
        	},
        	fail: function(error) {
        		alert(JSON.stringify(error));
        	}
        });
        //]]>
    </script>
</body>
</html>
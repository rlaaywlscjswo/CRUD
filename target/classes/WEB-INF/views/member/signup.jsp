<%@page import="java.util.Enumeration"%>
<%-- <%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
  <title>Teatime</title>
  <!-- Custom fonts for this template-->
  <link href="resources/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="resources/css/sb-admin.css" rel="stylesheet">
<style>
@import url(https://fonts.googleapis.com/css?family=BenchNine:700);
label{
	text-align: left;
}
input[type=text], select {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}
input[type=time]{
  padding: 8px 16px;
  margin:8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 100%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}
#starttime{
	margin-right: 10px;
}
#top {
	margin:30px auto;
	width:60%;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

textarea {
  width: 100%;
  height: 150px;
  padding: 12px 20px;
  box-sizing: border-box;
  border: 2px solid #ccc;
  border-radius: 4px;
  font-size: 16px;
  resize: none;
}
#mn{
	display: inline-block;
	position: relative;
	left:0%;
}
#pr{
	display: inline-block;
	position: relative;
	margin-left: 10px;
}
.delbtn {
  background-color: #007bff;
  border-radius:15%;
  border: none;
  color: #ffffff;
  cursor: pointer;
  /* display: inline-block; */
  font-family: 'BenchNine', Arial, sans-serif;
  font-size: 20px;
  line-height: 1em;
  margin-left: 10px;
  outline: none;
  padding: 10px 15px 10px;
  position: relative;
  text-transform: uppercase;
  font-weight: 700;
  top:-9px;
}
.delbtn:before, .delbtn:after {
  border-color: transparent;
  -webkit-transition: all 0.25s;
  transition: all 0.25s;
  border-style: solid;
  border-width: 0;
  content: "";
  height: 12px;
  position: absolute;
  width: 12px;
}

.delbtn:before {
  border-color: #007bff;
  border-right-width: 2px;
  border-top-width: 2px;
  right: -5px;
  top: -5px;
}
.delbtn:after {
  border-bottom-width: 2px;
  border-color: #007bff;
  border-left-width: 2px;
  bottom: -5px;
  left: -5px;
}
.delbtn:hover,
.delbtn.hover {
  background-color: #4CAF50;
}
.delbtn:hover:before,
.delbtn.hover:before,
.delbtn:hover:after,
.delbtn.hover:after {
  border-color:#4CAF50;
  height: 100%;
  width: 100%;
}
.checks {position: relative;}

.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0
}
.checks input[type="checkbox"] + label {
  display: inline-block;
  position: relative;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
  content: ' ';
  display: inline-block;
  width: 21px;  /* 체크박스의 너비를 지정 */
  height: 21px;  /* 체크박스의 높이를 지정 */
  line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
  margin: -2px 8px 0 0;
  text-align: center; 
  vertical-align: middle;
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius : 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="checkbox"] + label:active:before,
.checks input[type="checkbox"]:checked + label:active:before {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
  content: '\2714';  /* 체크표시 유니코드 사용 */
  color: #99a1a7;
  text-shadow: 1px 1px #fff;
  background: #e9ecee;
  border-color: #adb8c0;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}

.checks.small input[type="checkbox"] + label {
  font-size: 12px;
}

.checks.small input[type="checkbox"] + label:before {
  width: 17px;
  height: 17px;
  line-height: 17px;
  font-size: 11px;
}

.checks.etrans input[type="checkbox"] + label {
  padding-left: 30px;
}
.checks.etrans input[type="checkbox"] + label:before {
  position: absolute;
  left: 0;
  top: 0;
  margin-top: 0;
  opacity: .6;
  box-shadow: none;
  border-color: #6cc0e5;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

.checks.etrans input[type="checkbox"]:checked + label:before {
  position: absolute;
  content: "";
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity:1; 
  background: transparent;
  border-color:transparent #6cc0e5 #6cc0e5 transparent;
  border-top-color:transparent;
  border-left-color:transparent;
  -ms-transform:rotate(45deg);
  -webkit-transform:rotate(45deg);
  transform:rotate(45deg);
}
.cbox{
	margin-left: 10px;
}
.dbtn{
	top:1px;
}
.no-csstransforms .checks.etrans input[type="checkbox"]:checked + label:before {
  /*content:"\2713";*/
  content: "\2714";
  top: 0;
  left: 0;
  width: 21px;
  line-height: 21px;
  color: #6cc0e5;
  text-align: center;
  border: 1px solid #6cc0e5;
}
img {
	width: 100px;
	height: auto;
}
img:hover {
	cursor: pointer;
}
.img_wrap{
width:300px;
margin-top: 50px;
}
.img_wrap img{
	max-width:100%; 
}
#fileName1{
	display: none;
}
#imgs{
	display: inline-block;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
/* function add_item(){
    var div = document.createElement('div');
    div.innerHTML = document.getElementById('pre_set').innerHTML;
    document.getElementById('field').appendChild(div);
}
function remove_item(obj){
    document.getElementById('field').removeChild(obj.parentNode);
} */
$(document).ready(function(){
	
	let check = $('#check');
	let pwd1 = $('#pwd').val();
	let pwd2 = $('#confirmPassword').val();
	
	$('#pwd').keyup(function(){
		check.text('');
		if(pwd1.length >= 8){
			let test = $(this).val();
			console.log(test.length);
			check.html("비밀번호는 8자리 이상 적어주세요.");
			check.css('color', 'red');
			pwd1.css('color', 'red');
			pwd2.css('color', 'red');
		}
	}); //#user_pass.keyup
	
	$('#confirmPassword').keyup(function(){
		
		if(pwd1 != pwd2){
			let test = $(this).val();
			console.log(test.length);
			check.text('');
			check.html("암호틀림");
			check.css('color', 'red');
			pwd1.css('color', 'red');
			pwd2.css('color', 'red');
		} else {
			console.log(pwd1.length);
			check.text('');
			check.html("암호맞음");
			check.css('color', '#007bff');
			pwd1.css('color', '#007bff');
			pwd2.css('color', '#007bff');
		}
	}); //#chpass.keyup
});
</script>
<body>
<div id="top">
<h3>회원가입</h3>
<div>
  <form method="post" action="shopadds.do">
  	<div class="form-label-group">
  	  <input type="text" id="name" name="name" class="form-control" placeholder="이름을 적어주세요." autofocus required minlength="2" maxlength="6">
  	  <label for="name">이름</label>
	</div>
	<div class="form-label-group">
		<input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" required="required" minlength="8">
		<label for="pwd">Password</label>
	</div>
	<div class="form-label-group">
		<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm password" required="required" minlength="8">
		<label for="confirmPassword">Confirm password</label>
		<font id="check" size="2" color="red"></font> 
	</div>
    <!-- <div class="checks etrans">
  		<input type="checkbox" id="korean" name="korean" value="한식"> 
  		<label for="korean" class="cbox">한식</label> 
  		
  		<input type="checkbox" id="japanese" name="japanese" value="일식"> 
  		<label for="japanese" class="cbox">일식</label>
  		 
  		<input type="checkbox" id="chinese" name="chinese" value="중식"> 
  		<label for="chinese" class="cbox">중식</label> 
  		
  		<input type="checkbox" id="yangsig" name="yangsig" value="양식"> 
  		<label for="yangsig" class="cbox">양식</label>
  -->
    
    <hr>
    <h3>메뉴</h3>
    <div id="pre_set"  style="display:none">
    <div class="form-label-group" id="mn">
		<input type="text" name="menuname" value="" style="width:200px">
		<label for="menuname">메뉴이름</label>
	</div>	
	<div class="form-label-group" id="pr">
		<input type="text" name="price" value="" style="width:100px"> 
		<label for="menuname">가격</label>
	</div>
		<input  class="delbtn" type="button" onclick="remove_item(this)" value="삭제">
    	<!-- <button class="delbtn" onclick="remove_item(this)">삭제</button> -->
	</div>
    <div id="field"></div>
    <input type="button" value="메뉴 추가 " class="delbtn dbtn" onclick="add_item()">
    <input type="submit" value="등록">
    <!-- <button class="delbtn" >등록</button> -->
  </form>

</div>
</div>

<div class="container">
    <h3>회원가입 폼 입니다.</h3>
    <form action="/ajax/signup" method="post" id="myForm">
        <div class="form-group has-feedback">
            <label class="control-label" for="id">아이디</label>
            <input class="form-control" type="text" name="id" id="id"/>
            <span id="overlapErr" class="help-block">사용할 수 없는 아이디 입니다.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="pwd">비밀번호</label>
            <input class="form-control" type="password" name="pwd" id="pwd"/>
            <span id="pwdRegErr" class="help-block">8글자 이상 입력하세요.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="rePwd">비밀번호 재확인</label>
            <input class="form-control" type="password" name="rePwd" id="rePwd"/>
            <span id="rePwdErr" class="help-block">비밀번호와 일치하지 않습니다. 다시 입력해 주세요.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
            <label class="control-label" for="email">이메일</label>
            <input class="form-control" type="text" name="email" id="email"/>
            <span id="emailErr" class="help-block">올바른 이메일 형식이 아닙니다. 다시 입력해 주세요.</span>
            <span class="glyphicon glyphicon-ok form-control-feedback"></span>
        </div>
        <button class="btn btn-success" type="submit">가입</button>
    </form>
</div>
<script>
    //아이디 입력란에 keyup 이벤트가 일어 났을때 실행할 함수 등록 
    $("#id").keyup(function(){
        //입력한 문자열을 읽어온다.
        var id=$(this).val();
        //ajax 요청을 해서 서버에 전송한다.
        $.ajax({
            method:"post",
            url:"/idCheck",
            data:{inputId:id},
            success:function(data){
                var obj=JSON.parse(data);
                if(obj.canUse){//사용 가능한 아이디 라면 
                    $("#overlapErr").hide();
                    // 성공한 상태로 바꾸는 함수 호출
                    successState("#id");
                    
                }else{//사용 가능한 아이디가 아니라면 
                    $("#overlapErr").show();
                    errorState("#id");
                }
            }
        });
    });
    $("#pwd").keyup(function(){
        var pwd=$(this).val();
        // 비밀번호 검증할 정규 표현식
        var reg=/^.{8,}$/;
        if(reg.test(pwd)){//정규표현식을 통과 한다면
                    $("#pwdRegErr").hide();
                    successState("#pwd");
        }else{//정규표현식을 통과하지 못하면
                    $("#pwdRegErr").show();
                    errorState("#pwd");
        }
    });
    $("#rePwd").keyup(function(){
        var rePwd=$(this).val();
        var pwd=$("#pwd").val();
        // 비밀번호 같은지 확인
        if(rePwd==pwd){//비밀번호 같다면
            $("#rePwdErr").hide();
            successState("#rePwd");
        }else{//비밀번호 다르다면
            $("#rePwdErr").show();
            errorState("#rePwd");
        }
    });
    $("#email").keyup(function(){
        var email=$(this).val();
        // 이메일 검증할 정규 표현식
        var reg=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(reg.test(email)){//정규표현식을 통과 한다면
                    $("#emailErr").hide();
                    successState("#email");
        }else{//정규표현식을 통과하지 못하면
                    $("#emailErr").show();
                    errorState("#email");
        }
    });
    // 성공 상태로 바꾸는 함수
    function successState(sel){
        $(sel)
        .parent()
        .removeClass("has-error")
        .addClass("has-success")
        .find(".glyphicon")
        .removeClass("glyphicon-remove")
        .addClass("glyphicon-ok")
        .show();
 
        $("#myForm button[type=submit]")
                    .removeAttr("disabled");
    };
    // 에러 상태로 바꾸는 함수
    function errorState(sel){
        $(sel)
        .parent()
        .removeClass("has-success")
        .addClass("has-error")
        .find(".glyphicon")
        .removeClass("glyphicon-ok")
        .addClass("glyphicon-remove")
        .show();
 
        $("#myForm button[type=submit]")
                    .attr("disabled","disabled");
    };
</script>    

</body>
</html>
</body>
</html>
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
$(document).ready(function(){
	// 이메일 체크
	$('#email').keyup(function() {
		let email=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		if(document.getElementById("email").value.length > 8){
		console.log($("#email").val());
			if(!email.test($("#email").val())){
				$('#emailcheck').css('color', 'red').html('이메일 형식이 잘못 되었습니다.');
				status('n');
			} else {
				$('#emailcheck').text('');
				status('y');
			}
		}
	});
	
	// 비밀번호 체크	
	let check = $('#check');
	let pwd1 = $('#pwd');
	let pwd2 = $('#confirmPassword');
	
	function red() {
		check.css('color', 'red');
		pwd1.css('color', 'red');
		pwd2.css('color', 'red');
	}
	function blue() {
		check.css('color', '#007bff');
		pwd1.css('color', '#007bff');
		pwd2.css('color', '#007bff');
	}
	function pwdcheck(){
		if(document.getElementById("pwd").value.length < 7){
			check.html("비밀번호는 8자리 이상 적어주세요.").css('color', 'red');
		} else {
			if(pwd1.val() != pwd2.val()){
				check.text('').html("비밀번호가 서로 다릅니다.");
				red();
				status('n');
			} else {
				check.text('');
				blue();
				status('y');
			}
		}
	}
	$('#pwd').keyup(function(){
		check.text('');
		if(pwd2.val() != ""){
			pwdcheck();
		}
	}); 
	$('#confirmPassword').keyup(function(){
		pwdcheck();
	});
	
	// 이름 체크
	$('#name').keyup(function() {
		let getName = RegExp(/^[가-힣]+$/);
		if($("#name").val() != "" && document.getElementById("name").value.length > 1){
			if(!getName.test($("#name").val())){
				$('#namecheck').css('color', 'red').html('이름을 확인 해주세요.');
				status('n');
			} else {
				$('#namecheck').text('');
				status('y');
			}
		}	
	});
	let id = 'phone';
	$("#" + id).bind("keyup", function(event) {
	    var regNumber = /^[0-9]*$/;
	    var temp = $("#" + id).val();
	    if(!regNumber.test(temp))
	    {
	        console.log('숫자만 입력하세요');
	        $("#"+id).val(temp.replace(/[^0-9]/g,""));
	    }
	});

	// 가입 버튼(비/활성화)
	function status(sel){
		if(sel == 'y'){
			$("#signup").removeAttr("disabled");
		} else {
			$("#signup").attr("disabled","disabled");
		}
	}
	
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
  	  <font id="namecheck" size="2" color="red"></font> 
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
	
	<div class="form-label-group">
		<input type="text" id="email" name="email" class="form-control" placeholder="email" required="required">
		<label for="email">e-mail</label>
		<font id="emailcheck" size="2" color="red"></font> 
	</div>
	
	<div class="form-label-group">
		<input type="text" id="phone" name="phone" class="form-control" placeholder="Phone Number" required="required">
		<label for="phone">연락처</label>
		<font id="phonecheck" size="2" color="red"></font> 
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
    <input type="submit" id="signup" value="가입" disabled="disabled">
    <!-- <button class="delbtn" >등록</button> -->
  </form>

</div>
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
</script>   

</body>
</html>
</body>
</html>
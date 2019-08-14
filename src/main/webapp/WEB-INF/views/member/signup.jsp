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
	<link href="resources/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="resources/css/sb-admin.css" rel="stylesheet">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
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
  background-color: #9999;
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
/* 캘린더 */
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
    width: 40%;
}
.ui-datepicker .ui-datepicker-title select {
    font-size: 12px;
    margin: -1px 4px;
    padding: 4px 0px;
}
.ui-datepicker-trigger{cursor: pointer;}
.hasDatepicker{cursor: pointer;}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function(){
	// 이메일 체크
    $("#email").on("keyup", function email(){
    	let email=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    	let emailcheck = $('#emailcheck');
		if(document.getElementById("email").value.length < 3){
			emailcheck.text('');
		} else {
			if(!email.test($("#email").val())){
				emailcheck.css('color', 'red').html('이메일 형식이 잘못 되었습니다.');
				status('n');
			} else {
		        let id=$(this).val();
		        console.log("jsp 키 액션 : "+emailcheck);
		        $.ajax({
		            method:"post",
		            url:"/emailcheck",
		            data:id,
		            contentType:"application/json;charset=UTF-8",
		            success:function(data){
		            	console.log(data);
		                if(data == 0){ 
							status('y');
		                	emailcheck.css('color', '#007bff').html('사용 가능한 아이디입니다.');
		                }else{ 
		                	status('n');
		                	emailcheck.css('color', 'red').html('중복된 아이디입니다.');
		                }
		            }
		        });
			}
		}
    });
	
	// 비밀번호 체크	
	let check = $('#check');
	let pwd1 = $('#password');
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
		let password = document.getElementById("password");
		let password2 = document.getElementById("confirmPassword");
		if(password.value.length < 8 && password.value != ""){
			check.html("비밀번호는 8자리 이상 적어주세요.").css('color', 'red');
		} else {
			if(pwd1.val() != pwd2.val() && password2.value.length >= 8){
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
	$('#password').keyup(function(){
		check.text('');
		if(pwd2.val() != ""){
			pwdcheck();
		}
	}); 
	$('#confirmPassword').keyup(function(){
		pwdcheck();
	});
	
	// 이름 체크
	let name = document.getElementById("name");
	$('#name').keyup(function() {
		let getName = RegExp(/^[가-힣]+$/);
		if(name.value != "" && !getName.test(name.value)){
			$('#namecheck').css('color', 'red').html('이름을 확인 해주세요.');
			status('n');
		} else {
			$('#namecheck').text('');
			status('y');
		}
	});
	
	let id = 'phone';
	$("#" + id).on("keyup", function(event) {
	    var regNumber = /^[0-9]*$/;
	    var temp = $("#" + id).val();
	    if(!regNumber.test(temp))
	    {
	        $("#"+id).val(temp.replace(/[^0-9]/g,""));
	    }
	});

	// 가입 버튼(비/활성화)
	function status(sel){
		let btn = $('#signup');
		if(sel == 'y'){
			btn.hover(function() {
				$(this).css('background-color', '#45a049');
			}, function() {
				$(this).css('background-color', '#4CAF50');
			});
			btn.css('background-color', '#4CAF50').removeAttr("disabled");
		} else {
		    btn.css('background-color', '#9999').attr("disabled","disabled");
		}
	}
	
	$(function() { 
		let year = new Date().getFullYear()-20+'-01-01'; // 20년전.
	 $(".datepicker").datepicker({
		  /* showOn: "both", */ // 버튼과 텍스트 필드 모두 캘린더를 보여준다.
		  /* buttonImageOnly: true, */ // 버튼에 있는 이미지만 표시한다.
		  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
		  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
		  nextText: '다음 달', // next 아이콘의 툴팁.
		  prevText: '이전 달', // prev 아이콘의 툴팁.
		  numberOfMonths: [1,1], // 한번에 얼마나 많은 월을 표시할것인가. [2,3] 일 경우, 2(행) x 3(열) = 6개의 월을 표시한다.
		  stepMonths: 1, // next, prev 버튼을 클릭했을때 얼마나 많은 월을 이동하여 표시하는가. 
		  yearRange: 'c-100:c+10', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
		  minDate: '-100Y',
		  maxDate: '0Y',
		  defaultDate: year, 
		  buttonText: "선택", //버튼에 마우스 갖다 댔을 때 표시되는 텍스트    
		  showButtonPanel: true, // 캘린더 하단에 버튼 패널을 표시한다. 
		  currentText: '오늘' , // 오늘 날짜로 이동하는 버튼 패널
		  closeText: '닫기',  // 닫기 버튼 패널
		  dateFormat: "yy-mm-dd", // 텍스트 필드에 입력되는 날짜 형식.
		  showAnim: "slide", //애니메이션을 적용한다.
		  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
		  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
		  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
		 });
	});
	
	
});
</script>
<body>
<div id="top">
<h3>회원가입</h3>
	<form method="post" action="signupresult">
		<div class="form-label-group">
			<input type="text" id="email" name="email" class="form-control" placeholder="email" required="required" autofocus>
			<label for="text">e-mail *</label>
			<font id="emailcheck" size="2" color="red"></font> 
		</div>
		<div class="form-label-group">
			<input type="password" id="password" name="password" class="form-control" placeholder="Password" required="required" minlength="8">
			<label for="password">Password *</label>
		</div>
		<div class="form-label-group">
			<input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Confirm password" required="required" minlength="8">
			<label for="confirmPassword">Confirm password *</label>
			<font id="check" size="2" color="red"></font> 
		</div>
	  	<div class="form-label-group">
	  	  <input type="text" id="name" name="name" class="form-control" placeholder="이름을 적어주세요." required minlength="2" maxlength="6">
	  	  <label for="name">이름 *</label>
	  	  <font id="namecheck" size="2" color="red"></font> 
		</div>
		<div class="form-label-group">
			<input type="text" id="phone" name="phone" class="form-control" placeholder="Phone Number" minlength="9" maxlength="11">
			<label for="phone">연락처</label>
			<font id="phonecheck" size="2" color="red"></font> 
		</div>
		<div class="form-label-group">
			<input type="text" id="birth" name="birth" class="form-control datepicker" placeholder="910401" maxlength="6" readonly="readonly">
			<label for="birth">생년월일</label>
		</div>
	    <input type="submit" id="signup" value="가입" disabled="disabled">
	</form>

</div>

</body>
</html>
</body>
</html>
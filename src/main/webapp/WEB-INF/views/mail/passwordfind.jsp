<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/passwordfind.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
var key="";
function mailkey(anthkey)
{
	key=anthkey;
}

$(document).ready(function(){
	$('#next').on('click', function() {
		console.log('test');
		id = document.getElementById("userId").value;
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$.ajax({
            method:"POST",
            url:"/emailcheck",
            beforeSend: function(xhr){
	             xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	          },
            data:JSON.stringify({"email":id}),
            contentType:"application/json;charset=UTF-8",
            success:function(data){
            	console.log("..."+data);
                if(data == 0){ 
                	alert("아이디를 정확하게 입력해 주세요");
					return false;
                }else{ 
                	$('#divUserId').css("display", "none");
                	let s = $('.process').children();
                	s.eq(0).attr('class', '');
                	s.eq(1).attr('class', 'on');
                	$('#mailauth').css("display", "");
                	$('.btn_area').empty().append('<input type="button" id="next2" class="btn btn-primary" style="cursor:pointer" value="다음">');
                	$('#email').val(id);
                }
            }
        });
	}); //next
	
	$('#btnEmailAuthNo').on('click', function(){
		$(this).css('cursor', 'wait');
		$('body, input, p, span').css('cursor', 'wait');
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		$.ajax({
			 method:"POST",
	         url:"/mailSending",
	         beforeSend: function(xhr){
	             xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
	         },
	         data:JSON.stringify({"email":id}),
	         contentType:"application/json;charset=UTF-8",
	         success:function(authkey){
	        	 $('#btnEmailAuthNo').css('cursor', '');
	        	 $('body, input, p, span').css('cursor', '');
	        	 $('#next2').css('cursor', 'pointer');
	        	 alert(id+" 으로 정상적으로 인증키를 발송하였습니다."+ " "+authkey);
	        	 mailkey(authkey);
	    	}
		});	
	});
	
	$('#auth').on('keyup', function() {
		if(key != $('#auth').val()){
			$('#cl').empty().append('<img alt="cy" src="/resources/img/cancel.png">');
		} else {
			$('#cl').empty().append('<img alt="cy" src="/resources/img/checked.png">');
		}
	});
	
	$('body').on('click', "#next2", function(){
		let auth = $('#auth').val();
		if(key == auth && auth != ""){
			$('#mailauth').css("display", "none");
        	let s = $('.process').children();
        	s.eq(1).attr('class', '');
        	s.eq(2).attr('class', 'on');
        	$('#passworddiv').css("display", "");
        	$('.btn_area').empty().append('<input type="button" id="next3" class="btn btn-primary" style="cursor:pointer" value="다음">');
        	console.log($('#email').val(id));
		} else {
			$('#cl').empty().append('<img alt="cy" src="/resources/img/cancel.png">');
		}
	});
	
	let pwd1 = $('#password');
	let pwd2 = $('#confirmPassword');
	$('.password').on('keyup', function() {
		$('#pwd').empty()
		if(pwd1.val().length > 7){
			$('#pwd').empty();
			if(pwd1.val() != pwd2.val()){
				$('#pwd').empty().append('<p style="color:red; margin-left: 157px; margin-top: -20px; font-size: 11px;">비밀번호가 서로 다릅니다.</p>');	
			} else {
				$('#pwd').empty().append('<img alt="cy" src="/resources/img/checked.png">');
				console.log($('#email').val());
				console.log(pwd1.val());
			}
		} else if(pwd2.val() == "" && pwd1.val().length < 7) {
			$('#pwd').empty().append('<p style="color:red; position: relative; font-size: 11px; margin-top: -19px; margin-left: 157px;">8자리 이상 입력해주세요.</p>');
		}
	});
	
	$('body').on('click', "#next3", function(){
		if(pwd1.val() == pwd2.val() && pwd1.val() != ""){
			console.log("비번수정");
			$('form').submit();
		}
	});
});
</script>
</head>
<body>
	<div id="wrap" class="wrap_leave" >
		<div id="container">
			<div id="content" class="non_sign inquiry">
				<div class="content_header">
					<h2>
						<img class="pwdfind" src="/resources/img/h_find_pw2.gif"
							width="84" height="16" alt="비밀번호 찾기">
					</h2>
					<ol class="process">
						<li class="on">01. 아이디 입력<span>&gt;</span></li>
						<li>02. 본인 확인<span>&gt;</span></li>
						<li>03. 비밀번호 재설정</li>
					</ol>
				</div>
				<p class="content_summary">비밀번호를 찾고자 하는 아이디를 입력해 주세요.</p>
				<div class="section section_find">
					<div class="box6">
						<div id="divUserId" class="input_box">
							<input type="text" id="userId" name="userId" maxlength="40" placeholder="아이디 입력해주세요." class="input_txt">
						</div>
						<form method="post" action="passwordupdate">
						<div id="mailauth" style="display: none">
							<ul id="emailauth">
								<li><span>이메일 주소</span></li>
								<li><input type="text" name="email" id="email" required="required" readonly="readonly"></li>
								<li><a href="#" id="btnEmailAuthNo" class="btn_ct"><span class="blind">인증번호 받기</span></a></li>
							</ul>
							<div id="authdiv">
								<ul>
									<li><input type="text" name="auth" id="auth" placeholder="인증번호 6자리 입력" required="required" maxlength="6"></li>
									<li id="cl"></li>
								</ul>
							</div>
						</div>
						<div id="passworddiv" style="display: none">
							<ul>
								<li><input type="password" id="password" name="password" placeholder="비밀번호 8자리를 입력해주세요." class="password" required="required" minlength="8"></li>
								<li><input type="password" id="confirmPassword" name="confirmPassword" placeholder="다시 입력해주세요." class="password" required="required"  minlength="8"><span id="pwd"></span> </li>
							</ul>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						</form>
					</div>
					<div class="btn_area">
						<input type="button" id="next" class="btn btn-primary" style="cursor:pointer"value="다음">
						<!-- <a href="#" id="next" class="btn btn-primary"><span class="blind">다음</span></a> --> <!-- btn_next2 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>
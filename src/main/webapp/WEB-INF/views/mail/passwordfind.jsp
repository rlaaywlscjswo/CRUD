<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/passwordfind.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.box_inn_sub{
	display: inline;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	$('#next').on('click', function() {
		id = document.getElementById("userId").value;
		var csrfHeaderName = "${_csrf.headerName}";
		var csrfTokenValue = "${_csrf.token}";
		
		$.ajax({
            method:"POST",
            url:"/emailcheck",
            beforeSend:function(xhr){
            	xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
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
                	$('#next').attr('id', 'next2');
                	$('#email').val(id);
                }
            }
        });
	});
	
	$('#next2').on('click', function() {
		// #btnEmailAuthNo 인증번호 받기 버튼 
		// #auth 인증번호 6자리.
	});
});
</script>
</head>
<body>
	<div id="wrap" class="wrap_leave">
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
						<div id="mailauth" style="display: none">
							<ul id="emailauth">
								<li><span>이메일 주소</span></li>
								<li><input type="text" name="email" id="email" required="required" readonly="readonly"></li>
								<li><a href="#" id="btnEmailAuthNo" class="btn_ct"><span class="blind">인증번호 받기</span></a></li>
							</ul>
							<div id="authdiv">
								<ul>
									<li><input type="text" name="auth" id="auth" placeholder="인증번호 6자리 입력" required="required"></li>
								</ul>
							</div>
						</div>
						<div id="passworddiv" style="display: none">
							<ul>
								<li><input type="text" placeholder="변경할 비밀번호를 입력해주세요." class="password"></li>
								<li><input type="text" placeholder="한번 더 입력해주세요." class="password"></li>
							</ul>
						</div>
					</div>
					<div class="btn_area">
						<a href="#" id="next" class="btn_next2"><span class="blind">다음</span></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
</body>
</html>
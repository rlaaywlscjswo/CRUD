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
		alert("아이디 : "+id);
		$.ajax({
            method:"post",
            url:"/emailcheck",
            data:id,
            contentType:"application/json;charset=UTF-8",
            success:function(data){
            	console.log(data);
                if(data == 0){ 
                	alert("아이디를 정확하게 입력해 주세요");
					return false;
                }else{ 
					document.fm.submit();
                }
            }
        });
	});
});
</script>
</head>
<body>
<div id="wrap" class="wrap_leave">
	<div id="container">
		<form id="fm" name="fm" action="" method="post">
				<div id="content" class="non_sign inquiry">
					<div class="content_header">
						<h2><img src="/resources/img/h_find_pw2.gif" width="84" height="16" alt="비밀번호 찾기"></h2>
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
								<input type="text" id="userId" name="userId" maxlength="40" value="" placeholder="아이디 입력해주세요." class="input_txt">
							</div>
							
							<div id="div_regEmail" class="box_inn selected"> <!-- [D] 선택시 selected 클래스 추가 -->
								<div class="box_inn_sub">
									<p class="dsc">본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</p>	
									<dl>
										<dt><label for="t_ml1" class="label_txt">이메일 주소</label></dt>
										<dd>
											<input type="text" id="email" name="email" maxlength="100" class="input_txt" style="width:217px">
											<a href="#" id="btnEmailAuthNo" name="btnEmailAuthNo" onclick="sendAuthNoForEmailAuth();clickcr(this,'eml.code','','',event);" class="btn_ct"><span class="blind">인증번호 받기</span></a>
										</dd>
										<dt><label for="t_ct1" class="blind">인증번호 입력</label></dt>
										<dd class="ct">
											<span class="input_box2">
												<span id="span_emailAuthNo" class="phold">인증번호 6자리 숫자 입력</span>
												<input type="text" id="emailAuthNo" name="emailAuthNo" maxlength="6" onkeydown="check_num('emailAuthNo', '1')" onclick="hiddenObj('span_emailAuthNo')" class="input_txt" style="width:217px" disabled="">
											</span>
										</dd>
									</dl>
								</div>		
							</div>
						</div>
						
						<div class="btn_area">
							<a href="#" id="next" class="btn_next2"><span class="blind">다음</span></a>
						</div>
					</div>
				</div>
				<hr>
		</form>	
	</div>
</div>
</body>
</html>
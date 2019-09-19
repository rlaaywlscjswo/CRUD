<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함 - CRUD</title>
<link rel="stylesheet" href="/resources/css/talk.css">
<link rel="stylesheet" href="/resources/css/reply.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script>
function submitbtn() {
	if($("#nick").val() == "") {
		$("#exampleModalCenterTitle").text("이메일을 입력해주세요.");
		$("#modalbtn").trigger("click");
	} else if ($("#title").val() == "") {
		$("#exampleModalCenterTitle").text("제목을 입력해주세요.");
		$("#modalbtn").trigger('click');
		return;
	} else if ($("#content").val() == "") {
		$("#exampleModalCenterTitle").text("내용을 입력해주세요.");
		$("#modalbtn").trigger('click');
		return;
	} else {
		$("form").submit();
	}
};

function idCallBack(name, recipient, email) {
	document.fmNoteWrite.email.value = name+" <"+email+">";
	document.fmNoteWrite.recipient.value = recipient;
}

$(document).ready(function(){
	let reply = "${reply.no}";
	if(reply > 0){
		let name = "${reply.name}";
		let email = "${reply.email}";
		document.fmNoteWrite.email.value = name+" <"+email+">";
	}
	
	$('#nick').on('click', function(){
		let left = ($(window).width() - $('#noteWrap').width()) / 2; //'#noteWrap'
		let top = ($(window).height() - $('#noteWrap').height()) / 2;
		console.log(left);
		console.log(top);
		
		let pop = window.open("/idPopup","pops","width=450, height=500, left="+left+", top="+top+", scrollbars=yes, resizable=yes");
	});
});
</script>
</head>
<body class="bPopup">
<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class="selected oldstart"><span class="orange"><a href="/talkreply/0" >쪽지 보내기</a></span></li>
			<li class=""><span class="orange"><a href="/talk" >받은 쪽지함
				<c:if test="${unread gt 0}">
					<img class="new" src="/resources/img/icon_new_orange.gif" alt="새글"/>
				</c:if>
			</a></span></li>
			<li class=""><span class="orange"><a href="/talksend" >보낸 쪽지함</a></span></li>
			<li class=""><span class="orange size3"><a href="/talkkeep" >쪽지 보관함
				<c:if test="${keepunread gt 0}">
					<img class="new" src="/resources/img/icon_new_orange.gif" alt="새글"/>
				</c:if>
			</a></span></li>
		</ul>
	</dd>
</dl>
</div>
<div id="noteMain">
<form id="fmNoteWrite" name="fmNoteWrite" action="/send" method="POST">
<h1 class="note"><strong class="nick">${member.name}</strong>님의 <strong class="page">새쪽지쓰기</strong>입니다.</h1>
	<div id="noteWrite">
		<table class="content" border="0" cellpadding="0" cellspacing="0">
			<colgroup><col class="th"/><col class="td"/></colgroup>
				<tr>
					<td class="label"><label for="nick">이메일</label></td>
					<td class="value">
						<input class="nick" type="text" id="nick" name="email" value="" required="required" readonly="readonly">
						<input type="hidden" name="no" value="${member.no}"><!-- 보낸사람 번호 -->
						<input type="hidden" name="recipient" value="${reply.no}"><!-- 받는사람 번호 -->
					</td>
				</tr>
				<tr>
					<td class="label"><label for="title">제목</label></td>
					<td class="value"><input class="title" type="text" id="title" name="talk_title" value="" required="required"></td>
				</tr>
				<tr>
					<td class="label"><label for="content">내용</label></td>
					<td class="value">
						<textarea class="content" id="content" name="talk" style="width:96%;"></textarea>
					</td>
				</tr>
		</table>
		<div class="command">
			<a id="aNoteCancel" href="/back" class="bttn46">취소</a>
			<a id="aNoteSave" href="javascript:submitbtn()" class="bttn92ws">쪽지보내기</a>
		</div>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
</div>
</div>

  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span id="close" aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-outline-primary btn-primary" data-dismiss="modal">확인</button>        
      </div>
    </div>
  </div>
</div>
<button type="button" id="modalbtn" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">모달 창</button>

</body>
</html>
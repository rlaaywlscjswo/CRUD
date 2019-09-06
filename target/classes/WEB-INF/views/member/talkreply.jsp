<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함 - CRUD</title>
<link rel="stylesheet" href="/resources/css/talk.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<style>
#close{
	font-size: 1.7em;
}
.close, .btn-primary{
	cursor: pointer;
}
textarea.content{
	margin: 0px;
	width:96%;
    height: 305px;
}
#modalbtn{
	display: none;
}

#dialog-background {
    display: none;
    position: fixed;
    top: 0; left: 0;
    width: 100%; height: 100%;
    background: rgba(0,0,0,.3);
    z-index: 10;
}
#my-dialog {
    display: none;
    position: fixed;
    left: calc( 50% - 160px ); top: calc( 50% - 70px );
    width: 320px; height: 140px; 
    background: #fff;
    z-index: 11;
    padding: 10px;
}
#exampleModalCenterTitle{
	font-size: 1.2em;
	text-align: center;
    width: 100%;
}
.modal-content{
	width: 50%;
	left: 30%;
}

button {
  border-radius: 0; }

button:focus {
  outline: 1px dotted;
  outline: 5px auto -webkit-focus-ring-color; }

button {
  margin: 0;
  font-family: inherit;
  font-size: inherit;
  line-height: inherit;
 overflow: visible;
text-transform: none;}

button,
html [type="button"],
[type="reset"],
[type="submit"] {
  -webkit-appearance: button; }

button::-moz-focus-inner,
[type="button"]::-moz-focus-inner,
[type="reset"]::-moz-focus-inner,
[type="submit"]::-moz-focus-inner {
  padding: 0;
  border-style: none; }

button.close {
  padding: 0;
  background-color: transparent;
  border: 0;
  -webkit-appearance: none; }

button.bg-dark:hover,
button.bg-dark:focus {
  background-color: #1a1a1a !important; }

.fc-toolbar button:focus,
.fc-toolbar button:hover {
  z-index: 0; }

.fc-button {
  border: 1px solid rgba(120, 130, 140, 0.13) !important;
  text-transform: capitalize; }

.form-profile__icons button {
  background: none; }

  .media-reply__link button {
    background: none; }

.dt-buttons {
  display: inline-block;
  margin-bottom: 15px;
  padding-top: 5px; }
  .dt-buttons .btn {
    margin-bottom: 10px; }

.dt-buttons .dt-button {
  border-radius: 4px;
  margin-right: 3px;
  padding: 5px 15px; }

.dataTables_wrapper .dataTables_paginate .paginate_button {
  border: 1px solid rgba(120, 130, 140, 0.13);
  box-sizing: border-box;
  cursor: pointer;
  display: inline-block;
  min-width: 1.5em;
  padding: 0.5em 1em;
  text-align: center;
  text-decoration: none; }

.dataTables_wrapper .dataTables_paginate .paginate_button.disabled,
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:active,
.dataTables_wrapper .dataTables_paginate .paginate_button.disabled:hover {
  background: transparent;
  box-shadow: none;
  cursor: default; }

.dataTables_wrapper .dataTables_paginate .paginate_button:active {
  outline: medium none; }

.paging_simple_numbers .pagination .paginate_button {
  padding: 0; }

.paging_simple_numbers .pagination .paginate_button a {
  border: 0 none;
  padding: 2px 10px; 
  }
 .btn-primary {
  color: #fff;
  background-color: #7571f9;
  border-color: #7571f9; 
  border-radius: 5px;
  }
  .btn-primary:hover {
    color: #fff;
    background-color: #514cf7;
    border-color: #4540f7; }
  .btn-primary:focus, .btn-primary.focus {
    box-shadow: 0 0 0 0.2rem rgba(117, 113, 249, 0.5); }
  .btn-primary.disabled, .btn-primary:disabled {
    color: #fff;
    background-color: #7571f9;
    border-color: #7571f9; }
  .btn-primary:not(:disabled):not(.disabled):active, .btn-primary:not(:disabled):not(.disabled).active,
  .show > .btn-primary.dropdown-toggle {
    color: #fff;
    background-color: #4540f7;
    border-color: #3a34f6; }
    .btn-primary:not(:disabled):not(.disabled):active:focus, .btn-primary:not(:disabled):not(.disabled).active:focus,
    .show > .btn-primary.dropdown-toggle:focus {
      box-shadow: 0 0 0 0.2rem rgba(117, 113, 249, 0.5); }
.btn-primary:active, .btn-primary:focus, .btn-primary:hover {
  background: #4540f7;
  color: #fff;
  border-color: #4540f7; }
</style>
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
			<a id="aNoteSave" href="javascript:submitbtn()" class="bttn92w">쪽지보내기</a>
		</div>
	</div>
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
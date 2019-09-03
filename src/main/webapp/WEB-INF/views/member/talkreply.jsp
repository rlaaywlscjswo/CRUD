<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함 - CRUD</title>
<style>
textarea.content{
	margin: 0px;
	width:96%;
    height: 305px;
}
</style>
<link rel="stylesheet" href="/resources/css/talk.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
			<li class=""><span class="orange"><a href="?folder=sent" >보낸 쪽지함</a></span></li>
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
<script>
function submitbtn() {
	$("form").submit();
};
</script>
<form id="fmNoteWrite" name="fmNoteWrite" action="/send" method="POST">
<h1 class="note"><strong class="nick">${member.name}</strong>님의 <strong class="page">새쪽지쓰기</strong>입니다.</h1>
	<div id="noteWrite">
		<table class="content" border="0" cellpadding="0" cellspacing="0">
			<colgroup><col class="th"/><col class="td"/></colgroup>
				<tr>
					<td class="label"><label for="nick">닉네임</label></td>
					<td class="value">
						<input class="nick" type="text" id="nick" name="recipient" value="" required="required">
						<input type="hidden" name="no" value="${member.no}">
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
</body>
</html>
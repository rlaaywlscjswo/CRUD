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
</head>
<script>
// 쪽지 삭제 및 보관 함수
function talk(no, method) {
	let fmObj = document.getElementById("talk");
	let talk = document.getElementById("talkvalue").value = no;
	console.log(no+", "+method);
	fmObj.action = "/"+method;
	fmObj.submit();
}
</script>
<body class="bPopup">
<div id="noteWrap">
	<div id="noteLeft">
	<dl class="menu">
		<dt>쪽지함</dt>
		<dd>
			<ul>
				<li><span class="orange"><a href="/talkreply/0" >쪽지 보내기</a></span></li>
				<li class="selected oldstart"><span class="orange"><a href="/talk" >받은 쪽지함
					<c:if test="${unread gt 0}">
						<img class="new" src="/resources/img/icon_new_orange.gif" alt="새글"/>
					</c:if>
				</a></span></li>
				<li><span class="orange"><a href="?folder=sent" >보낸 쪽지함</a></span></li>
				<li><span class="orange size3"><a href="/talkkeep" >쪽지 보관함
					<c:if test="${keepunread gt 0}">
						<img class="new" src="/resources/img/icon_new_orange.gif" alt="새글"/>
					</c:if>
				</a></span></li>
			</ul>
		</dd>
	</dl>
	</div>
	<div id="noteMain">
	<h1 class="note"><strong class="nick">${member.name }</strong>님의 <strong class="page">쪽지보기</strong>입니다.</h1>
		<div id="noteView">
			<dl class="topInfo">
				<dt>보낸이:</dt>
						<dd class="sender">${detail.name}</dd>
					<dt>보낸날짜:</dt>
				<dd class="date">${detail.talk_date }</dd>
			</dl>
			<table class="content">
				<tr>
					<td class="label">제목</td>
					<td class="value">${detail.talk_title }</td>
				</tr>
				<tr class="content">
					<td class="label">내용</td>
					<td class="value">
						<div class="content">
							<div id="contentBody">${detail.talk }</div>
						</div>
					</td>
				</tr>
			</table>
			<div class="command">
				<a id="aNoteList" href="/talk" class="bttn76l">리스트</a>
				<a id="aNoteReply" href="/talkreply/${detail.no}" class="bttn65">답장쓰기</a>
				<a id="aNoteDelete" href="javascript:talk(${detail.talk_no}, 'talkdelete');" class="bttn46">삭제</a>
				<a id="aNoteStore" href="javascript:talk(${detail.talk_no}, 'keep');" class="bttn46">보관</a>
			</div>
			<form id="talk" action="" method="POST">
				<input id="talkvalue" type="hidden" name="talk_no">
			</form>
		</div>
	</div>
</div>
</body>
</html>
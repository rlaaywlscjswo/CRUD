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
<body>
<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class=""><span class="orange"><a href="/talkreply/0" >쪽지 보내기</a></span></li>
			<li class=""><span class="orange"><a href="/talk" >받은 쪽지함
				<c:if test="${unread gt 0}">
					<img class="new" src="/resources/img/icon_new_orange.gif" alt="새글"/>
				</c:if>
			</a></span></li>
			<li class=""><span class="orange"><a href="?folder=sent" >보낸 쪽지함</a></span></li>
			<li class="selected oldstart"><span class="orange size3"><a href="/talkkeep" >쪽지 보관함
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
// 쪽지 보관함으로 이동시키는 함수
function move() {
	let fmObj = document.getElementById("fmNoteData");
	fmObj.action = "move";
	fmObj.submit();
}
// 쪽지 삭제 함수
function deletes() {
	let fmObj = document.getElementById("fmNoteData");
	fmObj.action = 'talkdelete';
	fmObj.submit();
}

$(document).ready(function(){
	// 모든 체크박스 체크 or 풀기.
	$("#allcheckbox").on('click', function() {
		if($("#allcheckbox").prop("checked")){
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
});
</script>
<h1 class="note"><strong class="nick">${member.name}</strong>님의 <strong class="page">보관 편지함</strong>입니다.</h1>
<div id="noteList">
	<div class="cmdWrap">
		<a id="cmdDelete" class="bttn46" href="javascript:deletes();" >삭제</a>
		<a id="cmdStore" class="bttn65" href="javascript:move();">받은 쪽지함으로</a>
		<a id="cmdWrite" class="bttn92w" href="/talkreply/0" >쪽지보내기</a>
	</div>

	<div class="list">
	<form id="fmNoteData" name="fmNoteData" action="" method="POST">
		<table border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr>
				<th class="chk"><input type="checkbox" id="allcheckbox" name="talk_no" value="0"/></th>
				<th class="check"></th>
				<th class="title">제목</th>
				<th class="nickname">보낸사람</th>
				<th class="date">날짜</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="list" items="${talklist}">
				<c:choose>
					<c:when test="${empty list.talk_status}">
						<tr class="unread">
							<td class="chk">
								<input type="checkbox" class="talk_no" name="talk_no" value="${list.talk_no}" />
							</td>
							<td class="check">
								<img class="unread" alt="안읽음" src="/resources/img/envelope_close.png">
							</td>
							<td class="title">
								<a href="talkdetail/${list.talk_no }">${list.talk_title} &nbsp;</a>
							</td>
							<td class="nickname">${list.name}</td>
							<td class="date">${list.talk_date}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr class="read">
							<td class="chk">
								<input type="checkbox" class="talk_no" name="talk_no" value="${list.talk_no}" />
							</td>
							<td class="check">
								<img alt="읽음" src="/resources/img/envelope_open.png">
							</td>
							<td class="title">
								<a href="talkdetail/${list.talk_no }">${list.talk_title} &nbsp;</a>
							</td>
							<td class="nickname">${list.name}</td>
							<td class="date">${list.talk_date}</td>
						</tr>
					</c:otherwise>			
				</c:choose>
			</c:forEach>
			</tbody>
		</table>
	</form>
	</div>

	<div class="tools">
		<div id="notePaging"><span class="basetext"><img class="leftarrow" src="http://static.inven.co.kr/image/member/note/icon_arrow_left.gif"><span class="prevtext">이전</span> <span class="currentpg">1</span> <span class="nexttext">다음</span> <img class="rightarrow" src="http://static.inven.co.kr/image/member/note/icon_arrow_right.gif"></span></div>
		<form id="noteSearch" name="noteSearch" method="GET" action="">
			<select id="searchWhere" name="s_where">
				<option value="title" > 제 목</option>
				<option value="content" > 내 용</option>
				<option value="titlecontent" > 제목+내용</option>
				<option value="nick" >이름</option>
			</select>
			<input class="word" type="text" id="searchWord" name="s_word" value=""/>
			<input class="submit" type="image" src="/resources/img/bttn_search.gif"/>
		</form>
	</div>
</div>
</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함 - CRUD</title>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/talk.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
//쪽지 보관함으로 이동 및 쪽지 삭제 함수
function talk(method) {
	if($(".talk_no:checked").length <= 0){
		return;
	}
	let fmObj = document.getElementById("fmNoteData");
	fmObj.action = '/'+method;
	fmObj.submit();
}

$(document).ready(function(){
	
	// select 기본 체크 값
	let kind = $('#tampkind').val();
	console.log($('#tampkind').val());
	if(kind == '' || kind == null) {
		kind = 'talk_title';
	}
	$('#searchWhere').val(kind).prop("selected", true);
	
	// 모든 체크박스 체크 or 풀기.
	$("#allcheckbox").on('click', function() {
		if($("#allcheckbox").prop("checked")){
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
	$('tr').on('mouseover', function() {
		$(this).css('background-color', '#d3d3d3');
	});
	$('tr').on('mouseout', function() {
		$(this).css('background-color', '');
	});
	$('.unread').on('mouseover', function() {
		$(this).css('background-color', '#8bd3fc');
	});
	$('.unread').on('mouseout', function() {
		$(this).css('background-color', '#F4FFFF');
	});
});
</script>
</head>
<body>
<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class=""><span class="orange"><a href="/talkreply/0" >쪽지 보내기</a></span></li>
			<li class="selected oldstart"><span class="orange"><a href="/talk" >받은 쪽지함
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
<h1 class="note"><strong class="nick">${member.name}</strong>님의 <strong class="page">받은 쪽지함</strong>입니다.
<c:if test="${unread > 0}">
	(읽지 않은 쪽지: ${unread}통)
<a href="/allread" class="allread" >모두읽음</a>
</c:if>
</h1>
<div id="noteList">
	<div class="cmdWrap">
		<a id="cmdDelete" class="bttn46" href="javascript:talk('talkdelete');" >삭제</a>
		<a id="cmdStore" class="bttn46" href="javascript:talk('keep');">보관</a>
		<a id="cmdWrite" class="bttn92w" href="/talkreply/0" >쪽지보내기</a>
	</div>

	<form id="fmNoteData" name="fmNoteData" action="" method="POST">
	<div class="list">
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
						<tr class="unread" style="background-color: #F4FFFF;">
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
	</div>

	<div class="tools">
		<div id="notePaging">
			<ul class="basetext pagination">
				<c:if test="${dto.prev}">
					<li><a href="talk?currPage=${dto.firstPageOfBlock-1}">
					<c:out value="이전" /></a></li>
				</c:if>
				<c:forEach var="index" begin="${dto.firstPageOfBlock}" end="${dto.lastPageOfBlock}">
						<c:choose>
							<c:when test="${dto.currPage == index}">
								<li class="active"><a href="talk?currPage=${index}"><c:out value="${index}" /></a></li>
							</c:when>
							<c:otherwise>
								<li><a href="talk?currPage=${index}"><c:out value="${index}" /></a></li>
							</c:otherwise>
						</c:choose>
				</c:forEach>
			</ul>
		</div>
		<div id="noteSearch">
			<select id="searchWhere" name="kind">
				<option value="talk_title" >제 목</option>
				<option value="talk" >내 용</option>
				<option value="titlecontent" > 제목+내용</option>
				<option value="name" >이름</option>
			</select>
			<input class="word" type="text" id="searchWord" name="search" value="${search}"/>
			<input class="submit" id="tampkind" type="image" src="/resources/img/bttn_search.gif" value="${kind}">
		</div>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>
</div>
</div>

</body>
</html>
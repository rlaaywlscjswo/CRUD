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
			<li class="selected oldstart"><span class="orange"><a href="/talk" >받은 쪽지함
				<c:if test="${talknew gt 0}">
					<img class="new" src="/resources/img/icon_new_orange.gif" alt="새글"/>
				</c:if>
			</a></span></li>
			<li class=""><span class="orange"><a href="?folder=sent" >보낸 쪽지함</a></span></li>
			<li class=""><span class="orange size3"><a href="/talkkeep" >쪽지 보관함</a></span></li>
		</ul>
	</dd>
</dl>
</div>
<div id="noteMain">

<script>
$(document).ready(function(){
	
	// 모든 체크박스 체크 or 풀기.
	$("#allcheckbox").on('click', function() {
		if($("#allcheckbox").prop("checked")){
			$("input[type=checkbox]").prop("checked", true);
		} else {
			$("input[type=checkbox]").prop("checked", false);
		}
	});
	
	// 체크된 체크박스 값
	$(".talk_no").on('click', function() {
		let check_leng = $(".talk_no:checked").length;
		console.log("체크된 수 : "+check_leng);
		let talk_no = new Array(check_leng);
		$(".talk_no").each(function(i) {
			console.log(i);
			if($(this).is(":checked") == true && $(this).val() != 'on') {
				talk_no[i] = $(this).val();
			}
		});
		console.log("-----");
		$.ajax({
            method:"post",
            url:"/keep",
            data:{'talk_no':talk_no},
            dataType:'text',
            //contentType:"application/json;charset=UTF-8",
            success:function(data){
            	console.log(data);
            }
        }); 
	});
	function viewNote(n) {
		var url = "?act=view&n="+n+"&folder=inbox";
			location.href = url;
	}
	
	function deleteNotes() {
		var fmObj = document.getElementById("fmNoteData");
		if (!anyChecked(fmObj, "idx_")) { alert("삭제할 쪽지를 선택해 주세요"); return; }
	
		var ans = confirm("선택된 쪽지를 삭제하시겠습니까?");
		if (!ans) return;
	
		fmObj.action = 'http://www.inven.co.kr/member/note/note_status.php';
		fmObj.set.value = 'delete';
		fmObj.submit();
	}
	
	
	function storeNotes() {
		var fmObj = document.getElementById("fmNoteData");
		if (!anyChecked(fmObj, "talk_no")) { alert("보관할 쪽지를 선택해 주세요"); return; }
		
		console.log($("input:checkbox[name='talk_no']:checked").val());
		console.log("---");
		console.log($("input:checkbox[name='talk_no']").is("checked").val());
	
	
		console.log(fmObj.set.value);
		var ans = confirm("선택된 쪽지를 보관하시겠습니까?");
		if (!ans) return;
	
		fmObj.action = "keep";
		//fmObj.set.value = 'store';
		fmObj.submit();
	}
	function anyChecked(fmObj, prefix) {
		var temp = false;
	
		var chs = fmObj.getElementsByTagName('INPUT');
		var n = chs.length;
		var prefixn = prefix.length;
		for (var i = 0; i < n; i++) {
			var item = chs.item(i);
			if ((item.getAttribute('name').substring(0, prefixn) == prefix) && (item.checked)) temp = true;
		}
		return temp;
	}
	function setAllread() {
		var url = "http://www.inven.co.kr/member/note/note_allread.php?n=0&rurl=Qi80RXlXSVdHcnE3NTVSSVVkdXJUdkVkTVFXQ210MHlaOWNrTUZXVE5BT1FaQmU0bjJjSFkrSUZHMUQrd2srNA";
		location.href = url;
	}
});
</script>
<h1 class="note"><strong class="nick">${member.name}</strong>님의 <strong class="page">받은 편지함</strong>입니다.(읽지 않은 쪽지: ${unread}통) <a href="javascript:setAllread();" class="allread" onfocus="this.blur();">모두읽음</a></h1>
<div class="selectWrap">
	<select style="float:right;" onchange = "if (this.value) { var url = this.value.split('|'); if (!url[1]) { url[1] = ''; } INVEN.Location.openWin(url[0], url[1]); }">
	<option value="/member/note/index.php?folder=inbox&scale=10" selected>10</option>
	<option value="/member/note/index.php?folder=inbox&scale=30" >30</option>
	<option value="/member/note/index.php?folder=inbox&scale=50" >50</option>
	</select>
		<select style="float:right;" onchange = "if (this.value) { var url = this.value.split('|'); if (!url[1]) { url[1] = ''; } INVEN.Location.openWin(url[0], url[1]); }">
	<option value="/member/note/index.php?folder=inbox&scale=10" selected>전체</option>
	<option value="/member/note/index.php?folder=inbox&scale=10&readst=2" >안읽음</option>
	</select>
	</div>

<div id="noteList">
	<div class="cmdWrap">
		<a id="cmdDelete" class="bttn46" href="javascript:deleteNotes();" onfocus="this.blur();">삭제</a>
				<a id="cmdStore" class="bttn46" href="storeNotes()">보관</a>
				<a id="cmdWrite" class="bttn92w" href="javascript:writeNewNote();" onfocus="this.blur();">쪽지보내기</a>
	</div>

	<div class="list">
	<form id="fmNoteData" name="fmNoteData" action="" method="POST">
		<table border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr>
				<th class="chk"><input type="checkbox" id="allcheckbox" name="talk_no" /></th>
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
							<td class="chk"><input type="checkbox" class="talk_no" name="talk_no" value="${list.talk_no}" onfocus="this.blur();"/></td>
							<td class="check">
								<img class="unread" alt="안읽음" src="resources/img/envelope_close.png">
							</td>
							<td class="title" style="cursor:pointer;" onClick="viewNote(99838166);">
								<a href="talkdetail/${list.talk_no }">${list.talk_title} &nbsp;</a>
							</td>
							<td class="nickname">${list.name}</td>
							<td class="date">${list.talk_date}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr class="read">
							<td class="chk"><input type="checkbox" class="talk_no" name="talk_no" value="${list.talk_no}" onfocus="this.blur();"/></td>
							<td class="check">
								<img alt="읽음" src="resources/img/envelope_open.png">
							</td>
							<td class="title" style="cursor:pointer;" onClick="viewNote(99838166);">
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
		<div class="IEFix">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
	</form>
	</div>

	<div class="tools">
		<div id="notePaging"><span class="basetext"><img class="leftarrow" src="http://static.inven.co.kr/image/member/note/icon_arrow_left.gif"> <span class="prevtext">이전</span> <span class="currentpg">1</span> <span class="nexttext">다음</span> <img class="rightarrow" src="http://static.inven.co.kr/image/member/note/icon_arrow_right.gif"></span></div>
		<form id="noteSearch" name="noteSearch" method="GET" action="/member/note/index.php">
						<select id="searchWhere" name="s_where">
				<option value="title" > 제 목</option>
				<option value="content" > 내 용</option>
				<option value="titlecontent" > 제목+내용</option>
				<option value="nick" >이름</option>
			</select>
			<input class="word" type="text" id="searchWord" name="s_word" value=""/>
			<input class="submit" type="image" src="http://static.inven.co.kr/image/member/note/bttn_search.gif"/>
		</form>
	</div>
</div>
</div>
</div>

</body>
</html>
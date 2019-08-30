<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함 - CRUD</title>
<style>body {
		margin: 0px;
		padding: 0px;
	}
	body, a, td {
		font-family: gulim, 援대┝;
		font-size:9pt;
		color: #3E3E3E;
		text-decoration: none;
	}
	#noteWrap {
    width: 737px;
    height: 484px;
    margin: 5px;
    background: url(http://localhost:8080/resources/img/talk_background.png) left top no-repeat;
    float: left;
    display: inline;
   }
	#noteLeft {
		width: 147px;
		height: auto;
		float: left;
		display: inline;
		margin: 26px 0 0 7px;
	}
	#noteLeft,
	#noteLeft a {
		font-family: gulim, 援대┝;
		font-size:9pt;
		color: #3E3E3E;
		text-decoration: none;
	}
	#noteLeft a:hover {
		font-weight: bold;
		letter-spacing: -1px;
	}
	#noteLeft dl,
	#noteLeft dt,
	#noteLeft dd,
	#noteLeft ul,
	#noteLeft li {
		float: left;
		display: inline;
		margin: 0;
		padding: 0;
	}
	#noteLeft dl.menu {
		width: 100%;
		height: auto;
	}
	#noteLeft dl.menu dt {
		width: 100%;
		height: 1px;
		text-indent: -100em;
		_height: 35px;
		padding-top: 35px;
		border-bottom: solid 1px #B9B9B9;
		overflow: hidden;
		background: url(http://static.inven.co.kr/image/member/note/title_note.gif) 4px 0 no-repeat;
	}
	#noteLeft dl.menu dd,
	#noteLeft dl.menu ul,
	#noteLeft dl.menu li {
		width: 100%;
		height: auto;
		clear: both;
	}
	#noteLeft dl.menu dd {
		margin-top: 6px;
		overflow: hidden;
	}
	#noteLeft dl.menu ul {
		margin-top: -1px;
	}
	#noteLeft dl.menu li {
		padding: 10px 0 5px 0;
		background: url(http://static.inven.co.kr/image/member/note/dot_2x1_B8B8B8.gif) left top repeat-x;
	}
	#noteLeft dl.menu li.oldstart {
		background:none;
		border-top: 1px solid #b8b8b8;
	}

	#noteLeft dl.menu li span.orange {
		background: url(http://static.inven.co.kr/image/member/note/bul_circle_orange.gif) left 3px no-repeat;
		margin-left: 6px;
		float: left;
		display: inline;
	}
	#noteLeft dl.menu li a {
		width: 118px;
		height: auto;
		margin-left: 15px;
		float: left;
		display: inline;
	}
	#noteLeft dl.menu li.selected a {
		font-weight: bold;
		letter-spacing: -1px;
	}
	#noteLeft dl.menu li a:hover {
		background: url(http://static.inven.co.kr/image/member/note/bul_dblarrow_black.gif) right 3px no-repeat;
	}
	#noteLeft dl.menu li a img.new {
		border: none;
		width: 9px;
		height: 9px;
		vertical-align: middle;
		margin-bottom:2px;
	}
	#noteMain {
		width: 541px;
		height: auto;
		float: left;
		display: inline;
		margin: 0 0 0 33px;
	}
	#noteMain h1.note {
		height: auto;
		background: url(http://static.inven.co.kr/image/member/note/icon_note.gif) 6px top no-repeat;
		padding: 2px 0 0 34px;
		margin: 0;
		font-family: gulim, 援대┝;
		font-size:9pt;
		color: #000000;
		font-weight: normal;
		float: left;
		clear: both;
		display: inline;
	}
	#noteMain h1.note strong.nick {
		font-weight: bold;
		font-style: normal;
	}
	#noteMain h1.note strong.page {
		color: #DD5020;
		font-style: normal;
		font-weight: normal;
		letter-spacing: 0px;
	}


	#noteMain a:link.bttn46, #noteMain a:visited.bttn46, #noteMain a:active.bttn46, #noteMain a:hover.bttn46 {
		width: 46px;
		height: 16px;
		_height: 21px;
		padding-top: 5px;
		overflow: hidden;
		float: left;
		text-align: center;
		display: inline;
		background: url(http://static.inven.co.kr/image/member/note/bttn_note46.gif) left top no-repeat;
	}
	#noteMain a:link.bttn92w, #noteMain a:visited.bttn92w, #noteMain a:active.bttn92w, #noteMain a:hover.bttn92w {
		width: 67px;
		_width: 92px;
		height: 16px;
		_height: 21px;
		padding: 5px 0 0 25px;
		overflow: hidden;
		float: left;
		text-align: center;
		display: inline;
		background: url(http://static.inven.co.kr/image/member/note/bttn_note92_write.gif) left top no-repeat;
	}
	#noteMain a:link.bttn65, #noteMain a:visited.bttn65, #noteMain a:active.bttn65, #noteMain a:hover.bttn65 {
		width: 65px;
		height: 16px;
		_height: 21px;
		padding-top: 5px;
		overflow: hidden;
		float: left;
		text-align: center;
		display: inline;
		background: url(http://static.inven.co.kr/image/member/note/bttn_note65.gif) left top no-repeat;
	}
	#noteMain a:link.bttn75, #noteMain a:visited.bttn75, #noteMain a:active.bttn75, #noteMain a:hover.bttn75 {
		width: 75px;
		height: 16px;
		_height: 21px;
		padding-top: 5px;
		overflow: hidden;
		float: left;
		text-align: center;
		text-indent: 18px;
		display: inline;
		background: url(http://static.inven.co.kr/image_2011/member/note/bttn_note75_sendDel.gif) left top no-repeat;
	}
	#noteMain a:link.bttn76l, #noteMain a:visited.bttn76l, #noteMain a:active.bttn76l, #noteMain a:hover.bttn76l {
		width: 50px;
		_width: 76px;
		height: 16px;
		_height: 21px;
		padding: 5px 0 0 26px;
		overflow: hidden;
		float: left;
		text-align: center;
		display: inline;
		background: url(http://static.inven.co.kr/image/member/note/bttn_note76_list.gif) left top no-repeat;
	}

	.IEFix {
		width:1px !important;
		height:0px !important;
		_height:1px !important;
		margin:-1 0 0 0 !important;
		clear:both !important;
		display:inline !important;
		overflow:hidden !important;
		padding:1 0 0 0 !important;
		font-size:1pt !important;
	}




	#noteWrite {
		width: 538px;
		_width: 540px;
		height: auto;
		margin: 10px 0 0 0;
		float: left;
		clear: both;
		display: inline;
		border: solid 1px #B5B6B5;
	}
	#noteWrite div,
	#noteWrite table,
	#noteWrite form {
		float: left;
		display: inline;
		margin: 0;
		padding: 0;
	}

	#noteWrite table {
		width: 538px;
		table-layout: fixed;
	}
	#noteWrite table col.th { width: 147px; }
	#noteWrite table col.td { width: 391px; }
	#noteWrite table.content {
		width: 100%;
		height: auto;
		margin-top: -2px;
	}
	#noteWrite table.content td {
		background: url(http://static.inven.co.kr/image/member/note/dot_2x3_9C9C9C_td.gif) left top repeat-x;
		vertical-align: top;
		line-height: 150%;
	}
	#noteWrite table.content td.label {
		padding:9px 0 0px 0;
		width: 147px;
		text-align: center;
		background-color: #F2F2F2;
	}
	#noteWrite table.content td.value {
		padding:7px 2px 4px 19px;
	}
	#noteWrite table.content input {
		font-family: gulim, 援대┝;
		font-size:9pt;
		border: solid 1px #C4CAD1;
	}
	#noteWrite table.content input.nick { width: 230px; }
	#noteWrite table.content input.title { width: 358px; }

	#noteWrite table.content textarea.content {
		width: 100%;
		height: 290px;
		font-family: gulim, 援대┝;
		font-size:9pt;
		border: solid 1px #C4CAD1;
	}

	/* 踰꾪듉 */
	#noteWrite div.command {
		width: 100%;
		height: auto;
		padding: 9px 0 8px 0;
		background: url(http://static.inven.co.kr/image/member/note/dot_2x1_9C9C9C.gif) left top repeat-x;
		border-bottom: solid 1px #B5B6B5;
	}
	#noteWrite div.command #aNoteCancel {
		margin-left: 13px;
		float: left;
	}
	#noteWrite div.command #aNoteSave {
		margin-right: 13px;
		float: right;
	}




	#noteMain {
		margin-top: 24px;
	}
	#noteMain a:link.allread, #noteMain a:visited.allread, #noteMain a:active.allread, #noteMain a:hover.allread {
		width: 48px;
		height: 16px;
		margin: 0 0 0 5px;
		text-indent: -999px;
		overflow: hidden;
		display: inline-block;
		background: url(http://static.inven.co.kr/image/member/note/bttn_allread.gif) left top no-repeat;
	}
	#noteMain .selectWrap {float:right;}

	#noteList {
		width: 100%;
		height: auto;
		display: inline;
		margin: 9px 0 0 0;
		height: 0px;
		float: left;
		clear: both;
	}
	#noteList div,
	#noteList table,
	#noteList form {
		float: left;
		display: inline;
		margin: 0;
		padding: 0;

	}
	#noteList div.cmdWrap {
		width: 535px;
		height: auto;
		clear: both;
		padding-top: 8px;
		background: url(http://static.inven.co.kr/image/member/note/dot_3x1_CCCCCC.gif) left top repeat-x;
	}
	#noteList div.cmdWrap #cmdDelete { float: left; margin-left: 7px;}
	#noteList div.cmdWrap #cmdStore { float: left; margin-left: 5px;}
	#noteList div.cmdWrap #cmdWrite { float: right; margin-right 1px; }

	#noteList div.list {
		width: 541px;
		height: auto;
		border-top: solid 1px #CCCCCC;
		border-bottom: solid 1px #CCCCCC;
		padding-bottom: 1px;
		overflow: hidden;
		margin: 6px 0 0 0;
	}
	#noteList div.list table {
		width: 541px;
		margin-top: -3px;
		border-top: solid 1px #BBBBBB;
	}
	#noteList div.list table td,
	#noteList div.list table th {
		font-family: gulim, 援대┝;
		font-size: 9pt;
		background: url(http://static.inven.co.kr/image/member/note/dot_1x5_CCCCCC_td.gif) left top repeat-x;
	}
	#noteList div.list table th {
		padding: 13px 0 6px;
		font-weight: normal;
		background-color: #F7F7F7;
		text-align: center;
	}
	#noteList div.list table td {
		padding: 10px 0 3px 0;
		line-height: 15px;
		text-align: center;
		color: #000000;
	}
	#noteList div.list table td a {
		color: #000000;
	}
	#noteList div.list table .chk { width: 49px; padding: 5px 0 0 0; }
	#noteList div.list table .title { width: 312px; }
	#noteList div.list table .nickname { width: 90px; }
	#noteList div.list table .date { width: 90px; }

	#noteList div.list table td.title { text-align: left; padding-left: 7px; }
	#noteList div.list table tr.unread td { background-color: #F4FFFF; color: #1376AD; }
	#noteList div.list table tr.unread td a { color: #1376AD; }

	/* �섎떒 �섏씠吏� / 寃��� */
	#noteList div.tools {
		width: 100%;
		height: auto;
		margin: 2px 0 0 0;
		background: #F2F2F2;
	}
	#noteList #notePaging {
		width: 527px;
		height: auto;
		padding: 10px 0 7px 0;
		text-align: center;
		border-bottom: solid 1px #D0D0D0;
		margin: 0 0 0 6px;
		font-family: dotum, �뗭�;
		font-size: 8pt;
	}

	#noteList #noteSearch {
		width: 527px;
		height: auto;
		padding: 6px 0 9px 0;
		text-align: center;
		border-top: solid 1px #FFFFFF;
		margin: 0 0 0 6px;
	}
	#noteList #noteSearch input,
	#noteList #noteSearch select {
		float: left;
		display: inline;
	}
	#noteList #noteSearch select {
		width: 86px;
		font-family: gulim, 援대┝;
		font-size: 9pt;
		margin: 0px 0 0 114px;
	}
	#noteList #noteSearch input.word {
		width: 132px;
		font-family: gulim, 援대┝;
		font-size: 9pt;
		border: solid 1px #808080;
		margin: 2px 0 0 8px;
	}
	#noteList #noteSearch input.submit {
		width: 56px;
		height: 21px;
		border: none;
		margin: 0 0 0 5px;
	}
	/* classes : leftarrow, rightarrow, pg, currentpg, basetext, prevtext, nexttext */
	#noteList #notePaging * {
		float:none;
		font-size: 8pt;
	}

	#noteList #notePaging .leftarrow, #noteList #notePaging .rightarrow {
		width:3px;
		height:5px;
		border:none;
		margin-bottom:2px;
	}
	#noteList #notePaging .pg, #noteList #notePaging A.pg {
		text-decoration:none;
	}
	#noteList #notePaging .currentpg {
		font-weight:bold;
	}
	#noteList #notePaging .basetext {
	}
	#noteList #notePaging .prevtext, #noteList #notePaging .nexttext, #noteList #notePaging A.prevtext, #noteList #notePaging A.nexttext {
		text-decoration:none;
	}

	#noteView {
		width: 540px;
		height: auto;
		margin: 10px 0 0 0;
		float: left;
		clear: both;
		display: inline;
		border-top: solid 1px #B5B6B5;
		border-bottom: solid 1px #B5B6B5;
	}
	#noteView div,
	#noteView table,
	#noteView dl,
	#noteView dt,
	#noteView dd {
		float: left;
		display: inline;
		margin: 0;
		padding: 0;
	}
	#noteView dl.topInfo {
		width: 100%;
		height: auto;
		padding: 10px 0 6px 0;
	}
	#noteView dl.topInfo dt { display: none; }
	#noteView dl.topInfo dd {
		color: #000000;
	}
	#noteView dl.topInfo dd.sender {
		margin-left: 25px;
	}
	#noteView dl.topInfo dd.cancel {
		margin: -4px 0 0 5px;
	}
	#noteView dl.topInfo dd.date {
		float: right;
		margin-right: 15px;
	}
	#noteView table.content {
		width: 100%;
		height: auto;
	}
	#noteView table.content td {
		background: url(http://static.inven.co.kr/image/member/note/dot_2x3_9C9C9C_td.gif) left top repeat-x;
		padding:9px 0 3px 0;
		vertical-align: top;
		line-height: 150%;
	}
	#noteView table.content td.label {
		width: 147px;
		text-align: center;
		background-color: #F2F2F2;
	}
	#noteView table.content td.value {
		width: 393px;
		padding-left: 19px;
		padding-right: 2px
	}
	#noteView table.content tr.content td.value {
		padding-top: 2px;
		padding-bottom: 2px;
	}
	#noteView table.content div.content {
		position: relative;
		width: 100%;
		height: 294px;
		_height: 300px;
		overflow: auto;
		overflow-x: hidden;
		overflow-y: scroll;
		padding-top: 6px;
	}
	#noteView table.content div.content #contentBody {
		width: 350px;
		height: auto;
		overflow-x: hidden;
		word-wrap: break-word;
		text-align:justify;
	}
	/* 踰꾪듉 */
	#noteView div.command {
		width: 100%;
		height: auto;
		padding: 9px 0 8px 0;
		background: url(http://static.inven.co.kr/image/member/note/dot_2x1_9C9C9C.gif) left top repeat-x;
		border-bottom: solid 1px #B5B6B5;
	}
	#noteView div.command #aNoteList {
		margin-left: 26px;
		float: left;
	}
	#noteView div.command #aNoteStore,
	#noteView div.command #aNoteReport,
	#noteView div.command #aNoteDelete,
	#noteView div.command #aNoteSendDelete,
	#noteView div.command #aNoteDelivery  {
		margin-right: 5px;
		float: right;
	}
	#noteView div.command #aNoteReply {
		margin-right: 21px;
		float: right;
	}
</style>
</head>
<body>
<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class=""><span class="orange"><a href="?folder=write" onfocus="this.blur();">쪽지 보내기</a></span></li>
			<li class="selected oldstart"><span class="orange"><a href="?folder=inbox" onfocus="this.blur();">받은 쪽지함 (최신)</a></span></li>
			<li class=""><span class="orange"><a href="?folder=sent" onfocus="this.blur();">보낸 쪽지함 (최신)</a></span></li>
			<li class=""><span class="orange size3"><a href="?folder=store" onfocus="this.blur();">쪽지 보관함</a></span></li>
						<li class=" oldstart"><span class="orange"><a href="?folder=old" onfocus="this.blur();">받은 쪽지함 (이전)</a></span></li>
			<li class=""><span class="orange"><a href="?folder=oldsent" onfocus="this.blur();">보낸 쪽지함 (이전)</a></span></li>
						<li class=" oldstart"><span class="orange size2"><a href="?folder=block" onfocus="this.blur();">쪽지 차단 설정</a></span></li>
						<li class=""><span class="orange"><a href="javascript:;" onclick="lastAttack()" onfocus="this.blur();">마격보기</a></span></li>
					</ul>
	</dd>
</dl>
</div>
<div id="noteMain">

<script>
function checkAll(fm, prefix, chk) {
	var fmObj = document.getElementById(fm);
	var chs = fmObj.getElementsByTagName('INPUT');
	var n = chs.length;
	var prefixn = prefix.length;
	for (var i = 0; i < n; i++) {
		var item = chs.item(i);
		if (item.getAttribute('name').substring(0, prefixn) == prefix) {
			item.checked = chk;
		}
	}
}

function toggleCheck(fm, prefix, obj) {
	checkAll(fm, prefix, obj.checked);
}

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
	if (!anyChecked(fmObj, "idx_")) { alert("보관할 쪽지를 선택해 주세요"); return; }

	var ans = confirm("선택된 쪽지를 보관하시겠습니까?");
	if (!ans) return;

	fmObj.action = 'http://www.inven.co.kr/member/note/note_status.php';
	fmObj.set.value = 'store';
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
</script>
<h1 class="note"><strong class="nick">murmurIng</strong>님의 <strong class="page">받은 편지함</strong>입니다.(읽지 않은 쪽지: 0통) <a href="javascript:setAllread();" class="allread" onfocus="this.blur();">모두읽음</a></h1>
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
				<a id="cmdStore" class="bttn46" href="javascript:storeNotes();" onfocus="this.blur();">보관</a>
				<a id="cmdWrite" class="bttn92w" href="javascript:writeNewNote();" onfocus="this.blur();">쪽지보내기</a>
	</div>

	<div class="list">
	<form id="fmNoteData" name="fmNoteData" action="" method="POST">
		<input type="hidden" name="rurl" value="Qi80RXlXSVdHcnE3NTVSSVVkdXJUdkVkTVFXQ210MHlaOWNrTUZXVE5BT1FaQmU0bjJjSFkrSUZHMUQrd2srNA"/>
		<input type="hidden" name="set" value=""/>
		<input type="hidden" name="folder" value="inbox"/>
		<table border="0" cellpadding="0" cellspacing="0">
			<thead>
			<tr>
				<th class="chk"><input type="checkbox" id="idx_" name="idx_" onclick="toggleCheck('fmNoteData','idx_',this);" onfocus="this.blur();"/></th>
				<th class="title">제목</th>
				<th class="nickname">보낸사람</th>
				<th class="date">날짜</th>
			</tr>
			</thead>
			<tbody>
						<tr class="read">
				<td class="chk"><input type="checkbox" id="idx_99838166" name="idx_99838166" value="1" onfocus="this.blur();"/></td>
				<td class="title" style="cursor:pointer;" onClick="viewNote(99838166);"><a href="javascript:viewNote(99838166);" onfocus="this.blur();">[인벤] 천애명월도 '결전! 조천궁' 업데이트 및 이벤..&nbsp;</a></td>
				<td class="nickname"><img style="vertical-align: -3px;" src="http://upload2.inven.co.kr/upload/2015/12/18/icon/i11151695501.jpg"> 관리자</td>
				<td class="date">04-25 15:34:35</td>
			</tr>
						<tr class="read">
				<td class="chk"><input type="checkbox" id="idx_99080160" name="idx_99080160" value="1" onfocus="this.blur();"/></td>
				<td class="title" style="cursor:pointer;" onClick="viewNote(99080160);"><a href="javascript:viewNote(99080160);" onfocus="this.blur();">FIFA ONLINE4 인벤 커뮤니티 챌린지 시청 및 직관 안..&nbsp;</a></td>
				<td class="nickname"><img style="vertical-align: -3px;" src="http://upload2.inven.co.kr/upload/2015/12/18/icon/i11151695501.jpg"> 관리자</td>
				<td class="date">03-22 17:45:47</td>
			</tr>
						<tr class="read">
				<td class="chk"><input type="checkbox" id="idx_98885680" name="idx_98885680" value="1" onfocus="this.blur();"/></td>
				<td class="title" style="cursor:pointer;" onClick="viewNote(98885680);"><a href="javascript:viewNote(98885680);" onfocus="this.blur();">[인벤] 월드 오브 탱크 특별 이벤트 안내&nbsp;</a></td>
				<td class="nickname"><img style="vertical-align: -3px;" src="http://upload2.inven.co.kr/upload/2015/12/18/icon/i11151695501.jpg"> 관리자</td>
				<td class="date">03-15 16:59:33</td>
			</tr>
						<tr class="read">
				<td class="chk"><input type="checkbox" id="idx_95320957" name="idx_95320957" value="1" onfocus="this.blur();"/></td>
				<td class="title" style="cursor:pointer;" onClick="viewNote(95320957);"><a href="javascript:viewNote(95320957);" onfocus="this.blur();">[인벤] 로스트아크 이벤트 안내&nbsp;</a></td>
				<td class="nickname"><img style="vertical-align: -3px;" src="http://upload2.inven.co.kr/upload/2015/12/18/icon/i11151695501.jpg"> 관리자</td>
				<td class="date">11-07 16:25:18</td>
			</tr>
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
				<option value="nick" > 닉네임</option>
			</select>
			<input class="word" type="text" id="searchWord" name="s_word" value=""/>
			<input class="submit" type="image" src="http://static.inven.co.kr/image/member/note/bttn_search.gif"/>
		</form>
	</div>
</div>
</div>
</div>

<script type="text/javascript">
	if (navigator.userAgent.indexOf("Chrome") > -1) {
		opener.INVEN.Links.myNotesConfirm(window, false);
	}
</script>
</body>
</html>
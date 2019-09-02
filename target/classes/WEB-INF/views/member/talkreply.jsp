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
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-7385590-7', {'sampleRate' : 1});
  ga('require', 'linkid');
  ga('send', 'pageview');
</script>
<script type="text/javascript">
var linkback = linkback|| {};
(function() {
	var d = document, scr = d.createElement('script'), pro = d.location.protocol,
	tar = d.getElementsByTagName('head')[0];
	scr.type = 'text/javascript';  scr.async = true;
	scr.src = ((pro === 'https:') ? 'https' : 'http') + '://linkback.contentsfeed.com/src/lb4iv.min.js?v=170111a';
	scr.charset='utf-8';
	if(!linkback.l){linkback.l=true; tar.insertBefore(scr, tar.firstChild);}
})();
</script>
</head>
<body class="bPopup"><script>INVEN.Popup.resizeWindowBody(747,510);</script>
<script>
function writeNewNote(nick, reply) {
	if (!reply) { reply = ''; }
	if (!nick) nick = "";
	var url = "?folder=write&rurl=OE94MkNiYUFiTTcxdVJwS1pHRUNYSk1NUWY5aTVPZ1NsQTd4dzNXUWxpWTI5SzRoNW03ejdUN1FBY3lNbWhJMA&nick=" + encodeURIComponent(nick);
	if (reply) { url += '&reply=' + reply; }
		location.href = url;
}
function lastAttack() {
 var lastatk = window.open('http://www.inven.co.kr/member/skill/list_lasthit.php','myinventory','left=100,top=10,width=693,height=700,resizable=yes,scrollbars=yes, toolbar=0');
 lastatk.focus();

}
</script>
<div id="noteWrap">
<div id="noteLeft">
<dl class="menu">
	<dt>쪽지함</dt>
	<dd>
		<ul>
			<li class="selected oldstart"><span class="orange"><a href="/talkreply/0" >쪽지 보내기</a></span></li>
			<li class=""><span class="orange"><a href="/talk" >받은 쪽지함
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
<script type="text/javascript"  src="http://www.inven.co.kr/js/fn_string.js"></script>
<script>
	function sendNote() {
		var fmObj = document.getElementById("fmNoteWrite");
		if (fmObj.nick.value.trim() == '') { alert("받는 사람을 적어주세요."); fmObj.nick.focus(); return; }
		if (fmObj.title.value.trim() == '') { alert("쪽지 제목을 적어주세요."); fmObj.title.focus(); return; }
		if (fmObj.content.value.trim() == '') { alert("쪽지 내용을 적어주세요."); fmObj.content.focus(); return; }
		document.getElementById("aNoteSave").href = "javascript:void(0);";
		document.getElementById("aNoteSave").innerHTML = "보내는중..";
		fmObj.submit();
	}
</script>
<script>
	var MemberNote = window.MemberNote || {};
	MemberNote.create = function() {
		var obj = new MemberNote.object();
		return obj;
	}
	MemberNote.object = function() {
		data = new Array();
		var reloadTime = 3;
		var frmObj = false;
				var talkXmlObj = INVEN.Xml.create("POST", "http://www.inven.co.kr/member/note/note_write_send.xml.php", true);
				var returnurl = '';
		var pagelocation = false;
		this.init = init;
		function init(objName, rurl, pgloc) {
			frmObj = document.getElementById(objName);
			returnurl = rurl;
			if (pgloc) {
				pagelocation = pgloc;
			}
		}
		this.request = request;
		function request(act) {
			data['act'] = act;
			data['out'] = 'xml';
			switch(act) {
				case 'save':
					data['tonick'] = frmObj.nick.value;
					data['title'] = frmObj.title.value;
					data['content'] = frmObj.content.value;
					data['reply'] = frmObj.reply.value;
										data['toinven'] = frmObj.toinven.value;
					if (frmObj.noteflag.checked==true) {
						data['noteflag'] = frmObj.noteflag.value;
					} else {
						data['noteflag'] = '';
					}
					if (pagelocation) {
						data['pgloc'] = pagelocation;
					}
					break;
			}
			talkXmlObj.print = listProcess;
			talkXmlObj.request(data);
		}
		function listProcess(xmlObj){
			var lists = xmlObj.responseXML.getElementsByTagName("resultdata")[0];
			var message = lists.getElementsByTagName("message")[0].firstChild.nodeValue;
			if (message == '1') {
				returnAction();
			} else {
				alert(message);
			}
		}
		this.save = save;
		function save() {
			if (frmObj.nick.value == '') { alert("받는 분 닉네임을 입력해 주세요"); frmObj.nick.focus(); return; }
			if (frmObj.title.value == '') { alert("제목을 입력해 주세요"); frmObj.title.focus(); return; }
			if (frmObj.content.value == '') { alert("내용을 입력해 주세요"); frmObj.content.focus(); return; }
			request('save');
		}
		function returnAction() {
			if (returnurl=='_close') {
				if (confirm('쪽지가 전송되었습니다. 쪽지창을 닫습니다.')) {
					window.close();
				} else {
					location.replace('http://www.inven.co.kr/member/note/?folder=inbox');
				}
			} else {
				alert('쪽지가 전송되었습니다.');
				if (returnurl != '') {
					location.replace(returnurl);
				}
			}
		}
	}
</script>
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
						<textarea class="content" id="content" name="talk"></textarea>
					</td>
				</tr>
		</table>
		<div class="command">
			<a id="aNoteCancel" href="/talk" class="bttn46">취소</a>
			<a id="aNoteSave" href="javascript:submitbtn()" class="bttn92w">쪽지보내기</a>
		</div>
	</div>
</form>
</div>

</div>
</body>
</html>
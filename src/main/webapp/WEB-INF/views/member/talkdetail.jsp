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
	var url = "?folder=write&rurl=OE94MkNiYUFiTTcxdVJwS1pHRUNYQVNRTFFBZ2pJcFFJb0lGVW5NR2dOOTdlYU1LaHpWSXREMnd2T1ZpaVpnb2lDRmMyWTZkalFFTkR4Uk1IZjhnTU9LMzZhYjVtTmZEbWV1K1hGaWZscW89&nick=" + encodeURIComponent(nick);
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
<script type="text/javascript"  src="http://www.inven.co.kr/js/image.js"></script>
<script>
function deleteNote(n) {
	var ans = confirm("삭제하시겠습니까?");
	if (!ans) return;
	var url = "http://www.inven.co.kr/member/note/note_status.php?n="+n+"&rurl=Qi80RXlXSVdHcnE3NTVSSVVkdXJUdkVkTVFXQ210MHlaOWNrTUZXVE5BT1FaQmU0bjJjSFkrSUZHMUQrd2srNA&folder=inbox&set=delete";
	location.replace(url);
}
function storeNote(n) {
	var ans = confirm("보관하시겠습니까?");
	if (!ans) return;
	var url = "http://www.inven.co.kr/member/note/note_status.php?n="+n+"&rurl=Qi80RXlXSVdHcnE3NTVSSVVkdXJUdkVkTVFXQ210MHlaOWNrTUZXVE5BT1FaQmU0bjJjSFkrSUZHMUQrd2srNA&folder=inbox&set=store";
	location.replace(url);
}
</script>

<script type="text/javascript" src="http://www.inven.co.kr/common/lib/js/framework/jquery-1.5.1.min.js"></script>
<script type="text/javascript" src="http://www.inven.co.kr/common/lib/js/framework/jquery.jscrollpane.min.js"></script>
<script type="text/javascript" src="http://www.inven.co.kr/common/lib/js/framework/jquery.mousewheel.js"></script>
<h1 class="note"><strong class="nick">${member.name }</strong>님의 <strong class="page">쪽지보기</strong>입니다.</h1>

<div id="noteView">
	<dl class="topInfo">
		<dt>보낸이::</dt>
				<dd class="sender">${detail.name}</dd>
			<dt>보낸날짜:</dt>
		<dd class="date">${detail.talk_date }</dd>
	</dl>
	<table class="content" border="0" cellpadding="0" cellspacing="0">
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
				<a id="aNoteDelete" href="/talkdelete/${detail.talk_no}" class="bttn46">삭제</a>
				<a id="aNoteStore" href="" class="bttn46">보관</a>
				
			</div>
</div>
<script>//imageAutoResize("contentBody");</script>
</div>

</div><script type="text/javascript">
	if (navigator.userAgent.indexOf("Chrome") > -1) {
		opener.INVEN.Links.myNotesConfirm(window, false);
	}
</script>
</body>
</html>





</body>
</html>
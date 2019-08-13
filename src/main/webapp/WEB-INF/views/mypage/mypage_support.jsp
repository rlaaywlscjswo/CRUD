<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 후원 현황</title>
<style>

* {
	margin: 0;
	padding: 0;
}


body {
	width: 1000px;
	height: 333px;
	border: 5px dotted crimson;
	background-color: yellow;
}

#main {
	margin: 10px;
	padding: 2px;
	width: 300px;
	height: 130px;
	border: 1px solid;
	background-color: chartreuse;
	color: dodgerblue;
	border-radius: 10px;
	display: inline-block;
	border: 1px solid;
	position: relative;
	left: 15%;
}

#paging {
	position: relative;
	top: 10%;
	left: 45%;
	font-size: 22px;
}

a:link {
	text-decoration: none;
}

a:after {
	font-size: 2em;
}

label, #search {
	margin-top: 15px;
	margin-bottom: 10px;
	width: 300px;
	height: 30px;
	position: relative;
	left: 55%;
} 

#find {
	margin-top: 15px;
	margin-bottom: 10px;
	height: 30px;
	position: relative;
	left: 56%;
}

</style>
</head>
<body>


	<div id="searching">
		<form method="get" action="support?currPage=${dto.firstPageOfBlock}">
			<label for="search">검색 </label>
			<input type="text" id="search" name="search" placeholder="  프로젝트 이름으로 검색해주세요 :)">
			<input type="submit" value="찾아줘!!" id="find">
		</form>
	</div>

	<c:forEach var="slist" items="${supportList}">
		<div id="main">
			후원 일자 :
			<c:out value="${slist.da}" />
			<br> 썸네일 이미지 :
			<c:out value="${slist.project_photo}" />
			<br> 후원 진행 사항 :
			<c:out value="${slist.support_status}" />
			<br> 프로젝트 이름 :
			<c:out value="${slist.project_title}" />
			<br> 선택한 옵션 :
			<c:out value="${slist.option_no}" />
			<br> 후원 금액 :
			<c:out value="${slist.option_price}" />
		</div>
	</c:forEach>

 	<div id="paging">
		<c:if test="${dto.prev}">
			<a href="support?currPage=${dto.firstPageOfBlock-1}&search=${search}"><c:out value="이전" /></a>
		</c:if>

		<c:forEach var="index" begin="${dto.firstPageOfBlock}" end="${dto.lastPageOfBlock}">		
			<a href="support?currPage=${index}&search=${search}"><c:out value="${index}" /></a>
		</c:forEach>

		<c:if test="${dto.next}">
			<a href="support?currPage=${dto.lastPageOfBlock+1}&search=${search}"><c:out value="다음" /></a>
		</c:if>
	</div>



</body>
</html>
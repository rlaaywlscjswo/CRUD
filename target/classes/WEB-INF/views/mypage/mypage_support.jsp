<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 후원 현황</title>
<style>

#support_label {
	display: inline-block;
	position: relative;
	height: 30px;
	margin-top: 20px;
	left: 60%;
}

#support_search {
	display: inline-block;
	width: 250px;
	height: 30px;
	position: relative;
	margin-top: 20px;
	left: 60.5%;
}

#support_find {
	display: inline-block;
	height: 30px;
	position: relative;
	margin-top: 20px;
	left: 61%;
}

#support_main {
	position: relative;
	left: 10%;
	margin: 10px;
	padding: 10px;
	width: 1200px;
	display: inline-block;
	border: 1px solid purple;
	border-radius: 10px;
	background-color: chartreuse;
	color: purple;
}

#support_paging {
	position: relative;
	left: 45%;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 10px;
	font-size: 22px;
}

</style>
</head>
<body>


	<div id="support_searching">
		<form method="get" action="support?currPage=${dto.firstPageOfBlock}">
			<label for="support_search" id="support_label">검색 </label>
			<input type="text" id="support_search" name="support_search" placeholder="  프로젝트 이름으로 검색해주세요 :)">
			<input type="submit" value="찾아줘!!" id="support_find">
		</form>
	</div>

	<c:forEach var="slist" items="${supportList}">
		<div id="support_main">
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
		</div> <br>
	</c:forEach>

 	<div id="support_paging">
		<c:if test="${dto.prev}">
			<a href="support?currPage=${dto.firstPageOfBlock-1}&support_search=${support_search}"><c:out value="이전" /></a>
		</c:if>

		<c:forEach var="index" begin="${dto.firstPageOfBlock}" end="${dto.lastPageOfBlock}">		
			<a href="support?currPage=${index}&support_search=${support_search}"><c:out value="${index}" /></a>
		</c:forEach>

		<c:if test="${dto.next}">
			<a href="support?currPage=${dto.lastPageOfBlock+1}&support_search=${support_search}"><c:out value="다음" /></a>
		</c:if>
	</div>



</body>
</html>
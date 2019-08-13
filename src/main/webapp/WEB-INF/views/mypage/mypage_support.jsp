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
	left: 75%;
}

#support_search {
	display: inline-block;
	width: 250px;
	height: 30px;
	position: relative;
	margin-top: 20px;
	left: 75.5%;
}

#support_find {
	display: inline-block;
	height: 30px;
	position: relative;
	margin-top: 20px;
	left: 76%;
}

#support_main {
	position: relative;
	left: 10%;
	margin: 10px;
	padding: 10px;
	width: 1500px;
	display: inline-block;
	border: 1px solid silver;
	border-radius: 10px;
	color: gray;
}

#support_paging {
	position: relative;
	left: 45%;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 10px;
	font-size: 22px;
}

#da, #project_photo, #support_status, #project_title, #option_no, #option_price {
	position: relative;
	display: inline-block;
	border: 1px solid silver;
}

#da {
	width: 160px;
	height: 25px;
}

#project_photo {
	width: 160px;
	height: 160px;
	top: 35px;
	left: -11%;
	margin-bottom: 10px;
}

#support_status {
	width: 200px;
	height: 25px;
	top: 36px;
	left: -10%;
}

#project_title {
	width: 500px;
	height: 25px;
	top: 68px;
	left: -23.7%;
}

#option_no {
	width: 500px;
	height: 25px;
	top: -69px;
	left: 12.2%;
}

#option_price {
	width: 200px;
	height: 25px;
	top: -36px;
	left: -21.8%;
}


</style>
</head>
<body>

	모두 보기
	진행 중인 프로젝트
	결제가 완료 된 프로젝트

	<div id="support_searching">
		<form method="get" action="support?currPage=${dto.firstPageOfBlock}">
			<label for="support_search" id="support_label">검색 </label> <input
				type="text" id="support_search" name="support_search"
				placeholder="  프로젝트 이름으로 검색해주세요 :)"> <input type="submit"
				value="찾아줘!!" id="support_find">
		</form>
	</div>

	<c:forEach var="slist" items="${supportList}">
		<div id="support_main">			
			<div id="da"> 후원 일자 : <c:out value="${slist.da}" /> </div>
			<div id="project_photo"> 썸네일 이미지 : <c:out value="${slist.project_photo}" /> </div>
			<div id="support_status"> 후원 진행 사항 : <c:out value="${slist.support_status}" /> </div>
			<div id="project_title"> 프로젝트 이름 : <c:out value="${slist.project_title}" /> </div>
			<div id="option_no"> 선택한 옵션 : <c:out value="${slist.option_no}" /> </div>
			<div id="option_price"> 후원 금액 : <c:out value="${slist.option_price}" /> </div>
		</div>
		<br>
	</c:forEach>

	<div id="support_paging">
		<c:if test="${dto.prev}">
			<a
				href="support?currPage=${dto.firstPageOfBlock-1}&support_search=${support_search}"><c:out
					value="이전" /></a>
		</c:if>

		<c:forEach var="index" begin="${dto.firstPageOfBlock}"
			end="${dto.lastPageOfBlock}">
			<a href="support?currPage=${index}&support_search=${support_search}"><c:out
					value="${index}" /></a>
		</c:forEach>

		<c:if test="${dto.next}">
			<a
				href="support?currPage=${dto.lastPageOfBlock+1}&support_search=${support_search}"><c:out
					value="다음" /></a>
		</c:if>
	</div>



</body>
</html>
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

.mypage_support_wrap {
	border: 1px solid gray;
	border-radius: 10px;
	display: inline-block;
	height: 600px;
	width: 1000px;
}

#support_filter {
	display: inline-block;
 	left: 20px;
	position: relative;
	top: 20px;
}

#filter_all, #filter_ing, #filter_complete {
	border: 1px solid silver;
	border-radius: 5px;
	padding-left: 2px;
	padding-right: 2px;
}

#support_searching {
	display: inline-block;
	height: 50px;
	left: 220px;
	position: relative;
}

#support_search {
	display: inline-block;
	width: 220px;
	height: 20px;
	position: relative;
	top: 20px;
}

#support_find {
	display: inline-block;
	left: 10px;
	padding-top: 1px;
	padding-bottom: 1px;
	position: relative;
	top: 22px;
}

#support_main {
	position: relative;
	left: 80px;
	top: 50px;
	margin: 10px;
	padding: 10px;
	width: 800px;
	height: 150px;
	display: inline-block;
	border: 1px solid silver;
	border-radius: 10px;
	color: gray;
}

#support_paging {
	position: relative;
	left: 450px;
	margin-top: 20px;
	margin-bottom: 20px;
	padding: 10px;
	top: 40px;
	font-size: 22px;
}

#da, #project_photo, #support_status, #project_title, #option_no,
	#option_price {
	position: absolute;
	display: inline-block;
	border: 1px solid silver;
	font-size: 13px;
}

#da {
	width: 160px;
	height: 20px;
	margin-bottom: 15px;
}

#project_photo {
	width: 160px;
	height: 120px;
	top: 35px;
	left: 10px;
}

#support_sub {
	display: inline-block;
	height: 100px;
	left: 180px;
	position: absolute;
	top: 36px;
	width: 500px;
}

#support_status {
	width: 200px;
	height: 20px;
}

#project_title {
	width: 500px;
	height: 20px;
	top: 25px;
}

#option_no {
	width: 500px;
	height: 20px;
	top: 50px;
}

#option_price {
	width: 200px;
	height: 20px;
	top: 75px;
}
</style>
</head>
<body>

	<div class="mypage_support_wrap">

		<!-- filter -->
		<div id="support_filter">
			<span id="filter_all">모두 보기</span>
			<span id="filter_ing">진행 중인 프로젝트</span>
			<span id="filter_complete">목표 금액을 달성한 프로젝트</span>
		</div>

		<div id="support_searching">
			<form method="get" action="support?currPage=${dto.firstPageOfBlock}">
				<label for="support_search" id="search_label"></label>
				<input type="text" id="support_search" name="support_search" placeholder="  프로젝트 이름으로 검색해주세요 :)">
				<input type="submit" value="찾아줘!!" id="support_find">
			</form>
		</div>

		<c:forEach var="slist" items="${supportList}">

			<div id="support_main">

				<div id="da">후원 일자 : <c:out value="${slist.da}" /></div>
				<div id="project_photo">썸네일 이미지 : <c:out value="${slist.project_photo}" /></div>
				
				<div id="support_sub">
				
					<div id="support_status">후원 진행 사항 : <c:out value="${slist.support_status}" /></div>
					<div id="project_title">프로젝트 이름 : <c:out value="${slist.project_title}" /></div>
					<div id="option_no">선택한 옵션 : <c:out value="${slist.option_name}" /></div>
					<div id="option_price">후원 금액 : <c:out value="${slist.option_price}" /></div>

				</div> <!-- end #support_sub -->

			</div> <!-- end #support_main -->

		</c:forEach>

		<div id="support_paging">
		
			<c:if test="${dto.prev}">
				<a href="support?currPage=${dto.firstPageOfBlock-1}&support_search=${support_search}">
				<c:out value="이전" /></a>
			</c:if>

			<c:forEach var="index" begin="${dto.firstPageOfBlock}" end="${dto.lastPageOfBlock}">
				<a href="support?currPage=${index}&support_search=${support_search}">
				<c:out value="${index}" /></a>
			</c:forEach>

			<c:if test="${dto.next}">
				<a href="support?currPage=${dto.lastPageOfBlock+1}&support_search=${support_search}">
				<c:out value="다음" /></a>
			</c:if>
			
		</div> <!-- #support_paging -->

	</div> <!-- .mypage_support_wrap -->

</body>
</html>
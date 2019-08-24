<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 프로젝트</title>
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
			<label for="support_search" id="support_label">검색 </label> <input
				type="text" id="support_search" name="support_search"
				placeholder="  프로젝트 이름으로 검색해주세요 :)"> <input type="submit"
				value="찾아줘!!" id="support_find">
		</form>
	</div>
	
	<div>남은 시간을 보여줘 : ${remainingDays}일 남았어!!</div>

	내가 만든 프로젝트 개수 :
	<div
		style="font-size: 2em; color: dodgerblue; display: inline-block; margin-bottom: 50px;">${myProject}</div>
	개

	<div
		style="border: 1px solid silver; width: 1000px; margin-left: 50px;">
		<c:forEach items="${myProjectList}" var="mp">
			<div
				style="border: 1px solid silver; width: 200px; height: 230px; margin: 10px; display: inline-block; ">
				

					프로젝트 이름 : ${mp.project_title}<br>
					썸네일 이미지 : ${mp.project_photo}<br>
					남은 시간 : ${remainingDays}일<br>
					모인 금액 : ${achievePercent}원<br>

				
				<%-- 프로젝트 번호 : ${mplist.pno} <br>
				썸네일 이미지 : ${mplist.project_photo} <br> 
				남은 시간 : ${mplist.liter} <br> 
				달성률 : <br> 
				프로젝트 이름 : ${mplist.project_title} <br>
				모인 금액 : <br> --%>
			</div>
		</c:forEach>
 <%--  		<c:forEach var="allSupport" items="${allOfSupport}">
				${allSupport.pno}번 프로젝트의 모인 금액 : ${allSupport.opp} <br> 
		</c:forEach> --%>
	</div>

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
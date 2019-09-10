<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지 - 내 프로젝트</title>
<style>

	* {
		margin: 0;
		padding: 0;
	}
	
	.myProjectWrap {
		border: 3px dotted lime;
		height: 600px;
		width: 1000px;
	}
	
	#theNumbersOfMyProject, #myProject_searching, #mypro_main, #mypro_each, #myProject_paging {
		border: 1px solid dodgerblue;
		display: inline-block;
		position: relative;
	}
	
	#theNumbersOfMyProject {
	}
	
	#myProject_searching {
	}

	#mypro_main {
		height: 400px;
		width: 700px;
	}
	
	#mypro_each {
		height: 150px;
		margin: 10px;
		width: 300px;
	}
	
	#myProject_paging {
		
	}
</style>
</head>
<body>

	<div class="myProjectWrap">
		
		<div id="theNumbersOfMyProject">
		내가 만든 프로젝트 개수 : ${theNumbersOfMyProject}개
		</div>
		
		<div id="myProject_searching">
				<form method="get" action="mypro?currPage=${dto.firstPageOfBlock}">
				<label for="project_search" id="project_label"></label>
				<input type="text" id="project_search" name="project_search" placeholder="  프로젝트 이름으로 검색해주세요 :)">
				<input type="submit" value="찾아줘!!" id="project_find">
			</form>
		</div>
		
			<div id="mypro_main">
				<c:forEach var="myProject_list" items="${myProject_list}">
					<div id="mypro_each">	 	
						썸네일 이미지 : <img src="${myProject_list.project_photo}" alt="썸네일 이미지"><br>
						모인 금액 : ${myProject_list.sumop}원<br>
						
						<c:set var="rd" value="${myProject_list.remainingDay}" />
						<c:choose>
						<c:when test="${rd < 2}">남은 시간 : ${myProject_list.nam}시간<br></c:when>
						<c:otherwise>남은 날 : ${myProject_list.remainingDay}일<br></c:otherwise>
						</c:choose>					
						
						달성 퍼센트 : ${myProject_list.reachper}%<br>
						계약서 : ${myProject_list.project_contract}<br>
						프로젝트 이름 : ${myProject_list.project_title}<br>
					</div>
				 </c:forEach>					
			</div>
		
		<div id="myProject_paging">
			<c:if test="${dto.prev}">
				<a href="mypro?currPage=${dto.firstPageOfBlock-1}&project_search=${project_search}">
				<c:out value="이전" /></a>
			</c:if>

			<c:forEach var="index" begin="${dto.firstPageOfBlock}" end="${dto.lastPageOfBlock}">
				<a href="mypro?currPage=${index}&project_search=${project_search}">
				<c:out value="${index}" /></a>
			</c:forEach>

			<c:if test="${dto.next}">
				<a href="mypro?currPage=${dto.lastPageOfBlock+1}&project_search=${project_search}">
				<c:out value="다음" /></a>
			</c:if>
		</div>
		
		
	</div>

</body>
</html>
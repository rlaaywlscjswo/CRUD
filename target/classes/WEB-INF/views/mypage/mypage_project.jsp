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
	
	#theNumbersOfMyProject, #myProject_searching, #mypro_main, #myProject_paging {
		border: 1px solid dodgerblue;
		display: inline-block;
		position: relative;
	}
	
	#theNumbersOfMyProject {
	}
	
	#myProject_searching {
	}

	#mypro_main {
		height: 100px;
		margin: 10px;
		width: 400px;
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
			여긴 검색
		</div>
		
			<div id="mypro_main">
			
					<div>
						 <c:forEach var="thumbnail" items="${thumbnail}">
							썸네일 이미지 : ${thumbnail.project_photo}<br>
						 </c:forEach>
				 	</div>
					<%-- <div>
						<c:forEach var="" items="">
							모인 금액 : <br>
						</c:forEach>
					</div>
					<div>
						<c:forEach var="" items="">
							남은 시간 : <br>
						</c:forEach>
					</div>
					<div>
						<c:forEach var="" items="">
							달성 퍼센트 : <br>
						</c:forEach>
					</div>
					<div>
						<c:forEach var="" items="">
							계약서 : <br>
						</c:forEach>
					</div>
					<div>
						<c:forEach var="" items="">
							프로젝트 이름 : <br>
						</c:forEach>
					</div> --%>
			</div>
		
		<div id="myProject_paging">
			여긴 페이징
		</div>
		
		
	</div>

</body>
</html>
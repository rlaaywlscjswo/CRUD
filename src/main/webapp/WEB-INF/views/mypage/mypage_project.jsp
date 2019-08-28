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
		margin: 10px;
	}
	
	#myProject_paging {
		
	}
</style>
</head>
<body>

	<div class="myProjectWrap">
		
		<div id="theNumbersOfMyProject">
		내가 만든 프로젝트 개수 :
		</div>
		
		<div id="myProject_searching">
			여긴 검색
		</div>
		
		<c:forEach var="mypro" items="${mypro}">
			<div id="mypro_main">
				썸네일 이미지 : <br>
				모인 금액 : <br>
				남은 시간 : <br>
				달성 퍼센트 : <br>
				계약서 : <br>
				프로젝트 이름 : <br>
			</div>
		</c:forEach>
		
		<div id="myProject_paging">
			여긴 페이징
		</div>
		
		
	</div>

</body>
</html>
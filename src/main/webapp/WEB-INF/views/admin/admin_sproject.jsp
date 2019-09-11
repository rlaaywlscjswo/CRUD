<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀딩 현황 목록</title>
<style>

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 50%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#pdfhere {
	border: 1px solid silver;
	display: inline-block;
	height: 300px;
	position: relative;
	width: 400px;
}

#agree {
	background-color: dodgerblue;
	border: 1px solid;
	border-radius: 10px;
	color: #fff;
	display: inline-block;
	font-size: 1em;
	text-align: center;
	padding: 10px;
	position: relative;
	width: 100px;
}
</style>
<script>
	window.onload = function() {

		// Get the modal
		var modal = document.getElementById('myModal');

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}

	}
</script>
</head>
<body>

	<!-- 검색 -->
	<div id="sproject_search">
		<!-- 검색 옵션 -->
		<select class="form-control form-control-sm" style="width: 150px;">
			<option>프로젝트 이름</option>
			<option>현황</option>
		</select>
		<!-- 검색 바 -->
		<form method="get" action="spro?currPage=${dto.firstPageOfBlock}">
			<label for="sproject_search" id="sproject_label"></label> <input
				class="form-control form-control-sm" type="text"
				id="sproject_search" name="sproject_search"
				placeholder="  프로젝트 이름으로 검색해주세요 :)" style="width: 400px;"> <input
				type="submit" value="찾아줘!!" class="btn btn-primary">
		</form>
	</div>
	<!-- 검색 끝 -->

	<!-- 펀딩 현황 목록 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">프로젝트 번호</th>
				<th scope="col">프로젝트 이름</th>
				<th scope="col">현황</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="spro" items="${admin_sproject}">
				<tr>
					<td>${spro.project_no}</td>
					<td>${spro.project_title}</td>
					<td><c:set var="ps" value="${spro.project_status}" /> <c:choose>
							<c:when test="${ps == 0}">승인 대기<img
									src="/resources/img/thinking.png" alt="승인 대기" width="20px"
									height="20px">
							</c:when>
							<c:when test="${ps == 1}">진행 중<img
									src="/resources/img/ing.png" alt="진행 중 " width="20px"
									height="20px">
							</c:when>
							<c:when test="${ps == 2}">거절 된 프로젝트<img
									src="/resources/img/fail.png" alt="거절 된 프로젝트 " width="20px"
									height="20px">
							</c:when>
							<c:when test="${ps == 3}">지난 프로젝트<img
									src="/resources/img/end.png" alt="지난 프로젝트 " width="20px"
									height="20px">
							</c:when>
						</c:choose></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 펀딩 현황 목록 끝 -->

	<!-- 페이징 -->
	<div class="col-12">
		<div class="pagination-area d-sm-flex mt-15">
			<nav aria-label="#">
				<ul class="pagination">
					<li class="page-item"><c:if test="${dto.prev}">
							<a class="page-link"
								href="spro?currPage=${dto.firstPageOfBlock-1}&sproject_search=${sproject_search}">
								<c:out value="이전" />
							</a>
						</c:if></li>

					<c:forEach var="index" begin="${dto.firstPageOfBlock}"
						end="${dto.lastPageOfBlock}">
						<li class="page-item"><a class="page-link"
							href="spro?currPage=${index}&sproject_search=${sproject_search}">
								<c:out value="${index}" />
						</a></li>
					</c:forEach>

					<li class="page-item"><c:if test="${dto.next}">
							<a class="page-link"
								href="spro?currPage=${dto.lastPageOfBlock+1}&sproject_search=${sproject_search}">
								<c:out value="다음" />
							</a>
						</c:if></li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- 페이징 끝 -->

	<form name="excelForm" id="excelForm" method="post"
		action="./sprojectExcelDown.do">
		<input type="submit" id="excelDown" value="Excel 다운"
			class="btn btn-primary">
	</form>




	<!-- Trigger/Open The Modal -->
	<button id="myBtn">Open Modal</button>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="pdfhere"></div>
			<a href="#"><span id="agree">승인</span></a> <a href="#"><span
				id="agree">비승인</span></a>
		</div>

	</div>


</body>
</html>
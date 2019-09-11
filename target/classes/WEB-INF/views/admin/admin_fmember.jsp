<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀딩 회원 관리</title>
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
	<div id="fmember_search">
	<!-- 검색 옵션 -->
		<select class="form-control form-control-sm" style="width: 150px;">
			<option>회원 이름</option>
			<option>이메일</option>
			<option>프로젝트 이름</option>
		</select>
		<!-- 검색 바 -->
		<form method="get" action="fmember?currPage=${dto.firstPageOfBlock}">
			<label for="fmember_search" id="fmember_label"></label> <input class="form-control form-control-sm"
				type="text" id="fmember_search" name="fmember_search"
				placeholder="  프로젝트 이름으로 검색해주세요 :)" style="width: 400px;"> <input type="submit"
				value="찾아줘!!" id="fmember_find" class="btn btn-primary">
		</form>
	</div>
	<!-- 검색 끝 -->

	<!-- 펀딩 회원 목록 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">회원 번호</th>
				<th scope="col">회원 이름</th>
				<th scope="col">이메일</th>
				<th scope="col">프로젝트 이름</th>
				<th scope="col">평균 평점</th>
				<th scope="col">현재 후원금 / 목표 후원금</th>
				<th scope="col">성공 여부 / 달성률</th>
				<th scope="col">계약서</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="fmlist" items="${fmemberList}">
				<tr>

					<td>${fmlist.no}</td>
					<td>${fmlist.name}</td>
					<td>${fmlist.email}</td>
					<td>${fmlist.project_title}</td>
					<td><c:set var="ara" value="${fmlist.arating}" /> <c:choose>
							<c:when test="${ara == null}">아직 등록 된 평점이 없..</c:when>
							<c:otherwise>${fmlist.arating}점</c:otherwise>
						</c:choose></td>
					<td><c:set var="sop" value="${fmlist.sumop}" /> <c:set
							var="ntp" value="${fmlist.ntargetprice}" /> <c:choose>
							<c:when test="${sop == null}">아직 후원을 받지 못했.. / ${fmlist.ntargetprice}원</c:when>
							<c:when test="${sop > ntp}">
								<span>${fmlist.sumop}원</span> / ${fmlist.ntargetprice}원</c:when>
							<c:otherwise>${fmlist.sumop}원 / ${fmlist.ntargetprice}원</c:otherwise>
						</c:choose></td>
					<td><c:set var="rper" value="${fmlist.reachper}" /> <c:choose>
							<c:when test="${rper > 100}">
								<span style="color: dodgerblue;">프로젝트 성공! </span>
								<span> / </span>
								<span style="color: lime;"> ${fmlist.reachper}%</span>
							</c:when>
							<c:when test="${rper == null}">아직염.. / 0%</c:when>
							<c:otherwise>아직염.. / ${fmlist.reachper}%</c:otherwise>
						</c:choose></td>
					<td>${fmlist.project_contract}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

		<!-- 페이징 -->
	<div class="col-12">
		<div class="pagination-area d-sm-flex mt-15">
			<nav aria-label="#">
				<ul class="pagination">
					<li class="page-item"><c:if test="${dto.prev}">
							<a class="page-link"
								href="fmember?currPage=${dto.firstPageOfBlock-1}&fmember_search=${fmember_search}">
								<c:out value="이전" />
							</a>
						</c:if></li>

					<c:forEach var="index" begin="${dto.firstPageOfBlock}"
						end="${dto.lastPageOfBlock}">
						<li class="page-item"><a class="page-link"
							href="fmember?currPage=${index}&fmember_search=${fmember_search}">
								<c:out value="${index}" />
						</a></li>
					</c:forEach>

					<li class="page-item"><c:if test="${dto.next}">
							<a class="page-link"
								href="fmember?currPage=${dto.lastPageOfBlock+1}&fmember_search=${fmember_search}">
								<c:out value="다음" />
							</a>
						</c:if></li>
				</ul>
			</nav>
		</div>
	</div>
	<!-- 페이징 끝 -->

	<form name="excelForm" id="excelForm" method="post"
		action="./fmemberExcelDown.do">
		<input type="submit" id="excelDown" value="Excel 다운">
	</form>

	<!-- Trigger/Open The Modal -->
	<button id="myBtn">Open Modal</button>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<div>
				<h3>펀딩 회원 명</h3>
				<table>
					<thead>
						<tr>
							<th>성공 횟수 / 총 펀딩 횟수</th>
							<th>평균 달성률</th>
							<th>평균 평가점수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${successCount}회/${regipro}회</td>
							<td>${avgdal}%</td>
							<td>${avgRating}점</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>
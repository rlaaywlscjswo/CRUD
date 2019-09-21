<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀딩 회원 관리</title>
<link href="\resources\css/admin.css" rel="stylesheet">
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	jQuery.noConflict();
	jQuery(document).ready(function($) {
		
		$('tbody tr').on('click', function() {
			 var d=$(this).find('td:eq(0)').text();
			 // $('.modal-content').find('h3:eq(0)').css('background-color', 'lime');
			 // $('.modal-content table tr').find('td:eq(0)').css('background-color', 'dodgerblue');
			$.ajax({
				url:"/stats",
				data: "no="+d,
				dataType:"json",
				success:function(data) {
					
					$('.modal-content').find('h3:eq(0)').empty();
					$('.modal-content table tr').find('td:eq(0)').empty();
					$('.modal-content table tr').find('td:eq(1)').empty();
					$('.modal-content table tr').find('td:eq(2)').empty();
					
					var name = '';
					var sure = '';
					var avgdal = '';
					var avgRating = '';
					
					name += data.getName + " 님의 통계 자료";
					sure += data.successCount + '회 / ' + data.regipro + "회";
					avgdal += data.avgdal + '%';
					avgRating += data.avgRating + '점';
					
					$('.modal-content').find('h3:eq(0)').append(name);
					$('.modal-content table tr').find('td:eq(0)').append(sure);
					$('.modal-content table tr').find('td:eq(1)').append(avgdal);
					$('.modal-content table tr').find('td:eq(2)').append(avgRating);
					
					$('#myModal').css('display', 'block');
				}
				
			}); // end ajax
			
			$('.close').on('click', function() {
				$('#myModal').css('display', 'none');
			}); // end 모달 창 닫기 버튼 클릭 시
			
		}); // end on
		
	}); // end ready
</script>
</head>
<body>

	<div class="wrap">

	<!-- 검색 -->
	<div id="search">
		<!-- 검색 바 -->
		<form method="get" action="fmember?currPage=${dto.firstPageOfBlock}">
			<label for="fmember_search"></label>
			<input class="form-control form-control-sm" type="text" 
			id="bh_search" name="fmember_search" placeholder="  회원 이름으로 검색해주세요 :)">
			<input type="submit" value="찾아줘!!"	id="fmember_find" class="btn btn-primary">
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
							<c:when test="${ara == null}">아직 등록 된 평점이 없습니다.</c:when>
							<c:otherwise>${fmlist.arating}점</c:otherwise>
						</c:choose></td>
					<td><c:set var="sop" value="${fmlist.sumop}" /> <c:set
							var="ntp" value="${fmlist.ntargetprice}" /> <c:choose>
							<c:when test="${sop == null}">아직 후원을 받지 못했습니다. / ${fmlist.ntargetprice}원</c:when>
							<c:when test="${sop > ntp}">
								<span>${fmlist.sumop}원</span> / ${fmlist.ntargetprice}원</c:when>
							<c:otherwise>${fmlist.sumop}원 / ${fmlist.ntargetprice}원</c:otherwise>
						</c:choose></td>
					<td><c:set var="rper" value="${fmlist.reachper}" /> <c:choose>
							<c:when test="${rper > 100}">
								<span>프로젝트 성공! </span>
								<span> / </span>
								<span> ${fmlist.reachper}%</span>
							</c:when>
							<c:when test="${rper == null}">아직 후원을 받지 못했습니다. / 0%</c:when>
							<c:otherwise>아직 후원을 받는 중입니다. / ${fmlist.reachper}%</c:otherwise>
						</c:choose></td>
						
						
						<!-- 여기야!! -->
					<td>${fmlist.project_contract}</td>
					
					
					
					
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<!-- 페이징 -->
	<div class="col-12" id="paging">
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
		<input type="submit" id="excelDown" value="Excel 다운" class="btn btn-primary">
	</form>

	<!-- Trigger/Open The Modal -->
<!-- 	<button id="myBtn">Open Modal</button> -->

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->

		<div class="modal-content">
			<span class="close">&times;</span>
			<div>
				<h3></h3>

				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">성공 횟수 / 총 펀딩 횟수</th>
							<th scope="col">평균 달성률</th>
							<th scope="col">평균 평가점수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<%-- <td>${successCount}회/${regipro}회</td>
							<td>${avgdal}%</td>
							<td>${avgRating}점</td> --%>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>
	
	</div>

</body>
</html>
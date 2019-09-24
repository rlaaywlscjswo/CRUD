<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀딩 현황 목록</title>
<link href="\resources\css/admin.css" rel="stylesheet">
<style>

#pdfhere {	
    display: inline-block;
    height: 650px;
    position: relative;
    width: 560px;
    margin: 0 auto;
}

/* #agree {
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
} */
</style>
<script>
	/* window.onload = function() {

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

	} */
</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	jQuery.noConflict();
	jQuery(document).ready(function($) {
		
		$('table a').on('click', function() {
			$('html, body').css({'overflow': 'hidden', 'height': '100%'}); 
			$('#element').on('scroll touchmove mousewheel', function(event) { 
				// 터치무브와 마우스휠 스크롤 방지
				    event.preventDefault();
				    event.stopPropagation();
				    return false;
				});
			
			$('#pdfhere').empty();
			var project_no = $(this).parents('tr').children('td:eq(0)').text();
			var no = $(this).parents('tr').children('td:eq(3)').text();			
			
			var html = '';
			html += project_no;
			
			
			$.ajax({
				url:"/getpdf",
				data:"project_no="+project_no,
				success:function(data){
					console.log(data);
					$('#pdfhere').append('<iframe src="http://localhost:8080'+data+'" style="width:559px; height: 600px;" frameborder="0"></iframe>'); // pdf 추가할 곳
				}				
			});		
			
			$('#myModal').css('display', 'block');	
			
			$('.modal-content button:eq(0)').on('click', function() { // 동의 버튼 클릭 시
		
				console.log(project_no);				
				$.ajax({					
					url: "agree",
					data: "project_no="+project_no+"&no="+no,
					success: function(data) {				
						console.log('성공쓰');
						console.log(project_no);
						 location.reload();		
						 $('html, body').css({'overflow': 'auto', 'height': '100%'}); 
						//scroll hidden 해제
						$('#element').off('scroll touchmove mousewheel');
					
					},
					error: function(data) {
						console.log('실패쓰');
						console.log(project_no);
					}
					 
				}); // end ajax
				
			}); // end 동의 버튼 클릭 시
			
			$('.modal-content button:eq(1)').on('click', function() {
				
				$.ajax({
					
					url: "disagree",
					data: "project_no="+project_no+"&no="+no,
					success: function(data) {
						console.log('성공쓰');
						console.log(project_no);
						 location.reload();									
						 $('html, body').css({'overflow': 'auto', 'height': '100%'}); 
							//scroll hidden 해제
							$('#element').off('scroll touchmove mousewheel');
					},
					error: function(data) {
						console.log('실패쓰');
						console.log(project_no);
					}
					
				}); // end ajax
				
			}); // end 거절 버튼 클릭 시
			
			$('.close').on('click', function() {
				$('#myModal').css('display', 'none');
				$('html, body').css({'overflow': 'auto', 'height': '100%'}); 
				//scroll hidden 해제
				$('#element').off('scroll touchmove mousewheel');
			}); // end 모달 창 닫기 버튼 클릭 시
			
/* 			$(document).on('click', function(event) {				
				if ($(event.target) == $('#myModal')) {
					$('#myModal').css('display', 'none');
				}
			}); // end 모달 창 제외한 곳 클릭 시 */
			
		}); // end 승인 대기 프로젝트 클릭 시
		
	}); // end ready
</script>
</head>
<body>
<div class="wrap">
	<!-- 검색 -->
	<div id="search">
		<!-- 검색 바 -->
		<form method="get" action="spro?currPage=${dto.firstPageOfBlock}">
			<label for="sproject_search" id="sproject_label"></label> <input
				class="form-control form-control-sm" type="text"
				id="bh_search" name="sproject_search"
				placeholder="  프로젝트 이름으로 검색해주세요 :)"> <input
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
							<c:when test="${ps == 0}"><a href="#">승인 대기</a><img
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
						<td>${spro.no}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- 펀딩 현황 목록 끝 -->

	<!-- 페이징 -->
	<div class="col-12" id="paging">
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
						<c:choose>
							<c:when test="${dto.currPage == index}">
								<li class="page-item"><a class="page-link"
							href="spro?currPage=${index}&sproject_search=${sproject_search}">
								<c:out value="${index}" />
						</a></li>
							</c:when>
							<c:otherwise>
							<li class="page-item"><a class="page-link"
							href="spro?currPage=${index}&sproject_search=${sproject_search}">
								<c:out value="${index}" />
						</a></li>
							</c:otherwise>
						</c:choose>
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
	<!-- <button id="myBtn">Open Modal</button> -->

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<div id="pdfhere"></div>			
			<div style="display: inline-block; margin: 0 auto;">
			<button class="btn btn-primary">승인</button>			
			<button class="btn btn-primary">거절</button>
			</div>
		</div>

	</div>

</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 센터</title>
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
	width: 30%; /* Could be more or less, depending on screen size */
}
/* The Close Button */
.close {
	color: #aaa;
	display: inline-block;
	float: right;
	font-size: 28px;
	font-weight: bold;
	left: 93%;
	position: relative;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

.wrap {
	margin: 0 auto;
	margin-top: 50px;
	width: 1500px;
}

#search {
	display: inline-block;
	left: 70%;
	margin-bottom: 10px;
	position: relative;
}

#cs_search {
	display: inline-block;
	width: 300px;
}

#paging {
	left: 42%;
}

#writeButton {
	left: 95%;
	position: relative;
	top: -20px;
}

h4 {
	margin-bottom: 15px;
	margin-top: 15px;
}

h5 {
	margin-bottom: 10px;
	margin-top: 10px;
}

textarea {
	display: inline-block;
	position: relative;
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
				modal.style.display = "none"; // 이미지, ppt, 스크립트 - 19일, 24일 리허설
			}
		}

	}; // end javaScript
</script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	jQuery.noConflict();
	jQuery(document).ready(
			function($) {

				$('.modal-content').children('form').find('input').css(
						'margin-bottom', '10px');

				$('button').on('click', function() {

					var no = $(this).children().last().text();
					
					$.ajax({
						
						url: '/cs',
						data: 'no=' + no,
						success: function(data) {
							console.log('성공쓰? (씨익) : ' + no);
						}, error: function(data) {
							alert('으어어 에러다!!!! : ' + no);
						}
						
					}); // end ajax

				}); // end on

			}); // end ready
</script>
</head>
<body>

	<div class="wrap">

		<!-- 검색 -->
		<div id="search">
			<!-- 검색 바 -->
			<form method="get" action="cs?currPage=${dto.firstPageOfBlock}">
				<label for="cs_search"></label> <input
					class="form-control form-control-sm" type="text" id="cs_search"
					name="cs_search" placeholder="  질문 제목으로 검색해주세요 :)"> <input
					type="submit" value="찾아줘!!" id="cs_find" class="btn btn-primary">
			</form>
		</div>
		<!-- 검색 끝 -->

		<section>
			<!-- 자주 하는 질문 -->
			<article>
				<ul>
					<li><h4>자주 하는 질문 목록</h4></li>
					<li><div class="accordion" id="accordionExample">
							<div class="card">
								<div class="card-header" id="headingOne">
									<h5>크라우드펀딩이란 무엇인가요?</h5>
								</div>

								<div id="collapseOne" class="c" aria-labelledby="headingOne"
									data-parent="#accordionExample">
									<div class="card-body">
										<p>
											크라우드펀딩(crowdfunding) 은 소셜 네트워크 서비스를 이용해 소규모 후원을 받거나 투자 등의
											목적으로 인터넷과 같은 플랫폼을 통해 다수의 개인들로부터 자금을 모으는 행위입니다. <br> 주로
											자선활동, 이벤트 개최, 상품 개발 등을 목적으로 자금을 모집합니다. <br> 투자 방식 및 목적에
											따라 지분 투자, 대출, 보상, 후원 등으로 분류할 수 있습니다.
										</p>
									</div>
								</div>
							</div>
						</div></li>
					<li><div class="accordion" id="accordionExample">
							<div class="card">
								<div class="card-header" id="headingOne">
									<h5>어떤 사람들이 이용하면 좋은가요?</h5>
								</div>

								<div id="collapseOne" class="c" aria-labelledby="headingOne"
									data-parent="#accordionExample">
									<div class="card-body">
										<p>아이디어는 있으나 금전적인 제약으로 상품화하기 힘든 분이나, 이미 상품화한 아이디어 상품이 있으나
											대기업의 등쌀에 밀려 마땅히 판매할 곳이 없으신 분들 모두 이용하면 좋은 사이트입니다!</p>
									</div>
								</div>
							</div>
						</div></li>
					<li><div class="accordion" id="accordionExample">
							<div class="card">
								<div class="card-header" id="headingOne">
									<h5>프로젝트 등록은 어떻게 하나요?</h5>
								</div>

								<div id="collapseOne" class="c" aria-labelledby="headingOne"
									data-parent="#accordionExample">
									<div class="card-body">
										<p>회원 가입 후 사이트 우측에 있는 '프로젝트 등록' 버튼을 누르시고 작성 순서에 맞게 등록해주시면
											됩니다.</p>
									</div>
								</div>
							</div>
						</div></li>
				</ul>
			</article>
		</section>
		<!-- end 자주 하는 질문 -->


		<ul>
			<li><h4>회원 Q&A</h4></li>
			<!-- forEach 돌리면 됨 -->
			<c:forEach var="csList" items="${csList}">
				<li>
					<div class="accordion" id="accordionExample">
						<div class="card">
							<div class="card-header" id="headingOne">
								<h2 class="mb-0">
									<button class="btn btn-link" type="button"
										data-toggle="collapse" data-target="#${csList.sn}"
										aria-expanded="true" aria-controls="collapseOne">

										<!-- 질문 - 제목 영역 -->


										<c:set value="${csList.ss}" var="ss" />

											<span style="background-color: #e9ecef;">제목</span> : 
											<span>${csList.st}</span>

											<span style="background-color: #e9ecef;">작성자</span> : 
											<span>${csList.name}</span>
											
											<span style="background-color: #e9ecef;">공개 여부</span> : 
											<c:if test="${ss == 0}">
												<span>공개</span>
											</c:if>
											<c:if test="${ss == 1}">
												<span>비공개</span>
											</c:if>
																						
											<span style="display: none;">회원 번호</span> 
											<span style="display: none;">${csList.no}</span>

											<%-- <span style="background-color: #e9ecef;">질문 번호</span>
											<span> ${csList.sn}</span> --%>

										<%-- <c:if test="${ss == 1}">비공개 처리 된 질문입니다.</c:if> --%>

									</button>
								</h2>
							</div>

							<div id="${csList.sn}" class="collapse"
								aria-labelledby="headingOne" data-parent="#accordionExample">
								<div class="card-body">
									<!-- 질문 - 내용 영역 -->
											<c:set value="${no}" var="loginNo" />
											<c:set value="${csList.no}" var="csNo" />	
											
													

									<c:choose>
										<c:when test="${ss == 1}">
											<c:if test="${loginNo == csNo}">
											<p>내용 : ${csList.sc}</p>

											<hr>

											<p>
												<!-- 답변 단락 -->
												<c:set var="reply" value="${csList.sr}" />
												<c:choose>
													<c:when test="${reply == null}">
										아직 작성 된 답변이 없습니다.
									</c:when>
													<c:otherwise>
										답변 : ${csList.sr}
									</c:otherwise>
												</c:choose>
											</p>
											</c:if>
											
											<c:if test="${loginNo != csNo}">
												비공개 처리 된 질문입니다.
											</c:if>											
										</c:when>
										<c:otherwise>
											<p>내용 : ${csList.sc}</p>

											<hr>

											<p>
												<!-- 답변 단락 -->
												<c:set var="reply" value="${csList.sr}" />
												<c:choose>
													<c:when test="${reply == null}">
										아직 작성 된 답변이 없습니다.
									</c:when>
													<c:otherwise>
										답변 : ${csList.sr}
									</c:otherwise>
												</c:choose>
											</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>

						</div>
					</div>
				</li>
			</c:forEach>
		</ul>

		<!-- end 회원 Q&A 목록 -->

		<!-- 페이징 -->
		<div class="col-12" id="paging">
			<div class="pagination-area d-sm-flex mt-15">
				<nav aria-label="#">
					<ul class="pagination">
						<li class="page-item"><c:if test="${dto.prev}">
								<a class="page-link"
									href="cs?currPage=${dto.firstPageOfBlock-1}&cs_search=${cs_search}">
									<c:out value="이전" />
								</a>
							</c:if></li>

						<c:forEach var="index" begin="${dto.firstPageOfBlock}"
							end="${dto.lastPageOfBlock}">
							<li class="page-item"><a class="page-link"
								href="cs?currPage=${index}&cs_search=${cs_search}"> <c:out
										value="${index}" />
							</a></li>
						</c:forEach>

						<li class="page-item"><c:if test="${dto.next}">
								<a class="page-link"
									href="cs?currPage=${dto.lastPageOfBlock+1}&cs_search=${cs_search}">
									<c:out value="다음" />
								</a>
							</c:if></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- 페이징 끝 -->

		<div>
			<!-- <a href="#"><span>질문 작성</span></a> -->

			<!-- Trigger/Open The Modal -->
			<button class="btn btn-primary" id="myBtn">질문 작성</button>

			<!-- The Modal -->
			<div id="myModal" class="modal">

				<!-- Modal content -->
				<div class="modal-content">
					<span class="close">&times;</span>


					<form action="wq" method="get">
						<select name="question_no" class="form-control form-control-sm">
							<option value="1">회원 관련</option>
							<option value="2">사업자 관련</option>
							<option value="3">프로젝트 관련</option>
							<option value="4">후원 관련</option>
							<option value="5">배송 관련</option>
							<option value="6">환불 관련</option>
						</select> <label for="service_title"></label> <input type="text"
							id="service_title" name="service_title" placeholder="제목을 입력해주세요."
							class="form-control form-control-sm"
							style="display: inline-block; width: 300px;"> <br>
						<label for="service_secret"></label> <input type="radio"
							id="service_secret" name="service_secret" value="0">공개 <input
							type="radio" id="service_secret" name="service_secret" value="1">비공개
						<br>
						<textarea rows="10" cols="40" name="service_contents"
							placeholder="내용을 입력해주세요."></textarea>
						<input type="submit" value="작성 완료" class="btn btn-primary">
					</form>

				</div>

			</div>

		</div>

	</div>
	<!-- end .wrap -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문희는 포도가 머꼬찌푼뎅</title>
<style>
.wrap {
	margin: 0 auto;
	margin-top: 50px;
	width: 1500px;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	jQuery.noConflict();
	jQuery(document).ready(
			function($) {

				$('.card-header').on(
						'click',
						function() {

							var service_no = $(this).find('span:eq(0)').text(); // service_no

							$('form').find('input:eq(1)').on(
									'click',
									function() { // 작성 완료 버튼 클릭 시
										var service_reply = $(this).prev()
												.val();

										$.ajax({
											url : 'aCS',
											data : 'service_no=' + service_no
													+ '&service_reply='
													+ service_reply,
											success : function(data) {
												location.reload();
											},
											error : function(data) {
												console.log('service_no : ' + service_no);
												console.log('service_reply : ' + service_reply);
												alert('실패임 ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ');
											}
										}); // end ajax

									}); // end on			

						}); // end on		

			}); // end ready
</script>
</head>
<body>

	<div class="wrap">

		<!-- 펀딩 회원 목록 -->
		<c:forEach var="adminCS" items="${adminCS}">
			<div class="accordion" id="accordionExample">
				<div class="card">
					<div class="card-header" id="headingOne">
						<h2 class="mb-0">
							<button class="btn btn-link" type="button" data-toggle="collapse"
								data-target="#${adminCS.service_no}" aria-expanded="true"
								aria-controls="collapseOne">
								<span>${adminCS.service_no}</span>
								<span>제목 : ${adminCS.service_title} / </span>
								<span>작성자 : ${adminCS.name} / </span>
								<span>
									<c:set var="qn" value="${adminCS.question_no}" />
									<c:choose>
										<c:when test="${qn == 1}">분류 : 회원 관련 </c:when>
										<c:when test="${qn == 2}">분류 : 사업자 관련 </c:when>
										<c:when test="${qn == 3}">분류 : 프로젝트 관련 </c:when>
										<c:when test="${qn == 4}">분류 : 후원 관련 </c:when>
										<c:when test="${qn == 5}">분류 : 배송 관련 </c:when>
										<c:when test="${qn == 6}">분류 : 환불 관련 </c:when>
										<c:otherwise>뭐지..</c:otherwise>
									</c:choose>
								</span> 
							</button>
						</h2>
					</div>

					<div id="${adminCS.service_no}" class="collapse"
						aria-labelledby="headingOne" data-parent="#accordionExample">
						<div class="card-body">
						
						<span>내용 : ${adminCS.service_contents}</span>
						
							<hr>

							<c:set value="${adminCS.service_reply}" var="sr" />
							<c:choose>
								<c:when test="${sr == null}">
									<form>
										<input type="text" style="width: 400px; height: 100px;">
										<input type="button" class="btn btn-primary" value="작성 완료">
									</form>
								</c:when>
								<c:otherwise>${adminCS.service_reply}</c:otherwise>
							</c:choose>
						</div>
					</div>
					<!-- 답변 작성 끝 -->
				</div>
			</div>
		</c:forEach>

	</div>

</body>
</html>
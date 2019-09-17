<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문희는 포도가 머꼬찌푼뎅</title>
<style>
	 .answer {
	 	border: 1px solid silver;
	 	display: inline-block;
	 	height: 40px;
	 	position: relative;
	 	width: 100%;
	 }
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	jQuery.noConflict();
	jQuery(document).ready(function($) {
		
		// $('.answer').hide();
		
		$('tbody tr').on('click', function() {
			
			// var service_no = $(this).find('td:eq(0)').text();
			// alert(service_no);
			$(this).siblings('p').css('background-color', 'crimson');
			
		}); // end on
		
	}); // end ready
</script>
</head>
<body>

	<!-- 펀딩 회원 목록 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">문의 번호</th>
				<th scope="col">문의 제목</th>
				<th scope="col">작성자</th>
				<th scope="col">분류</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="adminCS" items="${adminCS}">
				<tr>
					<td>${adminCS.service_no}</td>
					<td>${adminCS.service_title}</td>
					<td>${adminCS.name}</td>
					<td>
					<c:set var="qn" value="${adminCS.question_no}" />
					<c:choose>
						<c:when test="${qn == 1}">회원 관련</c:when>
						<c:when test="${qn == 2}">사업자 관련</c:when>
						<c:when test="${qn == 3}">프로젝트 관련</c:when>
						<c:when test="${qn == 4}">후원 관련</c:when>
						<c:when test="${qn == 5}">배송 관련</c:when>
						<c:when test="${qn == 6}">환불 관련</c:when>
						<c:otherwise>뭐지..</c:otherwise>
					</c:choose>					
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div class="answer"></div>

</body>
</html>
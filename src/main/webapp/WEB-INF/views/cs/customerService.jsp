<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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
        .close:hover,
        .close:focus {
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
        modal.style.display = "none";	이미지, ppt, 스크립트 - 19일, 24일 리허설
    }
}

} // end javaScript

jQuery.noConflict();
jQuery(document).ready(function($) {
	
	$('#deleteQuestion').on('click', function(service_no) {
		
		alert('아 왜!!');
		$(location).attr('href' ,'dq');
		
	}); // end on
	
}); // end ready

</script>
</head>
<body>

	<div class="cs_wrap">
	
		<div>
			검색 들어갈 자리
		</div>
		
		<hr>
		
		<section> <!-- 자주 하는 질문 -->
			<article>
				<ul>
					<li><h4>자주 하는 질문 목록</h4></li>
					<li>
						<h5>자주하는 질문 1</h5>
						<p>답변</p>
					</li>
					<li>
						<h5>자주하는 질문 2</h5>
						<p>답변</p>
					</li>
					<li>
						<h5>자주하는 질문 1</h5>
						<p>답변</p>
					</li>
				</ul>
			</article>
		</section> <!-- end 자주 하는 질문 -->
		
		<hr>
		
		<section> <!-- 회원 Q&A 목록 -->
			<article>
				<ul>
					<li><h4>회원 Q&A</h4></li>
					<!-- forEach 돌리면 됨 -->
					<c:forEach var="csList" items="${csList}">
						<li>
							<div> <!-- 질문 영역 -->
								<div> <!-- 질문 - 제목 영역 -->
									<span>제목 : ${csList.st}</span>
									<span>질문자 : ${csList.name}</span>
									<span>공개 여부 : ${csList.ss}</span>
									<span>질문 번호 : ${csList.sn}</span>
								</div>
								<div> <!-- 질문 - 내용 영역 -->
									<p> 내용 : ${csList.sc} <p> 
									<span>수정</span>
									<span id="deleteQuestion">삭제</span>
								</div>
							</div>
							<p> <!-- 답변 단락 -->
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
						</li>
					</c:forEach>						
				</ul>
			</article>
		</section> <!-- end 회원 Q&A 목록 -->
		
		<hr>
		
		<div> <!-- 수정 양식 -->
			<form action="wq" method="get">
        		<select name="question_no">
            		<option value="1">회원 관련</option>
           			<option value="2">사업자 관련</option>
         		    <option value="3">프로젝트 관련</option>
            		<option value="4">후원 관련</option>
          		    <option value="5">배송 관련</option>
         		    <option value="6">환불 관련</option>
       			</select>
        		<label for="service_title"></label>
        		<input type="text" id="service_title" name="service_title" placeholder="제목을 입력해주세요.">
        		<label for="service_secret"></label>
        		<input type="radio" id="service_secret" name="service_secret" value="0">공개
        		<input type="radio" id="service_secret" name="service_secret" value="1">비공개
        		<textarea rows="10" cols="40" name="service_contents" placeholder="내용을 입력해주세요."></textarea>
        		<input type="submit" value="수정 완료">
        	</form>
		</div> <!-- end 수정 양식 -->
		
		<hr>
		
		<div>
			페이징 들어갈 자리
		</div>
		
		<hr>
		
		<div>
			<!-- <a href="#"><span>질문 작성</span></a> -->
			
					    <!-- Trigger/Open The Modal -->
    <button id="myBtn">질문 작성</button>
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">      
        <span class="close">&times;</span>   
        
                                                                    
        <form action="wq" method="get">
        <select name="question_no">
            <option value="1">회원 관련</option>
            <option value="2">사업자 관련</option>
            <option value="3">프로젝트 관련</option>
            <option value="4">후원 관련</option>
            <option value="5">배송 관련</option>
            <option value="6">환불 관련</option>
        </select>
        	<label for="service_title"></label>
        	<input type="text" id="service_title" name="service_title" placeholder="제목을 입력해주세요.">
        	<label for="service_secret"></label>
        	<input type="radio" id="service_secret" name="service_secret" value="0">공개
        	<input type="radio" id="service_secret" name="service_secret" value="1">비공개
        	<textarea rows="10" cols="40" name="service_contents" placeholder="내용을 입력해주세요."></textarea>
        	<input type="submit" value="작성 완료">
        </form>
        
      </div>
 
    </div>
			
		</div>
		
	</div> <!-- end .cs_wrap -->

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        modal.style.display = "none";
    }
}

}
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
		
		<section> <!-- 회원 Q&A -->
			<article>
				<ul>
					<li><h4>회원 Q&A</h4></li>
					<!-- forEach 돌리면 됨 -->
					<li>
						<p>질문</p>
						<p>답변</p>
					</li>						
				</ul>
			</article>
		</section> <!-- end 회원 Q&A -->
		
		<hr>
		
		<div>
			페이징 들어갈 자리
		</div>
		
		<hr>
		
		<div>
			<a href="#"><span>질문 작성</span></a>
		</div>
		
		<hr>
		

			
					    <!-- Trigger/Open The Modal -->
    <button id="myBtn">질문 작성</button>
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">      
        <span class="close">&times;</span>   
        
                                                                    
        <form action="wq" method="get">
        <select name="question_type">
            <option value="member">회원 관련</option>
            <option value="business">사업자 관련</option>
            <option value="project">프로젝트 관련</option>
            <option value="support">후원 관련</option>
            <option value="delivery">배송 관련</option>
            <option value="refund">환불 관련</option>
        </select>
        	<label for="service_title"></label>
        	<input type="text" id="service_title" name="service_title" placeholder="제목을 입력해주세요.">
        	<label for="service_secret"></label>
        	<input type="radio" id="service_secret" name="service_secret" value="public">동의
        	<input type="radio" id="service_secret" name="service_secret" value="private">비동의
        	<textarea rows="10" cols="40" name="service_contents" placeholder="내용을 입력해주세요."></textarea>
        	<input type="submit" value="작성 완료">
        </form>
        
      </div>
 
    </div>
			

		
	</div> <!-- end .cs_wrap -->

</body>
</html>
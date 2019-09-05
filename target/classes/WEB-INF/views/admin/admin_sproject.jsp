<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지 - 펀딩 현황 목록</title>
<style>
* {
	margin: 0;
	padding: 0;
}

table, th, td {
	border: 1px solid silver;
	border-collapse: collapse;
}

th {
	text-align: center;
}

td {
	text-align: center;
}

#here {
	text-align: right;
}

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

		<div id="sproject_searching">
			<form method="get" action="spro?currPage=${dto.firstPageOfBlock}">
				<label for="sproject_search" id="sproject_label"></label>
				<input type="text" id="sproject_search" name="sproject_search" placeholder="  프로젝트 이름으로 검색해주세요 :)">
				<input type="submit" value="찾아줘!!" id="sproject_find">
			</form>
		</div>

	<table>
		<thead>
			<tr>
				<th>프로젝트 번호</th>
				<th>프로젝트 이름</th>
				<th>현황</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="spro" items="${admin_sproject}">
				<tr>
					<td>${spro.project_no}</td>
					<td>${spro.project_title}</td>
					<td id="here">
					<c:set var="ps" value="${spro.project_status}" />
					<c:choose>
						<c:when test="${ps == 0}">승인 대기<img src="/resources/img/thinking.png" alt="승인 대기" width="20px" height="20px"></c:when>
						<c:when test="${ps == 1}">진행 중<img src="/resources/img/ing.png" alt="진행 중 " width="20px" height="20px"></c:when>
						<c:when test="${ps == 2}">거절 된 프로젝트<img src="/resources/img/fail.png" alt="거절 된 프로젝트 " width="20px" height="20px"></c:when>
						<c:when test="${ps == 3}">지난 프로젝트<img src="/resources/img/end.png" alt="지난 프로젝트 " width="20px" height="20px"></c:when>
					</c:choose>
					
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div id="sproject_paging">
		
			<c:if test="${dto.prev}">
				<a href="spro?currPage=${dto.firstPageOfBlock-1}&sproject_search=${sproject_search}">
				<c:out value="이전" /></a>
			</c:if>

			<c:forEach var="index" begin="${dto.firstPageOfBlock}" end="${dto.lastPageOfBlock}">
				<a href="spro?currPage=${index}&sproject_search=${sproject_search}">
				<c:out value="${index}" /></a>
			</c:forEach>

			<c:if test="${dto.next}">
				<a href="spro?currPage=${dto.lastPageOfBlock+1}&sproject_search=${sproject_search}">
				<c:out value="다음" /></a>
			</c:if>
			
		</div> <!-- end #sproject_paging -->
		
		<form name="excelForm" id="excelForm" method="post" action="./sprojectExcelDown.do">
			<input type="submit" id="excelDown" value="Excel 다운">
		</form>
		
		
		
		
		    <!-- Trigger/Open The Modal -->
    <button id="myBtn">Open Modal</button>
 
    <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
        <span class="close">&times;</span>                                                               
        <div id="pdfhere"></div>
       <a href="#"><span id="agree">승인</span></a>
        <a href="#"><span id="agree">비승인</span></a>
      </div>
 
    </div>
		

</body>
</html>
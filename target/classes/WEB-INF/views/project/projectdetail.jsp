<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
body{
/* background-image: url("/resources/img/cloud.jpg"); */
 background-image: linear-gradient(to top, #ffe6e6,#e5ccff, #cce6ff,#ccdcff);
}

#main{
width: 80%;
margin: 0 auto;
/* background-image: linear-gradient(to top, #ffe6e6,#e5ccff, #cce6ff); */
background-color: rgba(255,255,255,0.5);

}

#first{
width:1231px;
height: 750.33px;
margin: 0 auto;
}
#title{
height: 50px;
width: 1231px;
font-size:40px;
margin: 0 auto;
text-align: center;
}
#photo{
width: 650px;
height: 487.5px;
overflow: hidden;
background-color: #fff;
background-clip: border-box;
border: 1px solid rgba(0, 0, 0, 0.125);
border-radius: 10px;
box-shadow: 6px 11px 41px -28px #a99de7;
}

#project_photo_path{
width: 100%;
height: 100%;
}

#side{
width: 360px;
height: 495.33px;
float: right;
position: relative;
bottom: 500px;
right: 10px;
}
#paybtn{ 
 position: relative;
 top:150px;
}
#second{
width: 1231px;
height: 22517.33px;
margin: 0 auto;
}
#content{
border: 1px solid;
width: 690px;
height: 22121px;
background-color: white;
}

#right{
	width: 500px;
    height: 500px;
    float: right;
    position: relative;
    bottom: 22480px;
    right: 85px;
}
#img{
    width: 100px;
    height: 100px;
    border-radius: 100px;
    position: relative;
    left: 200px;
    bottom: 75px;
}
#writer{
width: 360px;
height: 390px;
margin: 0 auto;
}

#option{
width: 360px;
height: 312px;
margin: 0 auto;
margin-top: 20px;
}

.pdfobject-container {
    width: 100%;
    max-width: 600px;
    height: 600px;
    margin: 2em 0;
}
 
.pdfobject { border: solid 1px #666; }
#results { padding: 1rem; }
.hidden { display: none; }
.success { color: #4F8A10; background-color: #DFF2BF; }
.fail { color: #D8000C; background-color: #FFBABA; }


</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">	
	$(function () {		
		commentList();		
	
		$('[name=replyinsertbtn]').click(function(){ //댓글 등록 버튼 클릭시 
		    var insertData = $('[name=replyinsertform]').serialize(); //commentInsertForm의 내용을 가져옴
		    console.log(insertData);
		    commentInsert(insertData); //Insert 함수호출(아래)
		});
		
		//댓글 목록 
		function commentList(){
			var project_no = ${list.project_no}; // 프로젝트 번호
			console.log(project_no);
		    $.ajax({
		        url : '/replylist',
		        type : 'post',
		        data : {"project_no" : project_no},     
		        success: function(result) {	   
		        	var htmls = "";
		        	if(result.length < 1){		        		 
		        		 htmls += '<p>' +"등록된댓글 ㄴㄴ" + '</p>';				  
					} else {
			                    $(result).each(function(){
			                     htmls += '<p>' + this.name + '</p>';				                     
								 htmls += '<p>' + this.reply_contents + '</p>';
								 htmls += '<p>' + this.rating + '</p>';
								 });	//each end
					}
					$(".replylist").html(htmls);			        		        	
		        }
		    });
		}		
		//댓글 등록
		function commentInsert(insertData){
		    $.ajax({
		        url : '/replyinsert',
		        type : 'post',
		        data : insertData,
		        success : function(data){
		            if(data == 1) {
		                commentList(); //댓글 작성 후 댓글 목록 reload
		                $('[name=reply_contents]').val('');
		            }
		        }
		    });			
		}
		
	});

</script>

</head>
<body>
<div id="first">
<div id="title">${list.project_title }</div>
<div id="views">조회수${list.project_views }</div>
<div id="category">카테고리번호${list.category_no }</div>
<div id="photo">
<img id="project_photo_path" alt="프로젝트대표사진" src="${list.project_photo }">
</div>
<aside id="side">
<div class="card" style="width: 360px; height: 495.33px;">
  <div class="card-body">   
    <p class="card-text">
    <p>모인금액</p>
<p>종료일:${list.enddate }</p>
<p>후원자</p>
<div id="taget">펀딩진행중<br>목표금액인${list.targetprice }이 모여야만 결제됩니다.</div>
<div id="paybtn">
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  후원하기
</button>
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <c:forEach var="opt" items="${option }">
	<form action="pay" method="post">
		<div id="option">
		<div class="card" style="width: 360px;height: 312px;">
 	    <div class="card-body">
    	<h5 class="card-title">후원 옵션</h5>
    	<h6 class="card-subtitle mb-2 text-muted">서브없음</h6>
    	<p class="card-text">
    	<c:out value="${opt.option_no }"/><br>
		<c:out value="${opt.option_name}"/><br>
		<c:out value="${opt.option_price }"/><br>
		<c:out value="${opt.option_contents }"/><br>
		<c:out value="${opt.option_quantity }"/><br>
		<c:out value="${opt.project_no }"/><br>
		
		<input type="hidden" name="option_no" value="${opt.option_no }">
		<input type="hidden" name="option_name" value="${opt.option_name }">
		<input type="hidden" name="option_price" value="${opt.option_price }">
		<input type="hidden" name="option_contents" value="${opt.option_contents }">
		<input type="hidden" name="option_quantity" value="${opt.option_quantity }">
		<input type="hidden" name="alias" value="${list.alias}">   	    
    	                                   
    	</p>
   		<button class="btn btn-sm btn-outline-secondary">후원하기</button>
  		</div>
		</div>		
		</div>
	</form>
</c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>
</div>
</p>    
</div>
</div>
</aside>
</div>




<div id="second">
<!-- tab!!!  -->
<ul class="nav nav-tabs">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#qwe">프로젝트 상세 설명</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#asd">평점 및 댓글</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#zxc">환불</a>
  </li>
</ul>
<div class="tab-content">
  <div class="tab-pane fade show active" id="qwe">
  <div id="content">
<div id="pdf">
<div id="my-pdf" class=" pdfobject-container">
<embed class="pdfobject" src="https://pipwerks.com/pdfobject/file.php?item=sample-3pp#view=FitV&amp;pagemode=thumbs&amp;search=lorem%20ipsum&amp;page=2" type="application/pdf" style="overflow: auto; width: 100%; height: 100%;" internalinstanceid="79">
</div>
</div>
</div>
  
  </div>
  <div class="tab-pane fade" id="asd">
  
	<sec:authorize access="isAuthenticated()">  
 	<form method="post" name="replyinsertform">
 	<input type="hidden" id="project_no" name="project_no" value="${list.project_no }"> 	
 	<input type="text" id="reply_contents" name="reply_contents">
 	<button type="button" name="replyinsertbtn">댓글등록</button>
 	</form>
 	</sec:authorize>	
 	
 	
 	<div class="replylist">
 	</div>	
 		
 		
  </div>
  <div class="tab-pane fade" id="zxc">
   이 프로젝트의 환불 및 교환 정책
• 모든 프로젝트 공통
- 프로젝트 마감일 후에는 즉시 제작 및 실행에 착수하는 프로젝트 특성상 단순 변심에 의한 후원금 환불이 불가능합니다.
- 예상 전달일로부터 30일 이상 선물 전달이 이뤄지지 않을 경우, 환불을 원하시는 분들께는 수수료를 제한 후원금을 환불해 드립니다.
(플랫폼 수수료: 모금액의 5%, 부가세 별도 / 결제 수수료: 결제 성공액의 3%, 부가세 별도 )
- 선물 전달을 위한 배송지 및 서베이 답변은 2019. 09. 22 에 일괄 취합할 예정입니다.
- 이후 배송지 변경이나 서베이 답변 변경을 원하실 때에는 '창작자에게 문의하기'로 개별 문의하셔야 합니다.
• 배송이 필요한 선물이 있는 경우
- 파손 또는 불량품 수령 시 3일 이내로 교환이 가능합니다.
- 교환 및 AS 문의는 '창작자에게 문의하기'로 신청해 주세요.
- 파손이나 불량품 교환시 발생하는 비용은 창작자가 부담합니다. 선물 확인을 위한 포장 훼손 외에 아이템의 가치가 훼손된 경우에는 교환 및 환불이 불가합니다.
    </div>
</div>
</div>




<div id="right">
<div id="writer">
<div class="card" style="width: 360px; height: 390px;">
  <div class="card-body">
    <h5 class="card-title">창작자 소개</h5>
    <h6 class="card-subtitle mb-2 text-muted"> <div id="alias">창작자 : ${list.alias}</div> </h6>
    <p class="card-text"><div><img id="img" alt="창작자 프로필 사진" src="${list.img}"></div>
    <div id="introduce">소개글 : ${list.introduce }</div></p>
   <button class="btn btn-sm btn-outline-secondary">쪽지로 문의하기</button> 
  </div>
</div>
</div>

<c:forEach var="opt" items="${option }">
		<form action="/pay" method="post">	
		<div id="option">
		<div class="card" style="width: 360px;height: 312px;">
 	    <div class="card-body">
    	<h5 class="card-title">후원 옵션</h5>
    	<h6 class="card-subtitle mb-2 text-muted">서브없음</h6>
    	<p class="card-text">
    	<c:out value="${opt.option_no }"/><br>
		<c:out value="${opt.option_name}"/><br>
		<c:out value="${opt.option_price }"/><br>
		<c:out value="${opt.option_contents }"/><br>
		<c:out value="${opt.option_quantity }"/><br>
		<c:out value="${opt.project_no }"/><br>
     
		<input type="hidden" name="option_no" value="${opt.option_no }">
		<input type="hidden" name="option_name" value="${opt.option_name }">
		<input type="hidden" name="option_price" value="${opt.option_price }">
		<input type="hidden" name="option_contents" value="${opt.option_contents }">
		<input type="hidden" name="option_quantity" value="${opt.option_quantity }">
		<input type="hidden" name="alias" value="${list.alias}">   	    
    	                                   
    	</p>
   		<button class="btn btn-sm btn-outline-secondary">구매하기</button>
  		</div>
		</div>		
		</div>
	</form>
</c:forEach>
</div>

</body>
</html>
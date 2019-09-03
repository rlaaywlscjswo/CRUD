<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
bottom: 22120px;
left: 60px;
}
#img{
width: 150px;
height: 150px;
border-radius: 100px;
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

<div id="content">
<div id="results" class="hidden"></div>
<div id="pdf">
<div id="my-pdf" class=" pdfobject-container">
<embed class="pdfobject" src="https://pipwerks.com/pdfobject/file.php?item=sample-3pp#view=FitV&amp;pagemode=thumbs&amp;search=lorem%20ipsum&amp;page=2" type="application/pdf" style="overflow: auto; width: 100%; height: 100%;" internalinstanceid="79">
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
   		<button class="btn btn-sm btn-outline-secondary">구매하기</button>
  		</div>
		</div>		
		</div>
	</form>
</c:forEach>
</div>
</div>
</body>
</html>
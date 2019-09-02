<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
#main{
background-image: linear-gradient(to top, #fbc2eb 0%, #a6c1ee 100%);
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
border: 1px solid;
width: 650px;
height: 487.5px;
overflow: hidden;
}

#project_photo_path{
width: 650px;
height: 487.5px;
}

#side{
border:1px solid;
width: 360px;
height: 495.33px;
float: right;
position: relative;
bottom: 500px;
right: 10px;
background-color: white;
}
#paybtn{
 border: 1px solid; 
 width: 100%; 
 height: 50px;
 text-align: center;
 position: relative;
 top:290px;
}
#paybtn a{
text-decoration: none;
font-size: 37px;
 width: 100%; 
 height: 50px;
 text-align: center;
}
#paybtn:hover{
background-color: blue;
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
border:1px solid;
width: 360px;
height: 390px;
margin: 0 auto;
background-color: white;
}

#option{
border:1px solid;
width: 360px;
height: 312px;
margin: 0 auto;
margin-top: 20px;
background-color: white;
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
<div id="photo"><img id="project_photo_path" alt="프로젝트대표사진" src="${list.project_photo }"></div>
<aside id="side">
<p>모인금액</p>
<p>종료일:${list.enddate }</p>
<p>후원자</p>
<div id="taget">펀딩진행중<br>목표금액인${list.targetprice }이 모여야만 결제됩니다.</div>
<div id="paybtn">
<a href="projectoption/${list.project_no }">후원하기</a>
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
<div id="alias">창작자 : ${list.alias}</div>
<div><img id="img" alt="창작자 프로필 사진" src="${list.img}"></div>
<div id="introduce">소개글 : ${list.introduce }</div>
</div>

<c:forEach var="opt" items="${option }">
	<form action="pay" method="post">
		<div id="option">
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
		<button>구매하기</button>
		</div>
	</form>
</c:forEach>
</div>
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
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
}
#side{
border:1px solid;
width: 360px;
height: 495.33px;
float: right;
position: relative;
bottom: 500px;
right: 10px;
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
}

#right{
width: 500px;
height: 500px;
float: right;
position: relative;
bottom: 22120px;
left: 60px;
}
#writer{
border:1px solid;
width: 360px;
height: 390px;
margin: 0 auto;
}

#option{
border:1px solid;
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
<script src="/resources/js/pdfobject.min.js"></script>
<script type="text/javascript">
var options = {
    pdfOpenParams: {
        navpanes: 0,
        toolbar: 0,
        statusbar: 0,
        view: "FitV",
        pagemode: "thumbs",
        page: 2
    },
    forcePDFJS: true,
  	/*  PDFJS_URL: "/resources/pdfjs/web/viewer.html"  */
};
 
var myPDF = PDFObject.embed("/resources/pdf/summer.pdf", "#pdf", options);
 
var el = document.querySelector("#results");
el.setAttribute("class", (myPDF) ? "success" : "fail");
el.innerHTML = (myPDF) ? "PDFObject was successful!" : "Uh-oh, the embed didn't work.";
</script>




</head>
<body>
<div id="first">
<div id="title">${list.project_title }</div>
<div id="views">조회수${list.project_views }</div>
<div id="category">카테고리번호${list.category_no }</div>
<div id="photo">${list.project_photo }</div>

<aside id="side">
<p>모인금액</p>
<p>종료일:${list.enddate }</p>
<p>후원자</p>
<div id="taget">펀딩진행중<br>목표금액인${list.targetprice }이 모여야만 결제됩니다.</div>
<div id="paybtn">
<a href="projectoption=${list.project_no }">후원하기</a>
</div>
</aside>
</div>






<div id="second">
<div id="content">
<div id="results" class="hidden"></div>
<div id="pdf"></div>
<%-- ${list.project_contents } --%>
</div>


<div id="right">
<div id="writer">
<div id="alias">창작자 : ${list.alias}</div>
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
		<!-- 로그인 완성되면 수정해야하는 부분 -->
		<input type="hidden" name="no" value="4">
		
		
		
		<button>구매하기</button>
		</div>
	</form>
</c:forEach>
</div>
</div>
</body>
</html>
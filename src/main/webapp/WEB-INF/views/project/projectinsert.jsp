<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<style>
#container {  
	width: 960px;
	margin: 0 auto;
	text-align: center;
}
.tab {
	list-style: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
}
#tabcontent {
	display: block;
	border: 1px solid;
    color: black;
	padding: 6px 12px;
    height: 500px;
	
}
a{
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
	transition: 0.3s;
}
a:visited { 
	color: black; 
	text-decoration: none;
	
	}


li {
	float: left;
	display: inline-block;
	color: #000;
	text-align: center;
	text-decoration: none;
	padding: 14px 16px;
	font-size: 17px;
}
}
</style>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#1').click(function() {
		 $("#tabcontent").load("project_insert");		
		$('li').css('background-color', 'white');
		$(this).css('background-color', 'green');		 
	});
	
	$('#2').click(function() {
		 $("#tabcontent").load("project_insert2 #2");		
		$('li').css('background-color', 'white');
		$(this).css('background-color', 'green');			 
	});
	
	$('#3').click(function() {
		 $("#tabcontent").load("project_insert2 #3");		
		$('li').css('background-color', 'white');
		$(this).css('background-color', 'green');			 
	});
	
	$('#4').click(function() {
		 $("#tabcontent").load("project_insert2 #4");		
		$('li').css('background-color', 'white');
		$(this).css('background-color', 'green');			 
	});
	
	$('#5').click(function() {
		 $("#tabcontent").load("project_insert2 #5");		
		$('li').css('background-color', 'white');
		$(this).css('background-color', 'green');			 
	});

 

});

</script>
</head>
<body>
<div id="container">
		<ul class="tab">
			<li id="1" class='tabmenu' ><a href="#">(1)기본 정보</a></li>
			<li id="2" class='tabmenu'><a href="#">(2)사업자 정보</a></li>
			<li id="3" class='tabmenu'><a href="#">(3)창작자 정보</a></li>
			<li id="4" class='tabmenu'><a href="#">(4)프로젝트 설명</a></li>
			<li id="5" class='tabmenu'><a href="#">(5)옵션 설정</a></li>
		</ul>
		<div id="tabcontent"></div>
	</div>

<script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 400
      });
    </script>

</body>
</html>
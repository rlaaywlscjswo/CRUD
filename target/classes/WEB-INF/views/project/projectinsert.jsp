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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#1').click(function() {
		 $("#tabcontent").load("project_insert");		
		$('li').css('background-color', 'white');
		$(this).css('background-color', 'green');		
		 
	});

 

});

</script>
</head>
<body>
<div id="container">
		<ul class="tab">
			<li id="1" class='tabmenu' ><a href="#">TabExample1</a></li>
			<li class='tabmenu'><a href="#">TabExample2</a></li>
			<li class='tabmenu'><a href="#">TabExample3</a></li>
		</ul>
		<div id="tabcontent"></div>
	</div>


</body>
</html>
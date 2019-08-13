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
	$('.tabmenu').click(function() {
		var activeTab = $(this).attr('data-tab');
		console.log(activeTab);
		
		$('li').css('background-color', 'white');
		$(this).css('background-color', 'green');
		$(#tabcontent).load("project/project_insert");
		/* $.ajax({		              
			data :activeTab,   		
			success : function(data) {    //통신 성공시 탭 내용담는 div를 읽어들인 값으로 채운다.
				console.log("data"+data);
				$('#tabcontent').load(data);
			}
		}); */
	});
	/* $('#default').click(); */
 

});
/*   $("#div1").load("project/project_insert");	 */
</script>
</head>
<body>
<div id="container">
		<ul class="tab">
			<li data-tab="project/project_insert" class='tabmenu' id="default"><a href="#">TabExample1</a></li>
			<li data-tab="tab2" class='tabmenu'><a href="#">TabExample2</a></li>
			<li data-tab="tab3" class='tabmenu'><a href="#">TabExample3</a></li>
		</ul>
		<div id="tabcontent"></div>
	</div>


</body>
</html>
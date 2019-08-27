<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<style>
* {
	margin: 0;
	padding: 0;
}

#tab_1, #tab_2, #tab_3, #tab_4 {
	border: 1px solid silver;
	border-radius: 10px;
	display: inline-block;
	height: 30px;
	left: 100px;
	position: absolute;
	text-align: center;
	top: 500px;
	width: 200px;
}

#tab_1 {
	top: 32px;
}

#tab_2 {
	top: 64px;
}

#tab_3 {
	top: 96px;
}

#tab_4 {
	top: 128px;
}

#content_1, #content_2, #content_3, #content_4 {
	border: 1px solid crimson;
	border-radius: 10px;
	display: inline-block;
	height: 600px;
	left: 300px;
	position: absolute;
	width: 1000px;
}

#content_1 {
	top: 32px;
}

#content_2 {
	top: 64px;
}

#content_3 {
	top: 96px;
}

#content_4 {
	top: 128px;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- <script>
	$(document).ready(function() {
		$('#tab_1').on('click', function() {
			$('#content_1').load("/support");
		});
	});
</script> -->

<script>
	$(document).ready(
			function() {
				$.urlParam = function(name) {

					var results = new RegExp('[\?&]' + name + '=([^&#]*)')
							.exec(window.location.href);
					if (results == null) {
						return null;
					} else {
						return results[1] || 0;
					}
				}

				/* $("#result").load("review.do");
				console.log('hi'); */

				let id = $.urlParam('id');
				console.log(id);
				$.ajax({
					url : "/support",
					data : "id=" + id,
					dataType : "html",
					success : function(data) {
						$('#content_1').append(data);
					},
					error : function(data) {
						console.log('error');
					}
				});
			});
	</script>
	
 <script>
	window.onload = function() {
		
		document.getElementById('content_1').style.display = "block";
		document.getElementById('content_2').style.display = "none";
		document.getElementById('content_3').style.display = "none";
		document.getElementById('content_4').style.display = "none";
		
		function showContent_1() {
			document.getElementById('content_1').style.display = 'block';
			document.getElementById('content_2').style.display = "none";
			document.getElementById('content_3').style.display = "none";
			document.getElementById('content_4').style.display = "none";
		}
		
		function showContent_2() {
			document.getElementById('content_1').style.display = 'none';
			document.getElementById('content_2').style.display = "block";
			document.getElementById('content_3').style.display = "none";
			document.getElementById('content_4').style.display = "none";
		}
		
		function showContent_3() {
			document.getElementById('content_1').style.display = 'none';
			document.getElementById('content_2').style.display = "none";
			document.getElementById('content_3').style.display = "block";
			document.getElementById('content_4').style.display = "none";
		}
		
		function showContent_4() {
			document.getElementById('content_1').style.display = 'none';
			document.getElementById('content_2').style.display = "none";
			document.getElementById('content_3').style.display = "none";
			document.getElementById('content_4').style.display = "block";
		}
		
		document.getElementById('tab_1').addEventListener('click', showContent_1);
		document.getElementById('tab_2').addEventListener('click', showContent_2);
		document.getElementById('tab_3').addEventListener('click', showContent_3);
		document.getElementById('tab_4').addEventListener('click', showContent_4);
		
	}
</script>
</head>
<body>

	<div class="wrap">

		<div id="tab_1">내 후원 내역</div>		
		<div id="content_1"></div>
		
		<div id="tab_2">2번 탭</div>
		<div id="content_2">2번 내용</div>
		
		<div id="tab_3">3번 탭</div>
		<div id="content_3">3번 내용</div>
		
		<div id="tab_4">4번 탭</div>
		<div id="content_4">4번 내용</div>

	</div>

</body>
</html>
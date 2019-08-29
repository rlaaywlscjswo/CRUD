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

h4 {
	background-color: dodgerblue;
	border: 1px solid dodgerblue;
	border-radius: 10px;
	color: #fff;
	display: inline-block;
	height: 40px;
	padding: 5px;
	position: relative;
	text-align: center;
	width: 200px;
}

#my_first, #my_second, #my_third {
	border: 1px solid chartreuse;
	display: inline-block;
	height: 700px;
	margin-left: 40px; margin-top : 40px;
	position: relative;
	width: 1300px;
	margin-top: 40px;
}

#tab_1, #tab_2, #tab_3 {
	margin: 20px;
	position: absolute;
}

#content_1, #content_2, #content_3 {
	display: inline-block;
	height: 600px;
	left: 18%; position : relative;
	width: 1000px;
	position: relative;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document)
			.ready(
					function() {

						document.getElementById('content_1').style.display = "block";
						document.getElementById('content_2').style.display = "none";
						document.getElementById('content_3').style.display = "none";

						showContent_1();

						document.getElementById('tab_1').addEventListener(
								'click', showContent_1);
						document.getElementById('tab_2').addEventListener(
								'click', showContent_2);
						document.getElementById('tab_3').addEventListener(
								'click', showContent_3);

						function showContent_1() {
							document.getElementById('content_1').style.display = 'block';
							document.getElementById('content_2').style.display = "none";
							document.getElementById('content_3').style.display = "none";
							$('#content_1').empty();
							list("info", "content_1");
						}

						function showContent_2() {
							document.getElementById('content_1').style.display = 'none';
							document.getElementById('content_2').style.display = "block";
							document.getElementById('content_3').style.display = "none";
							$('#content_2').empty();
							list("mypro", "content_2");
						}

						function showContent_3() {
							document.getElementById('content_1').style.display = 'none';
							document.getElementById('content_2').style.display = "none";
							document.getElementById('content_3').style.display = "block";
							$('#content_3').empty();
							list("support", "content_3");
						}

						function list(url, content) {
							$.ajax({
								url : url,
								dataType : "html",
								success : function(data) {
									$('#' + content).append(data);
								},
								error : function(data) {
									console.log('error');
								}
							}); /* end ajax */
						} /* end function list */
					}); /* end ready */
</script>
</head>
<body>

	<div class="wrap">

		<div id="my_first">
			<h4 id="tab_1">내 프로필</h4>
			<div id="content_1"></div>
		</div>

		<div id="my_second">
			<h4 id="tab_2">내가 만든 프로젝트</h4>
			<div id="content_2"></div>
		</div>

		<div id="my_third">
			<h4 id="tab_3">내 후원 내역</h4>
			<div id="content_3"></div>
		</div>

	</div>

</body>
</html>
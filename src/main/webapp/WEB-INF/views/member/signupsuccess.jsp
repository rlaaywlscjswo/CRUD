<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
@import url('https://fonts.googleapis.com/css?family=Nunito');

@import url('https://fonts.googleapis.com/css?family=Poiret+One');

body, html {
	height: 100%;
	background-repeat: no-repeat;
	/*background-image: linear-gradient(rgb(12, 97, 33),rgb(104, 145, 162));*/
	/*background:black;*/
	background: -webkit-linear-gradient(43deg, rgb(244, 210, 215),
		rgb(220, 255, 186));
	background: linear-gradient(43deg, rgb(244, 210, 215),
		rgb(220, 255, 186));
	position: relative;
}

#particles-js {
	width: 100%;
	height: 100%;
	background-size: cover;
	background-position: 50% 50%;
	position: fixed;
	top: 0px;
	z-index: 1;
}


<!-- 내꺼 -->

.container {
	display: inline-block;
	height: 600px;
	left: 400px;
	position: absolute;
	top: 170px;
	width: 1000px;
}

#congratulation {
	display: inline-block;
	left: 250px;
	position: relative;
	top: 80px;
}

h1 {
	font-size: 3em;
}

#guide {
	border: 1px solid transparent;
	background-color: white;"
	display: inline-block;
	height: 200px;
	left: 16%;
	width: 800px;
	position: relative;
	text-align: center;
	top: 180px;
}

#cong-button {
	display: inline-block;
	left: 340px;
	position: relative;
	top: 220px;
}

a:nth-child(2) {
	margin-left: 160px;
	position: relative;
}

#cong-button {
	z-index: 1000;
}

</style>
</head>
<body>

	<div class="container">
		<div id="congratulation">
			<h1 style="color: #5858FA;">회원 가입을 축하드립니다!!</h1>
		</div>
		
		<div id="guide"><br><br><br><br>넘나 허전쓰.. 사이트 이용 가이드 넣으면 좋을 듯</div>

		<div id="cong-button">
			<a href="/sec_login"><button class="btn btn-primary">로그인 하기</button></a> 
			<a href="/yummy"><button class="btn btn-primary">메인으로 돌아가기</button></a>
		</div>		
	</div>
	<!-- /.container -->
	<div id="particles-js"></div>

	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js"></script>
	<script>
		$
				.getScript(
						"https://cdnjs.cloudflare.com/ajax/libs/particles.js/2.0.0/particles.min.js",
						function() {
							particlesJS('particles-js', {
								"particles" : {
									"number" : {
										"value" : 80,
										"density" : {
											"enable" : true,
											"value_area" : 800
										}
									},
									"color" : {
										"value" : "#642EFE"
									},
									"shape" : {
										"type" : "circle",
										"stroke" : {
											"width" : 0,
											"color" : "#000000"
										},
										"polygon" : {
											"nb_sides" : 5
										},
										"image" : {
											"width" : 100,
											"height" : 100
										}
									},
									"opacity" : {
										"value" : 0.5,
										"random" : false,
										"anim" : {
											"enable" : false,
											"speed" : 1,
											"opacity_min" : 0.1,
											"sync" : false
										}
									},
									"size" : {
										"value" : 5,
										"random" : true,
										"anim" : {
											"enable" : false,
											"speed" : 40,
											"size_min" : 0.1,
											"sync" : false
										}
									},
									"line_linked" : {
										"enable" : true,
										"distance" : 150,
										"color" : "#642EFE",
										"opacity" : 0.4,
										"width" : 1
									},
									"move" : {
										"enable" : true,
										"speed" : 6,
										"direction" : "none",
										"random" : false,
										"straight" : false,
										"out_mode" : "out",
										"attract" : {
											"enable" : false,
											"rotateX" : 600,
											"rotateY" : 1200
										}
									}
								},
								"interactivity" : {
									"detect_on" : "canvas",
									"events" : {
										"onhover" : {
											"enable" : true,
											"mode" : "repulse"
										},
										"onclick" : {
											"enable" : true,
											"mode" : "push"
										},
										"resize" : true
									},
									"modes" : {
										"grab" : {
											"distance" : 400,
											"line_linked" : {
												"opacity" : 1
											}
										},
										"bubble" : {
											"distance" : 400,
											"size" : 40,
											"duration" : 2,
											"opacity" : 8,
											"speed" : 3
										},
										"repulse" : {
											"distance" : 200
										},
										"push" : {
											"particles_nb" : 4
										},
										"remove" : {
											"particles_nb" : 2
										}
									}
								},
								"retina_detect" : true,
								"config_demo" : {
									"hide_card" : false,
									"background_color" : "#b61924",
									"background_image" : "",
									"background_position" : "50% 50%",
									"background_repeat" : "no-repeat",
									"background_size" : "cover"
								}
							});

						});
	</script>

</body>
</html>
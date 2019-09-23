<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> 
<link href="/resources/css/css.css" rel="stylesheet">
<script src="/resources/js/signature_pad.min.js"></script>

<style type="text/css">
.big_tab ul {
	overflow: hidden;
	width: 100%;
}
a{
color: white;
}
a:hover{
color:#F4D2D7;
}
.big_tab ul li {
	width: 16.6666666666%;
    box-sizing: border-box;
    float: left;
    list-style-type: none;   
    text-align: center;
    line-height: 40px;
    background-color: #ADDCAF;
}

.big_tab ul li.activeClass {
	font-weight: bold;
	font-size: 20px;
	background-color: #F4D2D7;
	
}

.sm_select {
	display: none;
}

.sm_select select {
	width: 100%;
	height: 40px;
 	background-color: #ADDCAF;
}

@media ( max-width :500px) {
	.sm_select {
		display: block;
	}
	.big_tab {
		display: none;
	}
	
}
.bg-dark{
margin-top: 800px;  
}
#modalbtn {
	 display: none; 
}
</style>
<script type="text/javascript">
	$(function() {
		$("#pattern-switcher").hide();
		$("#patter-close").hide();

		$(".tab_content").hide();
		$(".tab_content:first").show();

		
		function defaultinfo() {
			// (1) 기본 정보
			let project_title = $('#project_title').val(); // 프로젝트 제목
			let main_category = $('#main_category').val(); // 대분류
			let category_no = $('#category_no').val(); // 소분류
			let project_photo_file = $('#project_photo_file').val(); // 프로젝트 대표사진
			let targetprice = $('#targetprice').val(); // 목표 금액
			let startdate = $('#startdate').val(); // 시작 날짜
			let enddate = $('#enddate').val(); // 종료 날짜

			if (project_title == '' || project_title == null) {
				$("#exampleModalCenterTitle").text("프로젝트 제목을 입력하세요.");
				$("#modalbtn").trigger("click");
			} else if (main_category == '' || main_category == null) {
				$("#exampleModalCenterTitle").text("대분류를 선택 해주세요.");
				$("#modalbtn").trigger("click");
			} else if (category_no == '' || category_no == null) {
				$("#exampleModalCenterTitle").text("소분류를 선택 해주세요.");
				$("#modalbtn").trigger("click");
			} else if (project_photo_file == '' || project_photo_file == null) {
				$("#exampleModalCenterTitle").text("프로젝트 대표사진을 업로드 해주세요.");
				$("#modalbtn").trigger("click");
			} else if (targetprice == '' || targetprice <= 1000000) {
				$("#exampleModalCenterTitle").text(
						"목표금액을 입력해주세요. (최소 금액 100만원 이상)");
				$("#modalbtn").trigger("click");
			} else if (startdate == '' || startdate == null) {
				$("#exampleModalCenterTitle").text("시작 날짜를 입력해주세요.");
				$("#modalbtn").trigger("click");
			} else if (enddate == '' || enddate == null) {
				$("#exampleModalCenterTitle").text("종료 날짜를 입력해주세요.");
				$("#modalbtn").trigger("click");
			} else {
				return 1;
			}
		}

		function businessinfo() {
			// (2) 사업자 정보
			let business_name = $('#business_name').val(); // 사업자명
			let business_no = $('#business_no').val(); // 사업자 번호
			let business_division = $('input[name="business_division"]:checked').length; // 사업자 구분
			let business_addr = $('#business_addr').val(); // 소재지
			let business_startdate = $('#business_startdate').val(); // 법인설립연월일
			let business_url = $('#business_url').val(); // 홈페이지 주소
			if (business_name == "" || business_name == null) {
				$("#exampleModalCenterTitle").text("사업자 명을 입력해주세요.");
				$("#modalbtn").trigger("click");
			} else if (business_no.length < 9) { //사업자등록번호 자리수 10자리
				$("#exampleModalCenterTitle").text("사업자 번호를 입력해주세요.(10자리)");
				$("#modalbtn").trigger("click");
			} else if (business_division <= 0) {
				$("#exampleModalCenterTitle").text("사업자 구분을 선택해주세요.");
				$("#modalbtn").trigger("click");
			} else if (business_addr == "" || business_addr == null) {
				$("#exampleModalCenterTitle").text("소재지를 입력해주세요.");
				$("#modalbtn").trigger("click");
			} else if (business_startdate == "" || business_startdate == null) {
				$("#exampleModalCenterTitle").text("법인설립연월일을 입력해주세요.");
				$("#modalbtn").trigger("click");
			} else {
				return 1;
			}
		}

		function originatorinfo() {
			// (3) 창작자 정보
			let alias = $('#alias').val(); // 창작자 이름
			let img_file = $('#img_file').val(); // 창작자 프로필 사진
			let introduce = $('#introduce').val(); // 창작자 소개
			console.log(introduce);

			if (alias == "" || alias == null) {
				$("#exampleModalCenterTitle").text("창작자 이름을 입력해주세요.");
				$("#modalbtn").trigger("click");
			} else if (img_file == "" || img_file == null) {
				$("#exampleModalCenterTitle").text("창작자 프로필사진을 업로드해주세요.");
				$("#modalbtn").trigger("click");
			} else if (introduce == "" || introduce == null) {
				$("#exampleModalCenterTitle").text("창작자 소개를 해주세요.");
				$("#modalbtn").trigger("click");
			} else {
				return 1;
			}
		}

		function projectinfo() {
			// (4) 프로젝트 설명
			let project_contents_file = $('#project_contents_file').val(); // 파일올릴때
			let note_editable = $('.note-editable p').text(); // 써머노트
			console.log("파일 : " + project_contents_file);
			console.log("써머 : " + note_editable);

			if ((project_contents_file == "" || project_contents_file == null)
					&& note_editable == "") {
				$("#exampleModalCenterTitle").text("프로젝트 설명을 작성 또는 업로드해주세요.");
				$("#modalbtn").trigger("click");
			} else {
				return 1;
			}
		}
		//옵션 추가 버튼을 눌렀을때 옵션form 추가로 나옴
		var btncount = 0; // 추가할때 증가, 삭제할때 감소

		function optioninfo() {
			let option_name = new Array();
			let option_price = new Array();
			let option_contents = new Array();
			let option_quantity = new Array();
			console.log(btncount);
			if (btncount != 0) {
				for (let i = 0; i < btncount; i++) {
					option_name[i] = $('#option_name').val(); //옵션명
					option_price[i] = $('#option_price').val(); //가격
					option_contents[i] = $('#option_contents').val(); //내용
					option_quantity[i] = $('#option_quantity').val(); //수량
					console.log("(" + i + ") : " + option_name[i]);
					console.log(option_quantity[i]);
					if (option_name[i] == "" || option_name[i] == null) {
						$("#exampleModalCenterTitle").text(
								(i + 1) + "번째 옵션, 옵션명을 입력해주세요.");
						$("#modalbtn").trigger("click");
					} else if (option_price[i] < 999) {
						$("#exampleModalCenterTitle").text(
								(i + 1) + "번째 옵션, 가격을 입력해주세요. (최소 1000원 이상)");
						$("#modalbtn").trigger("click");
					} else if (option_contents[i] == ""
							|| option_contents[i] == null) {
						console.log(option_contents[i]);
						$("#exampleModalCenterTitle").text(
								(i + 1) + "번째 옵션, 내용을 입력하세요.");
						$("#modalbtn").trigger("click");
					} else if (option_quantity[i] < 0
							|| option_quantity[i] == "") {
						$("#exampleModalCenterTitle").text(
								(i + 1) + "번째 옵션, 수량을 입력하세요.");
						$("#modalbtn").trigger("click");
					} else {
						return 1;
					}
				}
			} else {
				$("#exampleModalCenterTitle").text("옵션을 추가해주세요.");
				$("#modalbtn").trigger("click");
			}
		}

		// 새로운 tab
		$('.big_tab li').first().addClass("activeClass");
		$(".tab-contents").not(':first').hide();

		$('.big_tab li').on(
				'click',
				function() {
					$(this).addClass("activeClass").siblings().removeClass(
							"activeClass");
					var link = $(this).find("a").attr("href");
					var link_num = link.substr(link.length - 1);
					$("select#tabmenu option").eq(link_num - 1).prop(
							"selected", "selected");
					$(".tab-contents").hide();
					$(link).show();
				});

		$('#btn2').on(
				'click',
				function() {
					console.log("버튼이오");
					if (defaultinfo() == 1) {
						$(this).addClass("activeClass").siblings().removeClass(
								"activeClass");
						var link = $(this).find("a").attr("href");
						var link_num = link.substr(link.length - 1);
						$("select#tabmenu option").eq(link_num - 1).prop(
								"selected", "selected");
						$(".tab-contents").hide();
						$(link).show();
					}
				});

		$('#btn3').on(
				'click',
				function() {
					if (businessinfo() == 1) {
						$(this).addClass("activeClass").siblings().removeClass(
								"activeClass");
						var link = $(this).find("a").attr("href");
						var link_num = link.substr(link.length - 1);
						$("select#tabmenu option").eq(link_num - 1).prop(
								"selected", "selected");
						$(".tab-contents").hide();
						$(link).show();
					}
				});

		$('#btn4').on(
				'click',
				function() {
					if (originatorinfo() == 1) {
						$(this).addClass("activeClass").siblings().removeClass(
								"activeClass");
						var link = $(this).find("a").attr("href");
						var link_num = link.substr(link.length - 1);
						$("select#tabmenu option").eq(link_num - 1).prop(
								"selected", "selected");
						$(".tab-contents").hide();
						$(link).show();
					}
				});

		$('#btn5').on(
				'click',
				function() {
					if (projectinfo() == 1) {
						console.log(projectinfo() + ".........");
						console.log("버튼누르고 이프문을 들어오면..");
						$(this).addClass("activeClass").siblings().removeClass(
								"activeClass");
						var link = $(this).find("a").attr("href");
						var link_num = link.substr(link.length - 1);
						$("select#tabmenu option").eq(link_num - 1).prop(
								"selected", "selected");
						$(".tab-contents").hide();
						$(link).show();
					}
					;
				});

		$('#btn6').on(
				'click',
				function() {
					if (optioninfo() == 1) {
						$(this).addClass("activeClass").siblings().removeClass(
								"activeClass");
						var link = $(this).find("a").attr("href");
						var link_num = link.substr(link.length - 1);
						$("select#tabmenu option").eq(link_num - 1).prop(
								"selected", "selected");
						$(".tab-contents").hide();
						$(link).show();
					}
				});

		$("select#tabmenu").on(
				"change",
				function() {
					var select_link = $("select#tabmenu").val();
					var select_num = $(this).prop('selectedIndex');
					$('.big_tab li').eq(select_num).addClass("activeClass")
							.siblings().removeClass('activeClass');
					$(".tab-contents").hide();
					$(select_link).show();
					console.log(select_link);
				});

		$('#insert').on(
				'click',
				function() {
					if (defaultinfo() != 1) {
						$("ul.tabs li").removeClass("active").css("color",
								"#333")
						$("ul.tabs li:eq(0)").addClass("active").css("color",
								"darkred")
						$('.tab_content').hide()
						$('.tab_content:eq(0)').show()
					} else if (businessinfo() != 1) {
						$("ul.tabs li").removeClass("active").css("color",
								"#333")
						$("ul.tabs li:eq(1)").addClass("active").css("color",
								"darkred")
						$('.tab_content').hide()
						$('.tab_content:eq(1)').show()
					} else if (originatorinfo() != 1) {
						$("ul.tabs li").removeClass("active").css("color",
								"#333")
						$("ul.tabs li:eq(2)").addClass("active").css("color",
								"darkred")
						$('.tab_content').hide()
						$('.tab_content:eq(2)').show()
					} else if (projectinfo() != 1) {
						$("ul.tabs li").removeClass("active").css("color",
								"#333")
						$("ul.tabs li:eq(3)").addClass("active").css("color",
								"darkred")
						$('.tab_content').hide()
						$('.tab_content:eq(3)').show()
					} else if (optioninfo() != 1) {
						$("ul.tabs li").removeClass("active").css("color",
								"#333")
						$("ul.tabs li:eq(4)").addClass("active").css("color",
								"darkred")
						$('.tab_content').hide()
						$('.tab_content:eq(4)').show()
					} else {
						$("form").submit();
						console.log("등록하자");
					}
				});

		$("#main_category option:eq(0)").attr("selected", "selected");

		$("#summerwrite").hide();
		$('#directpdf').hide();

		$("#contentoption1").on("click", function() {
			$("#summerwrite").hide();
			$("#directpdf").show();
		});

		$("#contentoption2").on("click", function() {
			$('#directpdf').hide();
			$("#summerwrite").show();
		});

		// 메인카테고리에 해당하는 서브카테고리불러오기
		$("#main_category").on(
				'change',
				function() {
					$("#category_no").empty();

					var main_category = $(this).val();

					$.ajax({
						method : "GET",
						dataType : "JSON",
						url : "/project/category",
						data : 'main_category=' + main_category,

						success : function(data) {
							console.log("ajax1");
							console.log(data);
							$.each(data, function(i, item) {
								console.log(item.category_no);
								console.log(item.sub_category);
								$("#category_no").append(
										"<option value='"+item.category_no+"'>"
												+ item.sub_category
												+ "</option>");
							});
						}
					});
				});

		var canvas = $("#signature-pad canvas")[0];
		var sign = new SignaturePad(canvas, {
			minWidth : 2,
			maxWidth : 4,
			penColor : "rgb(0, 0, 0)"
		});

		$("[data-action]").on(
				"click",
				function() {

					if ($(this).data("action") == "clear") {
						sign.clear();
					} else if ($(this).data("action") == "save") {
						if (sign.isEmpty()) {
							alert("사인해 주세요!!");
						} else {
							var ss = sign.toDataURL();
							var csrfHeaderName = "${_csrf.headerName}";
							var csrfTokenValue = "${_csrf.token}";
							console.log(csrfTokenValue);
							console.log(csrfHeaderName);
							$.ajax({
								url : "/sign",
								method : "POST",
								dataType : "text",
								beforeSend : function(xhr) {
									xhr.setRequestHeader(csrfHeaderName,
											csrfTokenValue);
								},
								data : {
									"sign" : ss
								},
								success : function(r) {
									console.log("ajax2");
									console.log(r);
									alert("저장완료 : " + r);
									sign.clear();
								},
								error : function(res, errcode, xh) {
									console.log(res + "," + errcode + ", " + xh
											+ "실패다");
								}
							});
						}
					}
				});

		$('#up')
				.on(
						'click',
						function() {
							var optform = document.getElementById("optform");
							var str = "<hr>";
							str += '<label for="option_name">옵션명</label><div><input type="text" class="form-control input-default" id="option_name" name="option_name"></div>';
							str += '<label for="option_price">가격</label><div><input type="text" class="form-control input-default" id="option_price" name="option_price"></div>';
							str += '<label for="option_contents">내용</label><div><textarea class="form-control input-default" id="option_contents" name="option_contents"></textarea></div>';
							str += '<label for="option_quantity">수량</label><div><input type="text" class="form-control input-default" id="option_quantity" name="option_quantity"></div>      	';

							var addform = document.createElement("div");
							addform.id = "added_" + btncount;
							addform.innerHTML = str;
							optform.appendChild(addform);
							btncount++;

							$('#btncnt').val(btncount);

							console.log(btncount);
						});

		$('#down').on('click', function() {
			var optform = document.getElementById("optform");
			if (btncount > 1) { // 현재 폼이 두개 이상이면
				var addform = document.getElementById("added_" + (--btncount));
				// 마지막으로 생성된 폼의 ID를 통해 Div객체를 가져옴
				optform.removeChild(addform); // 폼 삭제 
			} else { // 마지막 폼만 남아있다면
				document.optform.clear(); // 폼 내용 삭제
			}
			$('#btncnt').val(btncount);
			console.log(btncount);
		});
	});
</script>

</head>
<body>
	<div class="tabmenu">
		<div class="big_tab">
			<ul>
				<li><a href="#tab01">(1)기본 정보</a></li>
				<li><a href="#tab02">(2)사업자 정보</a></li>
				<li><a href="#tab03">(3)창작자 정보</a></li>
				<li><a href="#tab04">(4)프로젝트 설명</a></li>
				<li><a href="#tab05">(5)옵션 설정</a></li>
				<li><a href="#tab06">(6)약관동의 및 서명</a></li>
			</ul>
		</div>
		<div class="sm_select">
			<select name="" id="tabmenu">
				<option value="#tab01">(1)기본 정보</option>
				<option value="#tab02">(2)사업자 정보</option>
				<option value="#tab03">(3)창작자 정보</option>
				<option value="#tab04">(4)프로젝트 설명</option>
				<option value="#tab05">(5)옵션 설정</option>
				<option value="#tab06">(6)약관동의 및 서명</option>
			</select>
		</div>
	</div>

	<form method="post" action="/result" enctype="multipart/form-data">
		<div id="tab01" class="tab-contents">
			<label for="project_title">프로젝트 제목</label>
			<div>
				<input type="text" class="form-control input-default"
					id="project_title" name="project_title" value="고정제목">
			</div>
			<label for="main_category">대분류</label>
			<div>
				<select class="form-control input-default" id="main_category"
					name="main_category" id="default">
					<option value="">대분류를 선택하세요</option>
					<option value="게임">게임</option>
					<option value="패션">패션</option>
					<option value="도서">도서</option>
					<option value="IT">IT</option>
					<option value="도서번역">도서 번역
					<option>
				</select>
			</div>
			<label for="category_no">소분류</label>
			<div>
				<select class="form-control input-default" id="category_no"
					name="category_no">
				</select>
			</div>

			<label for="project_photo_file">프로젝트 대표사진</label>
			<div>
				<input type="file" class="form-control input-default"
					id="project_photo_file" name="project_photo_file">
			</div>

			<label for="targetprice">목표 금액</label>
			<div>
				<input type="number" class="form-control input-default"
					id="targetprice" name="targetprice" value="1111">
			</div>

			<label for="startdate">시작 날짜</label>
			<div>
				<input type="date" class="form-control input-default" id="startdate"
					name="startdate" value="2019-09-19">
			</div>

			<label for="enddate">종료 날짜</label>
			<div>
				<input type="date" class="form-control input-default" id="enddate"
					name="enddate" value="2019-09-25">
			</div>

			<div class="btn2 btn btn-primary" id="btn2">
				<a href="#tab02">다음</a>
			</div>
		</div>


		<div id="tab02" class="tab-contents">
			<label for="business_name">사업자명</label>
			<div>
				<input type="text" class="form-control input-default"
					id="business_name" name="business_name" value="고정제목">
			</div>

			<label for="business_no">사업자번호</label>
			<div>
				<input type="text" class="form-control input-default"
					id="business_no" name="business_no" maxlength="10">
			</div>

			<label for="business_division">사업자 구분</label>
			<div>
				<input type="radio" name="business_division" value="개인">개인<br>
				<input type="radio" name="business_division" value="법인">법인<br>
			</div>

			<label for="business_addr">소재지</label>
			<div>
				<input type="text" class="form-control input-default"
					id="business_addr" name="business_addr" value="고정주소">
			</div>

			<label for="business_startdate">법인설립연월일</label>
			<div>
				<input type="date" class="form-control input-default"
					id="business_startdate" name="business_startdate"
					value="2019-03-21">
			</div>

			<label for="business_url">홈페이지</label>
			<div>
				<input type="text" class="form-control input-default"
					id="business_url" name="business_url" value="고정페이지">
			</div>
			<div class="btn2 btn btn-primary" id="btn3">
				<a href="#tab03">다음</a>
			</div>
		</div>


		<div id="tab03" class="tab-contents">
			<label for="alias">창작자 이름</label>
			<div>
				<input type="text" class="form-control input-default" id="alias"
					name="alias" value="고정이름">
			</div>
			<label for="img_file">창작자 프로필사진</label>
			<div>
				<input type="file" class="form-control input-default" id="img_file"
					name="img_file">
			</div>
			<label for="introduce">창작자 소개</label>
			<div>
				<textarea class="form-control input-default" id="introduce"
					name="introduce">1111</textarea>
			</div>
			<div class="btn2 btn btn-primary" id="btn4">
				<a href="#tab04">다음</a>
			</div>
		</div>

		<div id="tab04" class="tab-contents">
			<div id="contentoption1">직접파일올리기</div>
			<div id="contentoption2">내용작성하기</div>

			<div id="directpdf">
				<label for="project_contents_file">프로젝트 설명 pdf파일 직접 업로드하기</label>
				<div>
					<input type="file" class="form-control input-default"
						id="project_contents_file" name="project_contents_file">
				</div>
			</div>

			<div id="summerwrite">
				<div id="gide"
					style="border: 1px solid; width: 100%; height: 200px; margin: auto;">
					<h1>작성가이드</h1>
				</div>
				<textarea id="summernote" name="summernote"></textarea>
			</div>

			<div class="btn2 btn btn-primary" id="btn5">
				<a href="#tab05">다음</a>
			</div>
		</div>


		<div id="tab05" class="tab-contents">
			<div id="optform"></div>

			<input type="hidden" id="btncnt" name="btncnt" value="0"> <input
				type="button" class="btn btn-primary" value="옵션 추가 " id="up">
			<input type="button" class="btn btn-primary" value="옵션 삭제 " id="down">
			<div class="btn2 btn btn-primary" id="btn6">
				<a href="#tab06">다음</a>
			</div>
		</div>

		<div id="tab06" class="tab-contents">
			<div id="signature-pad" class="m-signature-pad">
				<div class="m-signature-pad--body">
					<canvas width="300" height="100"></canvas>
				</div>
				<div class="m-signature-pad--footer">
					<button type="button" class="button clear btn btn-primary"
						data-action="clear">지우기</button>
					<button type="button" class="button save btn btn-primary"
						data-action="save">저장</button>
				</div>
			</div>
			<a href="#" class="btn btn-primary" id="insert">등록</a> 
		
		</div>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}">
	</form>

   <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span id="close" aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-outline-primary btn-primary" data-dismiss="modal">확인</button>        
      </div>
    </div>
  </div>
</div>
	<button type="button" id="modalbtn" class="btn btn-primary"
		data-toggle="modal" data-target="#exampleModalCenter">모달 창</button>
	<script>
		$('#summernote').summernote({
			placeholder : '작성가이드를 참고해서 작성해보세요!',
			tabsize : 2,
			height : 200
		});
	</script>
</body>
</html>
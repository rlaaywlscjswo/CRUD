<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
#footer{
	margin-top: 30px;
}
.kgPayments{
	background-color: blue;
}
#options{
	width: 70%;
	min-width:300px;
	max-width:500px;
}
#memos{
	min-width:300px;
	max-width:500px;
	border:2px solid blue;
	margin-left:95px;
	display:none;
	width: 70%;
	margin-top: -6px;
}
.memo{
	width: 100%;
	font-size: 12px;
}
#addrslist, .goPopup, #default_addrs, #addr_add, .memo, #basicaddr, #newaddr{
	cursor:pointer;
}
#goPopup{
	height: 25px;
	position: relative;
	font-size:12px;
	width: 60px;
}

/* .bg-dark{
margin-top: 600px;
} */
#top{
	border: 1px solid blue;
	margin-bottom: 10px;
	float: left;
	width: 100%;
}
.order_payment{
    float: left;
    width: 89px;
    height: 20px;
	width: 100%;
}
h3{
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em; 
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: 900;
	font-family: '나눔고딕';
}
h4{
	display: block;
    width: 100px;
    height: 17px;
	font-family: '나눔고딕';
}
body, #addrslist, #goPopup, #sub{
	font-family: '나눔고딕',NanumGothic,'맑은고딕',MalgunGothic,'돋움',Dotum,Helvetica,sans-serif;
}
input[type="button"] {
    border: 1px solid #d0d0d0;
    color: #4c4c4c;
    background-color: #fff;
    cursor: pointer;
	
    width: 70px;
    height: 24px;
    margin: 3px 0;
    padding: 0;
    letter-spacing: -1px;
}
#fdaddr{
	position: relative;
	top: -10px;
}
#top ul li{
	display: inline-block;
	margin-bottom: 20px;
	font-size: 14px;
	width: 100%;
	margin-bottom: 15px;
}
#jumun ul li label{
	display: inline-block;		
	width: 90px;
}
#jumun ul li{
	margin-bottom: 15px;
}
#jumun{
	border: 1px solid blue; 
	float: left; 
	width: 64%;
	padding: 0px 0px 0px 25px;
	width: 60%;
	font-size: 14px;
}
#fulladdr{
	width: 60%;
}
#addrDetail{
	width: 20%;		
}
#top{
	width: 100%;
}
#top ul li{
	display: inline;
	padding: 25px;
	margin-bottom: 15px;
}
#sky{
	margin-top:10px;
	width: 80%; 
	margin: 0 auto;
	height: 650px;
}
#sub{
	border: 1px solid blue; 
	float: right; 
	width: 35%;
}
#header{
	margin-bottom: 50px;
}
.jumuninfo{
	width: 300px;
}
#jumun h4{
	margin-bottom: 10px;
}

/*#top li:nth-child(1){
	width: 200px;
	margin-right: 130px;
}
#top li:nth-child(4){
	width: 100px;
	margin-right: 130px;
}
#top li:nth-child(2){
	margin-right: 130px;
}
#top li:nth-child(3){
	margin-right: 220px;
}*/
</style>
<script>
$(document).ready(function(){
	let num = ${opt.option_price}; //$(".price").text(); 		
	var regexp = /\B(?=(\d{3})+(?!\d))/g;
	$(".price").text(num.toString().replace(regexp, ','));
	//return num.toString().replace(regexp, ',');
	
	
	$('.goPopup').on('click', function(){
		// 주소검색을 수행할 팝업 페이지를 호출합니다.
		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
		var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
		// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
	});
	
	// 상세주소 수정 할 때, 전제 주소도 동시에 변경.
	$('#addrDetail').on('keyup', function(val){
		let addr1 = document.getElementById('roadaddrPart1').value;
		let addr2 = document.getElementById('roadaddrPart2').value;
		let detail = document.getElementById('addrDetail').value;
		document.getElementById('fulladdr').value="";
		document.getElementById('fulladdr').value=addr1 +", "+detail + " " + addr2;
	});
	
	//기존 배송지 주소가 있으면, 기본 배송지 선택 없으면 신규 배송지 선택 (라디오 버튼 선택)
	let defaultaddr = "${addr.roadaddrPart1}";
	if(!defaultaddr == null || !defaultaddr == "" || !defaultaddr == "undefined" ) {
		$("#address_name").val("${addr.address_name}");
		$("#address_photo").val("${addr.address_photo }");
		$("#alias").val("${addr.alias }");
		jusoCallBack("${addr.roadaddrPart1}", "${addr.addrDetail}", "${addr.roadaddrPart2}", "${addr.jibunaddr}", "${addr.zipno}");
		$("#basicaddr").prop("checked", true).prop("disabled", false)
	} else {
		$("input[name='addr_add']").prop("checked", true);
		$("#newaddr").prop("checked", true);
	}
	
	//기본 배송지 클릭시 자동 완성, 신규 배송지 클릭시 텍스트창 클리어!
	$("input[name='addrs']").change(function addr_change() {
		if($("input[name='addrs']:checked").val() == "basicaddr" ){
			$("#address_name").val("${addr.address_name}");
			$("#address_photo").val("${addr.address_photo }");
			$("#alias").val("${addr.alias }");
			$("#zipno").val("${addr.zipno}");
			$("#addrDetail").val("${addr.addrDetail}");
			$("#fulladdr").val("${addr.roadaddrPart1 }, ${addr.addrDetail} ${addr.roadaddrPart2}");
			$("input[name='addr_add']").prop("checked", false);
		} else { 
			$("#address_name").val("");
			$("#address_photo").val("");
			$("#alias").val("");
			$("#zipno").val("");
			$("#addrDetail").val("");
			$("#fulladdr").val("");
			$("input[name='addr_add']").prop("checked", true);
		}
	});
	
	//주소목록 팝업 호출
	$('#addrslist').on('click', function(){
		let pop = window.open("addrPopup?no=${member.no}","pop","width=720,height=900, scrollbars=yes, resizable=yes"); 
		console.log("자식 브라우저 : ${member.no}")
	});
	 
	//배송지 목록 추가 여부
	$('#reqpay').on('click', function() {
		let addr_check = $("input[name='addr_add']").is(':checked'); // 주소지 추가 true, false
		$("input[name='addr_add']").val(addr_check);
		//console.log($("input[name='addr_add']").val());
		let defaultaddr_check = $("input[name='default_addrs']").is(':checked'); // 기본주소지 설정 true, false
		$("input[name='default_addrs']").val(defaultaddr_check);
		//console.log($("input[name='default_addr']").val());
	});
	
	//결제 수단 선택
	var paymethod = "card";	
	$("#option").on('change', function() {
		console.log($(this).val());
		$("#options").val($(this).val());
	});
	
	// 결제 방법
	$("#frm").on('submit', function( event ) {
		event.preventDefault();
		let paymethod = $("#payselect").val();	
		requestPay(paymethod);
	});
	
	// 결제
	function requestPay(paymethod) {
		var IMP = window.IMP; // 생략가능
		IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		let option = parseInt($("#option_price").text()); // 상품 가격
		//let del = $("#delivery_pay").text();
		let delivery = 0;//parseInt($("#delivery_pay").text()); // 배송비
	IMP.request_pay({
	    pg : 'inicis',  
	    pay_method : paymethod,  
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : "${opt.option_name}",			// 상품명
	    amount : ${opt.option_price},			// 결제 금액
	    buyer_email : "${member.email}", 		// 메일주소
	    buyer_name : $("#address_name").val(),	// 구매자 이름
	    buyer_tel : $("#address_photo").val(),	// 구매자 연락처
	    buyer_addr : $("#fulladdr").val(),		// 구매자 주소
	    buyer_postcode : $("#zipno").val(),		// 구매자 우편번호
	    m_redirect_url : 'https://www.yourdomain.com/payments/complete' 
	    //모바일 결제시, 결제가 끝나고 랜딩되는 URL을 지정 (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
	}, function(rsp) {
	    if ( rsp.success ) {
	    	// jQuery로 HTTP 요청
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        
	        $("#frm").off('submit');
	        $('form').trigger('submit');
	        
	        /* jQuery.ajax({
	            url: "https://www.myservice.com/payments/complete", // 가맹점 서버
	            method: "POST",
	            headers: { "Content-Type": "application/json" },
	            data: {
	                imp_uid: rsp.imp_uid,
	                merchant_uid: rsp.merchant_uid
	            }
	        }).done(function (data) {
	          // 가맹점 서버 결제 API 성공시 로직
	          console.log("결제 성공!! : "+data);
	        }) */
	      } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	      }
	    alert(msg);
		});
	}
	
	// 요청사항
	$('#options').on('click', function() {
		$("#memos").toggle();
		let display_status = $("#memos").val();
		if(display_status == "off"){
			$("#memos").val("on");
		} else {
			$("#memos").val("off");
		}
		//$('#memos').css('display', '');
	});
	$(document).on('click', function(e) {
		/* if($("#memos").val() == "on"){
			$('#memos').css('display', 'none').val("off");
		} */
		//console.log(e.target);
		//console.log($("#memos").is(e.target));
		//console.log($("#memos").css('display'));
		if(!$("#options").is(e.target)){
		//if($("#memos").css('display') == 'block'){
			$('#memos').css('display', 'none');
			//$('#memos').css('display', 'none').val("off");
		} 
	});
	
	$('.memo').on('mouseover', function() {
		$(this).css('background-color', '#d3d3d3');
	});
	$('.memo').on('mouseout', function() {
		$(this).css('background-color', '');
	});
	
	$('.memo').on('click', function name() {
		$('#options').val($(this).text());
	});
	
});

function jusoCallBack(roadaddrPart1, addrDetail, roadaddrPart2, jibunaddr, zipno){		
	document.form.roadaddrPart1.value = roadaddrPart1;
	document.form.roadaddrPart2.value = roadaddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipno.value = zipno;
	document.form.jibunaddr.value = jibunaddr;
	// 전체 주소
	document.getElementById('fulladdr').value=roadaddrPart1 +", "+addrDetail + " " + roadaddrPart2;
}

function addrCallBack(roadaddrPart1, addrDetail, roadaddrPart2, zipno, alias, address_name, address_photo) {
	document.form.roadaddrPart1.value = roadaddrPart1;
	document.form.roadaddrPart2.value = roadaddrPart2;
	document.form.addrDetail.value = addrDetail;
	document.form.zipno.value = zipno;
	document.form.alias.value = alias;
	document.form.address_name.value = address_name;
	document.form.address_photo.value = address_photo;
	$("#basicaddr").prop("checked", true).prop("disabled", false);
	$("input[name='addr_add']").prop("checked", false);
	document.getElementById('fulladdr').value=roadaddrPart1 +", "+addrDetail + " " + roadaddrPart2;
}
</script>
</head>
<body>
<form name="form" id="frm" method="post" action="success">
<div id="sky">
<div id="top">
<h3 class="order_payment">주문/결제</h3>
	<ul>
		<li class="jumuninfo">상품명</li>
		<li>창작자</li>
		<li>후원금액</li>
	</ul>
	<ul>
		<li class="jumuninfo">${opt.option_name }</li>
		<li>${alias}</li>
		<li id="option_price" class="price">${opt.option_price }</li>
	</ul>
</div>

<!-- <li id="delivery_pay">0</li> 가려야함. -->
<div id="jumun">
<h4>주문자 정보</h4>
<ul>
	<li><span>${member.name }</span></li>
	<li><span>${member.email}</span></li>
</ul>

	<h4>배송지 정보</h4>
	<ul>
		<li>
			<label for="addrs">배송지 선택 </label>
			<input type="radio" name="addrs" id="basicaddr" value="basicaddr" disabled="disabled" >기본 배송지
			<input type="radio" name="addrs" id="newaddr" value="newaddr" >신규 배송지
			<input type="button" id="addrslist" name="addrslist" value="배송지목록" />
		</li>
		<li>
			<label for="address_name">수령인 </label>
			<input type="text" id="address_name" name="address_name" required="required" > 
		</li>
		<li>
			<label for="alias">배송지 명</label>
			<input type="text" id="alias" name="alias" required="required" >
		</li>
		<li>
			<label for="address_photo">연락처</label>
			<input type="text" id="address_photo" name="addr	ess_photo" required="required" >
		</li>
		<li>
			<label for="fulladdr">배송지 주소</label>
			<input type="checkbox" name="addr_add" id="addr_add" value="addr_add"> 배송지목록에 추가 
			<input type="checkbox" id="default_addrs" name="default_addrs" value="default_addr"> 기본 배송지로 설정<br>
			<input type="text"  style="width:70px;" id="zipno"  class="goPopup" name="zipno" required="required" readonly="readonly"/>
			<input type="button" id="goPopup" class="goPopup" value="우편 번호"/>
		</li>
		<li id="fdaddr">
			<label for="fulladdr"></label>
			<input type="text" id="fulladdr" name="fulladdr" readonly="readonly" > 
			<input type="text" id="addrDetail"  name="addrDetail" required="required" />
		</li>
		<li>
			<label for="options">요청 사항</label>
			<input type="text" id="options" name="options" value="요청사항을 직접 입력하세요.">
				<div id="memos">
					<ul>
						<li class="memo">배송 전에 미리 연락 바랍니다.</li>
						<li class="memo">부재시 경비실에 맡겨 주세요.</li>
						<li class="memo">부재시 전화 주시거나 문자 남겨 주세요.</li>
					</ul>
				</div>
		</li>
	</ul>
	</div>
	
	<div id="sub">
		<span>결제 금액</span><br>
		<span class="price">${opt.option_price}</span> <span>+ 2,500원</span>
		<hr style="width: 96%; margin-top: 30px; margin-bottom: 30px;">
			<span style="text-align: center;">총 후원 금액 : <span class="price">${opt.option_price}</span> 원</span><br>
			<span style="margin: 0 auto;">배송비 : 2,500원</span><br>
			<span style="margin: 0 auto;">결제수단</span><br>
			<select id="payselect" name="payselect" size="4" style="margin: 0 auto;">
				<option value="card" selected>신용카드</option>
				<option value="kakao">카카오페이</option>
				<option value="samsung">삼성페이</option>
				<option value="payco">페이코</option>
				<option value="vbank">가상계좌</option>
				<option value="phone">휴대폰소액결제</option>
				<option value="cultureland">문화상품권</option>
				<option value="happymoney">해피머니</option>
			</select><br>
			<input type="submit"  id="reqpay" style="width: 90%; margin: 0 auto;" value="결제"> <!-- <a href="#" id="reqpay" style="width: 90%; margin: 0 auto;">결제</a> -->
	</div>
	
</div>
	<input type="hidden"  id="roadaddrPart1"  name="roadaddrPart1" />
	<input type="hidden"  id="roadaddrPart2"  name="roadaddrPart2" />
	<input type="hidden"  id="jibunaddr"  name="jibunaddr" />
	<input type="hidden" name="no" value="${member.no} ">
	<input type="hidden" name="option_no" value="${opt.option_no}">
	
	<!-- spring security -->
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	
</form>

</body>
</html>
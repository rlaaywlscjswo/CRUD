<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
.kgPayments{
	background-color: blue;
}
</style>
<script>
// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


//function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,zipNo,jibunAddr, engAddr ,admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
function jusoCallBack(roadAddrPart1, addrDetail, roadAddrPart2, jibunAddr, zipNo){		

		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
		document.form.jibunAddr.value = jibunAddr;
		
		// 전체 주소
		document.getElementById('fulladdr').value=roadAddrPart1 +", "+addrDetail + " " + roadAddrPart2;
}

// 상세주소 수정 할 때, 전제 주소도 동시에 변경.
function addr(val){
	let addr1 = document.getElementById('roadAddrPart1').value;
	let addr2 = document.getElementById('roadAddrPart2').value;
	let detail = document.getElementById('addrDetail').value;
	document.getElementById('fulladdr').value="";
	document.getElementById('fulladdr').value=addr1 +", "+detail + " " + addr2;
}

</script>
<script>
$(document).ready(function(){
	var paymethod = "card";	
	
	$("#option").on('change', function() {
		console.log($(this).val());
		$("#options").val($(this).val());
	});
	
	/* $("#payselect").on('change', function() {
		paymethod = $(this).val();
		console.log(paymethod);
	}); */
	
	$("#newaddr").on('change', function() {
		
	});
	
	// 결제 방법
	$( "form" ).submit(function( event ) {
		event.preventDefault();
		let paymethod = $("#payselect").val();	
		console.log("submit ....");
		requestPay(paymethod);
	});
		
	
// 결제
var IMP = window.IMP; // 생략가능
IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
function requestPay(paymethod) {
	let option = parseInt($("#option_price").text()); // 상품 가격
	let delivery = parseInt($("#delivery_pay").text()); // 배송비
	console.log(delivery+option);
	IMP.request_pay({
	    pg : 'inicis',  
	    pay_method : paymethod,  
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : $("#option_name").val(),			// 상품명
	    amount : delivery + option, 			// 결제 금액
	    buyer_email : 'iamport@siot.do', 		// 메일주소
	    buyer_name : $("#name").val(), 			// 구매자 이름
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
	        
	        jQuery.ajax({
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
	          $("#form").submit();
	        })
	      } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
	      }
	    alert(msg);
	});
}
});
</script>
</head>
<body>
<div style="width: 80%; margin: 0 auto; ">
<div style=" border: 1px solid blue; margin-bottom: 10px; float: left; width: 100%">
<form name="form" id="form" method="post" action="paymentsuccess">
<span>주문/결제</span>
	<table>
		<thead>
			<tr>
				<th>후원하는 프로젝트 옵션 정보</th>
				<th>프로젝트 작성자</th>
				<th>배송비</th>
				<th>후원금액</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>프로젝트 옵션1</td>
				<td>홍길동</td>
				<td id="delivery_pay">2500</td>
				<td id="option_price">10000</td>
			</tr>
		</tbody>
	</table>
</div>
<div style=" border: 1px solid blue; float: left; width: 64%">
<span>주문자 정보</span>
<ul>
	<li>이름 : <span>홍길동</span></li>
	<li>이메일 : <span>idon@naver.com</span></li>
</ul>

	<span>배송지 정보</span>
	<ul>
		<li>배송지 선택 <input type="radio" name="addrs">기본 배송지<input type="radio" name="addrs" id="newaddr">신규 배송지</li>
		<li>수령인 : <input type="text" id="name" required="required"> </li>
		<li>연락처 : <input type="text" required="required"> </li>
		<li>배송지 주소 : <input type="text"  style="width:70px;" id="zipNo"  name="zipNo" required="required" onClick="goPopup();" /> 
		<input type="button" onClick="goPopup();" value="우편 번호"/> <input type="checkbox"> 배송지목록에 추가 <br>
			<input type="text" style="width: 500px;" id="fulladdr" readonly="readonly"> 
			<input type="text"  style="width:100px;" id="addrDetail"  name="addrDetail"  onkeyup="addr(this.value)"/>
		</li>
		<li>요청사항 : <select id="option">
							<option selected>경비실에 맡겨주세요.</option>
							<option>배송 전 연락주세요.</option>
						</select> <input type="text" id="options" value="경비실에 맡겨주세요."></li>
	</ul>
	</div>
	
	<div style="border: 1px solid blue; float: right; width: 35%;">
		<span>결제 금액</span>
		<span>n + 2,500원</span>
		<hr style="width: 96%; margin-top: 30px; margin-bottom: 30px;">
			<span style="text-align: center;">총 후원 금액 : n 원</span><br>
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
	<input type="hidden"  id="roadAddrPart1"  name="roadAddrPart1" />
	<input type="hidden"  id="roadAddrPart2"  name="roadAddrPart2" />
	<input type="hidden"  id="jibunAddr"  name="jibunAddr" />
</form>

</body>
</html>
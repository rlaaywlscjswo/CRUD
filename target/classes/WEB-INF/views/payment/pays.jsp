<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/pays.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
.memo{
	margin-bottom: 0px;
}
.radioul li{
	margin-bottom: 0px;
}
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
		let strarr = $("#address_photo").val().split('-');
		$('#phone_one').val(strarr[0]);
		$('#phone_two').val(strarr[1]);
		$('#phone_three').val(strarr[2]);
		jusoCallBack("${addr.roadaddrPart1}", "${addr.addrDetail}", "${addr.roadaddrPart2}", "${addr.jibunaddr}", "${addr.zipno}");
		$("input[name='default_addrs']").prop("checked", true);
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
			let strarr = $("#address_photo").val().split('-');
			$('#phone_one').val(strarr[0]);
			$('#phone_two').val(strarr[1]);
			$('#phone_three').val(strarr[2]);
			$("input[name='default_addrs']").prop("checked", true);
			$("input[name='addr_add']").prop("checked", false);
		} else { 
			$("#address_name").val("");
			$("#address_photo").val("");
			$("#alias").val("");
			$("#zipno").val("");
			$("#addrDetail").val("");
			$("#fulladdr").val("");
			$("input[name='default_addrs']").prop("checked", false);
			$("input[name='addr_add']").prop("checked", false);
		}
	});
	
	//주소목록 팝업 호출
	$('#addrslist').on('click', function(){
		let pop = window.open("addrPopup?no=${member.no}","pop","width=720,height=900, scrollbars=yes, resizable=yes"); 
		console.log("자식 브라우저 : ${member.no}")
	});
	 
	//배송지 목록 추가 여부
	$('#reqpay').on('click', function() {
		console.log("결제 클릭");		
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
		
		let phone_number = $('#phone_one').val()+"-"+$('#phone_two').val()+"-"+$('#phone_three').val();
		$('#address_photo').val(phone_number);
		console.log($('#address_photo').val());
		
		let paymethod = $("input[name='payselect']:checked").val(); 
		console.log("음"+paymethod);
		requestPay(paymethod);
	});
	
	// 결제
	function requestPay(paymethod) {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp17753765'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		let option = parseInt($("#option_price").text()); // 상품 가격
		//let del = $("#delivery_pay").text();
		//let delivery = 0;//parseInt($("#delivery_pay").text()); // 배송비
	IMP.request_pay({
	    pg : 'inicis',  
	    pay_method : paymethod,  
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : "${opt.option_name}",			// 상품명
	    amount : "${opt.option_price}",// 결제 금액
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
	        
	        jQuery.ajax({
	            url: "http://localhost:8080/sloth", // 가맹점 서버
	            method: "POST",
	            headers: { "Content-Type": "application/json" },
	            data: {
	                imp_uid: rsp.imp_uid,
	                merchant_uid: rsp.merchant_uid
	            }
	        }).done(function (data) {
	          // 가맹점 서버 결제 API 성공시 로직
	          console.log("결제 성공!! : "+data);
	        })
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
	let strarr = address_photo.split('-');
	$('#phone_one').val(strarr[0]);
	$('#phone_two').val(strarr[1]);
	$('#phone_three').val(strarr[2]);
	$("#basicaddr").prop("checked", true).prop("disabled", false);
	$("input[name='addr_add']").prop("checked", false);
	document.getElementById('fulladdr').value=roadaddrPart1 +", "+addrDetail + " " + roadaddrPart2;
}
</script>
</head>
<body>
<form name="form" id="frm" method="post" action="success">
	<div class="col-xs-offset-1 col-xs-10">
		<div class="rows">
			<div class="col-xs-12">
				<h2 class="margin-none">주문하기</h2>
			</div>
		</div>
		<div class="rows">
			<div class="col-xs-12">
				<div class="card">
					<div class="card-body">
						<div>
						<ul class="list-unstyled margin-top-5 margin-bottom-0">							
								<li class="padding-bottom-0 padding-top-0 " id="bottom-0">
								<div class="protitle">
								<img class="width-120px border-radius" src="${pdto.project_photo }" title="이미지">
								<h4 class="card-title order-info-gig-body margin-top-0 titleh4">${pdto.project_title }</h4>
								</div>
								</li>
								<li class="padding-bottom-0 padding-top-0">								
									<span class="font-color-lighter">${alias}</span>
								</li>
							</ul>
						</div>

						<table class="order-table">
							<colgroup>
								<col width="30%">
								<col width="50%">
								<col width="15%">
							</colgroup>
							<thead class="order-package">
								<tr>
									<th class="text-center">옵션</th>
									<th>옵션내용</th>
									<th class="text-right">가격</th>
								</tr>
							</thead>
							<tbody class="order-option">
								<tr>
									<td>
										<ul class="list-unstyled orderBill">
											<li
												class="padding-left-5  padding-bottom-0 padding-right-10 font-color-light padding-bottom-0 jumuninfo">
												<img class="done" alt="옵션" src="/resources/img/24px.svg">&nbsp;${opt.option_name } &nbsp;
											</li>
										</ul></td>
									<td class="text-center">${opt.option_contents}</td>
									<td class="text-right"><span id="option_price" class="tahoma price">${opt.option_price }</span>원</td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>


		<div class="rows">
			<div class="col-xs-12">
				<div class="card">
					<div class="card-header">의뢰인 정보</div>
					<div class="card-body">
						<div class="card-text">
							<ul class="list-unstyled margin-top-5 margin-bottom-0">
								<li class="padding-bottom-0 padding-top-0">이름 <span>&nbsp;:&nbsp;${member.name }</span></li>
								<li class="padding-bottom-0 padding-top-0">이메일<span>&nbsp;:&nbsp;${member.email }</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div id="addressWrap" class="rows">
			<div class="col-xs-12">
				<div class="card">
					<div class="card-header">배송지 정보</div>
					<div class="card-body">
						<div class="card-text">
							<ul class="list-inline margin-bottom-0">
								<li>
									<span>배송지 선택&nbsp;&nbsp; </span>
									<input id="basicaddr" name="addrs" type="radio" class="radio" value="basicaddr" disabled="disabled"> <label	for="basicaddr">기본 배송지</label>
									<input id="newaddr" name="addrs" type="radio" class="radio" value="newaddr"> <label	for="newaddr">신규 배송지</label>
									<input type="button" id="addrslist" name="addrslist" value="배송지목록" />
								</li>
								<li>
									<label for="alias">
										<strong class="shipping-necessary">배송지 명</strong>
									</label>
								</li>
								<li>
									<input type="text" id="alias" name="alias" class="form-control input-xs pnum" required="required">
								</li>
								<li>
									<label for="address_name">
										<strong class="shipping-necessary">이름</strong>
									</label>
								</li>
								<li>
									<input type="text" id="address_name" name="address_name" class="form-control input-xs pnum address_name" placeholder="받는 분" required="required">
								</li>
								<li>
									<label for="address_photo">
										<strong class="shipping-necessary">연락처</strong>
										<input type="hidden" id="address_photo" name="address_photo">
									</label>
								</li>
								<li style="width:588px; ">
									<div class="pnum numnum">
										<select class="form-control input-xs" id="phone_one">
											<option value="010" selected="">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
											<option value="02">02</option>
											<option value="031">031</option>
											<option value="032">032</option>
											<option value="033">033</option>
											<option value="041">041</option>
											<option value="042">042</option>
											<option value="043">043</option>
											<option value="044">044</option>
											<option value="051">051</option>
											<option value="052">052</option>
											<option value="053">053</option>
											<option value="054">054</option>
											<option value="055">055</option>
											<option value="061">061</option>
											<option value="062">062</option>
											<option value="063">063</option>
											<option value="064">064</option>
											<option value="050">050</option>
											<option value="0502">0502</option>
											<option value="0503">0503</option>
											<option value="0504">0504</option>
											<option value="0505">0505</option>
											<option value="0506">0506</option>
											<option value="0507">0507</option>
											<option value="070">070</option>
											<option value="080">080</option>
											<option value="0130">0130</option>
											<option value="0303">0303</option>
										</select>

										<div class="numtail">
										<div>-</div>

										<div>
											<input type="text" maxlength="4"
												class="form-control input-xs" required="required" id="phone_two">
										</div>

										<div>-</div>

										<div>
											<input type="text" maxlength="4"
												class="form-control input-xs" required="required" id="phone_three">
										</div>
										</div>
										
									</div>

								</li>

								<li>
									<label for="fulladdr">
										<strong class="shipping-necessary">주소</strong>
									</label>
								</li>
								<li>
									<div class="pnum">										
										<div class="addrs">
										<input type="text" id="zipno" class="form-control input-xs width-100 goPopup" name="zipno" required="required" readonly="readonly" placeholder="우편번호">
										<input type="button" id="goPopup" class="btn btn-xss btn btn-primary goPopup" value="우편 번호"/>
										<input type="checkbox" name="addr_add" id="addr_add" value="addr_add"> 배송지목록에 추가 
										<input type="checkbox" id="default_addrs" name="default_addrs" value="default_addr"> 기본 배송지로 설정 <br>
										</div>
									</div>
								</li>
								<li id="fdaddr">
									<label for="fulladdr"></label>
									<input type="text" id="fulladdr" class="form-control input-xs" name="fulladdr" required="required" readonly="readonly" placeholder="기본주소" > 
									<input type="text" id="addrDetail" class="form-control input-xs" name="addrDetail" required="required" placeholder="나머지주소" />
								</li>
								
								<li><label for="options">요청 사항</label>
									<input type="text" id="options" name="options" class="form-control input-xs" value="요청사항을 직접 입력하세요.">
									<div id="memos" style="display: none;">
										<ul>
											<li class="memo">배송 전에 미리 연락 바랍니다.</li>
											<li class="memo">부재시 경비실에 맡겨 주세요.</li>
											<li class="memo">부재시 전화 주시거나 문자 남겨 주세요.</li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="rows">
			<div class="col-xs-12">
				<div class="card">
					<div class="card-header">결제금액</div>
					<div class="card-body">
						<div class="card-text">
							<ul class="list-unstyled margin-top-5 margin-bottom-0">
								<li>
									<h3 class="margin-none">
										<b>총 결제금액</b> <span class="font-size-h5">(VAT 포함)</span>
									</h3>
									<h2 class="text-center margin-top-50 color-red"
										style="font-size: 30px !important;">
										<span class="tahoma price"> ${opt.option_price}</span><span>원</span>
									</h2>
								</li>
							</ul>
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- 결제금액 -->

		<div class="rows">
			<div class="col-xs-12">

				<div class="card">
					<div class="card-header">결제방법</div>
					<div class="card-body">
						<div class="card-text">
							<ul class="list-unstyled margin-top-5 margin-bottom-0">
								<li>
									<ul class="radioul">
										<li>
											<input id="card" name="payselect" type="radio" class="radio" checked="checked" value="card">
											<label for="card">신용카드</label>
										</li>
										<li>
											<input id="kakao" name="payselect" type="radio" class="radio" value="kakao">
											<label for="kakao">카카오페이</label>
										</li>
										<li>
											<input id="samsung" name="payselect" type="radio" class="radio" value="samsung">
											<label for="samsung">삼성페이</label>
										</li>
										<li>
											<input id="payco" name="payselect" type="radio" class="radio" value="payco">
											<label for="payco">
												<img style="height: 14px; position: relative; top: 5px;" src="https://s3-ap-northeast-1.amazonaws.com/kmong-static/assets/icon/ic_payco.png">
											</label>
										</li>
										<li>
											<input id="vbank" name="payselect" type="radio" class="radio" value="vbank">
											<label for="vbank">가상계좌</label>
										</li>
										<li>
											<input id="phone" name="payselect" type="radio" class="radio" value="phone">
											<label for="phone">휴대폰소액결제</label>
										</li>
										<li>
											<input id="cultureland" name="payselect" type="radio" class="radio" value="cultureland">
											<label for="cultureland">문화상품권</label>
										</li>
										<li>
											<input id="happymoney" name="payselect" type="radio" class="radio" value="happymoney">
											<label for="happymoney">해피머니</label>
										</li>
									</ul>
								</li>
							</ul>
						</div>						
					</div>					
				</div>
				<input type="submit" id="reqpay" class="btn btn-primary" style="width: 100%; margin: 0 auto;" value="결제">
			</div>
		</div>

	</div>
	<input type="hidden"  id="roadaddrPart1"  name="roadaddrPart1" />
	<input type="hidden"  id="roadaddrPart2"  name="roadaddrPart2" />
	<input type="hidden"  id="jibunaddr"  name="jibunaddr" />
	<input type="hidden" name="no" value="${member.no} ">
	<input type="hidden" name="option_no" value="${opt.option_no}">
	
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>

</body>
</html>
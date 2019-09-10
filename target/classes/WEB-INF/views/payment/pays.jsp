<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	box-sizing: border-box;
	word-break: break-all;
}

body {
	letter-spacing: -.3px;
	background: white !important;
	font-size: 14px;
}

.containers {
	width: 100%;
	margin-right: auto;
	margin-left: auto;
	padding-left: 15px;
	padding-right: 15px;
	margin-right: auto;
}

.row {
	width: 50%;
	margin: 0 auto;
}
h2 {
	font-size: 20px !important;
	font-family: "NotoSansKR Regular" !important;
	font-weight: 400;
	line-height: 1.1;
	color: inherit;
	display: block;
	margin-block-start: 0.83em;
	margin-block-end: 0.83em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
}
.col-xs-12, .panel{
	width: 100%;
}
.panel-default>.panel-heading {
    color: #4d4d4d;
    background-color: #E8E8E8;
    border-color: #E6E6E6;
}
.margin-top-30 {
    margin-top: 20px !important;
}
.panel-heading {
	border-top: 1.2px solid silver;
    padding: 10px 12px;
    border-bottom: 1px solid transparent;
}
.bg-color-gray {
    background-color: #F1F1F1 !important;
}
.panel {
    margin-top: 10px;
    margin-bottom: 10px;
    background-color: #fff;
    border: 1px solid transparent;
    border-radius: 5px;
}
.panel-body {
	width: 100%;
	border: 1px solid silver;
	padding: 20px;
	border: 1px solid silver;
}

.width-120px {
	width: 120px;
	margin-right: 10px;
}

.width-20px {
	width: 20px;
}

table {
	margin-top: 10px;
	width: 100%;
}

.order-table {
	margin-top: 25px;
	width: 100%;
	border-collapse: collapse;
}
.order-info-gig-body {
    height: 59px;
    line-height: 23px;
}

th {
	display: table-cell;
	vertical-align: inherit;
	font-weight: bold;
	text-align: -internal-center;
}

.order-package th {
	background-color: #E4EAF7;
}

.order-table td, .order-table th {
	padding: 7px 15px;
}
.done{
	width: 15px;
}
/* .awesome-radio-text{
	margin-left: 16px;
    position: relative;
    bottom: 5px;
}
#newDeliveryData{
	margin-left: 10px;
} */
li {
    text-align: -webkit-match-parent;
}
label {
    display: inline-block;
    max-width: 100%;
   /*  margin-bottom: 10px; */
}
/* .awesome-radio input[type="radio"] {
    opacity: 0;
    z-index: 1;
    position: absolute;
}
input[type="radio"] {
    -webkit-appearance: radio !important;
}
input[type="radio"], input[type="checkbox"] {
    margin: 4px 0 0;
    margin-top: 1px \9;
    line-height: normal;
}
input[type="checkbox"], input[type="radio"] {
    box-sizing: border-box;
    padding: 0;
}
.position-absolute {
    position: absolute;
}
.awesome-radio input[type="radio"]:checked+.awesome-radio-body {
    border-color: #ffd400;
}

.flex-center-center, .awesome-radio-body {
    display: flex;
    justify-content: center;
    align-items: center;
}
.awesome-radio-body {
    position: relative;
    margin-right: 5px;
    position: relative;
    width: 13px;
    height: 13px;
    border: 1px solid #979797;
    border-radius: 50%;
    background-color: #fff;
    -webkit-transition: border 0.15s ease-in-out;
    -o-transition: border 0.15s ease-in-out;
    transition: border 0.15s ease-in-out;
}
.awesome-radio-body::after {
    display: inline-block;
    position: relative;
    content: " ";
    width: 9px;
    height: 9px;
    border-radius: 50%;
    background-color: #ffd400;
    -webkit-transform: scale(0,0);
    -ms-transform: scale(0,0);
    -o-transform: scale(0,0);
    transform: scale(0,0);
    -webkit-transition: -webkit-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
    -moz-transition: -moz-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
    -o-transition: -o-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
    transition: transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
}
input {
    -webkit-appearance: none !important;
}
.awesome-radio:last-child {
    margin-bottom: 0px;
}
.margin-right-25 {
    margin-right: 25px !important;
}
.awesome-radio {
    margin-bottom: 5px;
}
.list-inline>li {
    display: inline-block;
    padding-left: 5px;
    padding-right: 5px;
}
.awesome-radio-text {
    display: inline-block;
}
.padding-all-15 {
    padding: 15px !important;
}
.list-inline {
    padding-left: 0;
    list-style: none;
    margin-left: -5px;
}
.awesome-radio>label {
    margin: 0px;
    display: flex;
    justify-content: left;
    align-items: center;
}
 */




input[type="checkbox"],
input[type="radio"] {
    border: 0;
    clip: rect(0 0 0 0);
    height: 1px;
    margin: -1px;
    overflow: hidden;
    padding: 0;
    position: absolute;
    width: 1px;
}

input[type="checkbox"]:focus + label:before,
input[type="checkbox"]:hover + label:before,
input[type="radio"]:focus + label:before,
input[type="radio"]:hover + label:before {
    border-color: black;
}

input[type="checkbox"]:active + label:before,
input[type="radio"]:active + label:before {
    -webkit-transition-duration: 0;
    transition-duration: 0;
    -webkit-filter: brightness(0.2);
    filter: brightness(0.2);
}

input[type="checkbox"] + label,
input[type="radio"] + label {
    position: relative;
    padding: 10px;
    padding-left: 2em;
    vertical-align: middle;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}

input[type="checkbox"] + label:before,
input[type="radio"] + label:before {
    box-sizing: content-box;
    content: '';
    color: #900;
    position: absolute;
    top: 50%;
    left: 0;
    width: 14px;
    height: 14px;
    margin-top: -9px;
    border: 2px solid grey;
    text-align: center;
}

input[type="checkbox"] + label:after,
input[type="radio"] + label:after {
    box-sizing: content-box;
    content: '';
    background-color: #900;
    position: absolute;
    top: 50%;
    left: 4px;
    width: 10px;
    height: 10px;
    margin-top: -5px;
    -webkit-transform: scale(0);
    transform: scale(0);
    -webkit-transform-origin: 50%;
    transform-origin: 50%;
    -webkit-transition: -webkit-transform 200ms ease-out;
    transition: -webkit-transform 200ms ease-out;
    transition: transform 200ms ease-out;
    transition: transform 200ms ease-out, -webkit-transform 200ms ease-out;
}

input[type="checkbox"] + label:after {
    background-color: transparent;
    top: 50%;
    left: 4px;
    width: 8px;
    height: 3px;
    margin-top: -4px;
    border-style: solid;
    border-color: #900;
    border-width: 0 0 3px 3px;
    -webkit-border-image: none;
    -o-border-image: none;
    border-image: none;
    -webkit-transform: rotate(-45deg) scale(0);
    transform: rotate(-45deg) scale(0);
    -webkit-transition: none;
    transition: none;
}

input[type="checkbox"]:checked + label:after {
    content: '';
    -webkit-transform: rotate(-45deg) scale(1);
    transform: rotate(-45deg) scale(1);
    -webkit-transition: -webkit-transform 200ms ease-out;
    transition: -webkit-transform 200ms ease-out;
    transition: transform 200ms ease-out;
    transition: transform 200ms ease-out, -webkit-transform 200ms ease-out;
}

input[type="radio"]:checked + label:before {
    -webkit-animation: borderscale 300ms ease-in;
    animation: borderscale 300ms ease-in;
    background-color: white;
}

input[type="radio"]:checked + label:after {
    -webkit-transform: scale(1);
    transform: scale(1);
}

input[type="radio"] + label:before,
input[type="radio"] + label:after {
    border-radius: 50%;
}

input[type="checkbox"]:checked + label:before {
    -webkit-animation: borderscale 200ms ease-in;
    animation: borderscale 200ms ease-in;
}

input[type="checkbox"]:checked + label:after {
    -webkit-transform: rotate(-45deg) scale(1);
    transform: rotate(-45deg) scale(1);
}

@-webkit-keyframes borderscale {
    50% {
        box-shadow: 0 0 0 2px #900;
    }
}

@keyframes borderscale {
    50% {
        box-shadow: 0 0 0 2px #900;
    }
}

.error-msg {
    display: block;
    color: red;
    max-height: 0;
    overflow: hidden;
    -webkit-transition: max-height 500ms ease-out;
    transition: max-height 500ms ease-out;
    will-change: max-height;
}

:required:not(:focus) ~ .error-msg,
:invalid:required ~ .error-msg {
    max-height: 9em;
}

input:focus {
    border: 1px solid black;
}

input:not(:focus):invalid {
    border: 1px solid red;
    outline: none;
}

input:not(:focus):valid {
    border: 1px solid green;
}

* {
    box-sizing: border-box;
}

form ul {
    list-style: none;
}

label {
    cursor: pointer;
    display: inline-block;
}
.radioul, .radioul li{
	display: inline-block;
}
</style>
</head>
<body>
	<div class="col-xs-offset-1 col-xs-10">
		<div class="row">
			<div class="col-xs-12">
				<h2 class="margin-none">주문하기</h2>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default border-radius-none margin-top-30">
					<div class="panel-body">
						<div>
							<div class="pull-left margin-right-20">
								<img class="width-120px border-radius"
									src="https://d2v80xjmx68n4w.cloudfront.net/gigs/small/3a2A41523607533.jpg"
									title="[크몽 입성 기념 50%할인] 고퀄리티 디자인 홈페이지를 24시간 내 제작해 드립니다."
									onerror="this.onerror=null;this.src='/img/404/no_gig_sm_image.jpg';">
							</div>
							<div>
								<h4 class="order-info-gig-body margin-top-0">[크몽 입성 기념
									50%할인] 고퀄리티 디자인 홈페이지를 24시간 내 제작해 드립니다.</h4>
								<div class="margin-top-20 color-primary">
									<img class="border-round width-20px"
										src="https://d2v80xjmx68n4w.cloudfront.net/members/thumbs/jSRDC1523950893.jpg"
										title="SOMEGUYFACTORY"
										onerror="this.onerror=null;this.src='/img/tools/main_user.png';">
									<span class="font-color-lighter">SOMEGUYFACTORY</span>
								</div>
							</div>
						</div>
						<table class="order-table">
							<colgroup>
								<col width="55%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead class="order-package">
								<tr>
									<th>옵션항목</th>
									<th class="text-center">수량선택</th>
									<th class="text-center">작업일</th>
									<th class="text-right">가격</th>
								</tr>
							</thead>
							<tbody class="order-option">
								<tr>
									<td><span>원페이지 디자인(랜딩페이지)</span>
										<ul class="list-unstyled orderBill">
											<li	class="padding-left-5  padding-bottom-0 padding-right-10 font-color-light padding-bottom-0">
												<img class="done" alt="옵션" src="/resources/img/24px.svg">&nbsp;반응형 웹 &nbsp;
											</li>
											<li	class="padding-left-5  padding-bottom-0 padding-right-10 font-color-light padding-bottom-0">
												<img class="done" alt="옵션" src="/resources/img/24px.svg">&nbsp;섹션 수	&nbsp;
											</li>
										</ul>
									</td>
									<td>
										<div
											class="gig-detail-default-option margin-right-10 margin-top-0">
											<div class="pull-right gig-detail-decision-option-btn">
												<a> <i class="fa fa-minus" aria-hidden="true"></i>
												</a> <span><b>1</b></span> <a> <i class="fa fa-plus"
													aria-hidden="true"></i>
												</a>
											</div>
										</div>
									</td>
									<td class="text-center">1&nbsp;일</td>
									<td class="text-right"><span class="tahoma">100,000</span>원</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>

		<div id="customer_info"></div>
		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default margin-top-0">
					<div class="panel-heading bg-color-gray">의뢰인 정보</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-xs-6">
								<ul class="list-unstyled margin-top-5 margin-bottom-0">
									<li class="padding-bottom-0 padding-top-0">이름</li>
									<li class="padding-bottom-0 padding-top-0">이메일</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

<div id="addressWrap" class="row" >
			<div class="col-xs-12">
				<div class="panel panel-default margin-top-0">
					<div class="panel-heading bg-color-gray">배송지 정보</div>
					<div class="panel-body padding-left-15 padding-right-15">
						<div class="rows">
							<div class="col-xs-12">
								<ul class="list-inline margin-bottom-0">
									<li>
										<label> 
											<input id="isDeliveryData" class="position-absolute" name="ShippingInputArea" type="radio"> 
											<span class="awesome-radio-text"> 기본배송지 </span>
										</label>
										<label> 
											<input id="newDeliveryData"	class="position-absolute" name="ShippingInputArea" type="radio">
											<span class="awesome-radio-text"> 신규 배송지 </span>
										</label>
									</li>
								</ul>
							</div>
						</div>
						<div class="row margin-top-20">
							<div class="col-xs-12">
								<div class="row">
									<div class="col-xs-1 margin-top-5 width-110px">
										<strong class="shipping-necessary"> 이름 </strong>
									</div>
									<div class="col-xs-3 padding-left-0">
										<input type="text" class="form-control input-xs"
											placeholder="받는 분">
										<div class="margin-top-5" style="display: none;">
											<h6 class="margin-none color-red">필수 항목입니다.</h6>
										</div>
									</div>
								</div>
								<div class="row margin-top-15">
									<div class="col-xs-1 margin-top-5 width-110px">
										<strong class="shipping-necessary"> 연락처 </strong>
									</div>
									<div class="col-xs-10">
										<div class="row">
											<div class="col-xs-1 padding-side-0 width-70px">
												<div class="select-control bg-color-f5">
													<select class="form-control input-xs">
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
												</div>
											</div>
											<div
												class="col-xs-1 text-center width-20px margin-top-5 padding-side-0">-</div>

											<div class="col-xs-1 padding-side-0 width-70px">
												<input type="text" maxlength="4"
													class="form-control input-xs">
											</div>

											<div
												class="col-xs-1 text-center width-20px margin-top-5 padding-side-0">-</div>

											<div class="col-xs-1 padding-side-0 width-70px">
												<input type="text" maxlength="4"
													class="form-control input-xs">
											</div>
											<div class="col-xs-12 padding-left-0 margin-top-5"
												style="display: none;">
												<h6 class="margin-none color-red">필수 항목입니다.</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="row margin-top-15">
									<div class="col-xs-1 margin-top-5 width-110px">
										<strong class="shipping-necessary"> 주소 </strong>
									</div>
									<div class="col-xs-10">
										<div class="row">
											<div class="col-xs-1 padding-left-0 width-70px">
												<button class="btn btn-xss kmong-purple-btn">주소 찾기
												</button>
											</div>
											<div class="col-xs-2">
												<input type="text" class="form-control input-xs width-100"
													placeholder="우편번호">
											</div>
										</div>
										<div class="row margin-top-10">
											<div class="col-xs-7 padding-side-0">
												<input type="text" class="form-control input-xs"
													placeholder="기본주소">
											</div>
										</div>
										<div class="row margin-top-10">
											<div class="col-xs-7 padding-side-0">
												<input type="text" class="form-control input-xs"
													placeholder="나머지주소">
											</div>
										</div>
										<div class="row" style="display: none;">
											<div class="col-xs-12 padding-left-0 margin-top-5">
												<h6 class="margin-none color-red">필수 항목입니다.</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="row margin-top-15">
									<div class="col-xs-1 margin-top-5 width-110px">
										<strong> 배송 메시지 </strong>
									</div>
									<div class="col-xs-6 padding-left-0 padding-right-10">
										<div class="select-control">
											<select class="select-control input-xs">
												<option value="">배송 시 요청사항을 선택하세요.</option>
												<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
												<option value="부재시 휴대폰으로 연락주세요.">부재시 휴대폰으로 연락주세요.</option>
												<option value="집 앞에 놓아주세요.">집 앞에 놓아주세요.</option>
												<option value="택배함에 넣어주세요.">택배함에 넣어주세요.</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row margin-top-10">
									<div class="col-xs-1 margin-top-5 width-110px"></div>
									<div class="col-xs-10 padding-left-0">
										<h6 class="margin-none font-color-lighter line-height">*
											주문 후 배송지를 수정하실 경우에는 전문가에게 문의해주시길 바랍니다.</h6>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<style>
.disabled-coupon {
	color: #ccc;
	cursor: not-allowed;
}
</style>

		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default margin-top-0">
					<div class="panel-heading bg-color-gray">결제금액</div>
					<div class="panel-body color-light-yellow">
						<div class="row">
							<div class="col-xs-7 border-dashed-right">
								<div class="row">
									<div class="col-xs-12">
										<strong>쿠폰 사용</strong> <span class="pull-right"><span
											class="tahoma color-red" style="display: none;">-<span>0</span>원
										</span>
											<button class="btn btn-xss kmong-purple-btn margin-left-10"
												data-toggle="modal" data-target="#selectedCouponModal">쿠폰선택</button></span>

										<!-- Modal -->
										<div class="modal fade" id="selectedCouponModal"
											aria-labelledby="selectedCoupon" tabindex="-1" role="dialog"
											aria-hidden="true">
											<div class="modal-dialog modal-position"
												style="width: 450px;">
												<div class="modal-content">
													<div class="modal-header border-bottom-none">
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">×</span>
														</button>
													</div>
													<div class="modal-body padding-top-0">

														<div>
															<h4 class="margin-none NGB margin-bottom-10">적용 가능한
																쿠폰</h4>


															<div style="display: none;">
																<ul class="list-group">
																	<li
																		class="list-group-item coupon-group-item border-radius-none padding-left-0 radio-active">
																		<div class="awesome-radio">
																			<label> <input type="radio"
																				class="buyerCouponRadioInput"
																				name="couponRadioButton" checked=""> <span
																				class="awesome-radio-body"></span>
																				<div class="awesome-radio-text margin-left-10">
																					사용안함</div>
																			</label>
																		</div>
																	</li>


																</ul>
															</div>


															<div>
																<div class="border-solid text-center"
																	style="height: 197px; line-height: 197px;">
																	<div class="font-color-lighter">적용 가능한 쿠폰이 없습니다.</div>
																</div>
															</div>
														</div>
													</div>
													<div
														class="width-100 bg-color-f1 padding-left-15 padding-right-15 padding-bottom-15 padding-top-25">
														<span class="margin-none NGB font-size-h4">총 할인 금액</span>
														<span class="pull-right color-red font-size-h3"><span
															style="display: none;">-</span><span class="tahoma">0</span>원</span>
														<a class="btn btn-block btn-black margin-top-15">쿠폰 적용</a>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="row margin-top-20">
									<div class="col-xs-12">
										<strong>총 서비스 금액</strong> <span class="pull-right"><span
											class="tahoma">100,000</span>원</span>
									</div>
								</div>
								<div class="row margin-top-5">
									<div class="col-xs-12">
										<div style="display: none"></div>
									</div>
								</div>
								<div class="row margin-top-20">
									<div class="col-xs-12">
										<h5 class="margin-none">
											<b>캐시 사용</b> <span>(보유 크몽캐시 : <span class="tahoma">0</span>원)
											</span>
										</h5>
									</div>
								</div>
								<div class="row margin-top-10">
									<div class="col-xs-12">
										<input id="usedFundsInput" type="number"
											class="form-control input-xs width-100 position-relative">
										<img id="totallyUseFundsDelete" style="display: none"
											class="width-15px position-absolute top-10 right-95 cursor"
											src="/img/promotion/profits_cal_icon.png">
										<button class="kmong-funds-btn">전액사용</button>
									</div>
								</div>
							</div>
							<div class="col-xs-5">
								<h3 class="margin-none">
									<b>총 결제금액</b> <span class="font-size-h5">(VAT 포함)</span>
								</h3>
								<h2 class="text-center margin-top-50 color-red"
									style="font-size: 30px !important;">
									<span class="tahoma"> 100,000원 </span>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		

		<div class="row">
			<div class="col-xs-12">
				<div class="panel panel-default margin-top-0">
					<div class="panel-heading bg-color-gray">결제방법</div>
					<div class="panel-body padding-all-15">
						<ul class="radioul">
				            <li><input id="card" name="payselect" type="radio" class="radio" checked="checked" value="card"> <label for="card">신용카드</label></li>
				            <li><input id="kakao" name="payselect" type="radio" class="radio" value="kakao"> <label for="kakao">카카오페이</label></li>
				            <li><input id="samsung" name="payselect" type="radio" class="radio" value="samsung"> <label for="samsung">삼성페이</label></li>
				            <li><input id="payco" name="payselect" type="radio" class="radio" value="payco"> <label for="payco"><img style="height: 14px;"
												src="https://s3-ap-northeast-1.amazonaws.com/kmong-static/assets/icon/ic_payco.png"></label></li>
				            <li><input id="vbank" name="payselect" type="radio" class="radio" value="vbank"> <label for="vbank">가상계좌</label></li>
				            <li><input id="phone" name="payselect" type="radio" class="radio" value="phone"> <label for="phone">휴대폰소액결제</label></li>
				            <li><input id="cultureland" name="payselect" type="radio" class="radio" value="cultureland"> <label for="cultureland">문화상품권</label></li>
				            <li><input id="happymoney" name="payselect" type="radio" class="radio" value="happymoney"> <label for="happymoney">해피머니</label></li>
        				</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<input type="submit"  id="reqpay" style="width: 100%; margin: 0 auto;" value="결제">
		</div>

	</div>
</body>
</html>
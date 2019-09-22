<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/pays.css" rel="stylesheet">
</head>
<body>
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
								<li class="padding-bottom-0 padding-top-0 ">
								<div class="protitle">
								<img class="width-120px border-radius"
									src="https://d2v80xjmx68n4w.cloudfront.net/gigs/small/3a2A41523607533.jpg"
									title="[크몽 입성 기념 50%할인] 고퀄리티 디자인 홈페이지를 24시간 내 제작해 드립니다."
									onerror="this.onerror=null;this.src='/img/404/no_gig_sm_image.jpg';">
								<h4 class="card-title order-info-gig-body margin-top-0 titleh4">[크몽
									입성 기념 50%할인] 고퀄리티 디자인 홈페이지를 24시간 내 제작해 드립니다.</h4>
								</div>
								</li>
								<li class="padding-bottom-0 padding-top-0">								
									<span class="font-color-lighter">SOMEGUYFACTORY</span>
								</li>
							</ul>
						
						</div>

						<table class="order-table">
							<colgroup>
								<col width="15%">
								<col width="55%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead class="order-package">
								<tr>
									<th class="text-center">옵션</th>
									<th>옵션내용</th>
									<th class="text-center">수량</th>
									<th class="text-right">가격</th>
								</tr>
							</thead>
							<tbody class="order-option">
								<tr>
									<td><span>원페이지 디자인(랜딩페이지)</span>
										<ul class="list-unstyled orderBill">
											<li
												class="padding-left-5  padding-bottom-0 padding-right-10 font-color-light padding-bottom-0">
												<img class="done" alt="옵션" src="/resources/img/24px.svg">&nbsp;반응형
												웹 &nbsp;
											</li>
											<li
												class="padding-left-5  padding-bottom-0 padding-right-10 font-color-light padding-bottom-0">
												<img class="done" alt="옵션" src="/resources/img/24px.svg">&nbsp;섹션
												수 &nbsp;
											</li>
										</ul></td>
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


		<div class="rows">
			<div class="col-xs-12">
				<div class="card">
					<div class="card-header">의뢰인 정보</div>
					<div class="card-body">
						<div class="card-text">
							<ul class="list-unstyled margin-top-5 margin-bottom-0">
								<li class="padding-bottom-0 padding-top-0">이름</li>
								<li class="padding-bottom-0 padding-top-0">이메일</li>
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
								<li><label> <input id="isDeliveryData"
										class="position-absolute" name="ShippingInputArea"
										type="radio"> <span class="awesome-radio-text">
											기본배송지 </span>
								</label> <label> <input id="newDeliveryData"
										class="position-absolute" name="ShippingInputArea"
										type="radio"> <span class="awesome-radio-text">
											신규 배송지 </span>
								</label></li>

								<li><label><strong class="shipping-necessary">
											이름 </strong></label></li>
								<li><input type="text" class="form-control input-xs pnum"
									placeholder="받는 분"></li>

								<li><label><strong class="shipping-necessary">
											연락처</strong></label></li>
								<li style="width:588px; ">

									<div class="pnum numnum">
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

										<div class="numtail">
										<div>-</div>

										<div>
											<input type="text" maxlength="4"
												class="form-control input-xs">
										</div>

										<div>-</div>

										<div>
											<input type="text" maxlength="4"
												class="form-control input-xs">
										</div>
										</div>
									</div>


									<div class="col-xs-12 padding-left-0 margin-top-5"
										style="display: none;">
										<h6 class="margin-none color-red">필수 항목입니다.</h6>
									</div>

								</li>



								<li><label><strong class="shipping-necessary">주소</strong></label>

								</li>
								<li>
									<div class="pnum">										
										<div class="addrs">
										<input type="text" class="form-control input-xs width-100"
											placeholder="우편번호"> <input type="text"
											class="form-control input-xs" placeholder="기본주소"> <input
											type="text" class="form-control input-xs" placeholder="나머지주소">
											<button class="btn btn-xss btn btn-primary">주소 찾기</button>
										</div>
									</div>
									<div class="rows" style="display: none;">
										<div class="col-xs-12 padding-left-0 margin-top-5">
											<h6 class="margin-none color-red">필수 항목입니다.</h6>
										</div>
									</div>
								</li>
								<li><label><strong> 배송 메시지 </strong></label>
									<div class="select-control">
										<select class="select-control input-xs">
											<option value="">배송 시 요청사항을 선택하세요.</option>
											<option value="부재시 경비실에 맡겨주세요.">부재시 경비실에 맡겨주세요.</option>
											<option value="부재시 휴대폰으로 연락주세요.">부재시 휴대폰으로 연락주세요.</option>
											<option value="집 앞에 놓아주세요.">집 앞에 놓아주세요.</option>
											<option value="택배함에 넣어주세요.">택배함에 넣어주세요.</option>
										</select>
									</div>
									<h6 class="margin-none font-color-lighter line-height">*
										주문 후 배송지를 수정하실 경우에는 전문가에게 문의해주시길 바랍니다.</h6></li>
							</ul>
						</div>
					</div>
				</div>


			</div>

		</div>
		<!--배송지 정보-->


		<div class="rows">
			<div class="col-xs-12">
				<div class="card">
					<div class="card-header">결제금액</div>
					<div class="card-body">
						<div class="card-text">
							<ul class="list-unstyled margin-top-5 margin-bottom-0">
								<li><label><strong>쿠폰 사용</strong></label> <span
									class="pull-right"> <span class="tahoma color-red"
										style="display: none;">- <span>0</span>원
									</span>
										<button class="btn btn-xss btn btn-primary margin-left-10"
											data-toggle="modal" data-target="#selectedCouponModal">쿠폰선택</button>
								</span> <!-- Modal -->
									<div class="modal fade" id="selectedCouponModal"
										aria-labelledby="selectedCoupon" tabindex="-1" role="dialog"
										aria-hidden="true">
										<div class="modal-dialog modal-position" style="width: 450px;">
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
													<span class="margin-none NGB font-size-h4">총 할인 금액</span> <span
														class="pull-right color-red font-size-h3"><span
														style="display: none;">-</span><span class="tahoma">0</span>원</span>
													<a class="btn btn-block btn-black margin-top-15">쿠폰 적용</a>
												</div>
											</div>
										</div>
									</div></li>


								<li><label><strong>총 서비스 금액</strong> </label> <span
									class="pull-right"><span class="tahoma">100,000</span>원</span>
								</li>
								<li>
									<h3 class="margin-none">
										<b>총 결제금액</b> <span class="font-size-h5">(VAT 포함)</span>
									</h3>
									<h2 class="text-center margin-top-50 color-red"
										style="font-size: 30px !important;">
										<span class="tahoma"> 100,000원 </span>
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
										<li><input id="card" name="payselect" type="radio"
											class="radio" checked="checked" value="card"> <label
											for="card">신용카드</label></li>
										<li><input id="kakao" name="payselect" type="radio"
											class="radio" value="kakao"> <label for="kakao">카카오페이</label></li>
										<li><input id="samsung" name="payselect" type="radio"
											class="radio" value="samsung"> <label for="samsung">삼성페이</label></li>
										<li><input id="payco" name="payselect" type="radio"
											class="radio" value="payco"> <label for="payco"><img
												style="height: 14px;"
												src="https://s3-ap-northeast-1.amazonaws.com/kmong-static/assets/icon/ic_payco.png"></label></li>
										<li><input id="vbank" name="payselect" type="radio"
											class="radio" value="vbank"> <label for="vbank">가상계좌</label></li>
										<li><input id="phone" name="payselect" type="radio"
											class="radio" value="phone"> <label for="phone">휴대폰소액결제</label></li>
										<li><input id="cultureland" name="payselect" type="radio"
											class="radio" value="cultureland"> <label
											for="cultureland">문화상품권</label></li>
										<li><input id="happymoney" name="payselect" type="radio"
											class="radio" value="happymoney"> <label
											for="happymoney">해피머니</label></li>
									</ul>
								</li>
							</ul>
						</div>						
					</div>					
				</div>
				<input type="submit" id="reqpay" class="btn btn-primary"
							style="width: 100%; margin: 0 auto;" value="결제">
			</div>
		</div>
		<!--결제방법  -->



	</div>
	<!--전체-->











</body>
</html>
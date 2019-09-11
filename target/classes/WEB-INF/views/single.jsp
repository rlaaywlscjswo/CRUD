<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>

<!-- 댓글 JS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	var project_no = $
	{
		list.project_no
	}; // 프로젝트 번호
	console.log("프번프번"+project_no);
	$(function() {
		commentList(); //페이지 로딩시 댓글 목록 출력 

		$('[name=replyinsertbtn]').click(function() { //댓글 등록 버튼 클릭시 
			var insertData = $('[name=replyinsertform]').serialize(); //commentInsertForm의 내용을 가져옴
			console.log(insertData);
			commentInsert(insertData); //Insert 함수호출(아래)
		});

	});

	//댓글 목록 
	function commentList() {
		$
				.ajax({
					url : '/replylist',
					type : 'post',
					data : {
						"project_no" : project_no
					},
					success : function(result) {
						var a = "";
						if (result.length < 1) {
							a += '<p>' + "등록된댓글 ㄴㄴ" + '</p>';
						} else {
							$
									.each(
											result,
											function(key, value) {
												console
														.log(value.reply_contents);
												a += '<div class="comment_area section_padding_50 clearfix">';
												a += '<ol>';
												a += '<li class="single_comment_area">';
												a += '<div class="comment-wrapper d-flex">';
												a += '<div class="comment-author">';
												a += '<img src="/resources/yummy/img/blog-img/17.jpg" alt="">';
												a += '</div>';
												a += '<div class="comment-content">';
												a += '<span class="comment-date text-muted" class="commentInfo'+value.reply_no+'">'
													 + '댓글번호 : '+ value.reply_no + ' / 작성자 : ' + value.name
													 + '</span>';
												a += '<h5>Brandon Kelley</h5>';
												a += '<p class="commentContent'+value.reply_no+'">'
														+ value.reply_contents
														+ '</p>';
												a += '<a class="active" href="#">수정</a> <a href="#">삭제</a>';
												a += '</div></div></li></ol></div>';												

													
												
												
												
												
												
											});
						}
						$(".replylist").html(a);
					}
				});
	}

	//댓글 등록
	function commentInsert(insertData) {
		$.ajax({
			url : '/replyinsert',
			type : 'post',
			data : insertData,
			success : function(data) {
				if (data == 1) {
					commentList(); //댓글 작성 후 댓글 목록 reload
					$('[name=reply_contents]').val('');
				}
			}
		});
	}

	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function commentUpdate(reply_no, reply_contents) {
		console.log('no:' + reply_no);
		console.log('contents:' + reply_contents);
		var a = '';
		a += '<div class="input-group">';
		a += '<input type="text" name="reply_contents'+reply_no+'" value="'+reply_contents+'"/>';
		a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('
				+ reply_no + ');">수정</button> </span>';
		a += '</div>';
		$('.commentContent' + reply_no).html(a);

	}

	//댓글 수정
	function commentUpdateProc(reply_no) {
		var updateContent = $('[name=reply_contents' + reply_no + ']').val();
		$.ajax({
			url : '/replyupdate',
			type : 'post',
			data : {
				'reply_contents' : updateContent,
				'reply_no' : reply_no
			},
			success : function(data) {
				if (data == 1)
					commentList(project_no); //댓글 수정후 목록 출력 
			}
		});
	}

	//댓글 삭제 
	function commentDelete(reply_no) {
		$.ajax({
			url : '/replydelete/' + reply_no,
			type : 'post',
			success : function(data) {
				alert('삭제하겠습니까?');
				if (data == 1)
					commentList(project_no); //댓글 삭제후 목록 출력 
			}
		});
	}
</script>
</head>
<body>
	<!-- ****** Breadcumb Area Start ****** -->
	<div class="breadcumb-nav">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#"><i
									class="fa fa-home" aria-hidden="true"></i></a></li>
							<li class="breadcrumb-item"><a href="#"></a></li>		
							<li class="breadcrumb-item"><a href="#"></a></li>						
							<li class="breadcrumb-item active" aria-current="page">${list.project_title }</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<!-- ****** Single Blog Area Start ****** -->
	<section class="single_blog_area section_padding_80">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 col-lg-8">
					<div class="row no-gutters">

						<!-- Single Post Share Info -->
						<div class="col-2 col-sm-1">
							<div class="single-post-share-info mt-100"></div>
						</div>

						<!-- Single Post -->
						<div class="col-10 col-sm-11">
							<div class="single-post">
								<!-- Post Thumb -->
								<div class="post-thumb">
									<img src="${list.project_photo }" alt="프로젝트대표사진">
								</div>
								<!-- Post Content -->
								<div class="post-content">

									<ul class="nav nav-tabs">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#qwe">프로젝트 설명</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#asd">후기 및 평점</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#zxc">환불정책</a></li>
									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="qwe">
											<p>pdf viewer 들어올 곳</p>
										</div>
										<div class="tab-pane fade" id="asd">
											<!-- 댓글 form -->
											<form method="post" name="replyinsertform">
												<input type="hidden" id="project_no" name="project_no"
													value="${list.project_no }">
												<textarea style="width: 100%; resize: none;"
													id="reply_contents" class="form-control"
													name="reply_contents"></textarea>
												<button type="button" name="replyinsertbtn">댓글등록</button>
											</form>
											
											<div class="replylist">
 											</div>																
											
										</div>
										<div class="tab-pane fade" id="zxc">
											<p>Curabitur dignissim quis nunc vitae laoreet. Etiam ut
												mattis leo, vel fermentum tellus. Sed sagittis rhoncus
												venenatis. Quisque commodo consectetur faucibus. Aenean eget
												ultricies justo.</p>
										</div>
									</div>
								</div>
							</div>


						
						</div>
					</div>
				</div>

				<!-- ****** Blog Sidebar ****** -->
				<div class="col-12 col-sm-8 col-md-6 col-lg-4">
					<div class="blog-sidebar mt-5 mt-lg-0">
						<!-- 프로젝트 설명 -->
						<div class="single-widget-area subscribe_widget text-center">
							<div class="widget-title">
								<h6>${list.project_title }</h6>
							</div>
							<div class="subscribe-link">
								<p>조회수 ${list.project_views }</p>
								<p>카테고리번호 ${list.category_no }</p>
								<p>모인금액</p>
								<p>종료일:${list.enddate }</p>
								<p>
									펀딩진행중<br>목표금액인${list.targetprice }이 모여야만 결제됩니다.
								</p>
								<button type="button" class="btn btn-primary"
									data-toggle="modal" data-target="#exampleModalCenter">
									후원하기</button>
									<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">후원 옵션</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
    <c:forEach var="opt" items="${option }">
	 <div class="single-widget-area add-widget text-center">
                            	<div class="add-widget-area">
                            	
                                <div style="width: 289px; height: 207px;"></div>
                                <div class="add-text">
                                    <div class="yummy-table">
                                        <div class="yummy-table-cell">
                                        	<form action="/pay" method="post">	
                                            <h2>${opt.option_name}</h2>
											<p>가격 ${opt.option_price }</p>
											<p>내용 ${opt.option_contents }</p>
											<p>수량 ${opt.option_quantity }</p> 
											<input type="hidden" name="option_no" value="${opt.option_no }">
											<input type="hidden" name="option_name" value="${opt.option_name }">
											<input type="hidden" name="option_price" value="${opt.option_price }">
											<input type="hidden" name="option_contents" value="${opt.option_contents }">
											<input type="hidden" name="option_quantity" value="${opt.option_quantity }">
											<input type="hidden" name="alias" value="${list.alias}">   
											
											<button class="btn btn-primary">후원하기</button>   
										
                                            </form>                                             
                                        </div>
                                    </div>
                                </div>                               
                            	</div>
                       		 </div>			
</c:forEach>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>        
      </div>
    </div>
  </div>
</div>
							</div>
						</div>

						<!-- 창작자 설명 -->
						<div class="single-widget-area about-me-widget text-center">
							<div class="widget-title">
								<h6>여기다가는 창작자 소개</h6>
							</div>
							<div class="about-me-widget-thumb">
								<img src="${list.img}" alt="창작자프로필">
							</div>
							<h4 class="font-shadow-into-light">${list.alias}</h4>
							<p>소개글 ${list.introduce }</p>
						<button  class="btn btn-primary">쪽지로 문의하기</button> 
						</div>

						<!-- 옵션목록들 -->
						<div class="single-widget-area popular-post-widget">
							<div class="widget-title text-center">
								<h6>후원 옵션</h6>
							</div>
							
							<c:forEach var="opt" items="${option }">
							
							  <div class="single-widget-area add-widget text-center">
                            	<div class="add-widget-area">
                            	
                                <div style="width: 289px; height: 207px;"></div>
                                <div class="add-text">
                                    <div class="yummy-table">
                                        <div class="yummy-table-cell">
                                        	<form action="/pay" method="post">	
                                            <h2>${opt.option_name}</h2>
											<p>가격 ${opt.option_price }</p>
											<p>내용 ${opt.option_contents }</p>
											<p>수량 ${opt.option_quantity }</p> 
											<input type="hidden" name="option_no" value="${opt.option_no }">
											<input type="hidden" name="option_name" value="${opt.option_name }">
											<input type="hidden" name="option_price" value="${opt.option_price }">
											<input type="hidden" name="option_contents" value="${opt.option_contents }">
											<input type="hidden" name="option_quantity" value="${opt.option_quantity }">
											<input type="hidden" name="alias" value="${list.alias}">   
											
											<button class="btn btn-primary">후원하기</button>   
										
                                            </form>                                             
                                        </div>
                                    </div>
                                </div>                               
                            	</div>
                       		 </div>							
							</c:forEach>		
						</div>
						</div>
				</div>
			</div>
		</div>
	</section>
	<!-- ****** Single Blog Area End ****** -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
 	<!-- Preloader Start -->
    <div id="preloader">
        <div class="yummy-load"></div>
    </div>
    <!-- ****** Welcome Post Area Start ****** -->
    <section class="welcome-post-sliders owl-carousel">

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/resources/yummy/img/bg-img/slide-1.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/resources/yummy/img/bg-img/slide-2.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/resources/yummy/img/bg-img/slide-3.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/resources/yummy/img/bg-img/slide-4.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

        <!-- Single Slide -->
        <div class="welcome-single-slide">
            <!-- Post Thumb -->
            <img src="/resources/yummy/img/bg-img/slide-4.jpg" alt="">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#">May 19, 2017</a>
                    <a href="#">5 Comment</a>
                </div>
                <a href="#">
                    <h5>“I’ve Come and I’m Gone”: A Tribute to Istanbul’s Street</h5>
                </a>
            </div>
        </div>

    </section>
    <!-- ****** Welcome Area End ****** -->

    <!-- ****** Categories Area Start ****** -->
    <section class="categories_area clearfix" id="about">
        <div class="container">
        
        	<!-- 메인에서 인기별로 뿌려줄 캐러셀 css 이거 갖다쓰면됨!!!!! class container안에 써야함-->
							<div class="related-post-area section_padding_50">
								<h4 class="mb-30">새로운 프로젝트</h4>

								<div class="related-post-slider owl-carousel">
									<!-- Single Related Post-->		
									
									<c:forEach var="newProject" items="${newProject}">
									<div class="single-post">
										<!-- Post Thumb -->
										<div class="post-thumb">
											<img src="${newProject.project_photo}" alt="프로젝트대표사진"> 
										</div>
										<!-- Post Content -->
										<div class="post-content">
											<div class="post-meta d-flex">
												<div class="post-author-date-area d-flex">
													<!-- Post Author -->
													<div class="post-author">
														<a>지울거임</a>
													</div>
													<!-- Post Date -->
													<div class="post-date">
														<a>${newProject.alias}</a>
													</div>
												</div>
											</div>
											<a href="projectdetail/${newProject.project_no }">
												<h6>${newProject.project_title}</h6>
											</a>
										</div>
									</div>
									</c:forEach>	
													
								</div>
							</div>
        
        
        	<div class="related-post-area section_padding_50">
								<h4 class="mb-30">인기 프로젝트</h4>
								<div class="related-post-slider owl-carousel">
								<!-- Single Related Post-->									
									<c:forEach var="popularProject" items="${popularProject}">
									<div class="single-post">
										<!-- Post Thumb -->
										<div class="post-thumb">
											<img src="${popularProject.project_photo}" alt="프로젝트대표사진"> 
										</div>
										<!-- Post Content -->
										<div class="post-content">
											<div class="post-meta d-flex">
												<div class="post-author-date-area d-flex">
													<!-- Post Author -->
													<div class="post-author">
														<a>지울거임</a>
													</div>
													<!-- Post Date -->
													<div class="post-date">
														<a>${popularProject.alias}</a>
													</div>
												</div>
											</div>
											<a href="projectdetail/${popularProject.project_no }">
												<h6>${popularProject.project_title}</h6>
											</a>
										</div>
									</div>
									</c:forEach>           				  
                     				</div>
								</div>
        
        <div class="related-post-area section_padding_50">
								<h4 class="mb-30">성공 임박 프로젝트</h4>

								<div class="related-post-slider owl-carousel">
								<c:forEach var="successApproach" items="${successApproach}">
									<div class="single-post">
										<!-- Post Thumb -->
										<div class="post-thumb">
											<img src="${successApproach.project_photo}" alt="프로젝트대표사진"> 
										</div>
										<!-- Post Content -->
										<div class="post-content">
											<div class="post-meta d-flex">
												<div class="post-author-date-area d-flex">
													<!-- Post Author -->
													<div class="post-author">
														<a>지울거임</a>
													</div>
													<!-- Post Date -->
													<div class="post-date">
														<a>${successApproach.alias}</a>
													</div>
												</div>
											</div>
											<a href="projectdetail/${successApproach.project_no }">
												<h6>${successApproach.project_title}</h6>
											</a>
										</div>
									</div>
									</c:forEach>  						
								</div>
							</div>
        
        
        
        
        
        
        
        
        
        
        
            <div class="row">    
            	<div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory wow fadeInUp" data-wow-delay=".3s">
                        <img src="/resources/yummy/img/catagory-img/1.jpg" alt="">
                        <div class="catagory-title">
                            <a href="#">
                                <h5>Food</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory wow fadeInUp" data-wow-delay=".6s">
                        <img src="/resources/yummy/img/catagory-img/2.jpg" alt="">
                        <div class="catagory-title">
                            <a href="#">
                                <h5>Cooking</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single_catagory wow fadeInUp" data-wow-delay=".9s">
                        <img src="/resources/yummy/img/catagory-img/3.jpg" alt="">
                        <div class="catagory-title">
                            <a href="#">
                                <h5>Life Style</h5>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ****** Categories Area End ****** -->


    <!-- ****** Instagram Area Start ****** -->
    <div class="instargram_area owl-carousel section_padding_100_0 clearfix" id="portfolio">

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="/resources/yummy/img/instagram-img/1.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="/resources/yummy/img/instagram-img/2.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="/resources/yummy/img/instagram-img/3.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="/resources/yummy/img/instagram-img/4.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="/resources/yummy/img/instagram-img/5.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="/resources/yummy/img/instagram-img/6.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="/resources/yummy/img/instagram-img/1.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Instagram Item -->
        <div class="instagram_gallery_item">
            <!-- Instagram Thumb -->
            <img src="/resources/yummy/img/instagram-img/2.jpg" alt="">
            <!-- Hover -->
            <div class="hover_overlay">
                <div class="yummy-table">
                    <div class="yummy-table-cell">
                        <div class="follow-me text-center">
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i> Follow me</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!-- ****** Our Creative Portfolio Area End ****** -->    
</body>
</html>
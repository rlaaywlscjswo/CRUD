<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
#page{
position: relative;

left: 900px;
}
#page li{
display: inline-block;
}
</style>
</head>
<body>

   <!-- Page Content -->
  <div class="container">

    <div class="row">

      <div class="col-lg-3">

        <h1 class="my-4">Shop Name</h1>
        <div class="list-group">
          <a href="#" class="list-group-item">Category 1</a>
          <a href="#" class="list-group-item">Category 2</a>
          <a href="#" class="list-group-item">Category 3</a>
        </div>

      </div>
      <!-- /.col-lg-3 -->

      <div class="col-lg-9">

        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
          <ol class="carousel-indicators">
            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
          </ol>
          <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
              <img class="d-block img-fluid" src="http://localhost:8080/resources/img/puppy-1207816_1920.jpg" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://localhost:8080/resources/img/dog-2785074_1920.jpg" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://localhost:8080/resources/img/cat-3586451_1920.jpg" alt="Third slide">
            </div>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
		<p>${searchtxt}을  검색한 결과 총 ${total }개 나왔습니다~ </p>
        <div class="row">
			
			
		<c:forEach var="item" items="${list }">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="projectdetail/${item.project_no }"><img class="card-img-top" src="${item.project_photo }" alt="프로젝트대표사진"></a>
              <div class="card-body">           

				이름:<c:out value="${item.name}"></c:out><br>
				프로젝트번호:<c:out value="${item.project_no }"></c:out><br>
				프로젝트제목:<c:out value="${item.project_title }"></c:out><br>
				카테고리번호:<c:out value="${item.category_no }"></c:out><br>
				조회수:<c:out value="${item.project_views }"></c:out><br>	
				사진:<c:out value="${item.project_photo }"></c:out><br>	
              </div>
              <div class="card-footer">
                <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
              </div>
            </div>
          </div>
</c:forEach>
        
        </div>
        <!-- /.row -->

      </div>
      <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

  </div>
  <!-- /.container -->




<!-- 페이징 -->
<ul id="page">		
			<li>			
				<c:if test="${page.prev}">
			<a href="projectlist?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">이전</a>	
				</c:if>					
			</li>			
					
			<c:forEach var="i" begin="${page.startBlock}" end="${page.endBlock }">	
				
			<li>				
			<a href="projectlist?currPage=${i }&searchtxt=${searchtxt }"><c:out value="${i }"/></a>						
			</li>	
				
			</c:forEach>	
			
			<li>			
			<c:if test="${page.next}">
			<a href="projectlist?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">다음</a>
			</c:if>			
			</li>	
					
		</ul>
		
		
		
	
		
		
		
        
</body>
</html>
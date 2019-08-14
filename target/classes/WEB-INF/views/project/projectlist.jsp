<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
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
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
            </div>
            <div class="carousel-item">
              <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
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

        <div class="row">
			
			
		<c:forEach var="item" items="${list }">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="card h-100">
              <a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>
              <div class="card-body">           

<c:out value="${item.no}"></c:out><br>
<c:out value="${item.project_no }"></c:out><br>
<c:out value="${item.project_title }"></c:out><br>
<c:out value="${item.category_no }"></c:out><br>		
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

검색 결과 총 ${total }개 나왔습니다~


<!-- 페이징 -->
<ul>		
			<li>			
				<c:if test="${page.prev}">
			<a href="projectlist?currPage=${page.startBlock-1 }&search=${search}&searchtxt=${searchtxt}">이전</a>	
				</c:if>					
			</li>			
					
			<c:forEach var="i" begin="${page.startBlock}" end="${page.endBlock }">	
				
			<li>				
			<a href="projectlist?currPage=${i }&search=${search }&searchtxt=${searchtxt }"><c:out value="${i }"/></a>						
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
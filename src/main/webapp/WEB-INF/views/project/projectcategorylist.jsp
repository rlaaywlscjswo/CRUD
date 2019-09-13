<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<section class="archive-area section_padding_80">
        <div class="container">
            <div class="row">

                <!-- Single Post -->
                <c:forEach var="item" items="${list }">
                <div class="col-12 col-md-6 col-lg-4">
                     <div class="card h-100">
              <a href="projectdetail/${item.project_no }"><img class="card-img-top" src="${item.project_photo }" alt="프로젝트대표사진"></a>
              <div class="card-body">           

				창작자:<c:out value="${item.alias}"></c:out><br>
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
				



<!-- 페이징 -->
 <div class="col-12">
               <div class="pagination-area d-sm-flex mt-15">
                    <nav aria-label="#">
                       <ul class="pagination">	
			<li class="page-item">			
				<c:if test="${page.prev}">
			<a class="page-link" href="projectcategorylist?currPage=${page.startBlock-1 }">이전</a>	
				</c:if>					
			</li>			
					
			<c:forEach var="i" begin="${page.startBlock}" end="${page.endBlock }">	
				
			<li class="page-item">				
			<a class="page-link" href="projectcategorylist?currPage=${i }"><c:out value="${i }"/></a>						
			</li>	
				
			</c:forEach>	
			
			<li class="page-item">			
			<c:if test="${page.next}">
			<a class="page-link" href="projectcategorylist?currPage=${page.endBlock+1 }">다음</a>
			</c:if>			
			</li>
					
		</ul>
		</nav>
		</div>
		</div>
		
		</div>
				</div>
</section>     
</body>
</html>	
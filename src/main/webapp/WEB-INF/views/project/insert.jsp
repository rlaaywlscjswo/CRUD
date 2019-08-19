<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script> 
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
<style type="text/css">
ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;
    
    font-family:"dotum";
    font-size:12px;
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width:200px;
    height: 31px;
    line-height: 31px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fafafa;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
    background: #FFFFFF;
    border-bottom: 1px solid #FFFFFF;
}
.tab_container {
    border: 1px solid #eee;
    border-top: none;
    clear: both;
    float: left;
    width: 1000px;
    height: 500PX;
    background: #FFFFFF;
}
.tab_content {
    padding: 5px;
    font-size: 12px;
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    padding:5px;
    list-style:none;
}
;
 #container {
    width: 500px;
    margin: 0 auto;
   

}
</style>
<script type="text/javascript">
$(function () {
  
    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
 


    $("#main_category").on('change',function(){
    	$("#category_no").empty();
    	/* console.log($(this).val()); */
    	
       var main_category=$(this).val();   
      /*   var d=JSON.stringify( {'main_category=' : $(this).val()} );  */
        $.ajax({  
        	method:"GET",
        	dataType: "JSON",
        	/* contentType:"application/json;charset=UTF-8",  */
           /*   data:d,  */
            url:"http://localhost:8080/project/category",
      		data:'main_category='+main_category, 
            success:function(data){   
            	console.log(data);
            	
            	$.each(data,function(i,item){
            		console.log(item.category_no);  
            		console.log(item.sub_category);
            		$("#category_no").append("<option value='"+item.category_no+"'>"+item.sub_category+"</option>");
            		});
            }
        });          
    });    
});
</script>

</head> 
<body>
 <div id="container">
     <ul class="tabs">
        <li class="active" rel="tab1">(1)기본 정보</li>
        <li rel="tab2">(2)사업자 정보</li>
        <li rel="tab3">(3)창작자 정보</li>
        <li rel="tab4">(4)프로젝트 설명</li>
        <li rel="tab5">(5)옵션 설정</li>
    </ul>
    
<div class="tab_container">
 
 <form name="file" method="post" action="projectresult" enctype="multipart/form-data">
    	<div id="tab1" class="tab_content">
           <ul> 
           
 			<li>
 			<label for="project_title">프로젝트 제목</label>
 			<input type="text" id="project_title" name="project_title">
 			</li>
 
 			<li>
			<label for="main_category">대분류</label>
			<select id="main_category" name="main_category" id="default">
			<c:forEach var="main" items="${mainlist }">
			<option value="${main.main_category }">${main.main_category }</option>
			</c:forEach>
			</select>
 			</li>  
 			
 			<li>
		    <label for="category_no">소분류</label>
			<select id="category_no" name="category_no">
			</select>
			</li>  
			
 			<li>
 			<label for="file">프로젝트 대표사진</label>
 			<input type="file" id="file" name="file"> 
 			</li>
 
 			<li>
 		<a href="#" id="btn2">다음</a>
 			</li>
 			
 			</ul> 
 			
 		</div>
        <!-- #tab1 -->
        
        <div id="tab2" class="tab_content">
        <ul>
        <li>
        <label for="business_name">사업자명</label>
 		<input type="text" id="business_name" name="business_name">
 		</li>
 		
 		<li>
 		<label for="business_division">사업자 구분</label>
 		<input type="radio" name="business_division" value="개인">개인<br>
 		<input type="radio" name="business_division" value="법인">법인<br>
		</li> 
		
		<li>
 		<label for="business_addr">소재지</label>
 		<input type="text" id="business_addr" name="business_addr">
 		</li>
 		
 		<li> 		
 		<label for="business_startdate">법인설립연월일</label>
 		<input type="text" id="business_startdate" name="business_startdate">
 		</li>
 		
 		<li>
 		<label for="business_url">홈페이지</label>
 		<input type="text" id="business_url" name="business_url">
 		</li>
		</ul>
		
        
        </div>
        <!-- #tab2 -->
    
        <div id="tab3" class="tab_content">
        
        <ul>
        
        <li>
        <label for="alias">창작자 이름</label>
        <input type="text" id="alias" name="alias">
        </li>
        
        <li>        
		<label for="image">창작자 프로필사진</label>
		<input type="file" id="image" name="image">
		</li>
		
		<li>
		<label for="introduce">창작자 소개</label>
		<textarea id="introduce" name="introduce"></textarea>
		</li>
		
		</ul>
		
        </div>
        
        <!-- #tab3 -->
        
    	<div id="tab4" class="tab_content">
    	
    	<div id="gide" style="border: 1px solid; width: 100%; height: 200px; margin: auto;">
		<h1>작성가이드</h1>
		</div>
		<textarea id="summernote" name="summernote"></textarea>
    	</div>
    	
    	<!-- #tab4 -->
    	
    	<div id="tab5" class="tab_content">
    	<ul>
    	
    	<li>
    	<label for="option_name">옵션명</label>
    	<input type="text" id="option_name" name="option_name">
    	</li>
    	
    	<li>
    	<label for="option_price">가격</label>
    	<input type="text" id="option_price" name="option_price">
    	</li>
    	
    	<li>
    	<label for="option_contents">내용</label>
    	<textarea id="option_contents" name="option_contents"></textarea>
    	</li>
    	
    	<li>
    	<label for="option_quantity">수량</label>
    	<input type="text" id="option_quantity" name="option_quantity">
    	</li>
    	
    	<li>
    	<input type="submit" value="등록하기">
    	</li>
    	
    	</ul>
    	</div>
    	
    	<!-- #tab5 -->
    	
    <!-- .tab_container -->
    </form>
    </div>
    <!-- #container -->
 </div>
<script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 200
      });
    </script>
</body>
</html>
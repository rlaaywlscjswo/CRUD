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
<link href="http://localhost:8080/resources/css/css.css" rel="stylesheet">
<script src="http://localhost:8080/resources/js/signature_pad.min.js"></script>
<style type="text/css">
/* ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 32px;
    border-bottom: 1px solid #eee;
    border-left: 1px solid #eee;    
    font-family:"dotum";
    font-size:12px;
    position: relative;
    left: 300px;
} */
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
    left: 300px;
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
    width: 1201px;
    height: auto;
    background: #FFFFFF;
    position: relative;
    left: 300px;
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

#container {
 	
 	height:1000px;
    width: 1300px;
   	margin: 0 auto; 
   

}
.btn2{
margin-top:20px;
border: 1px solid;
width: 50px;
height: 25px;
text-align: center;
}

#field{
border: 1px solid;
}

.bg-dark{
margin-top: 800px;  
}
</style>
<script type="text/javascript">
$(function () {
  
    $(".tab_content").hide();
    $(".tab_content:first").show();
    
    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#333");       
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });    
    
    // 다음눌렀을때 다음탭으로 이동!
    $('#btn2').on('click',function(){
    	$("ul.tabs li").removeClass("active").css("color", "#333")
    	$("ul.tabs li:eq(1)").addClass("active").css("color", "darkred")  	
    	$('.tab_content').hide()
    	$('.tab_content:eq(1)').show()   
    	
    });
    
    $('#btn3').on('click',function(){
    	$("ul.tabs li").removeClass("active").css("color", "#333")
    	$("ul.tabs li:eq(2)").addClass("active").css("color", "darkred")  	
    	$('.tab_content').hide()
    	$('.tab_content:eq(2)').show()    
    	
    });
    
    $('#btn4').on('click',function(){
    	$("ul.tabs li").removeClass("active").css("color", "#333")
    	$("ul.tabs li:eq(3)").addClass("active").css("color", "darkred")  	
    	$('.tab_content').hide()
    	$('.tab_content:eq(3)').show()    
    	
    });
    
    $('#btn5').on('click',function(){
    	$("ul.tabs li").removeClass("active").css("color", "#333")
    	$("ul.tabs li:eq(4)").addClass("active").css("color", "darkred")  	
    	$('.tab_content').hide()
    	$('.tab_content:eq(4)').show()    
    	
    });
    
    $('#btn6').on('click',function(){
    	$("ul.tabs li").removeClass("active").css("color", "#333")
    	$("ul.tabs li:eq(5)").addClass("active").css("color", "darkred")  	
    	$('.tab_content').hide()
    	$('.tab_content:eq(5)').show()    
    	
    });
    
   $("#main_category option:eq(0)").attr("selected","selected");
    
    // 메인카테고리에 해당하는 서브카테고리불러오기
    $("#main_category").on('change',function(){
    	$("#category_no").empty();   	
    	
       var main_category=$(this).val();       
        $.ajax({  
        	method:"GET",
        	dataType: "JSON",        	
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

  //옵션 추가 버튼을 눌렀을때 옵션form 추가로 나옴
    var btncount=1; // 추가할때 증가, 삭제할때 감소

    $('#up').on('click',function(){     
    	var div = document.createElement('div');
        div.innerHTML = document.getElementById('optform').innerHTML;
        document.getElementById('field').appendChild(div);    	
		/*   $('#field').append('<label for="option_name">옵션명</label> <div><input type="text" id="option_name" name="option_name"></div> <label for="option_price">옵션가격</label> <div><input type="text" id="option_price" name="option_price"></div> <label for="option_contents">옵션내용</label><div><input type="text" id="option_contents" name="option_contents"</div><br> <label for="option_quantity">옵션 수량</label> <div><input type="text" id="option_quantity" name="option_quantity"></div> <a href="#" class="down">삭제</a>');
    	    */    
    	$('#field').append('<a href="#" id="down">삭제</a>');
    	    btncount++;
    	    $('#btncnt').val(btncount);	
    	    console.log(btncount); 
    });

    $('#down').on('click', function(){
    		document.getElementById('field').removeChild(obj.parentNode);    
    	    btncount--;
    	    $('#btncnt').val(btncount);	
    }); 	    
   
    
 // sign pad
    
 var canvas = $("#signature-pad canvas")[0];
		var sign = new SignaturePad(canvas, {
			minWidth: 2,
			maxWidth: 4,
			penColor: "rgb(0, 0, 0)"
		});
		
		$("[data-action]").on("click", function(){
			if ( $(this).data("action")=="clear" ){
				sign.clear();
			}
			else if ( $(this).data("action")=="save" ){
				if (sign.isEmpty()) {
					alert("사인해 주세요!!");
				}else {
					var ss = sign.toDataURL(); 
					$.ajax({
						url : "http://localhost:8080/sign",
						method : "POST",
						dataType : "text",
						data : {						
							sign : ss							
						},
						success : function(r){
							console.log(r);
							alert("저장완료 : " + r);
							sign.clear();
						},
						error : function(res, errcode,xh){						
							console.log(res+","+errcode+", "+xh+"실패다");
						}
					});
				}
			}
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
        <li rel="tab6">(6)약관동의 및 서명</li>
    </ul>
    
<div class="tab_container">
 
 <form method="post" action="projectresult" enctype="multipart/form-data">
    	<div id="tab1" class="tab_content">
          
 			<label for="project_title">프로젝트 제목</label>
 			<div><input type="text" class="form-control input-default" id="project_title" name="project_title" value="고정제목"></div>
 			
 			
			<label for="main_category">대분류</label>
			<div>
			<select class="form-control input-default" id="main_category" name="main_category" id="default">
			<%-- <c:forEach var="main" items="${mainlist }">
			<option value="${main.main_category }">${main.main_category }</option>
			</c:forEach> --%>
			<option value="">대분류를 선택하세요</option>
			<option value="게임" >게임</option>
			<option value="패션" >패션</option>			
			</select>
			</div>
			
 			
		    <label for="category_no">소분류</label>
		    <div><select class="form-control input-default" id="category_no" name="category_no"></select></div>
		
			
 			<label for="project_photo_file">프로젝트 대표사진</label>
 			<div><input type="file" class="form-control input-default" id="project_photo_file" name="project_photo_file"> </div>
 			<p>사진규격은 width: 650px, height: 487.5px 추천</p>
 			
 			
 			<label for="targetprice">목표 금액</label>
 			<div><input type="number" class="form-control input-default" id="targetprice" name="targetprice" value="1111"></div>
 			
 			
 			<label for="startdate">시작 날짜</label>
 			<div><input type="date" class="form-control input-default" id="startdate" name="startdate"></div>
 			
 			
 			<label for="enddate">종료 날짜</label>
 			<div><input type="date" class="form-control input-default" id="enddate" name="enddate"></div>
 			
 			<div class="btn2" id="btn2"><a href="#" >다음</a></div>			 
 			
 		</div>
 		
        <!-- #tab1 -->
        
        <div id="tab2" class="tab_content">
        
        <label for="business_name">사업자명</label>
        <div><input type="text" class="form-control input-default" id="business_name" name="business_name" value="고정제목"></div>
 		
 		
 		<label for="business_division">사업자 구분</label>
 		<div>
 		<input type="radio" name="business_division" value="개인">개인<br>
 		<input type="radio" name="business_division" value="법인">법인<br>
 		</div>		

 		<label for="business_addr">소재지</label>
 		<div><input type="text" class="form-control input-default" id="business_addr" name="business_addr" value="고정주소"></div> 		
 		
 		<label for="business_startdate">법인설립연월일</label>
 		<div><input type="date" class="form-control input-default" id="business_startdate" name="business_startdate" value="2019-03-21"></div>
 		
 		<label for="business_url">홈페이지</label>
 		<div><input type="text" class="form-control input-default" id="business_url" name="business_url" value="고정페이지"></div> 		
 		
 		<div class="btn2"  id="btn3"><a href="#">다음</a></div>		
 		
 			
        </div>
        <!-- #tab2 -->
    
        <div id="tab3" class="tab_content">
        
        
        <label for="alias">창작자 이름</label>
        <div><input type="text" class="form-control input-default" id="alias" name="alias" value="고정이름"></div>
        
    
		<label for="img_file">창작자 프로필사진</label>
		<div><input type="file" class="form-control input-default" id="img_file" name="img_file"></div>
		 
		 
		<label for="introduce">창작자 소개</label>
		<div><textarea class="form-control input-default" id="introduce" name="introduce">1111</textarea></div>
		
		<div class="btn2" id="btn4"><a href="#" >다음</a></div>		

 		 	
		
        </div>
        
        <!-- #tab3 -->
        
    	<div id="tab4" class="tab_content">
    	
    	<div id="gide" style="border: 1px solid; width: 100%; height: 200px; margin: auto;">
		<h1>작성가이드</h1>
		</div>
		<textarea id="summernote" name="summernote"></textarea>
		<div class="btn2" id="btn5"><a href="#" >다음</a></div>		
    	</div>   	
    	
    	<!-- #tab4 -->
   
     	<div id="tab5" class="tab_content">    	
    	
    	<div id="optform">
    	<label for="option_name">옵션명</label>
    	<div><input type="text" class="form-control input-default" id="option_name" name="option_name"></div>
    	
    	<label for="option_price">가격</label>
    	<div><input type="text" class="form-control input-default" id="option_price" name="option_price"></div>
    	
    	<label for="option_contents">내용</label>
    	<div><textarea class="form-control input-default" id="option_contents" name="option_contents"></textarea></div>
    	
    	<label for="option_quantity">수량</label>
    	<div><input type="text" class="form-control input-default" id="option_quantity" name="option_quantity"></div>      	
   		</div>
   		
    	<div id="field">
    	
    	</div>   	
    	
    	<input type="button" value="옵션 추가 " id="up">
	    <input type="hidden" id="btncnt" name="btncnt" value="1">
	    
    	<!-- <input type="submit" id="save" value="등록하기">   -->	
    	<div class="btn2" id="btn6"><a href="#" >다음</a></div>	
    	</div> 
    	
    	<!-- #tab5 -->
    	
    	<div id="tab6" class="tab_content">  
    	
    	<!-- <input type="checkbox" name="terms" value="1">약관1<br>
    	<input type="checkbox" name="terms" value="2">약관2<br> -->    	
    	 	
    	<div id="signature-pad" class="m-signature-pad">
        <div class="m-signature-pad--body">
            <canvas width="300" height="100"></canvas>
        </div>
        <div class="m-signature-pad--footer">           
            <button type="button" class="button clear" data-action="clear">지우기</button>
            <button type="button" class="button save" data-action="save">저장</button>            
        </div>
    	</div>
   		
   		<input type="submit" id="save" value="등록하기">
    	</div> 
    	<!-- #tab6 -->
    	
    	<!-- 로그인 했으면 이거 넣어줘야 함 -->
    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">    	
    	
    <!-- .tab_container -->
    </form>
    </div>
    <!-- #container -->
 </div>
 
<script>
      $('#summernote').summernote({
        placeholder: '작성가이드를 참고해서 작성해보세요!',
        tabsize: 2,
        height: 200
      });
      
      
       
</script>

</body>
</html>
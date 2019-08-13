<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	/* $('#default').click();   */
    $("#main_category").on('change',function(){
    	$("#sub_category").empty();
    	console.log($(this).val());
   
        var main_category=$(this).val();       
        $.ajax({      
        	type:"json",
            method:"post",
            url:"http://localhost:8080/project/category",
            data:'main_category='+main_category,
            success:function(data){   
            	console.log(data);
            	
            	$.each(data,function(i,item){
            		console.log(item.category_no);  
            		console.log(item.sub_category);
            		$("#sub_category").append("<option value='"+item.category_no+"'>"+item.sub_category+"</option>");
            		
            	});
            }
        });        
    });
    
   /*  function checkFile(){
    	var fm = document.file;
    	var fnm = fm.project_photo;
    	var ext = fnm.value;
    	
    	if(!(ext.substr(ext.length-3)=='jpg' || ext.substr(ext.length-3)=='png')){
    	 alert("jpg, png 파일만 가능합니다.");
    		return false;
    	}fm.submit();     
    	} */   	
    
});
</script>
</head>



<body>



 <form name="file" method="post" action="projectresult" enctype="multipart/form-data">
 
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
 <label for="sub_category">소분류</label>

<select id="sub_category" name="sub_category">

</select>
 </li> 
 
 <li>
 <label for="file">프로젝트 대표사진</label>
 <input type="file" id="file" name="file"> 
 </li>
 
 <li>
 <input type="submit" value="다음"> 
 </li>
 </ul> 
 </form>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
   //아이디 입력란에 keyup 이벤트가 일어 났을때 실행할 함수 등록 
    $("#main_category").onclick(function(){
        //입력한 문자열을 읽어온다.
        var category=$(this).val();
        //ajax 요청을 해서 서버에 전송한다.
        $.ajax({
            method:"post",
            url:"category",
            data:{main_category:category},
            success:function(data){
                var obj=JSON.parse(data);
                console.log(obj);
                if(obj.canUse){//사용 가능한 아이디 라면 
                    // 성공한 상태로 바꾸는 함수 호출
                    $('#emailcheck').css('color', 'red').html('사용 가능한 아이디입니다.');
                    
                }else{//사용 가능한 아이디가 아니라면 
                    $('#emailcheck').css('color', 'red').html('중복된 아이디입니다.');
                }
            }
        });
    });
});
</script>


</head>
<body>
 <form method="post" action="projectlist">
 <ul>
 
 <li>
 <label for="project_title">프로젝트 제목</label>
 <input type="text" id="project_title" name="project_title">
 </li>
 
 <li>
<label for="main_category">대분류</label>
<select id="main_category" name="main_category">
<c:forEach var="main" items="${mainlist }">
<option value="${main.main_category }">${main.main_category }</option>
</c:forEach>
</select>
 </li> 
 
 <li>
 <label for="sub_category">소분류</label>
 <select id="sub_category" name="sub_category">
 <c:forEach var="sub" items="${sublist}">
<option value="${sub.sub_category }">${sub.sub_category }</option>
</c:forEach>
</select>
 </li> 
 
 </ul>
 
 </form>
</body>
</html>
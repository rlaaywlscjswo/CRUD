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
프로젝트번호 ${list.project_no }<br>
프로젝트제목${list.project_title }<br>
프로젝트사진${list.project_photo }<br>
달성금액${list.targetprice }<br>
소개글${list.introduce }<br>
시작일${list.startdate }<br>
종료일${list.enddate }<br>
결제일${list.payment_date }<br>
내용${list.project_contents }<br>
계약서${list.project_contract }
조회수${list.project_views }<br>
승인여부${list.project_status }<br>
회원번호${list.no }<br>
카테고리번호${list.category_no }<br>
<a href="projectoption=${list.project_no }" style="border: 1px solid;">후원하기</a><br>
 <c:forEach var="opt" items="${option }">
<c:out value="${opt.option_no }"/><br>
<c:out value="${opt.option_name}"/><br>
<c:out value="${opt.option_price }"/><br>
<c:out value="${opt.option_contents }"/><br>
<c:out value="${opt.option_quantity }"/><br>
<c:out value="${opt.project_no }"/>
</c:forEach>

</body>
</html>
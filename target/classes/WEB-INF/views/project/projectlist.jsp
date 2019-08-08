<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
table,th,td{
border-collapse: collapse;
border:1px solid;  
}
li{
display: inline-block;
}
ul,li{
list-style: none;
}
</style>
</head>
<body>
<table>
	<thead>
	<tr>
	<th>회원번호</th>
	<th>프로젝트 번호</th>
	<th>프로젝트 제목</th>
	<th>카테고리 번호</th>
	</tr>
	</thead>
	
	<tbody>
<c:forEach var="item" items="${list }">
<tr>
<td><c:out value="${item.no}"></c:out></td>
<td><c:out value="${item.project_no }"></c:out></td> 
<td><c:out value="${item.project_title }"></c:out></td>
<td><c:out value="${item.category_no }"></c:out></td>
<tr>
</c:forEach>
</tbody>
</table>
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
		
		<form method="get" action="projectlist?currPage=${page.startBlock }">
		<select class="option" id="search" name="search">
		<option value="project_title">제목</option>
		<option value="no">회원번호</option>
		</select>
		<input type="text" id="searchtxt" name="searchtxt">
		<input type="submit" value="검색">
		</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script>
</head>
<body>
 <form id="2" action="projectresult2" method="post" >
 
 <label for="business_name">사업자명</label>
 <input type="text" id="business_name" name="business_name">
 
 <label for="business_division">사업자 구분</label>
 <input type="radio" name="business_division" value="개인">개인<br>
 <input type="radio" name="business_division" value="법인">법인<br>

 <label for="business_addr">소재지</label>
 <input type="text" id="business_addr" name="business_addr">
 
 <label for="business_startdate">법인설립연월일</label>
 <input type="text" id="business_startdate" name="business_startdate">
 
 <label for="business_url">홈페이지</label>
 <input type="text" id="business_url" name="business_url">

	<input type="submit" value="다음">
</form>

<form id="3">
<label for="">창작자 이름</label>
<label for="">창작자 프로필사진</label>
<label for="">창작자 소개</label>
</form>

<form id="4">
<div id="gide" style="border: 1px solid; width: 100%; height: 200px; margin: auto;">
<h1>작성가이드</h1>
</div>
<textarea name="dd" id="summernote"></textarea>
</form>

<form id="5">
<h1>옵션설정</h1>
</form>

<script>
      $('#summernote').summernote({
        placeholder: 'Hello stand alone ui',
        tabsize: 2,
        height: 400
      });
    </script>

 
</body>
</html>
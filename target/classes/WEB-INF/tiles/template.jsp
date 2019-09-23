<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CRUD</title>
	<!-- Favicon -->
    <link rel="icon" href="/resources/yummy/img/A_02.png">

    <!-- Core Stylesheet -->
    <link href="/resources/yummy/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="/resources/yummy/css/responsive/responsive.css" rel="stylesheet">


<!-- Custom styles for this template -->
<link href="/resources\font\font-awesome\css\font-awesome.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
*{ 
 font-family: 'NanumSquareRound',sans-serif; 
 }
</style>


</head>
<body>
 <div style="width:100%; height:100%;">
    <div id="header"><tiles:insertAttribute name="header" /></div>
    <div id="main"><tiles:insertAttribute name="body" /></div>    
    <div id="footer"><tiles:insertAttribute name="footer" /></div>
 </div>
 
    <script type="text/javascript">
        $(function() {
        	$('#talk').on('click', function() { //인코딩 문제 방지
    			let uri = encodeURI("/talk");
    			console.log(uri);
    			let pop = window.open(uri, "pop", "width=750,height=495, scrollbars=yes, resizable=yes");
    		});
    	
    		// 마이 페이지, 관리자 페이지 jQuery
    		$('#myHide').hide();
    		$('#adminHide').hide();

    		$('#myButton').on('click', function() {

    			$('#myHide').slideDown(function() {
    				$('#myButton').on('click', function() {
    					$('#myHide').slideUp();
    				}); // end on
    			}); // end slideDown

    		}); // end on
    		
    		$('#adminButton').on('click', function() {
    			
    			$('#adminHide').slideDown(function() {
    				$('#adminButton').on('click', function() {
    					$('#adminHide').slideUp();
    				}); // end on
    			}); // end slideDown
    			
    		}); // end on
 
        });    
    </script>  
      
      
      
    <!-- Jquery-2.2.4 js -->
    <script src="/resources/yummy/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="/resources/yummy/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap-4 js -->
    <script src="/resources/yummy/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins JS -->
    <script src="/resources/yummy/js/others/plugins.js"></script>
    <!-- Active JS -->
    <script src="/resources/yummy/js/active.js"></script>
      
     <!-- Bootstrap core JavaScript -->
  	<!-- <script src="/resources/vendor/jquery/jquery.min.js"></script>
  	<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/plugins/common/common.min.js"></script>
    <script src="/resources/js/custom.min.js"></script>
    <script src="/resources/js/settings.js"></script>
    <script src="/resources/js/gleek.js"></script>
    <script src="/resources/js/styleSwitcher.js"></script>    
    <script src="/resources/plugins/highlightjs/highlight.pack.min.js"></script>
 -->
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어드어드 어드민</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	jQuery.noConflict();
	jQuery(document).ready(function($) {
		
		$('#btn').on('click', function() {
			
/* 			$.ajax({
				
				type : "get",
				url : "/fmember",
				data : "${flist1.name}",
				dataType: "script",
				success : function(data) {
					alert("success!!");
					alert("data : " + data);
					$('p').append(data);
				},
				error : function(data) {
					alert("error!!");
					alert("babo : " + data);
				}
				
			}); // end ajax test */
			
			var board = {};
			var lstCnt = 10;
			board.boardList = {
					init : function(cmpnNo, lstCnt) {
						var page = 1;
						board.boardList.param.pageNumber = Number(page);
						board.boardList.param.cmpnNo = cmpnNo;
						board.boardList.param.pageSize = lstCnt;
						board.boardList.data();
					},
					data : function() {
						$.ajax({
							url : '/fmember',
							data : board.boardList.param,
							success : function(result) {
								var boardList = result.boardList;
								if(boardList.length != 0) {
									board.boardList.totalCount = boardList[0].totalCount;
								};
								drawPagination(lstCnt);
								var markup = "";
								$('#result').html(markup);
							},
							error : function() {
								alert('오류래.. ㄸㅂ');
							}
						});
					}, 
					param : {
						pageNumber : 1,
						pageSize : lstCnt
					},
					totalCount : 0
			};
			
			function drawPagination(lstCnt) {
				$('#boardPagingDiv').pagination({
					items : board.boardList.totalCount,
					currentPage : board.boardList.param.pageNumber,
					itemsOnPage : lstCnt,
					displayPages : lstCnt,
					selectOnClick : function(currentPage) {
						searchBoardListPaging(currentPage);
					}
				});
			}
			
			function searchBoardListPaging (page) {
				board.boardList.param.pageNumber = Number(page);
				board.boardList.data();
				drawPagination(lstCnt);
			}
			
		}); // end on
	});	// end ready	
</script>
</head>
<body>


<h1>ajax Test</h1>

<p></p>

<input type="button" id="btn" value="눌러봥">
<div id="result"></div>

<br>
<hr>
<br>





	<div style="border: 1px solid crimson; width: 1000px; height: 500px;">
	
		<form method="post" action="changeAuth">
			<input type="submit" value="승인">
		</form>
		
		아.. 이건 현재 로그인 한 회원의 권한 변경이고..
		쪽지를 보낸 사람의 권한 변경은.. 그 값 가지고 와서.. 아..
	
		승인(누르면 ROLE_MEMBER -> ROLE_MANAGER 로 변경)
		누르는 건 자바 스크립트로 구현한다고 치고..
		일단 쿼리부터 만들어서 mapper.xml에 넣어주고 service, controller까지 해주면 끝
	
	</div>

	<h1>현재 로그인 한 회원의 이메일을 보여줘 : <c:out value="${needemail}" /></h1>

	<h1>여기 관리자 페이지가 될 예정이야</h1>

	<h2>할 사람은 여기다 해주세요.</h2>
	
  	<p>principal : <sec:authentication property="principal" /></p>
 	<%-- <p>MemberDTO : <sec:authentication property="principal.dto" /></p> --%>
	<%-- <p>사용자 이메일 : <sec:authentication property="principal.dto.email" /></p>
	<p>사용자 권한 리스트 : <sec:authentication property="principal.dto.authList" /></p> --%>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		이건 관리자만 보임 <br>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_MANAGER')">
		이건 매니저만 보임 <br>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_MEMBER')">
		이건 회원이면 다 보임 <br>
	</sec:authorize>

	<sec:authorize access="permitAll">
		이건 다 보임 <br>
	</sec:authorize>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#list').bind('click', listRun);
		$('#replay').bind('click', replayRun);
		$('#update').bind('click', updateRun);
		$('#delete').bind('click', deleteRun);
	});	
	
	function listRun() {		
		$('#frm').attr('action', "board_list.do").submit();
	}

	function replayRun() {
		$('#frm').attr('action', "board_write.do").submit();
	}

	function updateRun() {
		$('#frm').attr('action', "board_update.do").submit();
	}

	function deleteRun() {
		$('#frm').attr('action', "board_delete.do").submit();
	}
	
</script>
<style type="text/css">
#board_row tr{
	width:950px;
}

th{
 	width: 140px;
	text-align: left;
	padding: 10px;
}

td{
	width: 790px;
	text-align: left;
}

#textarea{
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
	text-align: left;
	height:450px;
}

.comment_str {
	width: 40%;
}

.comment_button {
	background-color: #8c8888;
	color: #fff;
	width: 80px;
	height: 25px;
	line-height: 10px;
}

.board_comment {
	padding: 20px 50px;
	text-align: center;
}

.board_buttons{
	padding: 20px 50px;
	text-align: center;
}

.board_page {
	padding: 20px 50px;
	text-align: center;
}
</style>	
	
<body>
<table id="board_row">
		<tr>
			<th>글쓴이</th>
			<td>${dto.board_writer}</td>
			<th>조회수</th>
			<td>${dto.board_readcount}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.board_subject}</td>
			<th>작성날짜</th>
			<td>
				<fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${dto.board_reg_date}" />
			</td>		
		</tr>
</table>

	<div id="textarea">
		${dto.board_content}
	</div>
		
	<div id="commentarea">
		<table id="comment_row">
			<tr>
				<td>${dto.comment_writer}</td>
				<td>${dto.comment_date}</td>
			</tr>
			<tr>
				<td>${dto.comment_content}</td>
			</tr>
		</table>
	</div>
		
	<div class="board_comment">
		<form id="search_frm" method="get">
			<input type="text" name="comment_str" value class="comment_str" />
			<input type="button" class="comment_button" value="입력" />
			<input type="button" class="comment_button" value="수정" />
			<input type="button" class="comment_button" value="삭제" />
		</form>		
 	</div>
 	
 	
 	<div class="board_page">
		<!-- 이전 출력 시작 -->
		<c:if test="${pv.startPage>1}">
			<a href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage-pv.blockPage}">이전</a>
		</c:if>

		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<c:url var="currPage" value="board_list.do?boardcategory_no=1">
				<c:param name="currentPage" value="${i}" />
			</c:url>
			<a href="${currPage}"><c:out value="${i}" /></a>
		</c:forEach>

		<!-- 페이지 출력 끝 -->
		<c:if test="${pv.totalPage>pv.endPage}">
			<a href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage+pv.blockPage}">다음</a>
		</c:if>
		
		</div>
 	
 	<div class="board_buttons">
	<form name="frm" id="frm" method="get" >	 
	    <input type="hidden" name="board_no" id="board_no" value="${dto.board_no}" />	
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" /> 
		<input type="button" id="list" value="목록" />
		<input type="button" id="update" value="수정" /> 
		<input type="button" id="delete" value="삭제" />
	</form>
	</div>
</body>
</html>








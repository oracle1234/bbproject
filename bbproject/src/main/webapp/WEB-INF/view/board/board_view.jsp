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
.board_row tr{
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

.textarea{
	padding-top: 20px;
	padding-bottom: 20px;
	padding-left: 20px;
	text-align: left;
	height:450px;
}
</style>	
	
<body>
<table class="board_row">
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
		<div class="textarea">
			${dto.board_content}
		</div>

	<form name="frm" id="frm" method="get" >	 
	    <input type="hidden" name="board_no" id="board_no" value="${dto.board_no}" />	
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" /> 
		<%-- <input type="hidden" name="ref" value="${dto.comment_ref}" /> 
		<input type="hidden" name="re_step" value="${dto.comment_re_step}" /> 
		<input type="hidden" name="re_level" value="${dto.comment_re_level}" />  --%>
		<input type="button" id="list" value="목록" />
		<input type="button" id="replay" value="답변" /> 
		<input type="button" id="update" value="수정" /> 
		<input type="button" id="delete" value="삭제" />
		
	</form>
</body>
</html>








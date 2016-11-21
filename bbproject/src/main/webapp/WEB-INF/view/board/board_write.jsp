<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		$('#btnList').bind('click', function() {
			$('#frm').attr('action', 'board_list.do');
			$('#frm').submit();
		});

		$('#btnSave').bind('click', function() {
			$('#frm').attr('action', 'board_write.do').submit();
		});
	});

	function process() {
		$('[name=board_content]').val(
				$('[name=board_content]').val().replace(/\n/gi, '<br/>'));
		return true;
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

.textarea {
	padding-top: 20px;
	padding-bottom: 20px;
}

.textarea textarea{
	width:948px;
	height: 450px;
}
</style>

</head>
<body>
	<div id="board_write" >
	<form name="frm" id="frm" method="post" enctype="multipart/form-data"
		onsubmit="return process()">

		<table class="board_row">

			<tr>
				<th scope="row">글쓴이</th>
				<td><input type="text" name="board_writer" size="10" maxlength="10" /></td>
			</tr>

			<tr>
				<th scope="row">제목</th>
				<td><c:if test="${bdto!=null}">답변</c:if> <input type="text"
					name="board_subject" size="40" /></td>
			</tr>
			
		</table>
		
		<div class="textarea">
			<textarea name="board_content" rows="100" cols="100"></textarea>
		</div>
		
		<!-- 답변글일때.... -->
		
		<c:if test="${bdto!=null}">
			<input type="hidden" name="board_no" id="board_no" value="${dto.board_no}" />
			<input type="hidden" name="currentPage" id="currentPage"
				value="${currentPage}" />
<%-- 			<input type="hidden" name="ref" value="${dto.comment_ref}" />
			<input type="hidden" name="re_step" value="${dto.comment_re_step}" />
			<input type="hidden" name="re_level" value="${dto.comment_re_level}" /> --%>
		</c:if>

		<div class="board_btn">
			<img alt="확인" src="./images/btn_ok.gif" id="btnSave">
			<img alt="취소" src="./images/btn_cancel.gif" id="btnList">
		</div>		
	</form>
	</div>
</body>
</html>











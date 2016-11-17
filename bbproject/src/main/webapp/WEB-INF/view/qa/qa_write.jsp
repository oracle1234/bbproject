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
			$('#frm').attr('action', 'qa_list.do');
			$('#frm').submit();
		});

		$('#btnSave').bind('click', function() {
			$('#frm').attr('action', 'qa_write.do').submit();
		});

		$('#filepath').on('change', function() {
			if (this.files && this.files[0]) {
				if (this.files[0].size > 1000000000) {
					alert("1GB 이하만 첨부할 수 있습니다.");
					$('#filepath').val('');
					return false;
				}
			}
		});
	});

	function process() {
		$('[name=qa_content]').val(
				$('[name=qa_content]').val().replace(/\n/gi, '<br/>'));
		return true;
	}
</script>

</head>
<body>
	<form name="frm" id="frm" method="post" enctype="multipart/form-data"
		onsubmit="return process()">

		<table class="qa_row">

			<tr>
				<th scope="row">글쓴이</th>
				<td><input type="text" name="board_writer" size="10" maxlength="10" /></td>
			</tr>

			<tr>
				<th scope="row">제목</th>
				<td><c:if test="${qdto!=null}">답변</c:if> <input type="text"
					name="qa_subject" size="40" /></td>
			</tr>
			
			<tr>
				<th scope="row">첨부파일</th>
				<td><input type="file" name="filename" id="filepath" />
			</tr>
			
		</table>
		
		<div class="textarea">
			<textarea name="qa_content" rows="100" cols="100"></textarea>
		</div>
		
		<!-- 답변글일때.... -->

		<c:if test="${qdto!=null}">
			<input type="hidden" name="num" id="num" value="${dto.board_no}" />
			<input type="hidden" name="currentPage" id="currentPage"
				value="${currentPage}" />
			<%-- <input type="hidden" name="ref" value="${dto.comment_ref}" />
			<input type="hidden" name="re_step" value="${dto.comment_re_step}" />
			<input type="hidden" name="re_level" value="${dto.comment_re_level}" /> --%>
		</c:if>

		<div class="board_btn">
			<input type="button" id="btnList" value="리스트" /> 
			<input type="button" id="btnSave" value="저장" />
		</div>
	</form>
</body>
</html>











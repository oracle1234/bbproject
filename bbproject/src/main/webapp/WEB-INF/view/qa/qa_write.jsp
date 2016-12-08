<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#btnList').bind('click', function() {
			$('#frm').attr('action', 'qa_list.do').submit();
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
<body>
<div id="board_write">
	<form name="frm" id="frm" method="post" enctype="multipart/form-data"
		onsubmit="return process()">

		<table class="board_row">
			<tr id="member_id">
				<th scope="row">글쓴이</th>
				<td>${sessionScope.member.id}</td>
			</tr>

			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="qa_subject" size="40" /></td>
			</tr>
			
			<tr>
				<th scope="row">첨부파일</th>
				<td>
					<input type="file" name="filename" id="filepath" />
				</td>
			</tr>			
		</table>
		
		<div class="textarea">
			<textarea name="qa_content" rows="100" cols="100"></textarea>
		</div>
		
		<c:if test="${qdto!=null}">
			<input type="hidden" name="qa_no" value="${qdto.qa_no}" />
			<input type="hidden" name="currentPage" value="${currentPage}" />
		</c:if>
		
		<input type="hidden" value="${sessionScope.member.id}"
				name="qa_writer">
			
		<div class="board_btn">
			<input type="image" alt="확인" src="./images/btn_ok.gif" id="btnSave">
			<input type="image" alt="취소" src="./images/btn_cancel.gif" id="btnList">
		</div>
		
	</form>
</div>
</body>
</html>











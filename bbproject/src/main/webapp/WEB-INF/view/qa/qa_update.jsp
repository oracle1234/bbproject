<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#update').bind('click', updateRun);
		$('#cancel').bind('click', cancelRun);
		$('#back').bind('click', backRun);
		$('[name=qa_content]').val($('[name=qa_content]').val().trim());
		$('[name=qa_content]').val($('[name=qa_content]').val().replace(/<br\s?\/?>/g,"\n"));
	});

	function updateRun() {
		$('[name=qa_content]').val(
				$('[name=qa_content]').val().replace(/\n/gi, '<br/>'));
		$('#frm').attr('action', 'qa_update.do').submit();
	}

	function cancelRun() {
		$('#qa_subject').val('${dto.qa_subject}');
		$('#qa_content').val('${dto.qa_content}');
		$('[name=qa_content]').val($('[name=qa_content]').val().trim());
		$('[name=qa_content]').val($('[name=qa_content]').val().replace(/<br\s?\/?>/g,"\n"));
		//window.history.back();
	}
	
	function backRun(){
		//history.back();
		history.go(-1);
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
<div id="board_write">
	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table class="board_row">
		
			<tr>
				<th scope="row">글쓴이</th>
				<td>${dto.qa_writer}</td>
				<th scope="row">등록일</th>
				<td>
				<fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${dto.qa_reg_date}"/>
				</td>
			</tr>

			<tr>
				<th scope="row">제목</th>
				<td><input type="text" name="qa_subject" id="qa_subject"
					value="${dto.qa_subject}" /></td>
			</tr>

			<tr>
				<th scope="row">파일</th>
				<td><input type="file" name="filename" /> <span>
						${fn:substringAfter(dto.qa_upload,"_")}</span></td>
			</tr>
		</table>
		
		<div class="textarea">
				<textarea name="qa_content" id="qa_content" rows="100" cols="100">${dto.qa_content}</textarea>
		</div>
		
		<input type="hidden" name="qa_no" id="qa_no" value="${dto.qa_no}" />
		<input type="hidden" name="currentPage" id="currentPage" value="${currentPage}" />
		
		<div class="board_btn">
			<img alt="수정" src="./images/btn_ok.gif" id="update" />
			<img alt="취소" src="./images/btn_cancel.gif" id="cancel" />
			<img alt="뒤로" src="./images/btn_back.gif" id="back" />
		</div>
	</form>
</div>
</body>
</html>










<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		$('[name=content]').val($('[name=content]').val().trim());
		$('[name=content]').val($('[name=content]').val().replace(/<br\s?\/?>/g,"\n"));
	});

	function updateRun() {
		$('[name=content]').val(
				$('[name=content]').val().replace(/\n/gi, '<br/>'));
		$('#frm').attr('action', 'update.sb').submit();
	}

	function cancelRun() {
		$('#subject').val('${dto.subject}');
		$('#email').val('${dto.email}');
		$('#content').val('${dto.content}');
		$('[name=content]').val($('[name=content]').val().trim());
		$('[name=content]').val($('[name=content]').val().replace(/<br\s?\/?>/g,"\n"));
		//window.history.back();
	}
	
	function backRun(){
		//history.back();
		history.go(-1);
	}
</script>
<style type="text/css">
table {
	width: 80%;
}
</style>
</head>
<body>
	<!-- 치환 변수 선언 -->
	<c:set var="cr" value="\r" scope="page" />
	<c:set var="cn" value="\n" scope="page" />
	<c:set var="crcn" value="\r\n" scope="page" />
	<c:set var="br" value="<br/>" scope="page" />

	<form name="frm" id="frm" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th width="20%">글쓴이</th>
				<td>${dto.writer}</td>
				<th width="20%">등록일</th>
				<td>${dto.reg_date}</td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="subject" id="subject"
					value="${dto.subject}" /></td>
			</tr>

			<tr>
				<th>메일</th>
				<td colspan="3"><input type="text" name="email" id="email"
					value="${dto.email}" /></td>
			</tr>

			<tr>
				<th>내용</th>
				<td colspan="3"><textarea name="content" id="content" rows="13"
						cols="40">
				${dto.content}
				</textarea></td>
			</tr>

			<tr>
				<th>첨부파일</th>
				<td colspan="3"><input type="file" name="filename" /> <span>
						${fn:substringAfter(dto.upload,"_")}</span></td>
			</tr>
		</table>
		<input type="hidden" name="num" value="${dto.num}" /> <input
			type="hidden" name="currentPage" value="${currentPage}" /> <input
			type="button" id="update" value="수정" /> <input type="button"
			id="cancel" value="취소" /> <input type="button" id="back" value="뒤로" />
	</form>
</body>
</html>










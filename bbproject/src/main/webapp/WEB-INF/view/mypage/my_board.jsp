<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('.board_checkbox').bind('click', function() {
		$('.board_cb').prop('checked', this.checked);
	});
	
	$(document).on('click', '#button_review', function(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'my_board_photo.do?member_no=${member_no}&boardcategory_no=2',
			success : photolist,
			error: function(xhr, textStatus, error) {
				alert(error);
			}
		})
	});
	
	$(document).on('click', '#button_qa', function(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'my_board_photo.do?member_no=${member_no}&boardcategory_no=3',
			success : qalist,
			error: function(xhr, textStatus, error) {
				alert(error);
			}
		})
	});
	
});

function photolist(data){
	$('.myboard_table').empty();
	$('.myboard_table').append('<tr>'+
	'<th width="5%"><input type="checkbox" class="board_checkbox"></th>'+
	'<th width="5%">번호</th>'+
	'<th width="15%">분류</th>'+
	'<th width="40%">제목</th>'+
	'<th width="20%">작성일</th>'+
	'<th width="10%">수정</th>'+
'</tr>');
	
	$.each(data,function(index, value){
		$('.myboard_table').append('<tr>'+
		'<td><input type="checkbox" class="board_cb" value="${dto.photo_no}"></td>'+
		'<td></td>'+
		'<td>포토후기</td>'+
		'<td>${dto.photo_subject}</td>'+
		'<td>${dto.photo_reg_date}</td>'+
		'<td><input type="button" id="board_upd" value="수정하기"></td>'+
	'</tr>');
	});
}

function qalist(qaqa){
	$('.myboard_table').empty();
	$('.myboard_table').append('<tr>'+
	'<th width="5%"><input type="checkbox" class="board_checkbox"></th>'+
	'<th width="5%">번호</th>'+
	'<th width="15%">분류</th>'+
	'<th width="40%">제목</th>'+
	'<th width="20%">작성일</th>'+
	'<th width="10%">수정</th>'+
'</tr>');
	
	$.each(qaqa,function(index, value){
		$('.myboard_table').append('<tr>'+
		'<td><input type="checkbox" class="board_cb" value="${dto.photo_no}"></td>'+
		'<td></td>'+
		'<td>포토후기</td>'+
		'<td>${dto.photo_subject}</td>'+
		'<td>${dto.photo_reg_date}</td>'+
		'<td><input type="button" id="board_upd" value="수정하기"></td>'+
	'</tr>');
	});
}
	
</script>
	<div class="mypage_body">
	<div class="link">
	<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 내가 쓴 글
	</div>
		<div class="board_button">
		<input type="button" id="button_free" value="자유게시판">
		<input type="button" id="button_review" value="포토후기">
		<input type="button" id="button_qa" value="Q&A">
		</div>
		
		<table class="myboard_table">
		<tr>
		<th width="5%"><input type="checkbox" class="board_checkbox"></th>
				<th width="5%">번호</th>
				<th width="15%">분류</th>
				<th width="40%">제목</th>
				<th width="20%">작성일</th>
				<th width="10%">수정</th>
			</tr>
			<c:forEach var="dto" items="${aList.bdto}">
				<tr>
				<td><input type="checkbox" class="board_cb" value="${dto.board_no}"></td>
					<td></td>
					<td>자유게시판</td>
					<td>${dto.board_subject}</td>
					<td>${dto.board_reg_date}</td>
					<td><input type="button" id="board_upd" value="수정하기"></td>
				</tr>
				</c:forEach>
		</table>
		<div class="myboard_write">
		<input type="button" id="button_write" value="글쓰기">
		</div>
		<div class="myboard_find">
		<input type="radio" name="board">제목
		<input type="radio" name="board">내용
		<input type="text" id="text_find" placeholder="검색">
		<input type="button" id="button_fint" value="검색">
		</div>
	</div>

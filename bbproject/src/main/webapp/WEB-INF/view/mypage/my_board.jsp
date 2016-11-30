<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/my_board.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$('.board_checkbox').bind('click', function() {
		$('.board_cb').prop('checked', this.checked);
	});
	
	$(document).on('click', '#button_free', function(){
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'my_board_free.do?member_no=${member_no}&boardcategory_no=1',
			success : freelist,
			error: function(xhr, textStatus, error) {
				alert(error);
			}
		})
	});
	
	$('#button_find').on('click', function(){
		var searchval = $('#searchval').val();
		if(searchval==''){
			alert('검색어를 입력하세요.');
		} else{
			$('#form_search').submit();
		}
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
			url : 'my_board_qa.do?member_no=${member_no}&boardcategory_no=3',
			success : qalist,
			error: function(xhr, textStatus, error) {
				alert(error);
			}
		})
	});
	
});

Handlebars.registerHelper("newDate",function(timeValue){
	var dateObj=new Date(timeValue);
	var year=dateObj.getFullYear();
	var month=dateObj.getMonth()+1;
	var date=dateObj.getDate();
	return year+"/"+month+"/"+date;
});//end newDate

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
 		$.each(value.pdto,function(index, value){
	var source='<tr>'+
	'<td><input type="checkbox" class="board_cb"{{dto.photo_no}}></td>'+
	'<td></td>'+
	'<td>포토후기</td>'+
	'<td>{{photo_subject}}</td>'+
	'<td>{{newDate photo_reg_date}}</td>'+
	'<td><input type="button" id="board_upd" value="수정하기"></td>'+
'</tr>'
var template=Handlebars.compile(source); 
$('.myboard_table').append(template(value));
 		});
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
 		$.each(value.qdto,function(index, value){

 			var source='<tr>'+
 			'<td><input type="checkbox" class="board_cb"{{dto.qa_no}}></td>'+
 			'<td></td>'+
 			'<td>질문과 답변</td>'+
 			'<td>{{qa_subject}}</td>'+
 			'<td>{{newDate qa_reg_date}}</td>'+
 			'<td><input type="button" id="board_upd" value="수정하기"></td>'+
 		'</tr>'
 		var template=Handlebars.compile(source); 
 		$('.myboard_table').append(template(value));
 		 		});
	});
}

function freelist(free){
	$('.myboard_table').empty();
	$('.myboard_table').append('<tr>'+
	'<th width="5%"><input type="checkbox" class="board_checkbox"></th>'+
	'<th width="5%">번호</th>'+
	'<th width="15%">분류</th>'+
	'<th width="40%">제목</th>'+
	'<th width="20%">작성일</th>'+
	'<th width="10%">수정</th>'+
'</tr>');
	

	
 		
	
	$.each(free,function(index, value){
 		$.each(value.bdto,function(index, value){
 			var source='<tr>'+
 			'<td><input type="checkbox" class="board_cb"{{dto.board_no}}></td>'+
 			'<td></td>'+
 			'<td>자유게시판</td>'+
 			'<td>{{board_subject}}</td>'+
 			'<td>{{newDate board_reg_date}}</td>'+
 			'<td><input type="button" id="board_upd" value="수정하기"></td>'+
 		'</tr>'
 		var template=Handlebars.compile(source); 
 		$('.myboard_table').append(template(value));
 		 		});
	});
}


	
</script>
<form id="form_search" method="get" action="search.do">
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
			<c:forEach var="dto" items="${aList}">
			<c:forEach var="bdto" items="${dto.bdto}">
				<tr>
				<td><input type="checkbox" class="board_cb" value="${bdto.board_no}"></td>
					<td></td>
					<td>자유게시판</td>
					<td>${bdto.board_subject}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${bdto.board_reg_date}"/></td>
					<td><input type="button" id="board_upd" value="수정하기"></td>
				</tr>
						</c:forEach>
				</c:forEach>
	
		</table>
		<div class="myboard_write">
		<input type="button" id="button_write" value="글쓰기">
			</div>

		<div class="myboard_find">
		<input type="radio" name="searchtype">제목
		<input type="radio" name="searchtype">내용
		<input type="text" id="searchval" placeholder="검색" name="searchval">
		<input type="button" id="button_find" value="검색">
		</div>
	</div>
	</form>

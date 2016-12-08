<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/my_board.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
/* 	var one = 1;
	var two = 2;
	var three = 3; */
	var boardcategory_no = "${boardcategory_no}";
	
	$('.board_checkbox').bind('click', function() {
		$('.board_cb').prop('checked', this.checked);
	});
	
	

	// 검색
	$('#button_find').on('click', function(){
		var searchval = $('#searchval').val();
		//alert(searchval);
		//alert($('input[type=radio]:checked').val());
		if(searchval==''){
			alert('검색어를 입력하세요.');
			 $('#searchval').focus();
		} else {
			if($('input[type=radio]:checked').val()=="제목"){
			 		$.ajax({
			 			type:"POST",
			 			dataType:"json",
			 			url:"boardtitlesearch.do",
			 			data:"boardcategory_no="+boardcategory_no+"&board_subject="+$('#searchval').val(),
			 			success: searchlist1,
			 			error : function(xhr, textStatus, error) {
				 			alert(error);
				 		}
			 		})
			}else if($('input[type=radio]:checked').val()=="내용"){
				$.ajax({
		 			type:"POST",
		 			dataType:"json",
		 			url:"boardcontentsearch.do",
		 			data:"boardcategory_no="+boardcategory_no+"&board_content="+$('#searchval').val(),
		 			success: searchlist1,
		 			error : function(xhr, textStatus, error) {
			 			alert(error);
			 		}
		 		})
			}
		}
	}); 
 		
	$(document).on('click', '#button_free', function(){
		boardcategory_no = 1;
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'my_board_free.do?member_no=${member_no}&boardcategory_no='+boardcategory_no,
			success : freelist,
			error: function(xhr, textStatus, error) {
				alert(error);
			}
		})
	});
	
	$(document).on('click', '#button_review', function(){
		boardcategory_no = 2;
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'my_board_photo.do?member_no=${member_no}&boardcategory_no='+boardcategory_no,
			success : photolist,
			error: function(xhr, textStatus, error) {
				alert(error);
			}
		})
	});
	
	$(document).on('click', '#button_qa', function(){
		boardcategory_no = 3;
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'my_board_qa.do?member_no=${member_no}&boardcategory_no='+boardcategory_no,
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
	return year+"-"+month+"-"+date;
});//end newDate

function photolist(data){
	//alert(data.pdto.length);
	$('.myboard_table').empty();
	
	if(data.pdto== null){
		$('.myboard_table').append('<img id="empty" src="images/no_board.png">');
	}else{
		$('#empty').remove();
		$('.myboard_table').empty();
		$('.myboard_table').append('<tr>'+
		'<th width="10%">번호</th>'+
		'<th width="15%">분류</th>'+
		'<th width="50%">제목</th>'+
		'<th width="20%">작성일</th>'+
		'</tr>');
	 	$.each(data.pdto,function(index, value){
			//  		$.each(value.pdto,function(index, value){
			var source='<tr>'+
			'<td>{{photo_no}}</td>'+
			'<td>포토후기</td>'+
			'<td>{{photo_subject}}</td>'+
			'<td>{{newDate photo_reg_date}}</td>'+
			'</tr>';
			var template=Handlebars.compile(source); 
			$('.myboard_table').append(template(value));
			//  		});
			$('.myboard_table').append(
			 		'<div class="myboard_find">'+
					'<input type="radio" name="searchtype" value="제목">제목 <input'+
						'type="radio" name="searchtype" value="내용">내용 <input'+
						'type="text" id="searchval" placeholder="검색" name="searchval">'+
					'<img id="button_find" src="./images/button_find2.png">'+
				'</div>'); 
		});
	}
}

function qalist(data){
	$('.myboard_table').empty();
	if(data.qdto== null){
		$('.myboard_table').append('<img id="empty" src="images/no_board.png">');
	}else{
		$('#empty').remove();
	$('.myboard_table').empty();
	$('.myboard_table').append('<tr>'+
	'<th width="10%">번호</th>'+
	'<th width="15%">분류</th>'+
	'<th width="50%">제목</th>'+
	'<th width="20%">작성일</th>'+
'</tr>');
	
 		
	$.each(data.qdto,function(index, value){
//  		$.each(value.qdto,function(index, value){

 			var source='<tr>'+
 			'<td>{{qa_no}}</td>'+
 			'<td>질문과 답변</td>'+
 			'<td>{{qa_subject}}</td>'+
 			'<td>{{newDate qa_reg_date}}</td>'+
 		'</tr>';
 		var template=Handlebars.compile(source); 
 		$('.myboard_table').append(template(value));
 		
//  		 		});
 		$('.myboard_table').append(
 		 		'<div class="myboard_find">'+
 				'<input type="radio" name="searchtype" value="제목">제목 <input'+
 					'type="radio" name="searchtype" value="내용">내용 <input'+
 					'type="text" id="searchval" placeholder="검색" name="searchval">'+
 				'<img id="button_find" src="./images/button_find2.png">'+
 			'</div>'); 
	});
}
}

function freelist(data){
	//alert(data.pdto.length);
	$('.myboard_table').empty();
	if(data.bdto == null){
		$('.myboard_table').append('<img id="empty" src="images/no_board.png">');
	}else{
		$('#empty').remove();
		$('.myboard_table').empty();
		$('.myboard_table').append('<tr>'+
	'<th width="10%">번호</th>'+
	'<th width="15%">분류</th>'+
	'<th width="50%">제목</th>'+
	'<th width="20%">작성일</th>'+
'</tr>');
	
	
	$.each(data.bdto,function(index, value){
  		//$.each(value.bdto,function(index, value){
 			var source='<tr>'+
 			'<td>{{board_no}}</td>'+
 			'<td>자유게시판</td>'+
 			'<td>{{board_subject}}</td>'+
 			'<td>{{newDate board_reg_date}}</td>'+
 		'</tr>';
 		var template=Handlebars.compile(source); 
 		$('.myboard_table').append(template(value));
  		 		//});
 	 	$('.myboard_table').append(
 		'<div class="myboard_find">'+
		'<input type="radio" name="searchtype" value="제목">제목 <input'+
			'type="radio" name="searchtype" value="내용">내용 <input'+
			'type="text" id="searchval" placeholder="검색" name="searchval">'+
		'<img id="button_find" src="./images/button_find2.png">'+
	'</div>'); 
	});
	
	}
}

function searchlist1(data){
		switch (data.boardcategory_no) {
		case 1:
			if(data.list.bdto == null){
				$(".myboard_table").append('<p>'+searchval+'의 검색결과가 없습니다.</p>');
			}else{
				freelist(data.list);
			}
			break;
		case 2:
			if(data.list.pdto == null){
				$(".myboard_table").append('<p>'+searchval+'의 검색결과가 없습니다.</p>');
			}else{
				photolist(data.list);
			}
			break;
		case 3:
			if(data.list.qdto == null){
				$(".myboard_table").append('<p>'+searchval+'의 검색결과가 없습니다.</p>');
			}else{
				qalist(data.list);
			}
			break;

		}
	}
	
</script>
<div class="mypage_body">
	<div class="link">
		<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 내가 쓴 글
	</div>
	<div class="board_button">
		<input type="button" id="button_free" value="자유게시판"> <input
			type="button" id="button_review" value="포토후기"> <input
			type="button" id="button_qa" value="Q&A">
	</div>
	<table class="myboard_table">
	<c:choose>
		<c:when test="${aList.bdto[0].board_no == null}">
			<img id="empty" src="images/no_board.png">
		</c:when>
	<c:otherwise> 
		<tr>
			<th width="10%">번호</th>
			<th width="15%">분류</th>
			<th width="50%">제목</th>
			<th width="20%">작성일</th>
		</tr>
<%-- 		<c:forEach var="dto" items="${aList}"> --%>
			<c:forEach var="bdto" items="${aList.bdto}">
				<tr>
					<td>${bdto.board_no}</td>
					<td>자유게시판</td>
					<td>${bdto.board_subject}</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd" dateStyle="short"
							value="${bdto.board_reg_date}" /></td>
				</tr>
			</c:forEach>
<%-- 		</c:forEach> --%>

	<div class="myboard_find">
		<input type="radio" name="searchtype" value="제목">제목 <input
			type="radio" name="searchtype" value="내용">내용 <input
			type="text" id="searchval" placeholder="검색" name="searchval">
		<img id="button_find" src="./images/button_find2.png">
	</div>
	</c:otherwise>
	</c:choose>
	</table>
</div>

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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$('#list').bind('click', listRun);
		$('#update').bind('click', updateRun);
		$('#delete').bind('click', deleteRun);
		
		$('#comment_insert').click(function(){
			if($('#comment_str').val()==""){
				return false;
			}
			
			$.ajax({
				type:'GET',
				dataType:'json',
				url:"commentInsert.do?comment_content="
						+ $('#comment_str').val() 
						+ "&board_no=${dto.board_no}"
						+ "&member_no=1",
				success : comment_insert,
				error:function(xhr, textStatus, error){
					alert("insert는 " + error);
				}
			});
		});
	});	
	
	Handlebars.registerHelper("newDate", function(timeValue) {
		/* var dataObj = new Date(timeValue);
		var year = dataObj.getFullYear();
		var month = dataObj.getMonth()+1;
		var date = dateObj.getDate(); */
		return new Date(timeValue);
	});
	
	function listRun() {		
		$('#frm').attr('action', "board_list.do").submit();
	}

	function updateRun() {
		$('#frm').attr('action', "board_update.do").submit();
	}

	function deleteRun() {
		$('#frm').attr('action', "board_delete.do").submit();
	}
	
	function comment_insert(res){
		$('.comment_row').remove();
		$('#board_page').empty();
		
		$.each(res.CommentDTO, function(index, value){
			var source = "<tr class='comment_row'><td>{{comment_no}}</td><td>{{comment_content}}</td><td>{{comment_writer}}</td><td>{{newDate comment_date}}</td><td><button class = 'comment_update' value={{comment_no}}수정</button></td><td><button class='comment_delete' value={{comment_no}}삭제</button></td></tr>";
			var template = Handlebars.compile(source);
			$('#comment_table').append(template(value));
		});
		
		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;
		
		if(start > 1){
			$('#board_page').append(
					'<a href="javascript:preFuncion(${board_no},'+ (start - block) + ')">이전</a>');
		}
		
		for(var i=start; i<=end; i++){
			var source1 = '<a href="javascript:myFunction(${board_no}, '
					+ i + ')">' + i + '&nbsp;';
			$('#board_page').append(source1);
		}
		
		if(end < total){
			$('#pre_next_pagenum').append(
					'<a href="javascript:nextFuncion(${board_no},' + (start + block) + ')">다음</a>');
		}
		
		$('#comment_table').val("");
	};
	
	function preFunction(b,c){
		$.ajax({
			type:'POST',
			dataType:'JSON',
			url:"board_view.do",
			data:"board_no="+b+"&currentPage="+c,
			success:comment_prenext_list_result,
			error:function(xhr, textStatus, error){
				alert("에러"+error);
			}
		});
	};
	
	function nextFunction(b,c){
		$.ajax({
			type:'POST',
			dataType:'JSON',
			url:"board_view.do",
			data:"board_no="+ b + "&currentPage=" + c,
			success:comment_prenext_list_result,
			error:function(xhr,textStatus,error){
				alert("에러"+error);
			}
		});
	};
	
	function myFunction(b,i){
		$.ajax({
			type:'POST',
			dataType:'JSON',
			url:"board_view.do",
			data:"board_no="+ b + "&currentPage=" + i,
			success:comment_list_result,
			error:function(xhr,textStatus,error){
				alert("에러"+error);
			}
		});
	};
	
	function comment_list_result(res){
		$('#comment_table .comment_row').remove();
		$.each(res.list,function(index,value){
			var source = "<tr class='comment_row'><td>{{comment_no}}</td><td>{{comment_content}}</td><td>{{comment_writer}}</td><td>{{newDate comment_date}}</td><td><button class='comment_update' value={{comment_no}}>수정</button></td><td><button class = 'comment_delete' value={{comment_no}}>삭제</button></td></tr>";
			var template = Handelbars.compile(source);
			$('#comment_table').append(template(value));
		});
		
	};
	
	function comment_prenext_list_result(res){
		$('#comment_table .comment_row').remove();
		$('#board_page').empty();
		
		$.each(res.list,function(index,value){
			var source = "<tr class='comment_row'><td>{{comment_no}}</td><td>{{comment_content}}</td><td>{{comment_writer}}</td><td>{{newDate comment_date}}</td><td><button class='comment_update' value={{comment_no}}>수정</button></td><td><button class = 'comment_delete' value={{comment_no}}>삭제</button></td></tr>";
			var template = Handelbars.compile(source);
			$('#comment_table').append(template(value));
		});
		
		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;
		
		if (start > 1) {
			$('#board_page').append(
					'<a href="javascript:preFunction(${board_no}, '
							+ (start - block) + ')">이전&nbsp;</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:myFunction(${board_no}, ' + i
					+ ')">' + i + '&nbsp;';
			$('#board_page').append(source1);
		}

		if (end < total) {
			$('#board_page').append(
					'<a href="javascript:nextFunction(${board_no}, '
							+ (start + block) + ')">다음</a>');
		}
	};
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

#comment_button {
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
		<table id="comment_table">
			
		<c:forEach items="${aList}" var="CommentDTO">
			<tr class="comment_row">
				<td>
				${CommentDTO.comment_writer}
				<fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${CommentDTO.comment_date}" />
				<button class="comment_update" value="${CommentDTO.comment_no}">수정</button>
				<button class="comment_delete" value="${CommentDTO.comment_no}">삭제</button>
				</td>
				<td>
					
				</td>
			</tr>
			<tr class="comment_row">
				<td>${CommentDTO.comment_content}</td>
			</tr>
		</c:forEach>
		</table>
	</div>
		
	<div class="board_comment">
		<form id="search_frm">
			<input type="text" id="comment_str" placeholder="댓글을 입력하세요" />
			<input type="button" id="comment_insert" value="입력" />
		</form>		
 	</div>
 	
 	
 	<div class="board_page">
		<!-- 이전 출력 시작 -->
		<c:if test="${pv.startPage>1}">
			<%-- <a href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage-pv.blockPage}">이전</a> --%>
			<a href="javascript:preFunction(${board_no}, ${pv.startPage-pv.blockPage})">
				<c:out value="이전" />
			</a>
		</c:if>

		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<a href="javascript:myFunction(${board_no},${i})">
				<c:out value="${i}" />
			</a>
		</c:forEach>

		<!-- 페이지 출력 끝 -->
		<c:if test="${pv.totalPage>pv.endPage}">
			<%-- <a href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage+pv.blockPage}">다음</a> --%>
			<a href="javascript:nextFunction(${board_no}, ${pv.startPage+pv.blockPage})">
				<c:out value="다음" />
			</a>
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








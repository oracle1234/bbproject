<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	var uno = "";

	$(document).ready(
			function() {

				$('.list_btn').bind('click', listRun);
				$('.update_btn').bind('click', updateRun);
				$('.delete_btn').bind('click', deleteRun);

				//[댓글입력]
				$('#comment_insert').click(
						function() {

							if ($('#comment_str').val() == "") {
								return false;
							}

							$.ajax({
								type : 'GET',
								dataType : 'json',
								url : "qa_commentInsert.do?comment_content="
										+ $('#comment_str').val()
										+ "&qa_no=${dto.qa_no}"
										+ "&member_no=${dto.member_no}"
										+ "&comment_writer=${member.id}",
								success : comment_insert,
								error : function(xhr, textStatus, error) {
									alert("insert는 " + error);
								}
							});
						});

				//[댓글삭제]
				$(document).on(
						'click',
						'.comment_delete',
						function() {
							var cno = $(this).val();
							$.ajax({
								type : 'GET',
								dataType : 'json',
								url : "qa_commentDelete.do?comment_no=" + cno
										+ "&qa_no=${dto.qa_no}"
										+ "&member_no=${dto.member_no}",
								success : comment_delete,
								error : function(xhr, textStatus, error) {
									alert("delete는 " + error);
								}
							});
						});

				//[댓글수정 창 띄우기]
				$('.updateWindow').addClass('updateHide');
				$(document).on('click', '.comment_update', function() {
					uno = $(this).val();
					$('.updateWindow').addClass('updateShow');
					$('.updateWindow').removeClass('updateHide');
				});

				//[업데이트_닫기버튼]
				$('.btnClose').on('click', function() {
					$('.updateWindow').removeClass('updateShow');
					$('.updateWindow').addClass('updateHide');
					uno = '';
				});

				//[댓글수정]
				$(document).on(
						'click',
						'.btnUpdate',
						function() {
							if ($('.updateCommentText').val() == "") {
								return false;

							}

							$.ajax({
								type : 'POST',
								dataType : 'json',
								url : "qa_commentUpdate.do",
								data : "comment_no=" + uno
										+ "&member_no=${dto.member_no}"
										+ "&comment_content="
										+ $('.updateCommentText').val()
										+ "&qa_no=${dto.qa_no}",
								success : comment_update,
								error : function(xhr, textStatus, error) {
									alert("update는 " + error);
								}
							});
						});
			});

	function listRun() {
		$('#frm').attr('action', "qa_list.do").submit();
	}

	function updateRun() {
		$('#frm').attr('action', "qa_update.do").submit();
	}

	function deleteRun() {
		$('#frm').attr('action', "qa_delete.do").submit();
	}

	Handlebars.registerHelper("newDate", function(timeValue) {
		var dataObj = new Date(timeValue);
		var year = dataObj.getFullYear();
		var month = dataObj.getMonth() + 1;
		var date = dataObj.getDate();
		return year + "/" + month + "/" + date;
		//return new Date(timeValue);
	});

	//[댓글입력]
	function comment_insert(res) {
		$('.comment_row').remove();
		$('.board_page').empty();

		$
				.each(
						res.list,
						function(index, value) {
							var source = "<div class='comment_row'><div class='comment_row_top'>{{comment_writer}}{{newDate comment_date}}<button class='comment_update' value={{comment_no}}>수정</button><button class = 'comment_delete' value={{comment_no}}>삭제</button></div><div class='comment_row_bottom'>{{comment_content}}</div></div>";
							var template = Handlebars.compile(source);
							$('.commentarea').append(template(value));

						});

		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;

		if (start > 1) {
			$('.board_page').append(
					'<a href="javascript:preFuncion(${dto.qa_no},'
							+ (start - block) + ')">이전</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:myFunction(${dto.qa_no}, ' + i
					+ ')">' + i + '&nbsp;';
			$('.board_page').append(source1);
		}

		if (end < total) {
			$('.board_page').append(
					'<a href="javascript:nextFuncion(${dto.qa_no},'
							+ (start + block) + ')">다음</a>');
		}

		$('#comment_str').val("");
	};

	//[댓글삭제]
	function comment_delete(res) {
		$('.comment_row').remove();
		$('.board_page').empty();
		if (res.list != null) {
			$
					.each(
							res.list,
							function(index, value) {
								var source = "<div class='comment_row'><div class='comment_row_top'>{{comment_writer}}{{newDate comment_date}}<button class='comment_update' value={{comment_no}}>수정</button><button class = 'comment_delete' value={{comment_no}}>삭제</button></div><div class='comment_row_bottom'>{{comment_content}}</div></div>";
								var template = Handlebars.compile(source);
								$('.commentarea').append(template(value));
							});

			var start = res.page.startPage;
			var end = res.page.endPage;
			var block = res.page.blockPage;
			var total = res.page.totalPage;

			if (start > 1) {
				$('.board_page').append(
						'<a href="javascript:preFuncion(${dto.qa_no},'
								+ (start - block) + ')">이전</a>');
			}

			for (var i = start; i <= end; i++) {
				var source1 = '<a href="javascript:myFunction(${dto.qa_no}, '
						+ i + ')">' + i + '&nbsp;';
				$('.board_page').append(source1);
			}

			if (end < total) {
				$('#pre_next_pagenum').append(
						'<a href="javascript:nextFuncion(${dto.qa_no},'
								+ (start + block) + ')">다음</a>');
			}
		}
	};

	//[댓글수정]
	function comment_update(data) {
		$('.comment_row').remove();
		$('.board_page').empty();

		$
				.each(
						data.list,
						function(index, value) {
							var source = "<div class='comment_row'><div class='comment_row_top'>{{comment_writer}}{{newDate comment_date}}<button class='comment_update' value={{comment_no}}>수정</button><button class = 'comment_delete' value={{comment_no}}>삭제</button></div><div class='comment_row_bottom'>{{comment_content}}</div></div>";
							var template = Handlebars.compile(source);
							$('.commentarea').append(template(value));
						});

		var start = data.page.startPage;
		var end = data.page.endPage;
		var block = data.page.blockPage;
		var total = data.page.totalPage;

		if (start > 1) {
			$('.board_page').append(
					'<a href="javascript:preFuncion(${dto.qa_no},'
							+ (start - block) + ')">이전</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:myFunction(${dto.qa_no}, ' + i
					+ ')">' + i + '&nbsp;';
			$('.board_page').append(source1);
		}

		if (end < total) {
			$('#pre_next_pagenum').append(
					'<a href="javascript:nextFuncion(${dto.qa_no},'
							+ (start + block) + ')">다음</a>');
		}
		$('.updateCommentText').val("");
		$('.updateWindow').removeClass('updateShow');
		$('.updateWindow').addClass('updateHide');
		uno = "";
	};

	function preFunction(b, c) {
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "qa_view.do",
			data : "qa_no=" + b + "&currentPage=" + c,
			success : comment_prenext_list_result,
			error : function(xhr, textStatus, error) {
				alert("에러" + error);
			}
		});
	};

	function nextFunction(b, c) {
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "qa_view.do",
			data : "qa_no=" + b + "&currentPage=" + c,
			success : comment_prenext_list_result,
			error : function(xhr, textStatus, error) {
				alert("에러" + error);
			}
		});
	};

	function myFunction(b, i) {
		$.ajax({
			type : 'POST',
			dataType : 'json',
			url : "qa_view.do",
			data : "qa_no=" + b + "&currentPage=" + i,
			success : comment_list_result,
			error : function(xhr, textStatus, error) {
				alert("에러" + error);
			}
		});
	};

	function comment_list_result(res) {
		$('.commentarea .comment_row').remove();
		$
				.each(
						res.list,
						function(index, value) {
							var source = "<div class='comment_row'><div class='comment_row_top'>{{comment_writer}}{{newDate comment_date}}<button class='comment_update' value={{comment_no}}>수정</button><button class = 'comment_delete' value={{comment_no}}>삭제</button></div><div class='comment_row_bottom'>{{comment_content}}</div></div>";
							var template = Handlebars.compile(source);
							$('.commentarea').append(template(value));
						});
	};

	function comment_prenext_list_result(res) {
		$('.commentarea .comment_row').remove();
		$('.board_page').empty();

		$
				.each(
						res.list,
						function(index, value) {
							var source = "<div class='comment_row'><div class='comment_row_top'>{{comment_writer}}{{newDate comment_date}}<button class='comment_update' value={{comment_no}}>수정</button><button class = 'comment_delete' value={{comment_no}}>삭제</button></div><div class='comment_row_bottom'>{{comment_content}}</div></div>";
							var template = Handlebars.compile(source);
							$('.commentarea').append(template(value));
						});
		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;

		if (start > 1) {
			$('.board_page').append(
					'<a href="javascript:preFunction(${dto.qa_no}, '
							+ (start - block) + ')">이전&nbsp;</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:myFunction(${dto.qa_no}, ' + i
					+ ')">' + i + '&nbsp;';
			$('.board_page').append(source1);
		}

		if (end < total) {
			$('.board_page').append(
					'<a href="javascript:nextFunction(${dto.qa_no}, '
							+ (start + block) + ')">다음</a>');
		}
	};
</script>
<style type="text/css">
#board_row tr {
	width: 950px;
}

th {
	width: 140px;
	text-align: left;
	padding: 10px;
}

td {
	width: 790px;
	text-align: left;
}

#textarea {
	padding: 20px;
	text-align: left;
	height: 450px;
}

#comment_str {
	width: 40%;
	height: 30px;
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

.board_btn {
	padding: 20px;
	float: right;
}

.board_page {
	padding: 20px 50px;
	text-align: center;
}

.updateShow {
	visibility: block;
	position: absolute;
	width:300px;
	height: 70px;
	top: 600px;
	left: 850px;
	border: 1px solid black;
	padding: 10px;
}

.updateHide {
	visibility: hidden;
	width: 0px;
	height: 0px;
}

.comment_row{
	margin-bottom: 30px;
	text-align: left;
	padding-left: 50px;
}

.updateCommentText{
	width:290px;
	height: 30px;
	margin-bottom: 10px;
}
</style>

<body>
	<table class="board_row">
		<tr>
			<th>글쓴이</th>
			<td>${dto.qa_writer}</td>
			<th>조회수</th>
			<td>${dto.qa_readcount}</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${dto.qa_subject}</td>
			<th>작성날짜</th>
			<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
					value="${dto.qa_reg_date}" /></td>
		</tr>
		<tr>
			<th>파일</th>
			<td><c:if test="${!empty dto.qa_upload}">
					<a href="contentdownload.do?qa_no=${dto.qa_no}">
						${fn:substringAfter(dto.qa_upload,"_")} </a>
				</c:if> <c:if test="${empty dto.qa_upload}">
					<c:out value="첨부파일 없음" />
				</c:if></td>
		</tr>
	</table>

	<div class="updateWindow">
		<p>
			<input type="text" class="updateCommentText"
				placeholder="수정할 댓글을 입력하세요" />
		</p>
		<p>
			<button class="btnUpdate" value="${CommentDTO.comment_no}">수정</button>
			<button class="btnClose">닫기</button>
		</p>
	</div>

	<div id="textarea">${dto.qa_content}</div>

	<div class="commentarea">
		<c:forEach items="${aList}" var="CommentDTO">
			<div class="comment_row">
				<div class="comment_row_top">${CommentDTO.comment_writer}<fmt:formatDate
						pattern="yyyy/MM/dd" dateStyle="short"
						value="${CommentDTO.comment_date}" />
					<button class="comment_update" value="${CommentDTO.comment_no}">수정</button>
					<button class="comment_delete" value="${CommentDTO.comment_no}">삭제</button>
				</div>
				<div class="comment_row_bottom">${CommentDTO.comment_content}</div>
			</div>
		</c:forEach>
	</div>

	<div class="board_comment">
		<form id="search_frm">
			<input type="text" id="comment_str" placeholder="댓글을 입력하세요" /> <input
				type="button" id="comment_insert" value="입력" />
		</form>
	</div>

	<div class="board_page">
		<!-- 이전 출력 시작 -->
		<c:if test="${pv.startPage>1}">
			<a
				href="javascript:preFunction(${dto.qa_no}, ${pv.startPage-pv.blockPage})">
				<c:out value="이전" />
			</a>
		</c:if>

		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<a href="javascript:myFunction(${dto.qa_no},${i})"> <c:out
					value="${i}" />
			</a>
		</c:forEach>

		<!-- 페이지 출력 끝 -->
		<c:if test="${pv.totalPage>pv.endPage}">
			<a
				href="javascript:nextFunction(${dto.qa_no}, ${pv.startPage+pv.blockPage})">
				<c:out value="다음" />
			</a>
		</c:if>
	</div>

	<div class="board_btn">
		<form name="frm" id="frm" method="get">
			<input type="hidden" name="qa_no" value="${dto.qa_no}" /> 
			<input type="hidden" name="currentPage" value="${currentPage}" /> 
			<input type="hidden" name="comment_writer" value="${sessionScope.member.id}" /> 
			<input type="image" class="list_btn" alt="목록" src="./images/menu/button_list.png" />

			<c:if test="${member.member_no ==  dto.member_no}">
				<input type="image" class="update_btn" alt="수정" src="./images/menu/button_modify.png" />
				<input type="image" class="delete_btn" alt="삭제" src="./images/menu/button_delete.png" />
			</c:if>
		</form>
	</div>

</body>
</html>








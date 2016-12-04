<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
	function check(res) {				
		if (document.search_frm.keyWord.value == "") {
			alert("검색어를 입력하세요.");
 			document.search_frm.keyWord.focus();
			return;
		}
		document.search_frm.submit();
	}
	
	var start = res.pv.startPage;
	var end = res.pv.endPage;
	var block = res.pv.blockPage;
	var total = res.pv.totalPage;
	
	if (start > 1) {
		$('.board_page').append(
				'<a href="javascript:preFuncion(${dto.board_no},'
						+ (start - block) + ')">이전</a>');
	}

	for (var i = start; i <= end; i++) {
		var source1 = '<a href="javascript:myFunction(${dto.board_no}, '
				+ i + ')">' + i + '&nbsp;';
		$('.board_page').append(source1);
	}

	if (end < total) {
		$('#pre_next_pagenum').append(
				'<a href="javascript:nextFuncion(${dto.board_no},'
						+ (start + block) + ')">다음</a>');
	}

	function preFunction(b, c) {
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "board_list.do",
			data : "board_no=" + b + "&currentPage=" + c,
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
			url : "board_list.do",
			data : "board_no=" + b + "&currentPage=" + c,
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
			url : "board_list.do",
			data : "board_no=" + b + "&currentPage=" + i,
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
							var source = "<td>{{board_no}}</td><td></td>";
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
							var source = "<div class='comment_row'><div class='comment_row_top'>{{comment_writer}}{{newDate comment_date}}<button class='comment_comment' value={{comment_no}}>댓글</button><button class='comment_update' value={{comment_no}}>수정</button><button class = 'comment_delete' value={{comment_no}}>삭제</button></div><div class='comment_row_bottom'>{{comment_content}}</div></div>";
							var template = Handlebars.compile(source);
							$('.commentarea').append(template(value));
						});
		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;

		if (start > 1) {
			$('.board_page').append(
					'<a href="javascript:preFunction(${dto.board_no}, '
							+ (start - block) + ')">이전&nbsp;</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:myFunction(${dto.board_no}, '
					+ i + ')">' + i + '&nbsp;';
			$('.board_page').append(source1);
		}

		if (end < total) {
			$('.board_page').append(
					'<a href="javascript:nextFunction(${dto.board_no}, '
							+ (start + block) + ')">다음</a>');
		} 
	};
</script>
<style type="text/css">
#bodywrap {
	width: 950px;
}

#bodytop {
	width: 950px;
	height: 100px;
}

#table {
	width: 950px;
}

.bodyname {
	font-size: 22px;
	display: block;
	font-family: "맑은 고딕", "malgun gothic", dotum;
	font-weight: bold;
	line-height: 100px;
	margin-left: 25px;
	float: left;
}

.board_search {
	padding: 20px 50px;
	text-align: center;
}

.board_page {
	padding: 20px 50px;
	text-align: center;
}

.board_write {
	padding-top: 10px;
	padding-right: 10px;
	text-align: right;
}

#keyWord {
	width: 40%;
}

#btnSearch {
	background-color: #8c8888;
	color: #fff;
	width: 80px;
	height: 25px;
	line-height: 10px;
}

#btnWrite {
	border-color: #cec6c6;
	background-color: #ffffff;
	width: 80px;
	height: 25px;
	line-height: 10px;
}

#table {
	padding: 11px 0;
	border-top: 2px solid black;
	border-bottom: 1px solid gray;
}

#table #col {
	line-height: 40px;
}

td {
	padding-top: 7px;
}
</style>

<body>
	<div id="bodywrap">
		<div id="bodytop">
			<h3 class="bodyname">자유게시판</h3>
		</div>
		<table id="table">
			<tr id="col">
				<th width="5%">번호</th>
				<th width="65%">제목</th>
				<th width="10%">글쓴이</th>
				<th width="10%">등록일</th>
				<th width="10%">조회수</th>
			</tr>

			<c:forEach var="BoardDTO" items="${aList}">
				<tr>
					<td>${BoardDTO.board_no}</td>
					<td><c:url var="board_content" value="board_view.do">
							<c:param name="currentPage" value="${pv.currentPage}" />
							<c:param name="board_no" value="${BoardDTO.board_no}" />
						</c:url> <a href="${board_content}">${BoardDTO.board_subject}</a></td>
					<td>${BoardDTO.board_writer}</td>
					<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
							value="${BoardDTO.board_reg_date}" /></td>
					<td>${BoardDTO.board_readcount}</td>
				</tr>
			</c:forEach>
		</table>

		<div class="board_write">
			<a href="board_write.do"><img alt="글쓰기"
				src="./images/btn_write.gif"></a>
		</div>

		<div class="board_page">
			<!-- 이전 출력 시작 -->
			<c:if test="${pv.startPage>1}">
				<a
					href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage-pv.blockPage}">이전</a>
			</c:if>

			<!-- 페이지 출력 시작 -->
			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
				<c:url var="currPage" value="board_list.do?boardcategory_no=1">
					<c:param name="currentPage" value="${i}" />
				</c:url>
				<a href="${currPage}"><c:out value="${i}" /></a>
			</c:forEach>

			<!-- 페이지 출력 끝 -->
			<c:if test="${pv.totalPage>pv.endPage}">
				<a
					href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage+pv.blockPage}">다음</a>
			</c:if>

		</div>

		<div class="board_search">
			<form action="board_search.do" id="search_frm" name="search_frm"
				method="post">

				<select name="keyField" size="1">
					<option value="board_subject"><c:if
							test="${'board_subject'==keyField}">selected</c:if>제목
					</option>
					<option value="board_writer"><c:if
							test="${'board_writer'==keyField}">selected</c:if>글쓴이
					</option>
				</select> <input type="text" name="keyWord" id="keyWord" value="${keyWord}">
				<input type="image" value="검색" src="./images/menu/button_find.png"
					onclick="check()">

			</form>
		</div>
	</div>
</body>
</html>
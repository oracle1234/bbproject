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
	$(function() {

		$("#search_frm").submit(function() {
			if ($("#keyWord").val() == "") {
				alert("검색어를 입력하세요.");
				return false;
			}
		});
	});
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

.content a{
	color: black;
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
				<tr class="content">
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

			<c:choose>
				<c:when test="${keyWord == null}">
					<!-- 이전 출력 시작 -->
					<c:if test="${pv.startPage>1}">
						<a
							href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage-pv.blockPage}">이전</a>
					</c:if>

					<!-- 페이지 num출력 시작 -->
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
				</c:when>

				<c:otherwise>
					<!-- 이전 출력 시작 -->
					<c:if test="${pv.startPage>1}">
						<a
							href='board_list.do?boardcategory_no=1&currentPage=${pv.startPage-pv.blockPage}&keyFiled=${keyFiled}&keyWord=${keyWord}'>이전</a>
					</c:if>

					<!-- 페이지 num출력 시작 -->
					<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
						<c:url var="currPage" value="board_search.do?boardcategory_no=1">
							<c:param name="currentPage" value="${i}" />
							<c:param name="keyField" value="${keyField}"></c:param>
							<c:param name="keyWord" value="${keyWord}"></c:param>
						</c:url>
						<a href="${currPage}"><c:out value="${i}" /></a>
					</c:forEach>

					<!-- 페이지 출력 끝 -->
					<c:if test="${pv.totalPage>pv.endPage}">
						<a
							href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage+pv.blockPage}&keyFiled=${keyFiled}&keyWord=${keyWord}">다음</a>
					</c:if>
				</c:otherwise>
			</c:choose>

			<!-- 이전 출력 시작 -->
			<%-- 			<c:if test="${pv.startPage>1}"> --%>
			<!-- 				<a -->
			<%-- 					href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage-pv.blockPage}">이전</a> --%>
			<%-- 			</c:if> --%>

			<!-- 페이지 num출력 시작 -->
			<%-- 			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}"> --%>
			<%-- 				<c:url var="currPage" value="board_list.do?boardcategory_no=1"> --%>
			<%-- 					<c:param name="currentPage" value="${i}" /> --%>
			<%-- 				</c:url> --%>
			<%-- 				<a href="${currPage}"><c:out value="${i}" /></a> --%>
			<%-- 			</c:forEach> --%>

			<!-- 페이지 출력 끝 -->
			<%-- 			<c:if test="${pv.totalPage>pv.endPage}"> --%>
			<!-- 				<a -->
			<%-- 					href="board_list.do?boardcategory_no=1&currentPage=${pv.startPage+pv.blockPage}">다음</a> --%>
			<%-- 			</c:if> --%>

		</div>

		<div class="board_search">
			<form action="board_search.do" id="search_frm" name="search_frm"
				method="GET">

				<select name="keyField" size="1">

					<option value="board_subject"><c:if
							test="${'board_subject'==keyField}">selected</c:if>제목
					</option>

					<option value="board_writer"><c:if
							test="${'board_writer'==keyField}">selected</c:if>작성자
					</option>

				</select> <input type="text" name="keyWord" id="keyWord" value="${keyWord}">
				<input type="image" value="검색" src="./images/menu/button_find.png">

			</form>
		</div>
	</div>
</body>
</html>
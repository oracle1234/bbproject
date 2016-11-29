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
<style type="text/css">
#bodywrap {
	width: 950px;
	height: 750px;
}

#bodytop {
	width: 950px;
	height: 100px;
}

.bodyname {
	font-size: 22px;
	display: block;
	font-family: "맑은 고딕", "malgun gothic", dotum;
	font-weight: bold;
	line-height:100px;
	margin-left:25px;
	float: left;
}

.board_page {
	padding: 20px 50px;
	text-align: center;
}

#photobox, #list{
	width: 950px;
	height:560px;
}

#list li{
	padding-left:15px;
	padding-bottom:15px;
	float:left;
	width: 105px;
	height:95px;
}

#list .line_first{
	padding-left: 0px;
	padding-bottom: 15px;
}

#list a{
	width: 80px;
	height:70px;
}

.board_write {
	padding-top:10px;
	padding-right:10px;
	text-align: right;
}
</style>

<body>
	<div id="bodywrap">
		<div id="bodytop">
			<h3 class="bodyname">포토후기</h3>
		</div>
		<div id=photobox>
			<ul id="list">
			<c:forEach items="${aList}" var="Photo_BoardDTO">
				<li class="photo_img">
					<a href="photo_list.do?photo_no=${Photo_BoardDTO.photo_no}"><img alt="후기이미지" src="images/${Photo_BoardDTO.picture}"></a>
				</li>	
			</c:forEach>
			</ul>
		</div>

		<div class="board_write">
			<a href="photo_write.do"><img alt="글쓰기" src="./images/btn_write.gif"></a>
		</div>

		<div class="board_page">
		<!-- 이전 출력 시작 -->
		<c:if test="${pv.startPage>1}">
			<a href="board_list.do?currentPage=${pv.startPage-pv.blockPage}">이전</a>
		</c:if>

		<!-- 페이지 출력 시작 -->
		<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
			<c:url var="currPage" value="photo_list.do">
				<c:param name="currentPage" value="${i}" />
			</c:url>
			<a href="${currPage}"><c:out value="${i}" /></a>
		</c:forEach>

		<!-- 페이지 출력 끝 -->
		<c:if test="${pv.totalPage>pv.endPage}">
			<a href="board_list.do?currentPage=${pv.startPage+pv.blockPage}">다음</a>
		</c:if>
	</div>

	</div>
</body>
</html>
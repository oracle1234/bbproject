<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="css/nf.lightbox.css"
	media="screen" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="js/NFLightBox.js"></script>
<script type="text/javascript">
	var member_id = "${sessionScope.member.id}";

	$(document).ready(function() {

		$("#write").click(function() {
			if (member_id == '') {
				alert("회원가입을 하세요.")
				return false;
			}
		});

		var settings = {
			containerResizeSpeed : 350
		};
		$('#gallery a').lightBox(settings);
	});
</script>
<style type="text/css">
#gallery {
	padding: 10px;
	width: 930px;
}

#gallery ul {
	list-style: none;
}

#gallery ul li {
	display: inline;
}

#gallery ul img {
	border: 5px solid #3e3e3e;
	border-width: 5px 5px 20px;
}

#gallery ul a:hover img {
	border: 5px solid #ff6000;
	border-width: 5px 5px 20px;
	color: #ff6000;
}

#gallery ul a:hover {
	color: #fff;
}

#photoList {
	padding-top: 10px;
	padding-bottom: 10px;
	width: 930px;
}

.board_page {
	padding: 20px 50px;
	text-align: center;
}

.board_write {
	padding: 20px 10px;
	height: 30px;
}

.board_write {
	padding-top: 10px;
	padding-right: 10px;
	text-align: right;
}

img {
	margin-bottom: 20px;
	margin-right: 10px;
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
	line-height: 100px;
	margin-left: 25px;
	float: left;
}
</style>
<body>
	<div id="bodytop">
		<h3 class="bodyname">포토후기</h3>
	</div>
	<div id="gallery">
		<ul id="photoList">
			<c:forEach items="${aList}" var="idto">
				<li><a href="#"><img alt="후기이미지"
						src="photo_image.do?filename=${idto.photo_upload}" width="200"></a></li>
			</c:forEach>
		</ul>
		<div class="board_write">
			<a href="photo_write.do"><img alt="글쓰기"
				src="./images/btn_write.gif" id="write"></a>
		</div>

		<div class="board_page">
			<!-- 이전 출력 시작 -->
			<c:if test="${pv.startPage>1}">
				<a
					href="photo_list.do?boardcategory_no=2&currentPage=${pv.startPage-pv.blockPage}">이전</a>
			</c:if>

			<!-- 페이지 출력 시작 -->
			<c:forEach var="i" begin="${pv.startPage}" end="${pv.endPage}">
				<c:url var="currPage" value="photo_list.do?boardcategory_no=2">
					<c:param name="currentPage" value="${i}" />
				</c:url>
				<a href="${currPage}"><c:out value="${i}" /></a>
			</c:forEach>

			<!-- 페이지 출력 끝 -->
			<c:if test="${pv.totalPage>pv.endPage}">
				<a
					href="photo_list.do?boardcategory_no=2&currentPage=${pv.startPage+pv.blockPage}">다음</a>
			</c:if>
		</div>
	</div>
</body>
</html>
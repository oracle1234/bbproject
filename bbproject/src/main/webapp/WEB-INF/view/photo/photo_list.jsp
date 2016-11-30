<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/nf.lightbox.css" media="screen" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="js/NFLightBox.js"></script>
<script type="text/javascript"> 
	$(function() {
	var settings = { containerResizeSpeed: 350
		};
		$('#gallery a').lightBox(settings);
	});
</script>
<style type="text/css"> 
#gallery{padding: 10px;width: 950px; height: 600px;}
#gallery ul{list-style: none;}
#gallery ul li{display: inline;}
#gallery ul img{border: 5px solid #3e3e3e;border-width: 5px 5px 20px;}
#gallery ul a:hover img{border: 5px solid #ff6000;border-width: 5px 5px 20px;color: #ff6000;}
#gallery ul a:hover{color: #fff;}
</style>
</head>

<body>

<div id="gallery">
	<ul id="photoList">
	<c:forEach items="${aList}" var="PhotoDTO">
		<li><a href="#"><img alt="후기이미지" src="photo_image.do?filename=${PhotoDTO.photo_upload}" width="250"></a></li>
	</c:forEach>
	</ul>
</div>



<!-- <div id="gallery">
	<ul>
		<li><a href="photos/01.jpg" title="여기에 이미지 코멘트 입력">
		<img src="/images/photo_board/photos/t01.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/02.jpg" title="Add title to show image name or description"><img src=".images/photo_board/photos/t02.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/03.jpg" title="Add title to show image name or description"><img src="photos/t03.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/04.jpg" title="Add title to show image name or description"><img src="photos/t04.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/05.jpg" title="Add title to show image name or description"><img src="photos/t05.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/06.jpg" title="Add title to show image name or description"><img src="photos/t06.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/07.jpg" title="Add title to show image name or description"><img src="photos/t07.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/08.jpg" title="Add title to show image name or description"><img src="photos/t08.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/09.jpg" title="Add title to show image name or description"><img src="photos/t09.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/10.jpg" title="Add title to show image name or description"><img src="photos/t10.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/11.jpg" title="Add title to show image name or description"><img src="photos/t11.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/12.jpg" title="Add title to show image name or description"><img src="photos/t12.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/13.jpg" title="Add title to show image name or description"><img src="photos/t13.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/14.jpg" title="Add title to show image name or description"><img src="photos/t14.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/15.jpg" title="Add title to show image name or description"><img src="photos/t15.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/16.jpg" title="Add title to show image name or description"><img src="photos/t16.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/17.jpg" title="Add title to show image name or description"><img src="photos/t17.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/18.jpg" title="Add title to show image name or description"><img src="photos/t18.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/19.jpg" title="Add title to show image name or description"><img src="photos/t19.jpg" width="110" alt="" /></a></li>
		<li><a href="photos/20.jpg" title="Add title to show image name or description"><img src="photos/t20.jpg" width="110" alt="" /></a></li>
	</ul>
</div> -->




		<%-- <div class="board_write">
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
	</div> --%>


</body>
</html>
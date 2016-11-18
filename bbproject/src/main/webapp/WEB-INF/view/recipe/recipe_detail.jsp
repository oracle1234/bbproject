<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">

</style>
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css" media="all" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script  src="js/jquery.bxslider.js"></script>

<script type="text/javascript">

	$(function() {
		
		var mySlider = $(".bxslider").bxSlider({
			mode : "horizontal", // 가로 수평으로 슬라이드 됩니다.
			speed : 500, // 이동 속도를 설정합니다.
			pager : false, // 현재 위치 페이징 표시 여부 설정.
			moveSlides : 1, // 슬라이드 이동시 갯수 설정.
			slideWidth : 100, // 슬라이드 마다 너비 설정.
			minSlides : 1, // 최소 노출 개수를 설정합니다.
			maxSlides : 1, // 최대 노출 개수를 설정합니다.
			slideMargin : 10, // 슬라이드간의 간격을 설정합니다.
			auto : true, // 자동으로 흐를지 설정합니다.
			autoHover : true, // 마우스 오버시 정시킬지 설정합니다.
			controls : true // 이전 다음 버튼 노출 여부 설정합니다.
			
		});

	});
</script>

</head>
<body>

	<div id="detailmain">
			<h1>레시피 이름 : ${dto.recipe_name }</h1>
			
			<span> 
			<img src="image.do?filename=${dto.picture}" width="300px" height="300px"/>
			</span>
			<p>간단 설명 : ${dto.recipe_explaination }</p>
			<p>인원 : ${dto.portion }</p>
			<p>조리 난이도 : ${dto.difficulty }</p>
			<p>조리 시간 : ${dto.recipe_time }</p>
			
			
			<c:forEach items="${dto.list}" var="list">
				<p> ${list.order_text}</p>
				<p> <img src="image.do?filename=${list.order_pic }" width="100"> </p>
			</c:forEach>
			
			<div>
				<br/>
				<h1>완성 사진</h1>
				<ul class="bxslider">
					<c:forEach items="${dto.complete_pic}" var="img">
						<li><img alt="" src="image.do?filename=${img}" width="100"/></li>
					</c:forEach>
				</ul>
			</div>
			
	</div>

</body>
</html>




<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css"
	media="all" />
	<link rel="stylesheet" type="text/css" href="css/recipe.css" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script type="text/javascript">

$(function () {
	var mySlider = $(".bxslider").bxSlider({
		mode : "horizontal", // 가로 수평으로 슬라이드 됩니다.
		speed : 500, // 이동 속도를 설정합니다.
		pager : false, // 현재 위치 페이징 표시 여부 설정.
		moveSlides : 1, // 슬라이드 이동시 갯수 설정.
		slideWidth : 500, // 슬라이드 마다 너비 설정.
		minSlides : 1, // 최소 노출 개수를 설정합니다.
		maxSlides : 1, // 최대 노출 개수를 설정합니다.
		slideMargin : 10, // 슬라이드간의 간격을 설정합니다.
		auto : true, // 자동으로 흐를지 설정합니다.
		autoHover : true, // 마우스 오버시 정시킬지 설정합니다.
		controls : false // 이전 다음 버튼 노출 여부 설정합니다.
	});
	
});

</script>

<div id="detailmain">

	<div id="detail_imgdiv" class="recipebox">
		<div id="menuimg" class="recipe_sub1">
			<span>
			 <img src="image.do?filename=${dto.picture}"
				width="300px" height="300px" />
			</span>
		</div>
		<div id="menudetail" class="recipe_sub2">
			<div class="list_detail">
			<span>레시피 이름 : ${dto.recipe_name }</span> <span>인원 :
				${dto.portion }</span> <span>조리 난이도 : ${dto.difficulty }</span> <span>조리
				시간 : ${dto.recipe_time }</span>
			</div>
		</div>
	</div>
	
	<hr/>
	<p id="exp">설명 : ${dto.recipe_explaination }</p>
	
	<br/>
	<p> 조리 순서 </p>
	<br/>
	
	<div id="orderlist">
		<c:forEach items="${dto.list}" var="list" varStatus="status">
				<p><img alt="" src="images/icon_step_${status.index + 1}.gif" width="20px" height="20px"> ${list.order_text}</p>
				<p>
					<img src="image.do?filename=${list.order_pic }" width="300">
				</p>
		</c:forEach>
	</div>

	<div>
		<br />
		<h1>완성 사진</h1>
		<br />
		<ul class="bxslider">
			<c:forEach items="${dto.complete_pic}" var="img">
				<li><img alt="" src="image.do?filename=${img}" width="500" /></li>
			</c:forEach>
		</ul>
	</div>

</div>



<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css"
	media="all" />
<link rel="stylesheet" type="text/css" href="css/recipe.css" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/recipe.js"></script>

<div id="detailmain">

	<div id="detail_imgdiv">
		<div id="menuimg">
			<span> 
				<img src="image.do?filename=${dto.picture}"	width="300px" height="300px" />
			</span>
		</div>
		<div id="menudetail">
			<span>레시피 이름 : ${dto.recipe_name }</span>
			<span>간단 설명 : ${dto.recipe_explaination }</span>
			<span>인원 : ${dto.portion }</span>
			<span>조리 난이도 : ${dto.difficulty }</span>
			<span>조리 시간 : ${dto.recipe_time }</span>
		</div>
	</div>
	
	

	<c:forEach items="${dto.list}" var="list">
		<p>${list.order_text}</p>
		<p>
			<img src="image.do?filename=${list.order_pic }" width="300">
		</p>
	</c:forEach>

	<div>
		<br />
		<h1>완성 사진</h1>
		<ul class="bxslider">
			<c:forEach items="${dto.complete_pic}" var="img">
				<li><img alt="" src="image.do?filename=${img}" width="500" /></li>
			</c:forEach>
		</ul>
	</div>

</div>



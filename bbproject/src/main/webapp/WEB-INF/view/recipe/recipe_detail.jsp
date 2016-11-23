<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="detailmain">

	<div id="detail_imgdiv">
		<div id="menuimg">
			<span> <img src="image.do?filename=${dto.picture}"
				width="300px" height="300px" />
			</span>
		</div>
		<div id="menudetail">
			<span>레시피 이름 : ${dto.recipe_name }</span> <span>인원 :
				${dto.portion }</span> <span>조리 난이도 : ${dto.difficulty }</span> <span>조리
				시간 : ${dto.recipe_time }</span>
		</div>
	</div>
	
	<p id="exp">설명 : ${dto.recipe_explaination }</p>
	
	<div id="orderlist">
		<c:forEach items="${dto.list}" var="list" varStatus="status">
			<p>${status.index + 1}.       ${list.order_text}</p>
			<p>
				<img src="image.do?filename=${list.order_pic }" width="300">
			</p>
		</c:forEach>
	</div>

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



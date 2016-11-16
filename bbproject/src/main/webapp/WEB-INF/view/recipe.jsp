<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
.recipelist {
	width: 900px;
	background-color: yellow;
	margin: auto;
}

.recipebox {
	width: 700px;
	height: 250px;
	background-color: red;
	margin: auto;
	margin-top: 10px;
}

.recipe_over {
	display: block;
}

.recipe_out {
	display: none;
}

.recipe_sub1 {
	width: 250px;
	float: left;
	position: relative;
}

.recipe_sub2 {
	width: 450px;
	height: 250px;
	background-color: green;
	float: right;
	position: relative;
}

.recipe_sub1 span img {
	width: 250px;
	height: 250px;
	position: absolute;
	left: 0;
}

.list_detail {
	position: absolute;
	top: 40px;
	left: 40px;
}

.list_detail p {
	line-height: 30px;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {

		$(".recipebox").mouseover(function() {
			$(".imgbox .recipe_img2", this).removeClass("recipe_out");
			$(".imgbox .recipe_img2", this).addClass("recipe_over");
		});

		$(".recipebox").mouseout(function() {
			$(".imgbox .recipe_img2", this).removeClass("recipe_over");
			$(".imgbox .recipe_img2", this).addClass("recipe_out");
		});

		// 		alert($("#barimg").attr("src", "images/mypage_main.png"));

	});
</script>

</head>
<body>

	<div class="recipediv">
		<div>
			<button>버튼</button>
		</div>
		<div class="recipelist">
			
			<c:forEach items="${aList}" var="dto">
				
				<div class="recipebox">
					<a href="recipedetail.do?recipe_no=${dto.recipe_no }" class="recipe">
						<span class="recipe_sub1">
							<span class="imgbox"> 
								<img class="recipe_img1" src="images/delevery.png" /> 
								<img class="recipe_img2 recipe_out" alt=""	src="images/thumb_over.png">
							</span>
						</span>
						<span class="recipe_sub2">
							<span class="list_detail">
								<p>레시피 이름 : ${dto.recipe_name }</p>
								<p>간단 설명 : ${dto.recipe_explaination }</p>
								<p>인원 : ${dto.portion }</p>
								<p>조리 난이도 : ${dto.difficulty }</p>
								<p>조리 시간 : ${dto.recipe_time }</p>
							</span>
						</span>
					</a>
				</div>
			</c:forEach>
			
		</div>
	</div>



</body>
</html>




<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	border: 2px solid #0066ff;
	border-radius: 30px;
	overflow: hidden;
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

.list_detail span {
	display : block;
	line-height: 30px;
}

.del{
	width : 100%;
	text-align: center;
}


</style>
<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>

<body>

	<div class="recipediv">
		<div class="recipelist">
			
			<c:forEach items="${aList}" var="dto">
				
				<div class="recipebox">
					<a href="recipedetail.do?recipe_no=${dto.recipe_no }" class="recipe">
						<span class="recipe_sub1">
							<span class="imgbox"> 
								<img class="recipe_img1" src="image.do?filename=${dto.picture}" /> 
							</span>
						</span>
						<span class="recipe_sub2">
							<span class="list_detail">
								<span>레시피 이름 : ${dto.recipe_name }</span>
								<span>간단 설명 : ${dto.recipe_explaination }</span>
								<span>인원 : ${dto.portion }</span>
								<span>조리 난이도 : ${dto.difficulty }</span>
								<span>조리 시간 : ${dto.recipe_time }</span>
								<span>테마 : 
									<c:choose>
										<c:when test="${dto.theme_no == 1}">
											<c:out value="영양식"></c:out>
										</c:when>
										<c:when test="${dto.theme_no == 2}">
											<c:out value="간식"></c:out>
										</c:when>
										<c:when test="${dto.theme_no == 3}">
											<c:out value="도시락"></c:out>
										</c:when>
										<c:when test="${dto.theme_no == 4}">
											<c:out value="다이어트"></c:out>
										</c:when>
										<c:when test="${dto.theme_no == 5}">
											<c:out value="야식"></c:out>
										</c:when>
										<c:otherwise>
											<c:out value="미분류"></c:out>
										</c:otherwise>
									</c:choose>
								</span>
							</span>
						</span>
					</a>
				</div>
				<div class="del">
					<a href="adminrecipedel.do?recipe_no=${dto.recipe_no}">삭제</a>	
				</div>
			</c:forEach>
			
		</div>
	</div>



</body>




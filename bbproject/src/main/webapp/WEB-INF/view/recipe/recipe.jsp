<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/recipe.css" />
<script src="js/recipe.js"></script>
<script type="text/javascript">
	var theme_no = "${pdto.theme_no}";
	var currentRow = parseInt("${pdto.currentRow}");
	var endRow = parseInt("${pdto.endRow}");
	var totalRow = parseInt("${pdto.totalRow}");
	var recipe_name = "";
</script>
<body>

	<div class="recipediv">
		<div>
			<h1 id="list_title">RECIPE</h1>
		</div>
		
		<div class="recipe_search">
			<select id="theme_no" name="theme_no">
				<option value="0">전체</option>
				<option value="1">영양식</option>
				<option value="2">간식</option>
				<option value="3">도시락</option>
				<option value="4">다이어트</option>
				<option value="5">야식</option>
			</select>
			<input type="text" id="recipe_name" name="recipe_name" />
			<input type="image" src="images/header_sch_btn.gif" id="recipe_sch_btn">
		</div>
		
		<div class="recipelist">

			<c:forEach items="${aList}" var="dto">

				<div class="recipebox">
					<a href="recipedetail.do?recipe_no=${dto.recipe_no }"
						class="recipe"> 
					<span class="recipe_sub1"> <span
							class="imgbox"> <img class="recipe_img1"
								src="image.do?filename=${dto.picture}" /> <img
								class="recipe_img2 recipe_out" alt=""
								src="images/thumb_over.png">
						</span>
					</span> <span class="recipe_sub2"> <span class="list_detail">
								<span>레시피 이름 : ${dto.recipe_name }</span> 
<%-- 								<span>간단 설명 : ${dto.recipe_explaination }</span> --%>
								 <span>인원 : ${dto.portion }</span> <span>조리
									난이도 : ${dto.difficulty }</span> <span>조리 시간 : ${dto.recipe_time }</span>
						</span>
					</span>
					</a>
				</div>
			</c:forEach>
		</div>

	</div>



</body>




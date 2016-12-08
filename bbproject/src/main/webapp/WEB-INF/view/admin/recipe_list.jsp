<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/recipe.css" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	var theme_no = "${pdto.theme_no}";
	var currentRow = parseInt("${pdto.currentRow}");
	var endRow = parseInt("${pdto.endRow}");
	var totalRow = parseInt("${pdto.totalRow}");
	
	$(function() {
		$(window).on("scroll", function() {
			var bodyBottom = $("body").height();
			var scrollBottom = $(window).scrollTop() + $(window).height();
			
			console.log(bodyBottom + "===" + scrollBottom);
			
			if(bodyBottom == scrollBottom){
				if(endRow < totalRow){
					recipeList(theme_no);
				}
			}
		});
	});
	
	function recipeList(no) {
		currentRow += 1;
		$.ajax({
			type : "POST",
			dataType : "json",
			url : "adminrecipelist.do",
			data : "theme_no="+theme_no+"&currentRow="+currentRow,
			success : function(data) {
				endRow = data.pdto.endRow;
					$.each(data.list, function(index, value) {
						$(".recipelist").append(
							'<div class="recipebox">'+
							'<a href="recipedetail.do?recipe_no='+value.recipe_no+'"'+
								' class="recipe"> <span class="recipe_sub1"> <span'+
									' class="imgbox"> <img class="recipe_img1"'+
										' src="image.do?filename='+value.picture+'" /> <img'+
										' class="recipe_img2 recipe_out" alt=""'+
										' src="images/thumb_over.png"></span>'+
							'</span> <span class="recipe_sub2"> <span class="list_detail">'+
										'<span>레시피 이름 : '+value.recipe_name+'</span> <span>인원 : '+value.portion+'</span><span>조리'+
											' 난이도 : '+value.difficulty+'</span> <span>조리 시간 : '+value.recipe_time+'</span>'+
								'</span></span></a></div>'+
								'<div class="del">'+
							'<a href="adminrecipedel.do?currentRow=1&recipe_no='+value.recipe_no+'">삭제</a></div>'
						);
						
					});
				},
				error: function(xhr, textStatus, error) {
					alert(error);
				}
		});
	}
</script>

	<hr/>
	<div class="recipediv">
		<ul>
			<li><a href="adminrecipelist.do?theme_no=1">영양식</a></li>
			<li><a href="adminrecipelist.do?theme_no=2">간식</a></li>
			<li><a href="adminrecipelist.do?theme_no=3">도시락</a></li>
			<li><a href="adminrecipelist.do?theme_no=4">다이어트</a></li>
			<li><a href="adminrecipelist.do?theme_no=5">야식</a></li>
		</ul>
	
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
								<span>인원 : ${dto.portion }</span>
								<span>조리 난이도 : ${dto.difficulty }</span>
								<span>조리 시간 : ${dto.recipe_time }</span>
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


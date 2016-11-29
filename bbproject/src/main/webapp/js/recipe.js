/**
 * 
 */

$(function() {

	$(document).on("mouseover", ".recipebox", function() {
		$(".imgbox .recipe_img2", this).removeClass("recipe_out");
		$(".imgbox .recipe_img2", this).addClass("recipe_over");
	});

	$(document).on("mouseout", ".recipebox", function() {
		$(".imgbox .recipe_img2", this).removeClass("recipe_over");
		$(".imgbox .recipe_img2", this).addClass("recipe_out");
	});

	$(window).on("scroll", function() {
		var bodyBottom = $("body").height();
		var scrollBottom = $(window).scrollTop() + $(window).height();
		if (bodyBottom == scrollBottom) {
			if (endRow < totalRow) {
				recipeList(theme_no);
			}
		}
	});

	$("#list_title").text(themeTitle(theme_no));
});

function themeTitle(theme_no) {
	var str = "";
	switch (theme_no) {
	case "1":
		// $("#list_title").text("영양식");
		str = "영양식";
		break;
	case "2":
		// $("#list_title").text("간식");
		str = "간식";
		break;
	case "3":
		// $("#list_title").text("도시락");
		str = "도시락";
		break;
	case "4":
		// $("#list_title").text("다이어트");
		str = "다이어트";
		break;
	case "5":
		// $("#list_title").text("야식");
		str = "야식";
		break;
	default:
		// $("#list_title").text("RECIPE");
		str = "RECIPE";
		break;
	}

	return str;
}

function recipeList(no) {
	currentRow += 1;
	$
			.ajax({
				type : "POST",
				dataType : "json",
				url : "recipe.do",
				data : "theme_no=" + theme_no + "&currentRow=" + currentRow,
				success : function(data) {
					endRow = data.pdto.endRow;
					$
							.each(
									data.list,
									function(index, value) {
										$(".recipelist")
												.append(
														'<div class="recipebox">'
																+ '<a href="recipedetail.do?recipe_no='
																+ value.recipe_no
																+ '"'
																+ ' class="recipe"> <span class="recipe_sub1"> <span'
																+ ' class="imgbox"> <img class="recipe_img1"'
																+ ' src="image.do?filename='
																+ value.picture
																+ '" /> <img'
																+ ' class="recipe_img2 recipe_out" alt=""'
																+ ' src="images/thumb_over.png"></span>'
																+ '</span> <span class="recipe_sub2"> <span class="list_detail">'
																+ '<span>레시피 이름 : '
																+ value.recipe_name
																+ '</span>'
																+
																// <span>간단 설명
																// :'+value.recipe_explaination+'</span>
																'<span>인원 : '
																+ value.portion
																+ '</span><span>조리'
																+ ' 난이도 : '
																+ value.difficulty
																+ '</span> <span>조리 시간 : '
																+ value.recipe_time
																+ '</span>'
																+ '</span></span></a></div>');

									});
				},
				error : function(xhr, textStatus, error) {
					alert(error);
				}
			});

}

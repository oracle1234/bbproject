/**
 * 
 */

$(function() {
	
	$(".recipebox").mouseover(function() {
		$(".imgbox .recipe_img2", this).removeClass("recipe_out");
		$(".imgbox .recipe_img2", this).addClass("recipe_over");
	});

	$(".recipebox").mouseout(function() {
		$(".imgbox .recipe_img2", this).removeClass("recipe_over");
		$(".imgbox .recipe_img2", this).addClass("recipe_out");
	});

		
});
	
	
	
	
	
	

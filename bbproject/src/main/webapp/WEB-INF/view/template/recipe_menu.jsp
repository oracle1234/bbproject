<%@page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$(".0yang").bind("mouseover", function() {
			$(this).attr("src", "./images/menu/recipe_0yang2.png");
		});
		$(".0yang").bind("mouseout", function() {
			$(this).attr("src", "./images/menu/recipe_0yang.png");
		});
		$(".dessert").bind("mouseover", function() {
			$(this).attr("src", "./images/menu/recipe_dessert2.png");
		});
		$(".dessert").bind("mouseout", function() {
			$(this).attr("src", "./images/menu/recipe_dessert.png");
		});

		$(".lunchbox").bind("mouseover", function() {
			$(this).attr("src", "./images/menu/recipe_lunchbox2.png");
		});
		$(".lunchbox").bind("mouseout", function() {
			$(this).attr("src", "./images/menu/recipe_lunchbox.png");
		});
		$(".diet").bind("mouseover", function() {
			$(this).attr("src", "./images/menu/recipe_diet2.png");
		});
		$(".diet").bind("mouseout", function() {
			$(this).attr("src", "./images/menu/recipe_diet.png");
		});
		$(".dinner").bind("mouseover", function() {
			$(this).attr("src", "./images/menu/recipe_dinner2.png");
		});
		$(".dinner").bind("mouseout", function() {
			$(this).attr("src", "./images/menu/recipe_dinner.png");
		});
	});
</script>
<div class="menubar">
	<div class="menu_title">
		<img alt="" src="./images/menu/menubar_recipe.png">
	</div>
	<ul class="detailmenu">
		<li><a href="recipe.do?theme_no=1"><img class="0yang"
				src="./images/menu/recipe_0yang.png"></a></li>
		<li><a href="recipe.do?theme_no=2"><img class="dessert"
				src="./images/menu/recipe_dessert.png"></a></li>
		<li><a href="recipe.do?theme_no=3"><img class="lunchbox"
				src="./images/menu/recipe_lunchbox.png"></a></li>
		<li><a href="recipe.do?theme_no=4"><img class="diet"
				src="./images/menu/recipe_diet.png"></a></li>
		<li><a href="recipe.do?theme_no=5"><img class="dinner"
				src="./images/menu/recipe_dinner.png"></a></li>
	</ul>
</div>

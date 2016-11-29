<%@page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$(".0yang").bind("mouseover", function(){
		$(this).attr("src", "./images/menu/recipe_0yang.png")
		}); 
	$(".0yang").bind("mouseout", function(){
		$(this).attr("src", "../images/menu/recipe_0yang2.png")
		}); 
	
	$(".mycart").bind("mouseover", function(){
		$(this).attr("src", "./images/mypage_basket2.png")
		}); 
	$(".mycart").bind("mouseout", function(){
		$(this).attr("src", "./images/mypage_basket.png")
		}); 
	
	$(".mycoupon").bind("mouseover", function(){
		$(this).attr("src", "./images/mypage_coupon2.png")
		}); 
	$(".mycoupon").bind("mouseout", function(){
		$(this).attr("src", "./images/mypage_coupon.png")
		}); 
	
	$(".myboard").bind("mouseover", function(){
		$(this).attr("src", "./images/mypage_board2.png")
		}); 
	$(".myboard").bind("mouseout", function(){
		$(this).attr("src", "./images/mypage_board.png")
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
		<li><a href="recipe.do?theme_no=2"><img class="myorder"
				src="./images/menu/recipe_dessert.png"></a></li>
		<li><a href="recipe.do?theme_no=3"><img class="myorder"
				src="./images/menu/recipe_lunchbox.png"></a></li>
		<li><a href="recipe.do?theme_no=4"><img class="myorder"
				src="./images/menu/recipe_diet.png"></a></li>
		<li><a href="recipe.do?theme_no=5"><img class="myorder"
				src="./images/menu/recipe_dinner.png"></a></li>
	</ul>
</div>

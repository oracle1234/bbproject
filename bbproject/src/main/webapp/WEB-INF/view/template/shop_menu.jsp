<%@page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$(".banchan").bind("mouseover", function(){
		$(this).attr("src", "./images/shop_banchan2.png")
		}); 
	$(".banchan").bind("mouseout", function(){
		$(this).attr("src", "./images/shop_banchan.png")
		}); 
	
	$(".gook").bind("mouseover", function(){
		$(this).attr("src", "./images/shop_gook2.png")
		}); 
	$(".gook").bind("mouseout", function(){
		$(this).attr("src", "./images/shop_gook.png")
		}); 
	
	$(".kimchi").bind("mouseover", function(){
		$(this).attr("src", "./images/shop_kimchi2.png")
		}); 
	$(".kimchi").bind("mouseout", function(){
		$(this).attr("src", "./images/shop_kimchi.png")
		}); 

});
</script>
<div class="menubar">
	<div class="menu_title">
		<img alt="" src="./images/menubar_shop.png">
	</div>
	<ul class="detailmenu">
		<li><a href="shop.do?category_no=1"><img class="banchan"
				src="./images/shop_banchan.png"></a></li>
		<li><a href="shop.do?category_no=2"><img class="gook"
				src="./images/shop_gook.png"></a></li>
		<li><a href="shop.do?category_no=3"><img class="kimchi"
				src="./images/shop_kimchi.png"></a></li>
	</ul>
</div>


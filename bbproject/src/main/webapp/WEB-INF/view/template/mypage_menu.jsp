<%@page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
	$(".myorder").bind("mouseover", function(){
		$(this).attr("src", "./images/mypage_order2.png")
		}); 
	$(".myorder").bind("mouseout", function(){
		$(this).attr("src", "./images/mypage_order.png")
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
		<img alt="" src="./images/menubar_mypage.png">
	</div>
	<ul class="detailmenu">
		<li><a href="my_order.do"><img class="myorder"
				src="./images/mypage_order.png"></a></li>
		<li><a href="my_cart.do"><img class="mycart"
				src="./images/mypage_basket.png"></a></li>
		<li><a href="my_coupon.do"><img class="mycoupon"
				src="./images/mypage_coupon.png"></a></li>
		<li><a href="my_board.do?boardcategory_no=1"><img
				class="myboard" src="./images/mypage_board.png"></a></li>
	</ul>
</div>

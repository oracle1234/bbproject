<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>

<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/main.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/menu.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<link rel="stylesheet" type="text/css" href="css/mypage.css" />
<link rel="stylesheet" type="text/css" href="css/mypage_imgbar.css" />
<link rel="stylesheet" type="text/css" href="css/my_order.css" />
<link rel="stylesheet" type="text/css" href="css/my_cart.css" />
<link rel="stylesheet" type="text/css" href="css/my_coupon.css" />
<link rel="stylesheet" type="text/css" href="css/my_board.css" />
<link rel="stylesheet" type="text/css" href="css/agree.css" />
<link rel="stylesheet" type="text/css" href="css/join.css" />

<link rel="stylesheet" type="text/css" href="css/recipe.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css"
	media="all" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/recipe.js"></script>

<style>
#quick_menu {
	width: 100px;
	border : 1px solid black;
	text-align: center;
	position: absolute;
	top: 100px;
	right: 0px;
	background-color: white;
 	display: none;
}

.quick_li span{
	font-size: 10px;
	position: relative;
	top: -5px;
}
.quick_img{
	width: 90px;
}

</style>
<script type="text/javascript">
	$(function() {
		var member_no = "${sessionScope.member.member_no}";
		/*퀵 메뉴*/
		if(member_no != ""){
			$("#quick_menu").css("display", "block");
			var defaultTop = parseInt($("#quick_menu").css("top"));
			var defaultRigth = parseInt($("#quick_menu").css("right"));
			$(window).on("scroll", function() {
				var scv = $(window).scrollTop();
				var sb = $(window).scrollLeft();
	
				$("#quick_menu").stop().animate({
					top : scv + defaultTop + "px",
					right : defaultRigth - sb + "px"
				}, 500);
			});
			
			$.ajax({
				type : 'POST',
				dataType : 'json',
				url : 'lately.do',
				data : 'member_no='+member_no,
				success : function(data) {
					$(".quick_ul").empty();
					$.each(data, function(index, value) {
						$(".quick_ul").append('<li class="quick_li"><a href="#"><img class="quick_img" src="image.do?filename='+value.picture+'"><span>'+value.foods_name+'</span></a></li>');
					});
						
				},
				error: function(xhr, textStatus, error) {
					alert(error);
				}
			});
			
		}
		
		
	});
</script>

</head>

<body>
	<header>
		<br />
		<p>
			<tiles:insertAttribute name="header" />
		</p>
	</header>

	<div id="imgbar">
		<tiles:insertAttribute name="img" />
	</div>
	<div id="main">
		<tiles:insertAttribute name="menu" />
		<div id="mainbody">
			<tiles:insertAttribute name="body" />
		</div>

	</div>
	<div id="quick_menu">
			<h3>
				최근 본 상품
			</h3>
			<ul class="quick_ul">
				<li class="quick_li"><a href="#"><img class="quick_img" alt="" src="images/shop_basket.png">
				<span>상품이름</span>
				</a></li>
			</ul>
			<a href=""><img src="images/quick_top_btn.png" alt="상단으로 이동"></a>
		</div>

	<footer>
		<p>
			<tiles:insertAttribute name="footer" />
		</p>
	</footer>

</body>
</html>
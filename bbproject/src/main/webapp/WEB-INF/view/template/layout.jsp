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
<!-- <link rel="stylesheet" type="text/css" href="css/header.css" media="all" /> -->
<link rel="stylesheet" type="text/css" href="css/main.css?var=1" media="all" />
<link rel="stylesheet" type="text/css" href="css/menu.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/footer.css?var=2" />
<link rel="stylesheet" type="text/css" href="css/mypage.css" />
<link rel="stylesheet" type="text/css" href="css/mypage_imgbar.css" />
<link rel="stylesheet" type="text/css" href="css/my_order.css" />
<link rel="stylesheet" type="text/css" href="css/my_cart.css" />
<link rel="stylesheet" type="text/css" href="css/my_coupon.css" />
<link rel="stylesheet" type="text/css" href="css/my_board.css" />
<link rel="stylesheet" type="text/css" href="css/agree.css" />

<link rel="stylesheet" type="text/css" href="css/recipe.css" />
<link rel="stylesheet" type="text/css" href="css/jquery.bxslider.css"
	media="all" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="js/jquery.bxslider.js"></script>
<script src="js/main.js?var=2"></script>
<script src="js/recipe.js"></script>

<script type="text/javascript">
		var member_no = "${sessionScope.member.member_no}";
</script>

</head>

<body>
	<header>
		<tiles:insertAttribute name="header" />
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
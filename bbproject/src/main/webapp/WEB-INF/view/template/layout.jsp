<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>
<style type="text/css">

</style>
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

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
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

	<footer>
		<p>
			<tiles:insertAttribute name="footer" />
		</p>
	</footer>

</body>
</html>
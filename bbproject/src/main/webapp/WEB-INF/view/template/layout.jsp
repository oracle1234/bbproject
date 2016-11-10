<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:getAsString name="title" /></title>

<link rel="stylesheet" type="text/css" href="css/header.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/main.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/footer.css" media="all"  />
<link rel="stylesheet" type="text/css" href="css/menu.css" media="all" />


<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>
<style>
body{
	margin: auto;
	width:1350px;
}

header {
	width: 1350px;
	height: 100px;
	background-color: aqua;
}

#main {
	width : 1200px;
	box-sizing: border-box;
	text-align: center;
	margin: auto;
}

/* .menu{
	width: 250px;
	background-color: teal;
	float: left;
} */

#mainbody{
	width: 950px;
	min-height : 300px;
	background-color: skyblue;
	float: left;
}

footer {
	background-color: #ffffff;
	clear: both;
}

#imgbar {
	width: 1350px;
	height: 350px;
}

li{
	list-style-type: none;
}
</style>
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
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
<style type="text/css">

</style>

<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

</head>

<body>
	<header>
		<p>
			<tiles:insertAttribute name="header" />
		</p>
	</header>

	<div id="admin">
		<div id="adminbody">
			<tiles:insertAttribute name="body" />
		</div>
	</div>

</body>
</html>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style type="text/css">
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {

	});
</script>

</head>
<body>

	<div id="detailmain">
			<h1>레시피 이름 : ${dto.recipe_name }</h1>
			
			<span> 
			<img src="image.do?filename=${dto.picture}" width="300px" height="300px"/>
			</span>
			<p>간단 설명 : ${dto.recipe_explaination }</p>
			<p>인원 : ${dto.portion }</p>
			<p>조리 난이도 : ${dto.difficulty }</p>
			<p>조리 시간 : ${dto.recipe_time }</p>
	</div>

</body>
</html>




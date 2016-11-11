<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<style type="text/css">
.recipelist {
	width: 900px;
	background-color: yellow;
	margin: auto;
}

.recipebox {
	width: 700px;
	height: 300px;
	background-color: red;
	margin: auto;
}

.recipe_over {
	display: none;
}

.test {
	display: block;
}


.recipe_sub1{
	width : 250px;
	float: left;
	position: relative;
}

.recipe_sub2{
	width : 450px;
	height : 250px;
	background-color: green;
	float: right;
	margin-top: 25px;
}

span img {
	width : 250px;
	height : 250px;
	position: absolute;
	left: 0;
	top: 25px;
}


</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {
		$(".recipebox").on("click", function() {
			$("span #recipe_img").removeClass("recipe_over");
			$("span #recipe_img").addClass("test");
		});
	});
</script>

</head>
<body>

	<div class="recipediv">
		<div>
			<button>버튼</button>
		</div>
		<div class="recipelist">
			<div class="recipebox">
				<a href="#" class="recipe">
					<div class="recipe_sub1">
						<span> <img id="recipe_img" class="recipe_over" alt=""
							src="images/thumb_over.png"> <img id="imgtt" alt=""
							src="images/thumb_over.png" />
						</span>
					</div>
					<div class="recipe_sub2">
						<p>제목</p> 
						<p>작성자</p>
					</div>

				</a>
			</div>
		</div>
	</div>



</body>
</html>




<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
#shopbody_wrap {
	width: 1200px;
	height: 810px;
}

#shopbody_menu {
	width: 950px;
	height: 810px;
}

#shop_table {
	text-align: center;
	float: left;
}

#prod_img {
	width: 312px;
	height: 200px;
	background-color: gray;
}

#prod_img a img {
	width: 312px;
	height: 200px;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>soup</title>
</head>
<body>
<body>
	<div id="shop_wrap">

		<div id="shop_menu">

			<table id="shop_table">
				<c:forEach items="${list}" var="FoodsDTO">
					<tr>
						<td><div class="prod_img">
								<a href=""><img alt="상품이미지" src="ban_images/gosarinamul.jpg"
									width="237" height="155"> </a>

							</div>

							<p class="name">
								<a href="">${FoodsDTO.foods_name}</a>
							</p>
							<p class="price">
								${FoodsDTO.price}<span> 원</span>
							</p>
							<p class="count">

								<select name="count_select">

									<c:forEach var="i" begin="1" end="20" step="1">
										<option value="i">${i}</option>
									</c:forEach>

								</select>
							</p> <img alt="장바구니 이미지" src="" width="237" height=""></td>
					</tr>
				</c:forEach>

			</table>

		</div>
	</div>
</body>
</html>
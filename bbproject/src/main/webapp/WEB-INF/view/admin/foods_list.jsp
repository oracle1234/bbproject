<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<style>
img {
	width: 100px;
	height: 100px;
}
.foodsbox{
	float: left;
}
</style>

<div class="foodsdiv">
	<div class="foodslist">
		<c:forEach items="${aList}" var="FoodsDTO">
			<div class="foodsbox">
				<table>
					<tr>
						<td><div class="prod_img">
								<a href=""><img alt="상품이미지"
									src="image.do?filename=${FoodsDTO.picture}"> </a>
							</div>
							<p class="name">
								<a href="">${FoodsDTO.foods_name}</a>
							</p>
							<p class="price">${FoodsDTO.price}<span>원</span>
							</p>
					</tr>
					<tr>
						<td>
							<div class="del">
								<a href="adminfoodsdel.do?foods_no=${FoodsDTO.foods_no}">삭제</a>
							</div>
						</td>
					</tr>

				</table>
			</div>
		</c:forEach>
	</div>
</div>


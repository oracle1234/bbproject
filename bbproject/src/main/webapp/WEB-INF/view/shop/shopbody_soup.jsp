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

			<c:forEach items="${aList}" var="FoodsDTO">
				<table id="shop_table">
					<tr>
						<td><div id="prod_img">
								<a href=""><img alt="상품이미지" src="image.do?filename=${FoodsDTO.picture }">
								</a>
							</div>
							<p class="name">
								<a href="">${FoodsDTO.foods_name}</a>
							</p>
							<p class="price">${FoodsDTO.price}<span>원</span>
							</p>
							<p class="count">

								<select name="count_select">

									<c:forEach var="i" begin="1" end="20" step="1">
										<option value="i">${i}</option>
									</c:forEach>

								</select>
							</p> <img alt="장바구니 이미지" src="" width="237" height=""></td>
					</tr>

				</table>

			</c:forEach>
			<c:if test="${pv.startPage>1}">
				<a href="shopSoup.do?category_no=1&currentPage=${pv.startPage-pv.blockPage}">
					<c:out value="이전" />
				</a>
			</c:if>

			<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
				<c:url var="currPage" value="shopSoup.do?category_no=1">
					<c:param name="currentPage" value="${i}" />
				</c:url>

				<a href="${currPage}"> <c:out value="${i}" />
				</a>
			</c:forEach>

			<c:if test="${pv.endPage<pv.totalPage}">
				<a href="shopSoup.do?category_no=1&currentPage=${pv.startPage+pv.blockPage}">
					<c:out value="다음" />
				</a>
			</c:if>
		</div>
	</div>
</body>
</html>
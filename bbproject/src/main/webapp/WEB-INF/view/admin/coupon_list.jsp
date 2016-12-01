<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<style>
	
	th, td{
		border: 1px solid black;
	}

</style>
<hr/>
<div class="coupondiv">
	<div class="couponlist">
		<table>
			<tr>
				<th>쿠폰 이름</th>
				<th>할인 가격</th>
			</tr>
			<c:forEach items="${aList}" var="dto">
				<tr>
					<td>
						${dto.coupon_name}
					</td>
					<td>
						${dto.coupon_discount}
					</td>
					<td>
						<div class="del">
							<a href="admincoupondel.do?coupon_no=${dto.coupon_no}">삭제</a>
						</div>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>


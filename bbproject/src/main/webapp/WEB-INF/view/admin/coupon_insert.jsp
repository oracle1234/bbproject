<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	
	th, td{
		border: 1px solid black;
		text-align: center;
	}

</style>
<hr/>
	쿠폰등록 폼
	<form id="coupon_form" action="admincouponins.do" method="post">
		
		쿠폰이름
		<input type="text" id="coupon_name" name="coupon_name">
		
		할인가격
		<input type="text" id="coupon_discount" name="coupon_discount">
		
		<input type="submit" value="등록">

	</form>
	<br/>
	<hr/>
	<br/>
	등록된 쿠폰
	<div class="coupondiv">
		<div class="couponlist">
			<table>
				<tr>
					<th>쿠폰 번호</th>
					<th>쿠폰 이름</th>
					<th>할인 가격</th>
				</tr>
				<c:forEach items="${aList}" var="dto">
					<tr>
						<td>
						${dto.coupon_no}
						</td>
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
	<br/>
	<hr/>
	<br/>
	쿠폰 보내기
	<form id="send_form" action="admincouponsend.do" method="post">
		
		쿠폰이름
		<input type="text" id="coupon_name" name="coupon_name">
		
		할인가격
		<input type="text" id="coupon_discount" name="coupon_discount">
		
		<input type="submit" value="등록">

	</form>
		

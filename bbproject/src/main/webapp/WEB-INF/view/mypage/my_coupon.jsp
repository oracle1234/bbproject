<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="mypage_body">
<div class="link">
	<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 쿠폰/적립금
	</div>
	<div class="coupon_info">
		<img id="coupon_info_photo" alt="" src="">
	</div>

	<table class="mycoupon_table">
		<tr>
			<th width="50%">쿠폰명</th>
			<th width="20%">할인금액(율)</th>
			<th width="30%">사용여부</th>

		</tr>
		<c:forEach var="dto" items="${aList}">
			<tr>
				<td>${dto.coupon_name}</td>
				<td>${dto.coupon_discount}</td>
				<td>${dto.coupon_state}</td>
			</tr>
		</c:forEach>
	</table>
</div>

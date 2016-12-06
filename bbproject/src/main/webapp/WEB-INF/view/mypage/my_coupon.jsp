<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/my_coupon.css" />
<script type="text/javascript">
var s_name = "${sessionScope.member.member_name}";
var s_point = "${sessionScope.member.point}";

$(document).ready(function(){
	$('#p_name').append(s_name);
	$('#p_point').append(s_point);
});
</script>
<div class="mypage_body">
<div class="link">
	<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 쿠폰/적립금
	</div>
	<div class="couponpoint">
	<div class="coupon_info">

		</div>
		<div class="point">
		 
		<p id="p_name"></p>님의 현재 적립금은 <p id="p_point"></p>원 입니다.
	
		</div>
</div>
	<table class="mycoupon_table">
		<tr>
			<th width="50%">쿠폰명</th>
			<th width="20%">할인금액(원)</th>
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

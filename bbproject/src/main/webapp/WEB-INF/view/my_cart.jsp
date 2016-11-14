<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="mypage_body">
		<div class="cart_state">
		<img id="cart_state_photo" alt="" src="">
		</div>
		
		<table class="mycart_table">
		<tr>
				<th width="5%"><input type="checkbox" id="cart_checkbox"></th>
				<th width="20%">상품명</th>
				<th width="20%">상품가격</th>
				<th width="15%">수량</th>
				<th width="20%">적립금</th>
				<th width="20%">합계</th>
			</tr>
			
			<c:forEach var="dto" items="${aList}">
				<tr>
					<td><input type="checkbox" id="cart_cb"></td>
					<td><img id="foodsmall_photo" alt="" src="">${dto.foods_name}</td>
					<td>${dto.price}</td>
					<td>${dto.amount}</td>
					<td>${dto.point}</td>
					<td></td>
				</tr>
				</c:forEach>
		</table>
		<div class="cart_button">
		<input type="button" id="cart_del" value="선택상품삭제">
		<input type="button" id="cart_order" value="선택상품주문">
		</div>
	</div>

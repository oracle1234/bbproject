<%@page contentType="text/html; charset=UTF-8"%>


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

				<tr>
					<td><input type="checkbox" id="cart_cb"></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
		</table>
		<div class="cart_button">
		<input type="button" id="cart_del" value="선택상품삭제">
		<input type="button" id="cart_order" value="선택상품주문">
		</div>
	</div>

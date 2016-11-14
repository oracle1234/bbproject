<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#upd_amount").on(
						'click',
						function() {
							$.ajax({
								type : 'GET',
								dataType : 'text',
								url : 'my_cart.do?member_no='
										+ $('#member_no').val() + '&amount='
										+ $(dto.amount).val(),
								success : cartlist
							});
						});
			});
	function cartlist(data) {
		$('.mycart_table').children().remove();
		
		$.each(data,function(index,value){
			
			$('.mycart_table').append(
					
			'<tr><td><input type="checkbox" id="cart_cb"></td>'+
			'<td><img id="foodsmall_photo" alt="" src="">'+value.foods_name+'</td>'+
			'<td>'+value.price+'원</td>'+
			'<td>'+value.amount+'<select name="count_select">'+
					'<c:forEach var="i" begin="1" end="20" step="1">'+
						'<option value="i">${i}</option>'+
					'</c:forEach></select>'+
					'<input type="button" id="upd_amount" value="변경"></td>'+
			'<td>'+value.price*value.amount*1/100+'원</td>'+
			'<td>'+value.price*value.amount+'원</td></tr>');
		});
	}
</script>
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
					<td>${dto.price}원</td>
					<td>${dto.amount}<select name="count_select">

							<c:forEach var="i" begin="1" end="20" step="1">
								<option value="i">${i}</option>
							</c:forEach>

					</select> <input type="button" id="upd_amount" value="변경">
					</td>
					<td>${dto.price*dto.amount*1/100}원</td>
					<td>${dto.price*dto.amount}원</td>
				</tr>
			</c:forEach>
		</table>

	<table class="mycart_table2">
		<tr>
			<th width="25%">상품금액</th>
			<th width="25%">할인금액</th>
			<th width="25%">배송비</th>
			<th width="25%">총 주문 합계</th>
		</tr>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
		</tr>
	</table> 

	<div class="cart_button">
		<input type="button" id="cart_del" value="선택상품삭제"> <input
			type="button" id="cart_order" value="선택상품주문">
	</div>
</div>

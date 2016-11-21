<%@page import="dto.BasketDTO"%>
<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	$('.cart_checkbox').bind('click', function() {
		$('.cart_cb').prop('checked', this.checked);
		
		
	});
	
	$(document).on('click', '.upd_amount',function(){
		 $.ajax({
		 type : 'GET', 
			dataType : 'json',
			url : 'my_cart_amountupdate.do?member_no=${member_no}&foods_no='+$(this).next().val()+'&amount='+$(this).prev().val(),
			success : cartlist,
			error: function(xhr, textStatus, error) {
				alert(error);
			}
		});  
		/*  var aa=$(this).val();
			$("#count_select option[value="+aa+"]").attr("selected", true); */

	});
	
	$(document).on('click', '#cart_del',function(){
		
		
		$('input[type=checkbox]:checked').each(function() {
			alert($(this).val());
			$.ajax({
		 		type:'GET',
		 		dataType :'json',
				url:'my_cart_delete.do?member_no=${member_no}&foods_no='+$(this).val()+'&amount='+$('#count_select').val(),
		 		success: cartlist,
				error: function(xhr, textStatus, error) {
		 			alert(error);
		 		}
		 		});
		});
	});
});


	function cartlist(data) {
		$('.mycart_table').empty();
		$('.mycart_table').append('<tr><th width="5%"><input type="checkbox" id="cart_checkbox"></th>'+
				'<th width="20%">상품명</th>'+
				'<th width="20%">상품가격</th>'+
				'<th width="15%">수량</th>'+
				'<th width="20%">적립금</th>'+
				'<th width="20%">합계</th>'+
			'</tr>');
		
		$.each(data,function(index, value){
			$('.mycart_table').append('<tr><td><input type="checkbox" class="cart_cb"></td>'+
			'<td><img id="foodsmall_photo" alt="" src="">'+value.foods_name+'</td>'+
			'<td>'+value.price+'원</td>'+
			'<td>'+value.amount+'<select id="count_select">'+
					'<c:forEach var="i" begin="1" end="20" step="1">'+
						'<option value="${i}">${i}</option>'+
					'</c:forEach></select>'+
					'<input type="button" class="upd_amount" value="변경">'+
					'<input type="hidden" class="foods_no" value="'+value.foods_no+'"></td>'+
			'<td>'+value.price*value.amount*1/100+'원</td>'+
			'<td>'+value.price*value.amount+'원</td></tr>');
		});
	}
	
</script>
<div class="mypage_body">
<div class="link">
	<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 장바구니
	</div>
	<div class="cart_state">
		<img id="cart_state_photo" alt="" src="">
	</div>

	<table class="mycart_table">
		<tr>
			<th width="5%"><input type="checkbox" class="cart_checkbox"></th>
			<th width="20%">상품명</th>
			<th width="20%">상품가격</th>
			<th width="15%">수량</th>
			<th width="20%">적립금</th>
			<th width="20%">합계</th>
		</tr>
			<c:forEach var="dto" items="${aList}">
			
				<tr>
					<td><input type="checkbox" class="cart_cb" value="${dto.foods_no}"></td>
					<td><img id="foodsmall_photo" alt="" src="">${dto.foods_name}</td>
					<td>${dto.price}원</td>
					<td>${dto.amount}
					<select id="count_select">

							<c:forEach var="i" begin="1" end="20" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>


					</select> 
					<input type="button" class="upd_amount" value="변경">
					<input type="hidden" class="foods_no" value="${dto.foods_no}">
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
			<td>222222원</td>
			<td>0원</td>
			<td>2500원</td>
			<td>2323원</td>
		</tr>
	</table> 

	<div class="cart_button">
		<input type="button" id="cart_del" value="선택상품삭제"> <input
			type="button" id="cart_order" value="선택상품주문">
	</div>
	<img id="plus1" src="images/plus.png">
	<img id="plus2" src="images/plus.png">
	<img id="sum" src="images/sum.png">
</div>

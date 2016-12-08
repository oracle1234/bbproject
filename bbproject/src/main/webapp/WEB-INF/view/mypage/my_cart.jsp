<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" type="text/css" href="css/my_cart.css" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
		$(document).on('click', '.cart_checkbox',function(){
		$('.cart_cb').prop('checked', this.checked);
	});
	
	 $('.count_select').on('click','.placeholder',function(){
		  var parent = $(this).closest('.select');
		  if ( ! parent.hasClass('is-open')){
		    parent.addClass('is-open');
		    $('.count_select.is-open').not(parent).removeClass('is-open');
		  }else{
		    parent.removeClass('is-open');
		  }
		}).on('click','#option',function(){
		  var parent = $(this).closest('.count_select');
		  parent.removeClass('is-open').find('.placeholder').text( $(this).text() );
		});
	 
		$('#cart_order').on('click', function(){
			 $("input[name=cart_cb]:checked").each(function(){
				 $(this).next().prop("name", "checkfood");
			 });
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
	});
	
	$(document).on('click', '#cart_del',function(){
		
		
		$('input[name=cart_cb]:checked').each(function() {
			
			$.ajax({
		 		type:'GET',
		 		dataType :'json',
				url:'my_cart_delete.do?member_no=${member_no}&foods_no='+$(this).next().val()+'&amount='+$('#count_select').next().next().val(),
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
		if(data.length <= 0){
			$('.mycart_table2').empty();
			$('.cart_button').remove();
			$('.mycart_table').append('<img id="empty" src="images/cart_empty.png">');
		}else{
			$('.mycart_table').append('<tr><th width="5%"><input type="checkbox" class="cart_checkbox"></th>'+
					'<th width="20%">상품명</th>'+
					'<th width="20%">상품가격</th>'+
					'<th width="15%">수량</th>'+
					'<th width="20%">적립금</th>'+
					'<th width="20%">합계</th>'+
				'</tr>');
			var sum = 0;
			$.each(data,function(index, value){
				 $('.mycart_table').append('<tr>'+
			               '<td><input type="checkbox" class="cart_cb" name="cart_cb">'+
			               '<input type="hidden" class="foods_no" value='+value.foods_no+'>'+
			              '<td><img id="foodsmall_photo" alt="" src="">'+value.foods_name+'</td>'+
			              '<td>'+value.price+'원</td>'+
			               '<td>'+value.amount+
			                '<select id="count_select" name="count_select">'+
			                     '<c:forEach var="i" begin="1" end="20" step="1">'+
			                        '<option value="${i}">${i}</option>'+
			                     '</c:forEach>'+
			               '</select>'+
			               '<input type="button" class="upd_amount" value="변경">'+
			               '<input type="hidden" class="foods_no" value="'+value.foods_no+'">'+
			               '</td>'+
			               '<td>'+value.price*value.amount*1/100+'원</td>'+
			               '<td>'+value.price*value.amount+'원</td>'+
			            '</tr>');
				 sum += parseInt(value.price)*parseInt(value.amount);
			}); 
		}
		var cost = 0;
		var str = "무료";
		if(sum < 45000){
			cost = 2500;
			str = cost+"원";
		}
		$("#mycart_sum").text(sum+"원");
		$("#mycart_cost").text(str);
		$("#mycart_totalsum").text((sum + cost)+"원");
		
	}
	
</script>

<style>
@import "https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css";
</style>

<form id="cart" method="post" action="shop_buy.do">
<div class="mypage_body">
<div class="link">
	<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 장바구니
	</div>
	<div class="cart_state">
		<img id="cart_state_photo" alt="" src="images/cart_info.png">
	</div>
 	<c:choose>
		<c:when test="${aList[0].foods_no == null}">
			<img id="empty" src="images/cart_empty.png">
		</c:when>
		
		<c:otherwise> 
		<table class="mycart_table">
		<tr>
			<th width="5%"><input type="checkbox" class="cart_checkbox"></th>
			<th width="20%">상품명</th>
			<th width="20%">상품가격</th>
			<th width="15%">수량</th>
			<th width="20%">적립금</th>
			<th width="20%">합계</th>
		</tr>
		<c:set var="sum" value="0"></c:set>
			<c:forEach var="dto" items="${aList}">
			<c:set var="totalprice" value="${dto.amount*dto.price}"></c:set>
		<c:set var="sum" value="${sum+totalprice}"></c:set>
			
				<tr>
					<td><input type="checkbox" class="cart_cb" name="cart_cb">
				 	<input type="hidden" class="foods_no" value="${dto.foods_no}" >
					<td><img id="foodsmall_photo" alt="" src="">${dto.foods_name}</td>
					<td>${dto.price}원</td>
					<td>${dto.amount}
				 	<select id="count_select" name="count_select">

							<c:forEach var="i" begin="1" end="20" step="1">
								<option value="${i}">${i}</option>
							</c:forEach>
							
					</select>  
					<input type="button" class="upd_amount" value="변경">
					<input type="hidden" class="foods_no" value="${dto.foods_no}">
					<input type="hidden" class="amount" value="${dto.amount}">
					</td>
					<td><fmt:formatNumber pattern="0">${dto.price*dto.amount*1/100}</fmt:formatNumber>원</td>
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
			<td id="mycart_sum">${sum}원</td>
			<td>0원</td>
			<td id="mycart_cost">
			<c:if test="${sum<45000}">
			<c:set var="delivery_cost" value="2500"></c:set>
			2500원
			</c:if>
			<c:if test="${sum>=45000}">
			<c:set var="delivery_cost" value="0"></c:set>
			무료</c:if></td>
			<td id="mycart_totalsum">${sum + delivery_cost}원</td>
		</tr>
	
	</table> 
		<div class="cart_button">
		<input type="button" id="cart_del" value="선택상품삭제"> <input
			type="submit" id="cart_order" value="선택상품주문">
			<input type="hidden" id="foodsno" >
			<input type="hidden" id="amount" >
		<!-- 	<img id="plus1" src="images/plus.png">
	<img id="plus2" src="images/plus.png">
	<img id="sum" src="images/sum.png"> -->
	</div>
	 	</c:otherwise>
	</c:choose>

	
	
</div>
</form>

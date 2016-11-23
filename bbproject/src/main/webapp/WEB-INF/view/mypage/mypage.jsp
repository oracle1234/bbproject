<%@page contentType="text/html; charset=UTF-8"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("p").hover(function(){
		    $(this).parent().css("background-color", "#c4c4c4");
		    }, function(){
		    $(this).parent().css("background-color", "white");
		}); 
	});
</script>

	<div class="mypage_title">
		<div id="title">
			<p>마이페이지</p>
		</div>
	</div>
	<div class="mypage_body">
		<div class="menu">
			<div id="order">
				<p>
					<a href="my_order.do?member_no=1">주문/배송조회</a>
				</p>
				<span>고객님께서 주문하신 상품의 내용 및 배송조회를 확인하실 수 있습니다.</span>
			</div>
			<div id="cart">
				<p>
					<a href="my_cart.do?member_no=1">장바구니</a>
				</p>
				<span>고객님께서 장바구니에 담으신 상품의 내용을 확인하실 수 있습니다.</span>
			</div>
			<div id="coupon">
				<p>
					<a href="my_coupon.do?member_no=1">쿠폰/적립금</a>
				</p>
				<span>고객님의 쿠폰과 적립금을 확인하실 수 있습니다. </span>
			</div>

			<div id="board">
				<p>
					<a href="my_board.do?member_no=1">내가쓴글</a>
				</p>
				<span>고객님께서 작성하신 글을 확인하실 수 있습니다. </span>
			</div>
		</div>
	</div>

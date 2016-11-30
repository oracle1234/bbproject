<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="css/my_order.css" />
   <link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/style.css">
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,100,100italic' rel='stylesheet' type='text/css'>
  <script src="js/jquery-ui"></script>  
  <script src="js/jquery-ui.min"></script>
   
<script type="text/javascript">

$(document).ready(function() {
/* 	$('#orderno').on('click', function() {
		if($(this).('${delivery_condition}'))
	}); */
	
	$('.calHelp').hide();
	
	$('#calfind').on('click', function(){
		$('.calHelp').slideDown('fast');
		  
			
	});
});
</script>
	<div class="mypage_body">
	<div class="link">
	<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 주문/배송조회
	</div>
	
		<div class="order_notice">
		<span id="notice_span">고객님의 주문내역이 정상적으로 처리되었는지 꼭 확인하세요.</span>
		<span id="notice_span2">
		<p>미입금 : 입금확인이 안된 상태로 입금 후 입금 완료가 처리되지 않으면 냉장고를 부탁해에 꼭 문의하시길 바랍니다.</p>
		<p>입금완료 : 상품이 입금 완료 확인되었으면 주문취소 및 주문 날짜를 변경하실 수 있습니다.</p>
		<p>상품준비중 : 상품을 출고하기 위해 해당일에 조리가 진행된 상태로 취소 변경이 불가능하며 이미 출고 작업이 끝난 상태입니다.</p>
		<p>배송중 : 주문하신 상품이 정상적으로 배송 중에 있어 배송조회가 가능합니다.</p>
		<p>배송완료 : 주문하신 상품이 배송 완료되었으며 구매 적립금이 지급됩니다.</p>
		</span>
		<span id="notice_span3">그 외에 또 다른 문의사항이 있으시면 반찬을 부탁해 게시판 또는 전화로 연락 주시면 친절하게 안내해 드리겠습니다.</span>
		</div>
		
			<div class="calfind">
<img id="calfind" src="images/cal.PNG"><input type="button" value="조회" id="calfindButton">
</div>
		<div class="calHelp">
		<div id="calHelp">
<!-- 	<div class="first active"><i>A</i> <b id="sel1text">SELECT DEPART</b></div><div class="disabled"><i>B</i> <b id="sel2text">RETURN</b></div> -->
</div>
<div id="disp"><div id="prev" class="nav">←</div><div id="month">Hello world</div><div id="next" class="nav">→</div></div>
<div id="cal"></div>

	<div class="log">
		 <script src='js/jquery.min.js'></script>
	<script src="js/cal.js"></script>
	</div>
	</div>
	
	

		
		<table class="myorder_table">
		<tr>
				
				<th width="15%">주문일자</th>
				<th width="15%">상품정보</th>
				<th width="20%">상품명</th>
				<th width="5%">수량</th>
				<th width="15%">상품가격</th>
				<th width="10%">총결제금액</th>
				<th width="15%">주문상태</th>
				<th width="15%">취소</th>
			</tr>
			<c:forEach var="dto" items="${aList}">
				<tr>
					<td>${dto.day}</td>
					<td><img id="foodsmall_photo" alt="" src="">${dto.picture}</td>
					<td>${dto.foods_no}</td>
					<td>${dto.amount}개</td>
					<td>${dto.price}</td>
					<td>${dto.price*dto.amount}원</td>
					<td>${dto.delivery_condition}</td>
					<td><input type="button" value="취소" id="orderno">
					<input type="hidden" class="foods_no" value="${dto.foods_no}"></td>
				</tr>
				</c:forEach>
		</table>
	</div>

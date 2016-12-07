<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

   <link rel="stylesheet" href="css/normalize.css">
	<link rel="stylesheet" href="css/style2.css">
	<link rel="stylesheet" type="text/css" href="css/my_order.css" />
	<link href='https://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,100,100italic' rel='stylesheet' type='text/css'>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="js/calendar.js"></script>
   
<script type="text/javascript">
var s_no ="${sessionScope.member.member_no}";

$(document).ready(function() {

		$('#calfindButton').on('click',function(){
			alert($("#start").val());
			alert($("#end").val());
			$.ajax({
				type:'POST',
				dataType : 'json',
				url : "ordersearch.do",
				data:'start='+$("#start").val()+'&end='+$("#end").val(),
				success : searchlist,
				error: function(xhr, textStatus, error) {
					alert(error);
				}
			});
		});

});
		
	 function searchlist(data){
		 if(data.list == null){
			 alert("조회 기간에 해당하는 주문내역이 없습니다.");
		 }else {
			 $('.myorder_table').empty();
			$('.myorder_table').append('<tr>'+
					'<th width="25%">주문일자</th>'+
					'<th width="25%">상품명</th>'+
					'<th width="10%">수량</th>'+
					'<th width="20%">상품가격</th>'+
					'<th width="15%">총결제금액</th>'+
					'<th width="20%">주문상태</th>'+
				'</tr>');
			
			$.each(data.list, function(index, value){
				alert(value.foods_name);
				$('.myorder_table').append('<tr>'+
				'<td>'+value.day+'</td>'+
				'<td>'+value.foods_name+'</td>'+
				'<td>'+value.amount+'</td>'+
				'<td>'+value.price+'</td>'+
				'<td>'+value.price*value.amount+'</td>'+
				'<td>'+value.delivery_condition+'</td>'+
				'</td>'+
			'</tr>');
			});
		}
	 }

</script>
	<div class="mypage_body">
	<div class="link">
	<a href="mypage.do">HOME</a> > <a href="mypage.do">마이페이지</a> > 주문/배송조회
	</div>
	
		<div class="order_notice">
		<img alt="" src="images/order_info.png">
		</div>

<div id="cal">
	<input class="date-picker" type="text" id="start" name="start"/>~
	<input class="date-picker" type="text" id="end" name="end"/>
<input type="button" value="조회" id="calfindButton">
</div>
	
		<table class="myorder_table">
		<tr>
				
				<th width="20%">주문일자</th>
				<th width="25%">상품명</th>
				<th width="10%">수량</th>
				<th width="20%">상품가격</th>
				<th width="15%">총결제금액</th>
				<th width="20%">주문상태</th>
			</tr>
			<c:forEach var="dto" items="${aList}">
				<tr>
					<td>${dto.day}</td>
					<td>${dto.foods_name}</td>
					<td>${dto.amount}개</td>
					<td>${dto.price}</td>
					<td>${dto.price*dto.amount}원</td>
					<td>${dto.delivery_condition}</td>
				</tr>
				</c:forEach>
		</table>
</div>

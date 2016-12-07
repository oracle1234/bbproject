<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	
	th, td{
		border: 1px solid black;
		text-align: center;
	}

</style>

<script type="text/javascript">
$(function() {
	
	$('#idchk').on("click",function() {
		var idreg =$('#id').val();
 		if(idreg.length == 0){
			alert("공백은 입력할 수 없습니다.");
			return false;
		} else {
	 		$.ajax({
	 			type : 'GET',
				url : 'admincouponidchk.do',
				data :"id="+idreg,
				success : function(data){
					if(data == ""){
						alert("없는 회원");
					}else{
						alert(data.member_name + " 회원 입니다.");
						$("#member_no").val("");
						$("#member_no").val(data.member_no);
					}
					
				},
				error : function(xhr, textStatus, error) {
					alert(error);
				}
			});
		}
	});
	
	$("#btn_submit").on("click", function() {
		if($("#member_no").val() == ""){
			alert("아이디 조회 필수");
			return false;
		}
	});
	
	
});

</script>

<hr/>
	쿠폰등록 폼
	<form id="coupon_form" action="admincouponins.do" method="post">
		
		쿠폰이름
		<input type="text" id="coupon_name" name="coupon_name">
		
		할인가격
		<input type="text" id="coupon_discount" name="coupon_discount">
		
		<input type="submit" value="등록">

	</form>
	<br/>
	<hr/>
	<br/>
	등록된 쿠폰
	<div class="coupondiv">
		<div class="couponlist">
			<table>
				<tr>
					<th>쿠폰 번호</th>
					<th>쿠폰 이름</th>
					<th>할인 가격</th>
				</tr>
				<c:forEach items="${aList}" var="dto">
					<tr>
						<td>
						${dto.coupon_no}
						</td>
						<td>
							${dto.coupon_name}
						</td>
						<td>
							${dto.coupon_discount}
						</td>
						<td>
							<div class="del">
								<a href="admincoupondel.do?coupon_no=${dto.coupon_no}">삭제</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br/>
	<hr/>
	<br/>
	쿠폰 보내기
	<form id="send_form" action="admincouponsend.do" method="post">
		
		쿠폰 번호
		<select name="coupon_no">
			<c:forEach items="${aList}" var="dto">
				<option value="${dto.coupon_no}">${dto.coupon_no}</option>
			</c:forEach>
		</select>
		<br/>
		회원 아이디
		<input type="text" id="id" name="id">
		<input type="button" id="idchk" value="조회">
		<input type="hidden" id="member_no" name="member_no" />
		<br/>
		<input id="btn_submit" type="submit" value="보내기">

	</form>
		

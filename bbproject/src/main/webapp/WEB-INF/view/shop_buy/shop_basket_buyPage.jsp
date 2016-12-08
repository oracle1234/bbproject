
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">

.menubar{
	display: none;
}

#mainbody{
border: 0;
}

table, tr, td{
	font-size: 13px;
	padding: 3px;
	border-spacing: 3px;
	color: #262626;
	
}

caption {
	font-size: 20px;
}

#buypage_wrap {
	width: 1200px;
	height: 2650px;
	position: relative;
	margin: auto;
}

#guide_wrap {
	width: 1200px;
	height: 280px;
	margin: auto;
}

#guide_image_wrap {
	width: 1200px;
	height: 250px;
}

#guide_image_wrap img {
	width: 1200px;
	height: 220px;
}

#terms_wrap {
	width: 1200px;
	height: 245px;
	position: absolute;
	top: 320px;
	left : 0px;
}

#terms_text {
	width: 1200px;
	height: 210px;
	position: absolute;
	left:0px;
}

#terms_text p {
	width: 1187px;
	height: 200px;
	overflow: auto;
	font-size: 12px;
	border: 1px solid lightgray;
	position: absolute;
	left : 10px;
	color : #262626;
	font-weight: normal;
	
}

#terms_text p Strong {
	font-weight: bold;
	font-size: 13px;
}

#terms_checkbox {
	width: 300px;
	height: 30px;
	font-size: 13px;
	position: absolute;
	top: 190px;
}

#order_wrap {
	width: 1200px;
	height: 630px;
	position: absolute;
	top: 580px;
}

#order_list_wrap {
	width: 1200px;
	height: 620px;
}

#order_table {
	width: 1200px;
}

#order_table th{
	width: 1200px;
	background-color:#ebebeb;
}


#order_table caption {
	text-align: left;
}

#savemoney_wrap {
	width: 700px;
	height: 150px;
	float: left;
}

#smalltotal_wrap {
	width: 500px;
	height: 150px;
	float: left;
}

#savemoney_table th {
	width: 100px;
	height: 30px;
	background-color: #ebebeb;
}

#savemoney_table td {
	text-align: left;
	background-color: #f5f5f5;
}

#coupon_select {
	width: 100%;
	text-align: center;
}

#smalltotal_table th {
	text-align: left;
	width: 200px;
	background-color: #ebebeb;
}

#smalltotal_table td {
	text-align: right;
	background-color: #f5f5f5;
}

#total_wrap {
	width: 1200px;
	height: 230px;
	float: left;
}

#total_table th {
	height: 30px;
	background-color: #ebebeb;
}

#total_table td {
	height: 50px;
	background-color: #f5f5f5;
}


#orderer_wrap {
	width: 1200px;
	height: 900px;
	position: absolute;
	top: 630px;
}

#orderer_info {
	width: 1200px;
	height: 350px;
	float: left;
}

#orderer_info_table caption {
	text-align: left;
}

#orderer_info_table th {
	width: 250px;
	height: 50px;
	background-color: #ebebeb;
}

#orderer_info_table td {
	text-align: left;
	background-color: #f5f5f5;
}

#delivery_info_table caption {
	text-align: left;
}

#delivery_info_table th {
	width: 250px;
	height: 50px;
	background-color: #ebebeb;
}

#delivery_info_table td {
	text-align: left;
	background-color: #f5f5f5;
}


#deliver_image {
	width: 1200px;
	height: 105px;
	float: left;
}

#deliver_image img {
	width: 1200px;
	height:95px;
}

#delivery_info {
	width: 1200px;
	height: 400px;
	float: left;
}

#pay_info_wrap {
	width: 1200px;
	height: 80px;
}

#pay_info_text_wrap {
	width: 55px;
	height: 16px;
}

#pay_info_wrap img {
	width: 1200px;
	height: 80px;
}

#info_image_wrap {
	width: 1200px;
	height: 120px;
	float: left;
}

#pay_type_wrap {
	width: 1200px;
	height: 410px;
	float: left;
}

#pay_type_table_wrap {
	width: 1200px;
	height: 390px;
}

#pay_type_table th {
	width: 230px;
	background-color: #e6e6e6;	
	
}

#pay_type_table td {
	text-align: left;
	background-color: #f5f5f5;
}


#shop_returnBtn {
	width: 145px;
	height: 45px;
}

#shop_orderBtn {
	width: 145px;
	height: 45px;
}

#total_table tr:nth-child(3) td{
	width:170px;
}

#counter {
  background:black;
  border-radius: 0.5em;
  padding: 0 .5em 0 .5em;
  font-size: 0.75em;
  color : white;
}

#total_table tr:nth-child(4) td{
	background-color: #e6e6e6;
}


#savemoneytext{
	text-align: right;
}

#deli_comment_area{
	font-size: 13px;
}

#save_text{
	color : #262626;
	font-weight: normal;
	font-size: 13px;
}

</style>

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
	
$(document).ready(function() {
	IMP.init('imp26018843'); 
	
	
	var totalMoney = parseInt($("#totalPrice").text());
	$('#total_table tr:nth-child(2) td:nth-child(1)').empty();
	$('#total_table tr:nth-child(2) td:nth-child(1)').append(totalMoney+'<span>원</span>');
	if(totalMoney < 45000){
		delicheck = totalMoney + 2500;
		$('#total_table tr:nth-child(2) td:nth-child(4)').empty();
		$('#total_table tr:nth-child(2) td:nth-child(4)').append('2500<span>원</span>')
		$('#total_table tr:nth-child(2) td:nth-child(5)').empty();
		$('#total_table tr:nth-child(2) td:nth-child(5)').append(delicheck+'<span>원</span>')
		$('#pay_type_table tr:nth-child(3) td').empty();
		$('#pay_type_table tr:nth-child(3) td').append('2500<span>원</span>');
		$('#pay_type_table tr:nth-child(4) td').empty();
		$('#pay_type_table tr:nth-child(4) td').append(delicheck+'<span>원</span>');
	}
	if (totalMoney >= 45000){
		$('#total_table tr:nth-child(2) td:nth-child(4)').empty();
		$('#total_table tr:nth-child(2) td:nth-child(4)').append('<span>무료</span>')
		$('#total_table tr:nth-child(2) td:nth-child(5)').empty();
		$('#total_table tr:nth-child(2) td:nth-child(5)').append(totalMoney+'<span>원</span>')
		$('#pay_type_table tr:nth-child(3) td').empty();
		$('#pay_type_table tr:nth-child(3) td').append('<span>무료</span>');
		$('#pay_type_table tr:nth-child(4) td').empty();
		$('#pay_type_table tr:nth-child(4) td').append(totalMoney+'<span>원</span>');
	}
	
	
	
	var discount = 0;
	$('#coupon_select').on('change', function(){
		var tm = 0;
		var couponID = $(this).val();
		$('#usecoupon').val(couponID);
		
		discount = discountGO(couponID);
		
		tm = totalMoney - discount - useSavemoney; 
		var deli = tm + 2500;
		if(tm < 45000){
			$('#total_table tr:nth-child(2) td:nth-child(4)').empty();
			$('#total_table tr:nth-child(2) td:nth-child(4)').append('2500<span>원</span>')
			$('#total_table tr:nth-child(2) td:nth-child(5)').empty();
			$('#total_table tr:nth-child(2) td:nth-child(5)').append(deli+'<span>원</span>');
			$('#pay_type_table tr:nth-child(2) td').empty();
			$('#pay_type_table tr:nth-child(2) td').append(tm+'<span>원</span>');
			$('#pay_type_table tr:nth-child(3) td').empty();
			$('#pay_type_table tr:nth-child(3) td').append('2500<span>원</span>');
			$('#pay_type_table tr:nth-child(4) td').empty();
			$('#pay_type_table tr:nth-child(4) td').append(deli+'<span>원</span>');
			
		}
		if(tm >= 45000){
			$('#total_table tr:nth-child(2) td:nth-child(4)').empty();
			$('#total_table tr:nth-child(2) td:nth-child(4)').append('<span>무료</span>')
			$('#total_table tr:nth-child(2) td:nth-child(5)').empty();
			$('#total_table tr:nth-child(2) td:nth-child(5)').append(tm+'<span>원</span>');
			$('#pay_type_table tr:nth-child(2) td').empty();
			$('#pay_type_table tr:nth-child(2) td').append(tm+'<span>원</span>');
			$('#pay_type_table tr:nth-child(3) td').empty();
			$('#pay_type_table tr:nth-child(3) td').append('<span>무료</span>');
			$('#pay_type_table tr:nth-child(4) td').empty();
			$('#pay_type_table tr:nth-child(4) td').append(tm+'<span>원</span>');
		}
		
		$('#smalltotal_table tr:nth-child(2) td').empty();
		$('#smalltotal_table tr:nth-child(2) td').append(discount+'<span>원</span>');
		$('#smalltotal_table tr:nth-child(5) td').empty();
		$('#smalltotal_table tr:nth-child(5) td').append(tm+'<span>원</span>');
		
		$('#total_table tr:nth-child(3) td:nth-child(2)').empty();
		$('#total_table tr:nth-child(3) td:nth-child(2)').append(discount+'<span>원</span>');
		
	});
	
	var useSavemoney = "0";
	$('#savemoney_table tr:nth-child(1) td input').on('change', function(){
		
		useSavemoney = $('#savemoney_table tr:nth-child(1) td input').val();
		var saveMoney = ${MemberDTO.point};
		var last = parseInt(useSavemoney.substring(useSavemoney.length-1));
		
		
		var sm = totalMoney - useSavemoney - discount;
		var deli = sm + 2500;
		if(useSavemoney > saveMoney){
			alert('보유한 적립금보다 많이 사용할 수 없습니다.');
			$('#savemoney_table tr:nth-child(1) td input').val("0");
			return false;
		}
		
		if(isNaN(useSavemoney)==true){
			alert('숫자만 입력하세요.')
			$('#savemoney_table tr:nth-child(1) td input').val("0");
			return false;
		}
		
		if(last != 0){
			alert('1의 자리는 0만 가능합니다.');
			$('#savemoney_table tr:nth-child(1) td input').val("0");
			return false;
		}
		
		if(sm < 45000){

			$('#total_table tr:nth-child(2) td:nth-child(4)').empty();
			$('#total_table tr:nth-child(2) td:nth-child(4)').append('2500<span>원</span>');
			$('#total_table tr:nth-child(2) td:nth-child(5)').empty();
			$('#total_table tr:nth-child(2) td:nth-child(5)').append(deli+'<span>원</span>');
			$('#pay_type_table tr:nth-child(2) td').empty();
			$('#pay_type_table tr:nth-child(2) td').append(sm+'<span>원</span>');
			$('#pay_type_table tr:nth-child(3) td').empty();
			$('#pay_type_table tr:nth-child(3) td').append(2500+'<span>원</span>');
			$('#pay_type_table tr:nth-child(4) td').empty();
			$('#pay_type_table tr:nth-child(4) td').append(deli+'<span>원</span>');
			
		}
		if (sm >= 45000){
			$('#total_table tr:nth-child(2) td:nth-child(4)').empty();
			$('#total_table tr:nth-child(2) td:nth-child(4)').append('<span>무료</span>')
			$('#total_table tr:nth-child(2) td:nth-child(5)').empty();
			$('#total_table tr:nth-child(2) td:nth-child(5)').append(sm+'<span>원</span>');
			$('#pay_type_table tr:nth-child(2) td').empty();
			$('#pay_type_table tr:nth-child(2) td').append(sm+'<span>원</span>');
			$('#pay_type_table tr:nth-child(3) td').empty();
			$('#pay_type_table tr:nth-child(3) td').append('<span>무료</span>');
			$('#pay_type_table tr:nth-child(4) td').empty();
			$('#pay_type_table tr:nth-child(4) td').append(sm+'<span>원</span>');
		}
		
		$('#total_table tr:nth-child(3) td:nth-child(1)').empty();
		$('#total_table tr:nth-child(3) td:nth-child(1)').append(useSavemoney+'<span>원</span>');
		$('#smalltotal_table tr:nth-child(3) td').empty();
		$('#smalltotal_table tr:nth-child(3) td').append(useSavemoney+'<span>원</span>');
		$('#smalltotal_table tr:nth-child(5) td').empty();
		$('#smalltotal_table tr:nth-child(5) td').append(sm+'<span>원</span>')
		
		
	});
	
	$('#sameOrder').on('click', function(){
		var name = $('#orderer_info_table tr:nth-child(1) td input').val();
		var chk = $(this).is(":checked");
		var postNum = $('#orderer_info_table #sample4_postcode').val();
		var detailAddress = $('#detailAddress').val();
		var addressAA = $('#orderer_info_table #sample4_roadAddress').val();
		
		var firstPhone = $('#firstPhone').val();
		var secondPhone = $('#secondPhone').val();
		var lastPhone = $('#lastPhone').val();
		
		
		if(chk == true){
			$('#delivery_info_table tr:nth-child(1) td').empty();
			$('#delivery_info_table tr:nth-child(1) td').append('<input type = "text" value ='+name+'>');
			$('#delivery_info_table tr:nth-child(2) td').remove();
			$('#delivery_info_table tr:nth-child(2)').append('<td><input type="text" id="sample4_postcode" placeholder="우편번호" value='+postNum+'>&nbsp;<input type="button" onclick="sample4_execDaumPostcode()" id="map" value="우편번호 찾기"></td><br>');
			$('#delivery_info_table #sample4_roadAddress').remove();
			$('#delivery_info_table tr:nth-child(3) td').append('<input type="text" size = "50px" id="sample4_roadAddress" name="address" placeholder="도로명주소" value="'+addressAA+'">')
			$('#delivery_info_table tr:nth-child(4) td').empty();
			$('#delivery_info_table tr:nth-child(4) td').append('<input type="text" size="66" placeholder="상세주소" value="'+detailAddress+'">');
			$('#delivery_info_table tr:nth-child(5) td input:nth-child(1)').val("");
			$('#delivery_info_table tr:nth-child(5) td input:nth-child(1)').val(firstPhone);
			$('#delivery_info_table tr:nth-child(5) td input:nth-child(2)').val("");
			$('#delivery_info_table tr:nth-child(5) td input:nth-child(2)').val(secondPhone);
			$('#delivery_info_table tr:nth-child(5) td input:nth-child(3)').val("");
			$('#delivery_info_table tr:nth-child(5) td input:nth-child(3)').val(lastPhone);
			
			
		}
		if(chk == false){
			$('#delivery_info_table tr:nth-child(1) td input').val("");
			$('#delivery_info_table tr:nth-child(2) td input:nth-child(1)').val("");
			$('#delivery_info_table tr:nth-child(3) td input').val("");
			$('#delivery_info_table tr:nth-child(4) td input').val("");
			$('#delivery_info_table tr:nth-child(5) td input').val("");
			$('#delivery_info_table tr:nth-child(6) td input').val("");
			
		}
	});
	
	
	$('#deli_comment').on('change', function(){
		var comment=$("#deli_comment option:selected").text();
		var chk = $("#deli_comment option:selected").val();
		if(chk == 1){
			$('#deli_comment_area').val(comment);
		}
		
		if(chk == 0){
			$('#deli_comment_area').val("");
		}
		
	});
	
	
	$('#deli_comment_area').keyup(function (e){
        var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $('#counter').html(content.length + '/40');
        
        if(content.length > 40){
        	$(this).val($(this).val().substring(0, 40));
        	alert('40자 이내로 입력하세요.');
        	return false;
        }
        
    });
    $('#deli_comment_area').keyup();
    
    
    $('#shop_orderBtn').on('click', function(){
    	
    	var buyer_name =  $('#orderer_name').val();
    	var buyer_tel = $('#firstPhone').val()+"-"+$('#secondPhone').val()+"-"+$('#lastPhone').val();
    	var buyer_addr = $('#orderer_info_table #sample4_roadAddress').val() +" "+ $('#orderer_info_table #detailAddress').val();
    	var buyer_postcode = $('#orderer_info_table #sample4_postcode').val(); 
    	var am = $('#pay_type_table tr:nth-child(4) td').text();
    	var amount = am.substring(0, am.length-1);
    	var buyer_mail = $('#orderer_mail').val();
    	var food_name = $('#order_t_food_name').text();
    	
    	
		if($('#orderer_name').val() == ""){
			alert('주문자 이름을 입력하세요.');
			return false;
		}
   
    	if($('#detailAddress').val() == ""){
 			alert('주소를 입력하세요.');
 			return false;
 		}
    	if($('#firstPhone').val() == ""){
 			alert('핸드폰번호를 입력하세요.');
 			return false;
 		}
    	if($('#secondPhone').val() == ""){
 			alert('핸드폰번호를 입력하세요.');
 			return false;
 		}
    	if($('#lastPhone').val() == ""){
 			alert('핸드폰번호를 입력하세요.');
 			return false;
 		}
    	if($('#orderer_mail').val() == ""){
 			alert('이메일을 입력하세요.');
 			return false;
 		}
    	if($('#recipient_name').val() == ""){
    		alert('받으시는분의 이름을 입력하세요.');
    		return false;
    	}
    	if($('#sample4_postcode').val() == ""){
    		alert('우편번호를 입력하세요.');
    		return false;
    	}
    	if($('#sample4_roadAddress').val() == ""){
    		alert('주소를 입력하세요.');
    		return false;
    	}
    	if($('#recipient_detail_address').val() == ""){
    		alert('주소를 입력하세요.');
    		return false;
    	}
    	
    	if($('#recipient_phone1').val() == ""){
    		alert('핸드폰번호를 입력하세요.');
    		return false;
    	}
    	if($('#recipient_phone2').val() == ""){
    		alert('핸드폰번호를 입력하세요.');
    		return false;
    	}
    	if($('#recipient_phone3').val() == ""){
    		alert('핸드폰번호를 입력하세요.');
    		return false;
    	}
    	if($('#deli_comment_area').val() == ""){
    		alert('배송시 할말을 입력하세요.')
    		return false;
    	}
    	
    	var temp = $('.pay_type:checked').val();
    	
		$("#userpoint").val(useSavemoney);
    	$('#food_infoform').submit();
    	
		/* if(temp == 'creditCard'){
			
			IMP.request_pay({
			    pg : 'danal_tpay',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        $('#food_infoform').submit();
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }

			    alert(msg);
			});
		}
		else if(temp == 'bankBook'){
			
			IMP.request_pay({
			    pg : 'danal_tpay',
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '주문명:결제테스트',
			    amount : 100,
			    buyer_email : 'iamport@siot.do',
			    buyer_name : '구매자이름',
			    buyer_tel : '010-1234-5678',
			    buyer_addr : '서울특별시 강남구 삼성동',
			    buyer_postcode : '123-456'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        
			        $('#food_infoform').submit();
			        
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }

			    alert(msg);
			});
		} */
    	
    	
    });
    
    
    $('#shop_returnBtn').on('click', function(){
    	window.location.href = "shop.do";
    });
	
	
}); //end document ready///////////////////////

function discountGO(no) {
	var sum = 0;

	var list = new Array();
	<c:forEach var='item1' items='${member.cList}'>
		var coupon = new Object();
		coupon.no = '${item1.couponbook_no}';
		coupon.discount = '${item1.coupon_discount}';
		list.push(coupon);
	</c:forEach>
	
	for(var i=0; i < list.length; i++){
		if(list[i].no == no){
			sum = list[i].discount;
		}
	}
	return sum;
}


function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('address').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}
	
</script>
</head>
<body>
	<div id="buypage_wrap">
		<div id="guide_wrap">
			<div id="guide_image_wrap">
				<img alt="안내이미지" src="./images/cart_info.png">
			</div>
		</div>
		<div id="terms_wrap">
			<div id="terms_text">
				<p id = "terms_p" align="left">
					<br> <Strong>'(주)반찬을부탁해'</Strong>는 (이하 '회사'는) 고객님의 개인정보를
					중요시하며, "정보통신망 이용촉진 및 정보보호"에 관한 법률을 준수하고 있습니다.<br> 회사는
					개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해
					어떠한 조치가<br> 취해지고 있는지 알려드립니다. 회사는 개인정보취급방침을 개정하는 경우 웹사이트
					공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br> 본 방침은 <Strong>2014년
						4월 7일</Strong>부터 시행됩니다.<br> <br> <Strong>수집하는 개인정보 항목</Strong><br>회사는
					회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.<br> <Strong>수집항목</Strong><br>
					- 필수 항목 : 성명, 생년월일, 연락처(휴대전화번호, 전화번호), 이메일, 성별, 방문일시, 서비스이용기록,
					온라인상담기록, OS버전, 단말기 기기명<br> - 선택 항목 : 공동현관 비밀번호, 집 약도<br>
					<br> <Strong>개인정보 수집방법</Strong><br> - 홈페이지 (회원가입, 고객센터
					게시판), 구매시 정보입력, 이벤트참여 및 고객센터를 통한 전화 또는 온라인 상담<br> <br> <br>
					<Strong>개인정보의 수집 및 이용목적</Strong><br> 회사는 수집한 개인정보를 다음의 목적을 위해
					활용합니다.<br> <Strong>서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</Strong><br>
					- 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 회원 관리 <br>- 회원제 서비스
					이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 불만처리 등
					민원처리 , 고지사항 전달<br> <br> <br> <Strong>마케팅 및
						광고에 활용</Strong><br> - 이벤트 등 광고성 정보 전달 결제정보 <br> <br> <br>
					<strong>결제정보</strong><br>- 결제업체(PG회사) 및 결제유형에 따라 다음과 같은 정보의
					입력이 추가로 요구 될 수 있습니다. <br>- 신용카드 결제 시 : 카드사명, 카드번호 <br>-
					무통장 입금 시 : 은행명, 입금자명 <br> <br> <br> <strong>개인정보의
						보유 및 이용기간</strong><br> 회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이
					파기합니다.<br>
				</p>
			</div>
	
		</div>

		<div id="order_wrap">
			<div id="order_list_wrap">
				<div id="order_list">
				<form id="food_infoform" action="pay_end.do" method="POST">
					<table id="order_table">
						<caption>주문내역</caption>
						<tr>
							<th>상품명</th>
							<th>상품가격</th>
							<th>상품수량</th>
							<th>적립금</th>
							<th>합계</th>
						</tr>
						
						<%-- 합계계산 --%>
						<c:set var="totalPrice" value="0" scope="page"/>
						<c:set var="totalAmount" value="0" scope="page"/>
						<c:set var="saveMoneySum" value="0" scope="page"/>
						<c:set var="saveMoney" value="0" scope="page"/>
						
						<c:forEach items="${FoodsDTO}" var="food">
							<c:set var = "saveMoney" value="${food.price * 0.01 * food.amount}"></c:set>
							<tr>
									<td id="order_t_food_name">${food.foods_name}
									
									<input type="hidden" name="chkfood" value="${food.foods_no}">
									<input type="hidden" name="foods_no" value="${food.foods_no}">
									<input type="hidden" name="foods_name" value="${food.foods_name}">
									<input type="hidden" name="price" value="${food.price}">
									<input type="hidden" name="amount" value="${food.amount}">
									<input type="hidden" name="savepoint" value="${food.price * 0.01 * food.amount}">
									</td>
									<td>${food.price}<span>원</span></td>
								<td>${food.amount}<span>개</span></td>
								<td><fmt:formatNumber value="${saveMoney+(10-(saveMoney%10))%10}" type="NUMBER"></fmt:formatNumber><span>원</span></td>
								<td>${food.price * food.amount}<span>원</span></td>
								<c:set var= "totalAmount" value="${totalAmount + food.amount}"/>
								<c:set var="totalPrice" value="${totalPrice + food.price * food.amount}"/>
								<c:set var = "round" value="${saveMoney+(10-(saveMoney%10))%10}"></c:set>
								<c:set var="saveMoneySum" value="${saveMoneySum + round}"/>
							</tr>
						</c:forEach>
					</table>
						<input id="userpoint" value = "0" type="hidden" name="userpoint">
						<input id="usecoupon" value = "0" type="hidden" name="usecoupon">
					</form>
				</div>
				<div id="savemoney_wrap">
					<p id="save_text" align="left">고객님의 적립금이나 쿠폰을 사용하면 좀 더 절약하여 구매할 수 있습니다.</p><br>
					<table id="savemoney_table" width="600px" height="103px;"> 
						<tr>
							<th scope="row">적립금사용</th>
							<td>
							<input size="5" type = "text" name = "useSaveMoney1" id ="savemoneytext" value="0"><span>원</span> (사용가능한 적립금 : ${MemberDTO.point}<span>원</span>)
							</td>
						</tr>
						<tr>
							<th scope="row">쿠폰적용</th>
							<td><select id="coupon_select">
									<option selected value="0">사용하실 쿠폰을 선택하세요.</option>
									<c:forEach items="${member.cList}" var = "couponDTO">
									<option value="${couponDTO.couponbook_no}">${couponDTO.coupon_name}</option>
									</c:forEach>
							</select>
							</td>

						</tr>
					</table>
					
				</div>
				<div id="smalltotal_wrap">
					<table id="smalltotal_table" width="100%" >
						<tr>
							<th scope="row">주문수량합계</th>
							<td>${totalAmount}<span>개</span></td>
						</tr>
						<tr>
						
							<th scope="row">쿠폰사용</th>
							<td>0<span>원</span></td>
						</tr>
						<tr>
							<th scope="row">적립금사용</th>
							<td>0<span>원</span></td>
						</tr>
						<tr>
							<th scope="row">적립금</th>
							<td><fmt:formatNumber value="${saveMoneySum}" type="NUMBER"></fmt:formatNumber><span>원</span></td>
						</tr>
						<tr>
							<th scope="row">총 결제금액</th>
							<td id="totalPrice">${totalPrice}<span>원</span></td>
						</tr>
					</table>
				</div>

				<div id="total_wrap">
					<table id="total_table" width="100%" >
						<tr>
							<th>상품금액</th>
							<th colspan="2">할인금액</th>
							<th>배송비 합계</th>
							<th>총 주문 합계</th>
						</tr>
						
						<tr>
							<td rowspan="2">0<span>원</span></td>
							<td>적립금사용</td>
							<td>쿠폰사용</td>
							<td rowspan="2">0<span>원</span></td>
							<td rowspan="2">0<span>원</span></td>
						</tr>
						<tr>
							<td>0<span>원</span></td>
							<td>0<span>원</span></td>
						</tr>
						<tr>
							<td colspan="5" align="left">고객님, 수도권 지역이세요?<br> 반찬을부탁해
								새벽직배송으로 더신선하고 신속하게 반찬을 만나보실 수 있습니다.<br> 상품금액에서 할인금액을 제외한 총
								주문 합계가 45,000원 이상이 되어야 무료배송이 가능합니다.
							</td>
						</tr>
					</table>
				</div>
				<div id="orderer_wrap">
					<div id="orderer_info">
						<table id="orderer_info_table" width="950" height="300">
							<caption>주문자 정보</caption>
							<tr>
								<th scope="row">주문자 *</th>
								<td><input type="text" id ="orderer_name" value="${MemberDTO.member_name}"></td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">주소</th>
								<td>
								<input type="text" id="sample4_postcode" placeholder="우편번호" value="${postNum}">
								<input type="button" onclick="sample4_execDaumPostcode()" id="map" value="우편번호 찾기"><br>
							</tr>
							<tr>
								<td><input type="text" size = "50px" value = "${Address}" id="sample4_roadAddress" name="address" placeholder="도로명주소">
							</tr>
							<tr>
								<td><input type="text" size="66" placeholder="상세주소" id="detailAddress" value="${detailAddress}"></td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td><input type="text" id = "firstPhone" size="3" value = "${firstPhone}"> - <input
									type="text" id="secondPhone" size="4" value="${secondPhone}"> - <input type="text" id = "lastPhone" size="4" value = "${lastPhone}"></td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td><input type="text" id="orderer_mail" size="25" value ="${MemberDTO.mail}"></td>
							</tr>
						</table>
					</div>

					<div id="deliver_image">
						<img alt="배송안내이미지" src="./images/shop_deli_img.png">
					</div>

					<div id="delivery_info">
						<table id="delivery_info_table" width="950">
							<caption>
								배송지 정보<span>*</span>&nbsp;&nbsp;&nbsp;<input type="checkbox" id="sameOrder"> 주문자 정보와
								동일
							</caption>
							<tr>
								<th scope="row">받으시는분 <span>*</span></th>
								<td><input id="recipient_name" type="text"></td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">주소</th>
								<td>
								<input type="text" id="sample4_postcode" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" id="map" value="우편번호 찾기"><br></td>
								
							</tr>
							<tr>
								<td><input type="text" size = "50px" id="sample4_roadAddress" name="address" placeholder="도로명주소"></td>
							</tr>
							<tr>
								<td><input type="text" id = "recipient_detail_address" size="66" placeholder="상세주소"></td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td><input type="text" id="recipient_phone1" size="3"> - <input
									type="text" id="recipient_phone2" size="4"> - <input type="text" id="recipient_phone3" size="4"></td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">배송관련 할말(40자 내외)</th>
								<td>* 택배기사님께 전달하는 메시지를 적는 란 입니다.</td>
							</tr>
							<tr>
								<td><select id = "deli_comment">
										<option value = "0" selected="selected">배송기사님께 전달되는 메세지를 입력하세요.</option>
										<option value="1">부재시 경비(관리)실에 맡겨주세요.</option>
										<option value="1">부재시 문앞에 놓아주세요.</option>
										<option value="1">배송전에 연락주세요.</option>
										<option value="0">==========================================</option>
										<option value="0">직접입력하기 (40자 내외)</option>
								</select></td>
							</tr>
							<tr>
								<td>
								<textarea id="deli_comment_area" rows="15" cols="70" style="resize: none;"></textarea>
								<span id="counter">###</span>
								</td>
							</tr>

						</table>

					</div>
					<div id="info_image_wrap">
						<div id="pay_info_text_wrap">
							<img alt="" src="./images/pay_info_text.png">
						</div>
						<div id="pay_info_wrap">
							<img alt="" src="./images/pay_info.png">
						</div>
					</div>

					<div id="pay_type_wrap">
						<div id="pay_type_table_wrap">
							<table id="pay_type_table" width="950">
							
								<tr>
									<th scope="row">결제방식</th>
									<td><input type="radio" class="pay_type" name="pay_type" value="creditCard">
										신용카드<br> &nbsp;- 신용카드 결제 신청 시 승인 진행에 다소 시간이 소요될 수 있으므로
										'중지', '새로고침'을 누르지 마시고 결과 화면이 나타날 때까지 기다려 주십시오.<br>
										&nbsp;- 결제하기 버튼 클릭시 결제창이 나타나지 않을 경우나 안전결제 모듈이 설치 되지 않을 경우 반찬을부탁해
										사이트를 모두 닫으시고 아래 설치파일을 다운받아 ActiveX를 수동설치 하시고 결제를 진행하여 주십시오.<br>
									<br> <input type="radio" class="pay_type" name="pay_type" value="bankBook">
										무통장입금<br> &nbsp;- 안전한 거래를 제공하기 위해 현금결제시 구매안전 서비스를 제공하고
										있습니다. <br> &nbsp;- 입금금액이 일치해야 정삭적으로 입금이 가능합니다.<br>
										&nbsp;- 주문완료 후 희망배송일 이틀 전 21시 이내에 입금이 확인되지 않으면 자동취소 됩니다.<br>
									</td>
								</tr>
								<tr>
									<th scope="row">상품합계금액</th>
									<td><span>${totalPrice}원</span></td>
								</tr>
								<tr>
									<th scope="row">배송료</th>
									<td><span>원</span></td>
								</tr>
								<tr>
									<th scope="row">총 결제금액</th>
									<td><span>원</span></td>
								</tr>
							</table>
							<br>
							<br> <input type="image" id="shop_returnBtn" value="쇼핑계속" src="./images/shop_shopping_con.png">
							<input type="image" id="shop_orderBtn" value="주문하기" src="./images/shop_play_order.png">
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</body>
</html>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
<style type="text/css">
.menubar {
	display: none;
}

#mainbody {
	border: 0;
}

#pay_end {
	width: 1200px;
	height: auto;
	margin: auto;
	background-color: red;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
	$('#homeBtn').on('click', function() {
		alert('홈버튼');
		window.location.href = "main.do";
	});

	$('#shoppingBtn').on('click', function() {
		alert('쇼핑계속');
		window.location.href = "shop.do";

	});
</script>


</head>
<body>
	<div id="pay_end">
		<p>구매가 완료되었습니다.</p>
		<p>고객님의 메일로 구매상품정보를 발송하였습니다.</p>
		<p>반찬을 부탁해를 이용해주셔서 감사합니다.</p>
		<button id="shoppingBtn">계속쇼핑하기</button>
		<button id="homeBtn">홈으로 가기</button>
	</div>
</body>
</html>


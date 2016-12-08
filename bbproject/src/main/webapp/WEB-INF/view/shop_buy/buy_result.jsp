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
}

#pay_end p{
	font-size: 25px;
	margin-top: 20px;
}
</style>


</head>
<body>
	<div id="pay_end">
		<p>구매가 완료되었습니다.</p>
		<p>고객님의 메일로 구매상품정보를 발송하였습니다.</p>
		<p>반찬을 부탁해를 이용해주셔서 감사합니다.</p><br><br>
		<a href="shop.do"><button id="shoppingBtn">계속쇼핑하기</button></a>
		<a href="main.do"><button id="homeBtn">홈으로 가기</button></a>
	</div>
</body>
</html>


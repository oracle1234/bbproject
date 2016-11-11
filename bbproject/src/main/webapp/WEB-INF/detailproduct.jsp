<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <script src="js/detail_product.js"></script> -->
<style type="text/css">
body {
	margin: 0px;
	padding: 0px;
}

#detail_wrap {
	width: 950px;
	height: 2500px;
	float: left;
	background-color: lightgray;
}

.detail_img img {
	width: 320px;
	height: 320px;
	position: absolute;
	left: 20px;
	top: 20px;
}

.info #info_table {
	position: absolute;
	top: 20px;
	left: 380px;
}

.button_img {
	position: absolute;
	top: 295px;
	left: 620px;
}

.button_img img {
	width: 145px;
	height: 45px;
}

#info_table th {
	width: 150px;
	height: 30px;
	text-align: left;
}

#shop_upbutton {
	position: absolute;
	top: 150px;
}

#shop_downbutton {
	position: absolute;
	top: 161px;
}

.deli_img img {
	position: absolute;
	top: 295px;
	left: 370px;
	width: 245px;
	height: 45px;
}

#info_table tr:nth-child(1) {
	font-size: 25px;
}

#account {
	position: absolute;
	top: 370px;
	left: 20px;
}

#account_meter th {
	width: 80px;
}

#account_meter td {
	width: 700px;
}

#product_packing {
	background-color: gray;
	width: 850px;
	height: 1117px;
	position: absolute;
	top: 550px;
	left: 50px;
}

.shop_review {
	width: 850px;
	position: absolute;
	float : left;
	background-color: yellow;
}

#review_text_p {
	width: 130px;
	height: 30px;
	background-color: blue;
	font-size: 20px;
}

#review_table {
	width: 850px;
}

#review_table th:nth-child(1) {
	width: 80px;
}

#review_table th:nth-child(2) {
	width: 610px;
}

#review_table th:nth-child(3) {
	width: 90px;
}

#review_table th:nth-child(4) {
	width: 100px;
}

#review_wrap{
	width: 850px;
	height: 600px;
	background-color: red;
	position:relative;
	top:1770px;
	left : 50px;
}

.review_text{
	position : absolute;
	background-color: lime;
}

</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#shop_upbutton').on('click', function() {
			// alert(('#counttext').val());
			var count = parseInt($('#counttext').val());
			count += 1;

			document.getElementById("counttext").value = count;

		});

		$('#shop_downbutton').on('click', function() {

			var count = parseInt($('#counttext').val());
			if (count != 1) {
				count -= 1;
				document.getElementById("counttext").value = count;
			}
		});

	});
</script>

</head>
<body>

	<div id="detail_wrap">
		<div class="detail_img">
			<img alt="상세이미지" src="">
		</div>
		<div class="info">
			<table id="info_table" width="600px" height="auto">

				<tr>
					<th colspan="2">이름</th>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<th>판매가격</th>
					<td>1235213</td>
				</tr>
				<tr>
					<th>유통기한</th>
					<td>4</td>
				</tr>
				<tr>
					<th>용량</th>
					<td>4</td>
				</tr>
				<tr>
					<th>수량</th>
					<td><input type="text" id="counttext" size="2px" width="10px"
						value="1" style="text-align: center;"> <span><img
							alt="up" id="shop_upbutton" src="./images/upbutton.png"
							width="11" height="10"></span> <span><img alt="down"
							id="shop_downbutton" src="./images/downbutton.png" width="11"
							height="10"></span></td>
				</tr>
				<tr>
					<th>적립금</th>
					<td>가격의 1%</td>
				</tr>
				<tr>
					<th>구매예정금액</th>
					<td>수량x가격</td>
				</tr>
			</table>

			<div class="deli_img">
				<img alt="무료배송안내이미지" src="./images/baesong_info.png">
			</div>

			<div class="button_img">
				<img src="" alt="바로구매이미지" src=""> <img alt="장바구니이미지" src="">
			</div>
		</div>
		<div id="account">
			<table id="account_meter">
				<tr>
					<th>재료</th>
					<td>ㅁㄴㅇㅁㅇㄴㄻㄴㅇㄻㄴㅇasdasfdadsfafsdafdsㅁㅇㄴㄻㅇㄴㄻㄴㅇㄻㄴㅇㄻㅇㄹㄴㅇㅁㄹㄴㅁㅇㄴㄻㅇㄹㄴㅇㄻㄴㄹ라ㅏㅓㅏㅣㅓㅏㅣㅏㅘㅓㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣ</td>
				</tr>

				<tr>
					<th>설명</th>
					<td>ㅅㅁㄴㅇㄻㅇㅓㅏㅣㅓㅏㅣㅏㅓㅣㅏㅓㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅏㅓㅣㅏㅓㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㅣㅓㅏㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㄹㅓㅏㅣㅓㅏㅣㅏㄴ</td>
				</tr>
			</table>
		</div>
		<div id="product_packing">
			<img alt="배송용기설명" src="./images/delevery.png">
		</div>


		<div id = review_wrap>

			<div class="shop_review">
			<p id="review_text_p">한줄평</p>
				<table id="review_table">
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>

					<%-- <c:forEach items="${list}" var="ReviewDTO"> --%>
					<tr>
						<td>ReviewDTO.fc_no</td>
						<td>ReviewDTO.fc_content}</td>
						<td>ReviewDTO.fc_writer}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>ReviewDTO.fc_no</td>
						<td>ReviewDTO.fc_content}</td>
						<td>ReviewDTO.fc_writer}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>ReviewDTO.fc_no</td>
						<td>ReviewDTO.fc_content}</td>
						<td>ReviewDTO.fc_writer}</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<%-- </c:forEach> --%>

				</table>

			</div>

			<div class="review_text">
				<label>한줄평 남기기</label><input type="text" size="70px"
					value="30자 이내로 한줄평을 작성해주세요.">
				<button id="review_reg">등록</button>
			</div>
		</div>

	</div>

</body>
</html>


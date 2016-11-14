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

#product_wrap {
	width: 950px;
	height: 2500px;
	position: relative;
	background-color: lightgray;
}

.detail_img_wrap {
	width: 350px;
	height: 350px;
	background-color: red;
	position: absolute;
}

.detail_img img {
	width: 320px;
	height: 320px;
	position: absolute;
	top: 20px;
	left: 20px;
}

.sul_wrap {
	background-color: yellow;
	width: 950px;
	height: 500px;
}

.table_wrap {
	width: 600px;
	height: 350px;
	background-color: blue;
	float: right;
}

#info_table {
	position: absolute;
	top: 20px;
}

#info_table tr:nth-child(1) {
	font-size: 25px;
}

.deli_img {
	position: absolute;
	top: 280px;
	left: 360px;
}

#account {
	position: absolute;
	left: 20px;
	top: 350px;
}

#info_table th {
	width: 100px;
	height: 25px;
	text-align: left;
}

#account_meter th {
	width: 50px;
}

#account_meter td {
	width: 800px;
}

.packing_wrap {
	background-color: green;
	width: 852px;
	height: 1119px;
	position: absolute;
	left: 50px;
}

#review_wrap {
	width: 850px;
	height: 500px;
	background-color: green;
	position: absolute;
	top: 1640px;
	right: 50px;
}

#shop_upbutton {
position: absolute;
	top: 133px;	
}

#shop_downbutton {
	position: absolute;
	top: 144px;
}

.shop_review p{
	font-size: 23px;
}

#review_table th:nth-child(1) {
	width: 40px;
}

#review_table th:nth-child(2) {
	width: 680px;
}

#review_table th:nth-child(3) {
	width: 90px;
}

#review_table th:nth-child(4) {
	width: 100px;
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

	<div id="product_wrap">
		<div class="sul_wrap">
			<div class="detail_img_wrap">
				<div class="detail_img">
					<img alt="상세이미지" src="">
				</div>

			</div>
			<!-- 상세이미지 -->


			<div class="table_wrap">
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
					<img alt="무료배송안내이미지" src="./images/baesong_info.png"> <img
						src="./images/shop_buy.png" alt="바로구매이미지" src=""> <img
						alt="장바구니이미지" src="./images/shop_basket.png">
				</div>

			</div>



			<div id="account">
				<table id="account_meter" height="auto">
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
		</div>

		<!-- 상품 상세설명 end -->
		<div class="packing_wrap">
			<div id="product_packing">
				<img alt="배송용기설명" src="./images/delevery.png">
			</div>
		</div>


		<div id=review_wrap>

			<div class="shop_review">
				<p id="review_text_p">한줄평</p>
				<table id="review_table" border="1" width="850px">
					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>

					<%-- <c:forEach items="${list}" var="ReviewDTO"> --%>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td>2016-11-11</td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td>2016-11-11</td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					<tr>
						<td>2000</td>
						<td>ReviewDTO.fc_content}</td>
						<td>fffffffffffff</td>
						<td><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short"
								value="${ReviewDTO.date}" /></td>
					</tr>
					
					
					<%-- </c:forEach> --%>

				</table>

				<label>한줄평 남기기</label><input type="text" size="70px"
					value="30자 이내로 한줄평을 작성해주세요.">
				<button id="review_reg">등록</button>
			</div>

		</div>

	</div>

</body>
</html>


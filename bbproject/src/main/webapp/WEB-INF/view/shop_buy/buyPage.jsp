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
table {
	font-size: 13px;
}

caption {
	font-size: 20px;
}

#buypage_wrap {
	width: 950px;
	height: 2850px;
	background-color: lightgray;
	position: relative;
}

#guide_wrap {
	width: 950px;
	height: 280px;
	background-color: blue;
	position: absolute;
	top: 30px;
}

#guide_image_wrap {
	width: 950px;
	height: 250px;
	background-color: red;
}

#guide_image_wrap img {
	width: 950px;
	height: 250px;
}

#terms_wrap {
	width: 950px;
	height: 245px;
	position: absolute;
	top: 320px;
	background-color: yellow;
}

#terms_text {
	width: 950px;
	height: 200px;
	background-color: green;
}

#terms_text p {
	width: 930px;
	height: 200px;
	overflow: auto;
	font-size: 13px;
	margin-left: 20px;
}

#terms_text p Strong {
	font-weight: bold;
	font-size: 14px;
}

#terms_checkbox {
	width: 300px;
	height: 30px;
	font-size: 13px;
	position: absolute;
	top: 190px;
}

#order_wrap {
	width: 950px;
	height: 630px;
	position: absolute;
	top: 580px;
	background-color: aqua;
}

#order_list_wrap {
	width: 950px;
	height: 620px;
	background-color: maroon;
}

#order_table {
	width: 950px;
}

#order_table caption {
	text-align: left;
}

#savemoney_wrap {
	width: 650px;
	height: 150px;
	background-color: navy;
	float: left;
}

#smalltotal_wrap {
	width: 300px;
	height: 150px;
	background-color: blue;
	float: left;
}

#savemoney_table th {
	width: 100px;
	height: 30px;
}

#coupon_select {
	width: 100%;
	text-align: center;
}

#smalltotal_table th {
	text-align: left;
	width: 200px;
}

#smalltotal_table td {
	text-align: right;
}

#total_wrap {
	width: 950px;
	height: 230px;
	background-color: lime;
	float: left;
}

#total_table th {
	height: 30px;
}

#total_table td {
	height: 50px;
}

#orderer_wrap {
	width: 950px;
	height: 900px;
	background-color: purple;
	position: absolute;
	top: 630px;
}

#orderer_info {
	width: 950px;
	height: 350px;
	background-color: teal;
	float: left;
}

#orderer_info_table caption {
	text-align: left;
}

#orderer_info_table th {
	width: 250px;
	height: 50px;
}

#orderer_info_table td {
	text-align: left;
}

#delivery_info_table caption {
	text-align: left;
}

#delivery_info_table th {
	width: 250px;
	height: 50px;
}

#delivery_info_table td {
	text-align: left;
}

#deliver_image {
	width: 950px;
	height: 105px;
	background-color: green;
	float: left;
}

#deliver_image img {
	width: 950px;
	height: 100px;
}

#delivery_info {
	width: 950px;
	height: 510px;
	background-color: olive;
	float: left;
}

#pay_info_wrap {
	width: 950px;
	height: 80px;
	background-color: silver;
}

#pay_info_text_wrap {
	width: 55px;
	height: 16px;
}

#pay_info_wrap img {
	width: 950px;
	height: 80px;
}

#info_image_wrap {
	width: 950px;
	height: 120px;
	float: left;
	background-color: black;
}

#pay_type_wrap {
	width: 950px;
	height: 410px;
	background-color: navy;
	float: left;
}

#pay_type_table_wrap {
	width: 950px;
	height: 390px;
	background-color: fuchsia;
}

#pay_type_table td {
	text-align: left;
}

#pay_type_table th {
	width: 230px;
}

#shop_returnBtn {
	width: 145px;
	height: 45px;
}

#shop_orderBtn {
	width: 145px;
	height: 45px;
}
</style>
</head>
<body>
	<div id="buypage_wrap">
		<div id="guide_wrap">
			<div id="guide_image_wrap">
				<img alt="안내이미지" src="">
			</div>
		</div>
		<div id="terms_wrap">
			<div id="terms_text">
				<p align="left">
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
			<!-- <div id="terms_checkbox">
				<input type="checkbox" id="terms_chk"> 개인정보 정보보호에 관한 법률에
				동의합니다.
			</div> -->
		</div>

		<div id="order_wrap">
			<div id="order_list_wrap">
				<div id="order_list">
					<table id="order_table" border="1">
						<caption>주문내역</caption>
						<tr>
							<th>상품명</th>
							<th>상품가격</th>
							<th>상품수량</th>
							<th>적립금</th>
							<th>합계</th>
						</tr>

						<c:forEach items="${FoodsDTO}" var="food">
							<tr>
								<td>${food.foods_name}</td>
								<td>${food.price}</td>
								<td>${amount}</td>
								<td><fmt:formatNumber pattern="0" value="${food.price * 0.01 * amount}" type="NUMBER"></fmt:formatNumber></td>
								<td>${food.price * amount}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="savemoney_wrap">
					<p align="left">고객님 포인트를 사용하면 좀 더 절약하여 구매할 수 있습니다.</p>
					<br>
					<table id="savemoney_table" border="1" width="600px">
						<tr>
							<th scope="row">적립금사용</th>
							<td>100<span>원</span> (사용가능한 적립금 : 0<span>원</span>)
							</td>
						</tr>
						<tr>
							<th scope="row">쿠폰적용</th>
							<td><select id="coupon_select">
									<option>사용하실 쿠폰을 선택하세요.</option>
									<option>회원가입 축하이벤트쿠폰(~2016.12.24)</option>
							</select></td>

						</tr>
					</table>
				</div>
				<div id="smalltotal_wrap">
					<table id="smalltotal_table" border="1">
						<tr>
							<th scope="row">주문수량합계</th>
							<td>z</td>
						</tr>
						<tr>
							<th scope="row">총 할인금액</th>
							<td>z</td>
						</tr>
						<tr>
							<th scope="row">적립금사용</th>
							<td>z</td>
						</tr>
						<tr>
							<th scope="row">적립금</th>
							<td>z</td>
						</tr>
						<tr>
							<th scope="row">총 결제금액</th>
							<td>zzzzzzzzzzzzzzz</td>
						</tr>
					</table>
				</div>

				<div id="total_wrap">
					<table id="total_table" border="1" width="100%">
						<tr>
							<th>상품금액</th>
							<th colspan="2">할인금액</th>
							<th>배송비 합계</th>
							<th>총 주문 합계</th>
						</tr>
						<tr>
							<td rowspan="2">14543<span>원</span></td>
							<td colspan="2">적립금사용&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 쿠폰사용</td>
							<td rowspan="2">g</td>
							<td rowspan="2">g</td>
						</tr>
						<tr>
							<td>적립금사용<span>원</span></td>
							<td>쿠폰사용.<span>원</span></td>
						</tr>
						<tr>
							<td colspan="5" align="left">고객님, 수도권 지역이세요?<br> 반찬을부탁해
								새벽직배송으로 더신선하고 신속하게 더반찬을 만나보실 수 있습니다.<br> 상품금액에서 할인금액을 제외한 총
								주문 합계가 45,000원 이상이 되어야 무료배송이 가능합니다.
							</td>
						</tr>

					</table>
				</div>
				<div id="orderer_wrap">
					<div id="orderer_info">
						<table id="orderer_info_table" width="950" border="1">
							<caption>주문자 정보</caption>
							<tr>
								<th scope="row">주문자 *</th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">주소</th>

								<td><input type="text" size="30">&nbsp;<input
									type="button" value="우편번호 검색"></td>
							</tr>
							<tr>
								<td><input type="text" size="100"></td>
							</tr>
							<tr>
								<td><input type="text" size="100"></td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td><input type="text" size="1"> - <input
									type="text" size="1"> - <input type="text" size="1"></td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td><input type="text" size="1"> - <input
									type="text" size="1"> - <input type="text" size="1"></td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td><input type="text" size="25"></td>
							</tr>
						</table>
					</div>

					<div id="deliver_image">
						<img alt="배송안내이미지" src="">
					</div>

					<div id="delivery_info">
						<table id="delivery_info_table" width="950" border="1">
							<caption>
								배송지 정보&nbsp;&nbsp;&nbsp;<input type="checkbox"> 주문자 정보와
								동일
							</caption>
							<tr>
								<th scope="row">받으시는분 *</th>
								<td><input type="text"></td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">주소</th>

								<td><input type="text" size="30">&nbsp;<input
									type="button" value="우편번호 검색"></td>
							</tr>
							<tr>
								<td><input type="text" size="100"></td>
							</tr>
							<tr>
								<td><input type="text" size="100"></td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td><input type="text" size="1"> - <input
									type="text" size="1"> - <input type="text" size="1"></td>
							</tr>
							<tr>
								<th scope="row">휴대폰번호</th>
								<td><input type="text" size="1"> - <input
									type="text" size="1"> - <input type="text" size="1"></td>
							</tr>
							<tr>
								<th scope="row" rowspan="3">배송관련 할말(40자 내외)</th>
								<td>* 택배기사님께 전달하는 메시지를 적는 란 입니다.</td>
							</tr>
							<tr>
								<td><select>
										<option>배송기사님께 전달되는 메세지를 입력하세요.</option>
										<option>부재시 경비(관리)실에 맡겨주세요.</option>
										<option>부재시 문앞에 놓아주세요.</option>
										<option>배송전에 연락주세요.</option>
										<option>==========================================</option>
										<option>직접입력하기 (40자 내외)</option>

								</select></td>
							</tr>
							<tr>
								<td><textarea cols="100" rows="10" style="resize: none"></textarea></td>
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
							<table id="pay_type_table" border="1" width="950">
								<tr>
									<th scope="row">결제방식</th>
									<td><input type="radio" name="pay_type" value="crditCard">
										신용카드<br> &nbsp;- 신용카드 결제 신청 시 승인 진행에 다소 시간이 소요될 수 있으므로
										'중지', '새로고침'을 누르지 마시고 결과 화면이 나타날 때까지 기다려 주십시오.<br>
										&nbsp;- 결제하기 버튼 클릭시 결제창이 나타나지 않을 경우나 안전결제 모듈이 설치 되지 않을 경우 더반찬
										사이트를 모두 닫으시고 아래 설치파일을 다운받아 ActiveX를 수동설치 하시고 결제를 진행하여 주십시오.<br>
									<input type="button" value="LG U+ 결제 모듈 수동설치"><br>
									<br> <input type="radio" name="pay_type" value="bankBook">
										무통장입금<br> &nbsp;- 안전한 거래를 제공하기 위해 현금결제시 구매안전 서비스를 제공하고
										있습니다. <br> &nbsp;- 입금금액이 일치해야 정삭적으로 입금이 가능합니다.<br>
										&nbsp;- 주문완료 후 희망배송일 이틀 전 21시 이내에 입금이 확인되지 않으면 자동취소 됩니다.<br>
									</td>
								</tr>
								<tr>
									<th scope="row">상품합계금액</th>
									<td>원</td>
								</tr>
								<tr>
									<th scope="row">배송료</th>
									<td>2500원</td>
								</tr>
								<tr>
									<th scope="row">총 결제금액</th>
									<td>124323원</td>
								</tr>
							</table>
							<br>
							<br> <input type="image" id="shop_returnBtn" value="쇼핑계속">
							<input type="image" id="shop_orderBtn" value="주문하기">
						</div>
					</div>


				</div>


			</div>
		</div>
	</div>
</body>
</html>



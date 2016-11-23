<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#buypage_wrap {
	width: 950px;
	height: 2000px;
	background-color: lightgray;
	position: relative;
}

#guide_wrap {
	width: 950px;
	height: 300px;
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
	position:absolute;
	top:400px;
	background-color: yellow;
}

#terms_text{
	width: 950px;
	height: 175px;
	background-color: green;
}

#terms_text p {
	width: 930px;
	height: 175px;
	overflow : auto;
	font-size: 13px;
	margin-left: 20px;
	
}
#terms_text p Strong {
	font-weight : bold;
	font-size: 14px; 
}

#terms_checkbox{
	width: 300px;
	height: 30px;
	font-size: 13px;
	position: absolute;
	top:190px;
}

#order_wrap{
	width: 950px;
	height: 1000px;
	position: absolute;
	top:650px;
	background-color: aqua;
}

#order_list_wrap{
	width: 950px;
	height: 700px;
	background-color: red;
}

#order_table{
 width: 950px;
}

#order_table caption{
	text-align: left;
}

#savemoney_wrap{
	width: 650px;
	height: 150px;
	background-color: lightgray;
	float: left;
}

#smalltotal_wrap{
	width: 300px;
	height : 150px;
	background-color: blue;
	float: left;
}


#savemoney_table th{
	width: 100px;
}

#coupon_select{
	width: 100%;
	text-align: center;
}

#smalltotal_table th{
	text-align: left;
	width: 200px;
}

#smalltotal_table td{
	text-align: right;
}

#total_wrap{
	width: 950px;
	height: 200px; 
	background-color: lime;
	float: left;
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
				<p align="left"><br>
				<Strong>'(주)반찬을부탁해'</Strong>는 (이하 '회사'는) 고객님의 개인정보를 중요시하며, "정보통신망 이용촉진 및
					정보보호"에 관한 법률을 준수하고 있습니다.<br>
					회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한
					용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가<br> 취해지고 있는지 알려드립니다. 회사는
					개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br> 본 방침은 <Strong>2014년 4월
					7일</Strong>부터 시행됩니다.<br><br> <Strong>수집하는 개인정보 항목</Strong><br>회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를
					수집하고 있습니다.<br> <Strong>수집항목</Strong><br> - 필수 항목 : 성명, 생년월일, 연락처(휴대전화번호, 전화번호), 이메일, 성별,
					방문일시, 서비스이용기록, 온라인상담기록, OS버전, 단말기 기기명<br> - 선택 항목 : 공동현관 비밀번호, 집 약도<br><br>
					<Strong>개인정보 수집방법</Strong><br> - 홈페이지 (회원가입, 고객센터 게시판), 구매시 정보입력, 이벤트참여 및 고객센터를 통한 전화 또는
					온라인 상담<br><br><br> <Strong>개인정보의 수집 및 이용목적</Strong><br> 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.<br>
					<Strong>서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산</Strong><br> - 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 회원
					관리 <br>- 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의 부정 이용 방지와 비인가 사용 방지 , 가입
					의사 확인 , 불만처리 등 민원처리 , 고지사항 전달<br><br><br> <Strong>마케팅 및 광고에 활용</Strong><br> - 이벤트 등 광고성 정보 전달 결제정보 <br><br><br><strong>결제정보</strong><br>-
					결제업체(PG회사) 및 결제유형에 따라 다음과 같은 정보의 입력이 추가로 요구 될 수 있습니다. <br>- 신용카드 결제 시 :
					카드사명, 카드번호 <br>- 무통장 입금 시 : 은행명, 입금자명 <br><br><br><strong>개인정보의 보유 및 이용기간</strong><br> 회사는 개인정보 수집 및
					이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.</p>
			</div>
			<div id = "terms_checkbox">
				<input type = "checkbox" id="terms_chk" > 개인정보 정보보호에 관한 법률에 동의합니다.
			</div>
		</div>
		
		<div id = "order_wrap">
			<div id = "order_list_wrap">
				<div id = "order_list">
					<table id = "order_table" border="1">
					<caption>주문내역</caption>
					<tr>
					<th>상품명</th>
					<th>상품가격</th>
					<th>상품수량</th>
					<th>적립금</th>
					<th>합계</th>
					</tr>
					
					<c:forEach begin="1" end="6">
					<tr>
					<td>상품명</td>
					<td>가격</td>
					<td>수량</td>
					<td>적립금</td>
					<td>합계</td>
					</tr>
					</c:forEach>
					</table>
				</div>
				<div id = "savemoney_wrap">
						<p align="left">고객님 포인트를 사용하면 좀 더 절약하여 구매할 수 있습니다.</p><br>
						<table id = "savemoney_table" border="1" width="600px">
							<tr>
								<th scope="row">적립금사용</th>
								<td>100<span>원</span> (사용가능한 적립금 : 0<span>원</span>)</td>
							</tr>
							<tr>
								<th scope="row">쿠폰적용</th>
								<td>
									<select id="coupon_select">
									<option>사용하실 쿠폰을 선택하세요.</option>
									<option>회원가입 축하이벤트쿠폰(~2016.12.24)</option>
									</select>
								</td>
							
							</tr>
						</table>
					</div>
					<div id = "smalltotal_wrap">
						<table id = "smalltotal_table" border="1">
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
					
					<div id = "total_wrap">
						<table border="1" width="100%">
							<tr>
								<th></th>
								<th colspan="2"></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
							<tr>
								<td rowspan="2"><span>원</span></td>
								<td colspan="3"><span>할인금액</span></td>
								<td><span></span></td>
							</tr>
							<tr>
								<td colspan="4">fffas</td>
							</tr>
						</table>
					</div>
				
				
			</div>
		</div>
	</div>
</body>
</html>





























<div class="tbl_price">
			<table>
				<caption class="hidden">총 주문가격</caption>
				<colgroup>
					<col style="width:14%;">
					<col>
					<col style="width:13%;">
					<col style="width:15%;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">상품금액</th>
						<th scope="col">할인금액</th>
						<th scope="col">배송비 합계</th>
						<th scope="col">총 주문 합계</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="sum"><span class="prc">29,400</span>원</td>
						<td class="sale sale_yes">
							<div class="field">
								<img src="/_image/shop/mark_minus.png" alt="minus" class="mark">
								<table class="tbl_price_sale">
									<caption class="hidden">할인상세항목</caption>
									<tbody>
										<thead>
											<tr>
												<!--..K..Y…‥·
												<th scope="col">이벤트 할인</th>
												·‥…S..Y..//-->

												<!--..K..Y…‥·
												<th scope="col">미스국 3개이상, 3%할인</th>
												·‥…S..Y..//-->

												<!--..K..Y…‥·
												<th scope="col">미스반 3개이상, 3%할인</th>
												·‥…S..Y..//-->

												<!--..K..Y…‥·
												<th scope="col">다이닝 3개이상, 3%할인</th>
												·‥…S..Y..//-->

												<!--..K..Y…‥·
												<th scope="col">세븐데이프렌즈 할인</td>
												·‥…S..Y..//-->

												<th scope="col">예치금 사용</th>
												<th scope="col">별포인트 사용</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<!--..K..Y…‥·
												<td><span class="prc">0</span>원</td>
												·‥…S..Y..//-->

												<!--..K..Y…‥·
												<td><span class="prc">0</span>원</td>
												·‥…S..Y..//-->

												<!--..K..Y…‥·
												<td><span class="prc">0</span>원</td>
												·‥…S..Y..//-->


												<!--..K..Y…‥·
												<td><span class="prc">0</span>원</td>
												·‥…S..Y..//-->

												<!--..K..Y…‥·
												<td><span class="prc">0</span>원</td>
												·‥…S..Y..//-->

												<td><span class="prc emoney_prc"></span>원</td>
												<td><span class="prc milage_prc"></span>원</td>
											</tr>
										</tbody>
									</tbody>
								</table>
							</div>
						</td>
						<td class="dlv">
							<div class="field">
								<span class="prc " id="delivery_prc_view">2,500</span>원								<img src="/_image/shop/mark_plus.png" alt="plus" class="mark">
							</div>
						</td>
						<td class="total">
							<div class="field">
								<img src="/_image/shop/mark_equals.png" alt="plus" class="mark">
								<span class="prc total_order_price">31,900</span>원
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<p class="delivery_msg">
				<strong>고객님, 수도권 지역이세요?</strong>
				<br>더반찬 새벽직배송으로 더신선하고 신속하게 더반찬을 만나보실 수 있습니다. <strong><a href="/content/content.php?cont=dawn">새벽직배송 가능지역 안내 >></a></strong>
				<br>상품금액에서 할인금액을 제외한 총 주문 합계가 45,000원 이상이 되어야 무료배송이 가능합니다.
			</p>
		</div>


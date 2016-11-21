<%@page import="dto.FoodsDTO"%>
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
}

.detail_img_wrap {
	width: 350px;
	height: 350px;
	position: absolute;
}

.detail_img img {
	width: 350px;
	height: 350px;
	position: absolute;
	top: 20px;
	left: 20px;
}

.sul_wrap {
	width: 950px;
	height: 500px;
}

.table_wrap {
	width: 600px;
	height: 350px;
	float: right;
}

#info_table {
	position: absolute;
	top: 20px;
	left: 420px;
	text-align: left;
}

#info_table tr:nth-child(1) {
	font-size: 25px;
}

#info_table tr:nth-child(9) td {
	font-size: 25px;
}

.deli_img {
	position: absolute;
	top: 325px;
	left: 387px;
}

#account {
	position: absolute;
	left: 20px;
	top: 390px;
}

#info_table th {
	width: 100px;
	height: 25px;
	text-align: left;
}

#account_meter th {
	width: 80px;
}

#account_meter td {
	width: 820px;
	text-align: left;
}

.packing_wrap {
	width: 852px;
	height: 1119px;
	position: absolute;
	top: 550px;
	left: 50px;
}

#review_wrap {
	width: 930px;
	height: 500px;
	position: absolute;
	top: 1700px;
	left: 10px;
}

#shop_upbutton {
	position: absolute;
	left: 158px;
	top: 190px;
}

#shop_downbutton {
	position: absolute;
	left: 158px;
	top: 199px;
}

.shop_review {
	width: 1000px;
	height: 1000px;
}

.shop_review p {
	font-size: 23px;
}

#review_table, th, td {
	padding: 3px;
}

#review_table {
	border-spacing: 3px;
}

#review_table caption {
	font-size: 30px;
}

#review_table th:nth-child(1) {
	width: 45px;
}

#review_table th:nth-child(2) {
	width: 500px;
}

#review_table th:nth-child(3) {
	width: 90px;
}

#review_table th:nth-child(4) {
	width: 120px;
}

#review_table td {
	text-align: center;
}

#review_table td:nth-child(2) {
	text-align: left;
}

#pre_next_pagenum {
	width: 130px;
	height: 40px;
}

.modifyHide {
	visibility: hidden;
	width: 0px;
	height: 0px;
}

.modifyShow {
	display: block;
	position: absolute;
	top: 150px;
	left: 200px;
	width: 400px;
	height: 150px;
	z-index: 1000;
	border: 1px solid black;
	background-color: green;
	text-align: center;
}
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">

	var uno="";
	
	$(document).ready(function() {
						
						$('#modifyWindow').addClass('modifyHide');
						
						$('.review_udt_btn').on('click', function(){
							$('#modifyWindow').addClass('modifyShow');
							$('#modifyWindow').removeClass('modifyHide');
						});
						
						$('#btnClose').on('click', function() {
							$('#modifyWindow').removeClass('modifyShow');
							$('#modifyWindow').addClass('modifyHide');
							uno = '';
						});
						
						$('#btnModify').on('click', review_update_result);
						
						
						var price = parseInt($('#info_table tr:nth-child(3) td')
								.text());
						var savemoney = price * 0.01;

						$('#info_table tr:nth-child(8) td').empty();
						$('#info_table tr:nth-child(8) td').append(
								'<td>' + savemoney + '<span>원</span></td>');

						$('#shop_upbutton')
								.on(
										'click',
										function() {
											var price = parseInt($(
													'#info_table tr:nth-child(3) td')
													.text());
											var count = parseInt($('#counttext')
													.val());
											count += 1;

											document
													.getElementById("counttext").value = count;
											var total = price * count;

											$('#info_table tr:nth-child(9) td')
													.empty();
											$('#info_table tr:nth-child(9) td')
													.append(
															'<td>'
																	+ total
																	+ '<span>원</span></td>');

										});

						$('#shop_downbutton')
								.on(
										'click',
										function() {
											var price = parseInt($(
													'#info_table tr:nth-child(3) td')
													.text());
											var count = parseInt($('#counttext')
													.val());
											if (count != 1) {
												count -= 1;
												document
														.getElementById("counttext").value = count;
											}
											var total = price * count;
											$('#info_table tr:nth-child(9) td')
													.empty();
											$('#info_table tr:nth-child(9) td')
													.append(
															'<td>'
																	+ total
																	+ '<span>원</span></td>');
										});

						$('#info_table tr:nth-child(7) td input')
								.on(
										"keyup",
										function() {
											var input = parseInt($(
													'#info_table tr:nth-child(7) td input')
													.val());

											if (input >= 1) {
												var total = price * input;
												$(
														'#info_table tr:nth-child(9) td')
														.empty();
												$(
														'#info_table tr:nth-child(9) td')
														.append(
																'<td>'
																		+ total
																		+ '<span>원</span></td>');
												return false;
											} else if (input == 0) {
												alert('최소 구매수량은 1개입니다.')
												$(
														'#info_table tr:nth-child(7) td input')
														.val("1");
												return false;
											}

										});

						$('#review_reg')
								.on(
										'click',
										function() {

											if ($('#reviewText').val() == "") {
												alert('한줄평을 입력하세요.');
												return false;

											}

											$
													.ajax({
														type : 'GET',
														dataType : 'json',
														url : 'reviewInsert.do?review_content='
																+ $('#reviewText').val()
																+ "&foods_no=${foods_no}"
																+ "&member_no=1",
														success : review_insert_result,
														error : function(xhr,
																textStatus,
																error) {
															alert("insert===="
																	+ error);
														}
													});
										});

						//딜리트
						$(document).on("click",".review_del_btn",function() {
							var dno = $(this).val();
							$.ajax({
								type : 'GET',
								dataType : 'json',
								url : 'reviewDelete.do?review_no='
								+dno
								+ "&foods_no=${foods_no}"+ "&member_no=1",
								success : review_delete_result,
								error : function(xhr,textStatus,error) {
								alert("delete===="+ error);
								}
							});
						});
						
						
							

					});//end ready end

	Handlebars.registerHelper("newDate", function(timeValue) {
		var dateObj = new Date(timeValue);
		var year = dateObj.getFullYear();
		var month = dateObj.getMonth() + 1;
		var date = dateObj.getDate();
		return year + "-" + month + "-" + date;
	});

	function preFunction(f, c) {
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "detailProduct.do",
			data : "foods_no=" + f + "&currentPage=" + c,
			success : review_prenext_list_result,
			error : function(xhr, textStatus, error) {
				alert("joo====" + error);
			}
		});
	};

	function nextFunction(f, c) {
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "detailProduct.do",
			data : "foods_no=" + f + "&currentPage=" + c,
			success : review_prenext_list_result,
			error : function(xhr, textStatus, error) {
				alert("joo====" + error);
			}
		});

	};

	function myFunction(f, i) {
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "detailProduct.do",
			data : "foods_no=" + f + "&currentPage=" + i,
			success : review_list_result,
			error : function(xhr, textStatus, error) {
				alert("joo====" + error);
			}
		});
	};

	function review_list_result(res) {
		$('#review_table .review_tr').remove();
		$
				.each(
						res.list,
						function(index, value) {
							var source = "<tr class='review_tr'><td>{{review_no}}</td><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
							var template = Handlebars.compile(source);
							$('#review_table').append(template(value));
						});

	};

	function review_prenext_list_result(res) {
		$('#review_table .review_tr').remove();
		$('#pre_next_pagenum').empty();

		$
				.each(
						res.list,
						function(index, value) {
							var source = "<tr class='review_tr'><td>{{review_no}}</td><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
							var template = Handlebars.compile(source);
							$('#review_table').append(template(value));
						});

		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;

		if (start > 1) {
			$('#pre_next_pagenum').append(
					'<a href="javascript:preFunction(${foods_no}, '
							+ (start - block) + ')">이전&nbsp;</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:myFunction(${foods_no}, ' + i
					+ ')">' + i + '&nbsp;';
			$('#pre_next_pagenum').append(source1);
		}

		if (end < total) {
			$('#pre_next_pagenum').append(
					'<a href="javascript:nextFunction(${foods_no}, '
							+ (start + block) + ')">다음</a>');
		}

	};

	function review_insert_result(res) {
		$('.review_tr').remove();
		$('#pre_next_pagenum').empty();

		$
				.each(
						res.ReviewDTO,
						function(index, value) {
							var source = "<tr class='review_tr'><td>{{review_no}}</td><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
							var template = Handlebars.compile(source);
							$('#review_table').append(template(value));
						});

		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;

		if (start > 1) {
			$('#pre_next_pagenum').append(
					'<a href="javascript:preFunction(${foods_no}, '
							+ (start - block) + ')">이전</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:myFunction(${foods_no}, ' + i
					+ ')">' + i + '&nbsp;';
			$('#pre_next_pagenum').append(source1);
		}

		if (end < total) {
			$('#pre_next_pagenum').append(
					'<a href="javascript:nextFunction(${foods_no}, '
							+ (start + block) + ')">다음</a>');
		}

		$('#reviewText').val("");
	}

	//딜리트
	function review_delete_result(res) {
		$('.review_tr').remove();
		$('#pre_next_pagenum').empty();

		$
				.each(
						res.ReviewDTO,
						function(index, value) {
							var source = "<tr class='review_tr'><td>{{review_no}}</td><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
							var template = Handlebars.compile(source);
							$('#review_table').append(template(value));
						});

		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;

		if (start > 1) {
			$('#pre_next_pagenum').append(
					'<a href="javascript:preFunction(${foods_no}, '
							+ (start - block) + ')">이전</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:myFunction(${foods_no}, ' + i
					+ ')">' + i + '&nbsp;';
			$('#pre_next_pagenum').append(source1);
		}

		if (end < total) {
			$('#pre_next_pagenum').append(
					'<a href="javascript:nextFunction(${foods_no}, '
							+ (start + block) + ')">다음</a>');
		}
	};
	
	function review_update_result(res) {
		
		if($('#updateReviewText').val() == ''){
			alert('수정할 내용을 입력하세요.')
			return false;
		}
		
		
		//시작할곳 수정할곳
		var uno = $('#updateReviewText').val();
		alert(uno);
		
		$.ajax({
			type : 'GET',
			dataType : 'json',
			url : 'reviewUpdate.do?review_no='
					+ uno
					+ "&member_no=1"
					+ "review_content="+$('#updateReviewText').val(),
			seccess : review_update_result,
			error : function(xhr,textStatus,error) {
			alert("update===="+ error);
			}
		});
		
		$('#modifyWindow').removeClass('modifyShow');
		$('#modifyWindow').addClass('modifyHide');
		uno = '';
		
	};
</script>

</head>
<body>
	<div id="product_wrap">
		<div class="sul_wrap">
			<c:forEach items="${list}" var="FoodsDTO">
				<div class="detail_img_wrap">
					<div class="detail_img">
						<img alt="상세이미지" src="./images/${FoodsDTO.picture}">
					</div>

				</div>
				<!-- 상세이미지 -->

				<div class="table_wrap">
					<table id="info_table" width="510px" height="auto">
						<tr>
							<td colspan="2">${FoodsDTO.foods_name}</td>
						</tr>
						<tr>
							<td></td>
						</tr>
						<tr>
							<th>판매가격</th>
							<td>${FoodsDTO.price}<span>원</span></td>
						</tr>
						<tr>
							<th>유통기한</th>
							<td>${FoodsDTO.way}</td>
						</tr>
						<tr>
							<th>용량</th>
							<td>${FoodsDTO.weight}</td>
						</tr>
						<tr>
							<th>보관방법</th>
							<td>${FoodsDTO.shelfLife}</td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input type="text" id="counttext" size="2px"
								width="10px" value="1" style="text-align: center"> <span><img
									alt="up" id="shop_upbutton" src="./images/upbutton.png"
									width="11" height="10"></span> <span><img alt="down"
									id="shop_downbutton" src="./images/downbutton.png" width="11"
									height="10"></span></td>
						</tr>
						<tr>
							<th>적립금</th>
							<td><span>원</span></td>
						</tr>

						<tr>
							<th>구매예정금액</th>
							<td>${FoodsDTO.price}<span>원</span></td>
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
							<td>${FoodsDTO.foods_material}</td>
						</tr>

						<tr>
							<th>설명</th>
							<td>${FoodsDTO.foods_explaination}</td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
		<!-- 상품 상세설명 end -->
		<div class="packing_wrap">
			<div id="product_packing">
				<img alt="배송용기설명" src="./images/delevery.png">
			</div>
		</div>


		<div id=review_wrap>

			<div class="shop_review">
				<!-- <p id="review_text_p">한줄평</p> -->
				<table id="review_table" width="930">
					<caption>한줄평</caption>

					<tr>
						<th>번호</th>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th></th>
					</tr>
					<c:forEach items="${aList}" var="ReviewDTO">
						<tr class="review_tr">
							<td>${ReviewDTO.review_no}</td>
							<td>${ReviewDTO.review_content}</td>
							<td>${ReviewDTO.review_writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" dateStyle="short"
									value="${ReviewDTO.review_date}" /></td>
							<td>
								<button class="review_udt_btn" value="${ReviewDTO.review_no}">수정</button>
							</td>
							<td>
								<button class="review_del_btn" value="${ReviewDTO.review_no}">삭제</button>
							</td>
						</tr>
					</c:forEach>

				</table>

				<label>한줄평 남기기</label> <input type="text" size="70px"
					placeholder="20자 이내로 한줄평을 작성해주세요." id="reviewText"
					class="form-control">
				<button id="review_reg">등록</button>

				<div id="pre_next_pagenum">
					<c:if test="${pv.startPage>1}">
						<%-- <a href="detailProduct.do?foods_no=${foods_no}&currentPage=${pv.startPage-pv.blockPage}"> --%>
						<a
							href="javascript:preFunction(${foods_no}, ${pv.startPage-pv.blockPage})">
							<c:out value="이전" />
						</a>
					</c:if>

					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
						<a href="javascript:myFunction(${foods_no}, ${i})"> <c:out
								value="${i}" /></a>
					</c:forEach>

					<c:if test="${pv.endPage<pv.totalPage}">
						<%--<a href="javascript:nextFunction(${foods_no}, ${pv.startPage+pv.blockPage})"> --%>
						<a
							href="javascript:nextFunction(${foods_no}, ${pv.startPage+pv.blockPage})">
							<%-- <a href="detailProduct.do?foods_no=${foods_no}&currentPage=${pv.startPage+pv.blockPage}"> --%>
							<c:out value="다음" />
						</a>
					</c:if>
				</div>

				<div id="modifyWindow">
					<p>
						<label for="updateReplyText">한줄평 수정하기</label> <input
							class="form-control" type="text" placeholder="수정할 한줄평을 입력하세요."
							id="updateReviewText">
					</p>
					<p>
						<button id="btnModify" value = "${ReviewDTO.review_no}">수정</button>
						<button id="btnClose">닫기</button>
					</p>
				</div>

			</div>

		</div>

	</div>

</body>
</html>


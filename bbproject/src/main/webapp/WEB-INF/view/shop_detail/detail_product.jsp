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

#product_wrap {
	width: 950px;
	height: 2300px;
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
	left: 140px;
	top: 188px;
}

#shop_downbutton {
	position: absolute;
	left: 140px;
	top: 200px;
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
	width: 450px;
}

#review_table th:nth-child(2) {
	width: 130px;
}

#review_table th:nth-child(3) {
	width: 100px;
}

#review_table th:nth-child(4) {
	width: 60px;
}

#review_table th:nth-child(5) {
	width: 60px;
}

#review_table td {
	text-align: center;
}

/* #review_table td:nth-child(1) {
	text-align: left;
} */

#pre_next_pagenum {
	width: 130px;
	height: 40px;
	margin: auto;
}

#pre_next_pagenum a{
	text-decoration: none;
	color : black;
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

#dialog{
	display: none;
}


</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
var uno = "";
var savemoney = "";
$(document).ready(function() {
			
			var review_mem_no = $('.r_mem_no').val();
			
	
		
			$('#modifyWindow').addClass('modifyHide');
				$(document).on("click", ".review_udt_btn", function() {
				uno = $(this).val();
				$('#modifyWindow').addClass('modifyShow');
				$('#modifyWindow').removeClass('modifyHide');
				});

						
			$('.btnClose').on('click', function() {
				$('#modifyWindow').removeClass('modifyShow');
				$('#modifyWindow').addClass('modifyHide');
				uno = '';
			});

			//$('#btnModify').on('click', review_update_result);

			var price = parseInt($('#info_table tr:nth-child(3) td').text());
			var savemoney1 = price * 0.01;
			savemoney = Math.ceil(savemoney1/10) * 10;

			$('#info_table tr:nth-child(8) td').empty();
			$('#info_table tr:nth-child(8) td').append('<td>' + savemoney + '<span>원</span></td>');
						
						
			var totalmoney = parseInt($('#info_table tr:nth-child(3) td').text());
			
			$('#shop_upbutton').on('click',function() {
				var price = parseInt($('#info_table tr:nth-child(3) td').text());
				var count = parseInt($('#counttext').val());
				count += 1;
				document.getElementById("counttext").value = count;
				totalmoney = price * count;
				$('#info_table tr:nth-child(9) td').empty();
				$('#info_table tr:nth-child(9) td').append('<td>'+ totalmoney+ '<span>원</span></td>');
			});

			$('#shop_downbutton').on('click',function() {
				var price = parseInt($('#info_table tr:nth-child(3) td').text());
				var count = parseInt($('#counttext').val());
				if (count != 1) {
					count -= 1;
					document.getElementById("counttext").value = count;
				}
				totalmoney = price * count;
				$('#info_table tr:nth-child(9) td').empty();
				$('#info_table tr:nth-child(9) td').append('<td>'+ totalmoney+ '<span>원</span></td>');
				});

				$('#info_table tr:nth-child(7) td input').on("keyup",function() {
					var input = parseInt($('#info_table tr:nth-child(7) td input').val());

					if (isNaN(input) == true) {
						alert('숫자만 입력하세요.')
						$('#info_table tr:nth-child(7) td input').val("1");
						return false;
					}

					if (input >= 1) {
						totalmoney = price * input;
						$('#info_table tr:nth-child(9) td').empty();
						$('#info_table tr:nth-child(9) td').append('<td>'+ totalmoney+ '<span>원</span></td>');
						return false;
					} else if (input == 0) {
						alert('최소 구매수량은 1개입니다.')
						$('#info_table tr:nth-child(7) td input').val("1");
						return false;
					}
				});
						
				$('#review_reg').on('click',function() {
					if ($('#reviewText').val() == "") {
						alert('한줄평을 입력하세요.');
						return false;
						}
					
					$.ajax({
					type : 'GET',
					dataType : 'json',
					url : 'reviewInsert.do?review_content='
							+ $('#reviewText').val()
							+ "&foods_no=${foods_no}"
							+ "&member_no=${member_no}",
					success : review_insert_result,
					error : function(xhr,textStatus,error) {
						alert("insert===="+ error);
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
					+ dno
					+ "&foods_no=${foods_no}"
					+ "&member_no=${member_no}",
					success : review_delete_result,
					error : function(xhr,textStatus,error) {
					alert("delete===="+ error);
					}
				});
			});

			//업데이트
			$(document).on('click',".btnModify",function() {

				if ($('#updateReviewText').val() == "") {
				alert('수정할 한줄평 내용을 입력하세요.')
				return false;
				}
							
				$.ajax({
					type : 'POST',
					dataType : 'json',
					url : 'reviewUpdate.do',
					data : "review_no="
					+ uno
					+ "&member_no=${member_no}"
					+ "&review_content="
					+ $('#updateReviewText').val()
					+ "&foods_no=${foods_no}",
					success : review_update_result,
					error : function(xhr,textStatus,error) {
					alert("update===="+ error);
					},
				});
			});
						
			//장바구니 클릭
			$(".basket_insimg").on("click", function() {
				$("#dialog").dialog({
					autoOpen: false,
					width : "500px",
					height : "500px",
					modal : true,
					resizeable : false,
					buttons : { // dialog 하단 버튼들
						예 : function() {
							window.location.href = "my_cart.do";
						},
						아니요 : function() {
							$(this).dialog("close"); // 남아있기
						},
					},
					open : function() {
						$(".ui-dialog-titlebar-close").hide();
					}
				});
				
				$.ajax({
					type : 'GET',
					dataType : 'text',
					url : "basketInsert.do?amount="+$('#counttext').val()+"&foods_no=${foods_no}",
					success : dialog_result,
					error : function(xhr,textStatus,error) {
					alert("basket===="+ error);
					}
				});
				
				return false;
			});
			
			//바로구매 클릭
			$("#buy_insimg").on("click", function() {
				
				if(totalmoney < 10000){
				alert('최소주문금액은 10000원입니다.')
				return false;
				} 
				
				else if(totalmoney >= 10000){
					$('#foodform').submit();
				}
			
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
	
	
	//리스트?
	function review_list_result(res) {
		$('#review_table .review_tr').remove();
		$.each(res.list,function(index, value) {
			
			
			
			if(value.member_no == member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
			else if (value.member_no != member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
		});

	};
	
	
	//페이지 넘버
	function review_prenext_list_result(res) {
		$('#review_table .review_tr').remove();
		$('#pre_next_pagenum').empty();

		$.each(res.list,function(index, value) {
			if(value.member_no == member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
			else if (value.member_no != member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
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
	
	
	//인설트
	function review_insert_result(res) {
		$('.review_tr').remove();
		$('#pre_next_pagenum').empty();
		
	
		
		$.each(res.ReviewDTO,function(index, value) {
			
			if(value.member_no == member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
			else if (value.member_no != member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
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
	
	
	//딜리트 석세스
	function review_delete_result(res) {
		$('.review_tr').remove();
		$('#pre_next_pagenum').empty();

		$.each(res.ReviewDTO,
			function(index, value) {
			if(value.member_no == member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
			else if (value.member_no != member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
		});

		var start = res.page.startPage;
		var end = res.page.endPage;
		var block = res.page.blockPage;
		var total = res.page.totalPage;

		if (start > 1) {
			$('#pre_next_pagenum').append('<a href="javascript:preFunction(${foods_no}, '+ (start - block) + ')">이전</a>');
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
	
	//업데이트 석세스
	function review_update_result(data) {
		$('.review_tr').remove();
		$('#pre_next_pagenum').empty();

		$.each(data.ReviewDTO,function(index, value) {
			if(value.member_no == member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td><td><button class = 'review_udt_btn' value = {{review_no}}>수정</button></td><td><button class = 'review_del_btn' value = {{review_no}}>삭제</button></td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
			else if (value.member_no != member_no){
				var source = "<tr class='review_tr'><td>{{review_content}}</td><td>{{review_writer}}</td><td>{{newDate review_date}}</td></tr>";
				var template = Handlebars.compile(source);
				$('#review_table').append(template(value));
			}
		});

		var start = data.page.startPage;
		var end = data.page.endPage;
		var block = data.page.blockPage;
		var total = data.page.totalPage;

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

		$('#updateReviewText').val('');
		$('#modifyWindow').removeClass('modifyShow');
		$('#modifyWindow').addClass('modifyHide');
		uno = '';

	};
	
	
	function dialog_result(data){
		alert(data);
		$('#dialog').dialog('open');
	};
</script>

</head>
<body>

	<div id="product_wrap">

		<form method="POST" id="foodform" action="shop_buy.do">

			<div class="sul_wrap">
				<c:if test=""></c:if>
				<c:forEach items="${list}" var="Foods">
					<div class="detail_img_wrap">
						<div class="detail_img">
							<input type="hidden" name="checkfood" value="${foods_no}" />
							<img alt="상세이미지" src="image.do?filename=${Foods.picture}">
						</div>
					</div>
					<div class="table_wrap">
						<table id="info_table" width="510px" height="auto">
							<tr>
								<td colspan="2">${Foods.foods_name}</td>
							</tr>
							<tr>
								<td></td>
							</tr>
							<tr>
								<th>판매가격</th>
								<td>${Foods.price}<span>원</span></td>
							</tr>
							<tr>
								<th>유통기한</th>
								<td>${Foods.way}</td>
							</tr>
							<tr>
								<th>용량</th>
								<td>${Foods.weight}</td>
							</tr>
							<tr>
								<th>보관방법</th>
								<td>${Foods.shelfLife}</td>
							</tr>
							<tr>
								<th>수량</th>
								<td><input name="amount" type="text" id="counttext"
									size="2px" width="10px" value="1" style="text-align: center">
									<span><img alt="up" id="shop_upbutton"
										src="./images/upbutton.png" width="11" height="10"></span> <span><img
										alt="down" id="shop_downbutton" src="./images/downbutton.png"
										width="11" height="10"></span></td>
							</tr>
							<tr>
								<th>적립금</th>
								<td><span>원</span></td>
							</tr>

							<tr>
								<th>구매예정금액</th>
								<td>${Foods.price}<span>원</span></td>
							</tr>

						</table>
						<div class="deli_img">
							<img alt="무료배송안내이미지" src="./images/baesong_info.png"> <input
								type="image" id="buy_insimg" alt="바로구매이미지"
								src="./images/shop_buy.png"> <input type="image"
								class="basket_insimg" alt="장바구니이미지"
								src="./images/shop_basket.png">
						</div>

					</div>

					<div id="account">
						<table id="account_meter" height="auto">
							<tr>
								<th>재료</th>
								<td>${Foods.foods_material}</td>
							</tr>

							<tr>
								<th>설명</th>
								<td>${Foods.foods_explaination}</td>
							</tr>
						</table>

					</div>
				</c:forEach>
			</div>

		</form>
		<!-- 상품 상세설명 end -->
		<div class="packing_wrap">
			<div id="product_packing">
				<img alt="배송용기설명" src="./images/delevery.png">
			</div>
		</div>


		<div id=review_wrap>

			<div class="shop_review">
				<!-- <p id="review_text_p">한줄평</p> -->
				<table id="review_table" width="860" >
					<caption>한줄평</caption>

					<tr>
						<th>내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th></th>
					</tr>
					<c:forEach items="${aList}" var="ReviewDTO">
					
						<tr class="review_tr">
							<td>
							<input type = "hidden" class="r_mem_no" value="${ReviewDTO.member_no}">
							<input type = "hidden" class="r_review_no" value="${ReviewDTO.review_no}">							
							${ReviewDTO.review_content}</td>
							<td>${ReviewDTO.review_writer}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" dateStyle="short"
									value="${ReviewDTO.review_date}" /></td>
							<td>
								<c:if test="${ReviewDTO.member_no == member_no }">
								<button class="review_udt_btn" value="${ReviewDTO.review_no}">수정</button>
								</c:if>
							</td>
							<td>
							<c:if test="${ReviewDTO.member_no == member_no }">
								<button class="review_del_btn" value="${ReviewDTO.review_no}">삭제</button>
							</c:if>
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
						<a
							href="javascript:nextFunction(${foods_no}, ${pv.startPage+pv.blockPage})">
							<c:out value="다음" />
						</a>
					</c:if>
				</div>

				<div id="modifyWindow">
					<p>
						<label for="updateReviewText">한줄평 수정하기</label> <input
							class="form-control" type="text" placeholder="수정할 한줄평을 입력하세요."
							id="updateReviewText">
					</p>

					<p>
						<button class="btnModify" value="${ReviewDTO.review_no}">수정</button>
						<button class="btnClose">닫기</button>
					</p>
				</div>

			</div>

		</div>
		<div id="dialog" >
			<p><br>
				장바구니로 이동하시겠습니까?<br>
			</p>
		</div>
	</div>

</body>
</html>


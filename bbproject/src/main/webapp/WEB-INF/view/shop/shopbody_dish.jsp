<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
#shopbody_wrap {
	width: 1200px;
	height: 810px;
}

#shopbody_menu {
	width: 950px;
	height: 810px;
}

#shop_table {
	text-align: center;
	float: left;
}

#prod_img {
	width: 312px;
	height: 200px;
	background-color: gray;
}

#prod_img a img {
	width: 312px;
	height: 200px;
}

.count {
	display: block;
	margin: auto;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.basketInsertBtn').on('click', function() {
// 			alert($(this).prev().val());
// 			alert($(this).children().val());
// 			var url = "basketInsert.do?amount="+$(this).prev().val()+"&foods_no="+$(this).children().val();
			
// 			$(this).attr("href", url);

			
			$.ajax({
	 			type : "GET",
	 			dataType : "text",
				url : "basketInsert.do?amount="+$(this).prev().val()+"&foods_no="+$(this).val(),
				success : dialog_result,
				error : function(xhr, textStatus, error) {
					alert(error);
				}
			}); 
			

		
		});
		
		$("#dialog").dialog({
			autoOpen: false,
			width : "100%",
			height : "100%",
			modal : true,
			resizeable : false,
			buttons : { // dialog 하단 버튼들
				예 : function() {
					$(this).dialog("close"); //장바구니 이동
				},
				 
				아니요 : function() {
					$(this).dialog("close"); // 남아있기
				},
			},
			show : { // 애니메이션 효과 - 보여줄때
				effect : "blind",
				duration : 1000
			},
			hide : { // 애니메이션 효과 - 감출때
				effect : "explode",
				duration : 1000
			},
			open : function() {
				$(".ui-dialog-titlebar-close").hide();
			}
		});
		
	});//end ready
	
	function dialog_result(data){
		
// 		alert('adfqwe');
		alert(data);
		$('#dialog').dialog('open');
	};
	
	
	
	
	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>dish</title>
</head>
<body>
<body>
	<div id="shop_wrap">
		<div id="shop_menu">

			<c:forEach items="${aList}" var="FoodsDTO">
				<table id="shop_table">
					<tr>
						<td><div id="prod_img">
								<a href="detailProduct.do?foods_no=${FoodsDTO.foods_no}"><img
									alt="상품이미지" src="image.do?filename=${FoodsDTO.picture}"> </a>
							</div>
							<p class="name">
								<a href="detailProduct.do?foods_no=${FoodsDTO.foods_no}">${FoodsDTO.foods_name}</a>
							</p>
							<p class="price">${FoodsDTO.price}<span>원</span>
							</p> <select class="count" name="amount">
								<c:forEach var="i" begin="1" end="20" step="1">
									<option value="${i}">${i}</option>
								</c:forEach>
						</select> <input type="image" alt=""
								src="images/basketIns.png" value="${FoodsDTO.foods_no}" class="basketInsertBtn">
					</tr>

				</table>

			</c:forEach>
			<c:if test="${pv.startPage>1}">
				<a
					href="shopDish.do?category_no=2&currentPage=${pv.startPage-pv.blockPage}">
					<c:out value="이전" />
				</a>
			</c:if>

			<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
				<c:url var="currPage" value="shopDish.do?category_no=2">
					<c:param name="currentPage" value="${i}" />
				</c:url>

				<a href="${currPage}"> <c:out value="${i}" />
				</a>
			</c:forEach>

			<c:if test="${pv.endPage<pv.totalPage}">
				<a
					href="shopDish.do?category_no=2&currentPage=${pv.startPage+pv.blockPage}">
					<c:out value="다음" />
				</a>
			</c:if>
		</div>
	</div>
	<div id="dialog" >
		<p>장바구니에 추가되었습니다. 이동하시겠습니까?
		</p>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
#shop_wrap {
	width: 950px;
	height: auto;
}

#shop_menu {
	width: 950px;
	height: auto;
}

#shop_table {
	text-align: center;
	float: left;
}

#prod_img {
	width: 312px;
	height: 200px;
}

#prod_img a img {
	width: 312px;
	height: 200px;
}

.count {
	display: block;
	margin: auto;
}

.name a {
	text-decoration: none;
	color: black;
}

#page_search_wrap {
	width: 300px;
	height: 100px;
	clear: left;
	margin: auto;
	position: relative;
}

#pagenum_wrap {
	width: 300px;
	height: 30px;
	margin: auto;
}

#search_wrap {
	width: 300px;
	height: 50px;
	position: absolute;
	top: 30px;
}
</style>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		
		$(document).on('click', '.basketInsertBtn', function(){
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
			width : "500px",
			height : "500px",
			modal : true,
			resizeable : false,
			buttons : { // dialog 하단 버튼들
				예 : function() {
					window.location.href = "my_cart.do"; //장바구니 이동
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
		
		
		$('#searchBtn').on('click', function(){
			var searchText = $('#searchText').val();
			var option = $('#searchSelect').val();
			
			if(searchText == ""){
				alert('검색어를 입력하세요.');
				return false;
			}
		
			$.ajax({
	 			type : "GET",
	 			dataType : "json",
				url : "shopSearch.do?foods_name="+searchText+"&category_no="+$('#searchSelect').val(),
				success : search_result,
				error : function(xhr, textStatus, error) {
					alert(error);
				}
			}); 
			
		});
		
	});//end ready
	
	function dialog_result(data){
		
		$('#dialog').dialog('open');
	};
	
	function search_result(data){
		
		var searchText = $('#searchText').val();
		
		$('#shop_menu').empty();
		$('#pagenum_wrap').empty();
		
		if(data.searchList == null){
			$("#shop_menu").append('<p>'+searchText+'의 검색결과가 없습니다.</p>');	
		}
		
		else{
		$.each(data.searchList, function(index, value) {
			
	  		var source = '<table id="shop_table"><tr><td><div id="prod_img"><a href="detailProduct.do?foods_no={{foods_no}}"><img alt="상품이미지" src="image.do?filename={{picture}}"></a>'
	  				+'</div><p class="name"><a href="detailProduct.do?foods_no={{foods_no}}">{{foods_name}}</a></p>'
	  				+'<p class="price">{{price}}<span>원</span></p> <select class="count" name="amount">'
	  				+'<c:forEach var="i" begin="1" end="20" step="1"><option value="${i}">${i}</option></c:forEach></select>'
	  				+'<input type="image" alt="" src="images/basketIns.png" value="{{foods_no}}" class="basketInsertBtn"></tr></table>';
	  				
			var template = Handlebars.compile(source);
			$('#shop_menu').append(template(value));
			
		});
		}
		
		
		var start = data.pdto.startPage;
		var end = data.pdto.endPage;
		var block = data.pdto.blockPage;
		var total = data.pdto.totalPage;
		var category_no = data.pdto.category_no;
		

		if (start > 1) {
			$('#pagenum_wrap').append('<a href="javascript:preFunction('+category_no+","+ (start - block) + ')">이전&nbsp;</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:numberFunction(' + i + ')">' + i + '&nbsp;';
			$('#pagenum_wrap').append(source1);
		}

		if (end < total) {
			$('#pagenum_wrap').append('<a href="javascript:nextFunction('+category_no+","+ (start + block) + ')">다음</a>');
		}

	};

	function preFunction(category_no, curr) {
		var searchText = $('#searchText').val();
		var search_category_no = $('#searchSelect').val();
		
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "shopSearch.do",
			data : "category_no = "+category_no+"&currentPage=" + curr +"&foods_name="+searchText,
			success : search_result,
			error : function(xhr, textStatus, error) {
				alert("next====" + error);
			}
		});
	};

	function nextFunction(category_no, curr) {
		var searchText = $('#searchText').val();
		var search_category_no = $('#searchSelect').val();
		
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "shopSearch.do",
			data : "category_no = "+category_no+"&currentPage=" + curr +"&foods_name="+searchText,
			success : search_result,
			error : function(xhr, textStatus, error) {
				alert("next====" + error);
			}
		});

	};

	function numberFunction(curr) {
		var searchText = $('#searchText').val();
		var search_category_no = $('#searchSelect').val();
		
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "shopSearch.do",
			data : "category_no="+search_category_no+"&currentPage=" + curr +"&foods_name="+searchText,
			success : search_result,
			error : function(xhr, textStatus, error) {
				alert("number====" + error);
			}
		});
	};
	
	function list_numberFunction(cate, curr){
		
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "shop.do",
			data : "category_no=" + cate + "&currentPage=" + curr,
			success : page_num_list,
			error : function(xhr, textStatus, error) {
				alert("pn_number====" + error);
			}
		});
		
	}
	
	function list_nextFunction(cate, curr){
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "shop.do",
			data : "category_no=" + cate + "&currentPage=" + curr,
			success : page_num_list,
			error : function(xhr, textStatus, error) {
				alert("pn_next====" + error);
			}
		});
		
	}
	
	function list_preFunction(cate, curr){
		$.ajax({
			type : 'POST',
			dataType : 'JSON',
			url : "shop.do",
			data : "category_no=" + cate + "&currentPage=" + curr,
			success : page_num_list,
			error : function(xhr, textStatus, error) {
				alert("pn_pre====" + error);
			}
		});
		
	}
	
	
	function page_num_list(data){
		
		$('#shop_menu').empty();
		$('#pagenum_wrap').empty();
		
		$.each(data.aList, function(index, value) {
			
	  	var source = '<table id="shop_table"><tr><td><div id="prod_img"><a href="detailProduct.do?foods_no={{foods_no}}"><img alt="상품이미지" src="image.do?filename={{picture}}"></a>'
	  	+'</div><p class="name"><a href="detailProduct.do?foods_no={{foods_no}}">{{foods_name}}</a></p>'
	  	+'<p class="price">{{price}}<span>원</span></p> <select class="count" name="amount">'
	  	+'<c:forEach var="i" begin="1" end="20" step="1"><option value="${i}">${i}</option></c:forEach></select>'
	  	+'<input type="image" alt="" src="images/basketIns.png" value="{{foods_no}}" class="basketInsertBtn"></tr></table>';
	  				
		var template = Handlebars.compile(source);
		$('#shop_menu').append(template(value));
			
		});
		
		
		var start = data.pv.startPage;
		var end = data.pv.endPage;
		var block = data.pv.blockPage;
		var total = data.pv.totalPage;
		

		if (start > 1) {
			$('#pagenum_wrap').append('<a href="javascript:list_preFunction(${category_no},'+ (start - block) + ')">이전&nbsp;</a>');
		}

		for (var i = start; i <= end; i++) {
			var source1 = '<a href="javascript:list_numberFunction(${category_no},' + i + ')">' + i + '&nbsp;';
			$('#pagenum_wrap').append(source1);
		}

		if (end < total) {
			$('#pagenum_wrap').append('<a href="javascript:list_nextFunction(${category_no},'+ (start + block) + ')">다음</a>');
		}
		
	}
	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>shop</title>
</head>
<body>
<body>
	<div id="shop_wrap">
		<div id="shop_menu">

			<c:forEach items="${aList}" var="FoodsDTO">
				<table id="shop_table">
					<tr>
						<td><div id="prod_img">
								<a href="detailProduct.do?foods_no=${FoodsDTO.foods_no}">
								<img alt="상품이미지" src="image.do?filename=${FoodsDTO.picture}">
								</a>
							</div>
							<p class="name">
								<a href="detailProduct.do?foods_no=${FoodsDTO.foods_no}">${FoodsDTO.foods_name}</a>
							</p>
							<p class="price">${FoodsDTO.price}<span>원</span>
							</p> <select class="count" name="amount">
								<c:forEach var="i" begin="1" end="20" step="1">
									<option value="${i}">${i}</option>
								</c:forEach></select> <input type="image" alt="" src="images/basketIns.png"
							value="${FoodsDTO.foods_no}" class="basketInsertBtn">
					</tr>
				</table>
			</c:forEach>

		</div>

		<div id="page_search_wrap">
			<div id="pagenum_wrap">
				<c:if test="${pv.startPage>1}">
						<a href="javascript:list_preFunction(${category_no}, ${pv.startPage-pv.blockPage})">
							<c:out value="이전" />
						</a>
					</c:if>
					
					<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
						<a href="javascript:list_numberFunction(${category_no}, ${i})"> <c:out
								value="${i}" /></a>
					</c:forEach>

					<c:if test="${pv.endPage<pv.totalPage}">
						<a href="javascript:list_nextFunction(${category_no}, ${pv.startPage+pv.blockPage})">
							<c:out value="다음" />
						</a>
					</c:if>
			</div>

			<br>
			<br>

			<div id="search_wrap">
				<select id="searchSelect">
					<option value="0">전체</option>
					<option value="1">국/찌개</option>
					<option value="2">반찬</option>
					<option value="3">김치</option>
				</select> <input type="text" id="searchText">
				<button id="searchBtn">검색</button>
			</div>

		</div>
	</div>
	<div id="dialog">
		<p>
			장바구니로 이동하시겠습니까?<br>
		</p>
	</div>
</body>
</html>
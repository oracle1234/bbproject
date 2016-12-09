<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/main2.js"></script>
<script src="js/jquery-ui-1.10.4.custom.min.js"></script>
<script src="js/jquery.cookie.js"></script>
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
<!-- <link rel="stylesheet" type="text/css" href="css/header.css" media="all" /> -->
<!-- <link rel="stylesheet" type="text/css" href="css/main.css?var=2" media="all" /> -->
<link rel="stylesheet" type="text/css" href="css/menu.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/footer.css?var=2" />
<link rel="stylesheet" type="text/css" href="css/mypage_imgbar.css" />
<link rel="stylesheet" type="text/css" href="css/shop_imgbar.css" />
<!-- <link rel="stylesheet" type="text/css" href="css/mypage_imgbar.css" /> -->
<link rel="stylesheet" type="text/css" href="css/mainpage.css?var=2" />
		
</head>
<body>
<div id="mainbody">
<div id="board">
<img class="title" src="images/main_board.png">
<c:forEach var="BoardDTO" items="${aList}">
<table>
<tr>
<td width="70%">${BoardDTO.board_subject}</td>
<td width="30%"><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${BoardDTO.board_reg_date}"/></td>
</tr>
</table>
</c:forEach>
</div>
   <div class="container">
		<iframe src="https://www.youtube.com/embed/fOyr5bvf-Wk?showinfo=0&am p;autoplay=1" frameborder="0" allowfullscreen></iframe>
      </div>
<div id="new">
<img class="title" src="images/main_new.png">
<ul><li class="main_photo"><a href="detailProduct.do?foods_no=86"><img src="./images/new_1.jpg"></a></li><li class="main_content"><p>●참치김치찌개</p><span class="main_span">요즘처럼 경기가 안 좋을 때, 답답한 가슴 속까지 확 뚫어주는 얼큰한 김치찌개 생각나시죠? 어머니가 해주시던 깊은 그 맛으로 오늘 하루 속 시원하게 시작하세요.</span></li></ul>
<ul><li class="main_photo"><a href="detailProduct.do?foods_no=84"><img src="./images/new_2.jpg"></a></li><li class="main_content"><p>●영양콩비지찌개</p><span class="main_span">오늘 저녁 뭘 해먹지? 고민이신 분들을 위해 반찬을 부탁해에서 제안하는 식탁요리, 올갱이 된장국입니다.</span></li></ul>
<ul><li class="main_photo"><a href="detailProduct.do?foods_no=85"><img src="./images/new_3.jpg"></a></li><li class="main_content"><p>●올갱이된장국</p><span class="main_span">콩비지에는 현대인에게 부족하기 쉬운 식이섬유가 다량 함유되어 있습니다. 또한 콜레스테롤을 낮춰주고 혈액을 맑게 해주는 효능이 있어 동맥경화, 고혈압, 고지혈증과 같은 성인병예방에 도움이 됩니다.</span></li></ul>
</div>

<div id="etc">
<ul>
<li id="map">
<img alt="" src="images/main_1.png">
</li>
<li id="company">
<a href="https://www.facebook.com/%EB%B0%98%EC%B0%AC%EC%9D%84-%EB%B6%80%ED%83%81%ED%95%B4-174044316394697/?fref=ts"
					target="_blank" title="더반찬 페이스북"><img alt="" src="images/main_2.png"></a>
</li>
<li id="bb">
<img alt="" src="images/main_3.png">
</li>
</ul>
</div>

<div id="photo">
<img class="title" src="images/main_photo.png">
<ul>
<c:forEach items="${aList}" var="idto">
<li><a href="#"><img alt="후기이미지" src="photo_image.do?filename=${idto.photo_upload}" width="200"></a></li>
</c:forEach>
</ul>
</div>

	<div>
		<p id="pop_wrap">
			<img src="images/popup/main_pop.png" alt="" usemap="#pop" />
			<map name="pop" id="pop">
				<area shape="rect" coords="334,419,374,434" id="#" alt="창닫기" />
				<area shape="rect" coords="129,419,264,434" href="#" alt="하루동안 창 닫기" />
			</map>
		</p>
	</div>
	</div>
</body>
</html>
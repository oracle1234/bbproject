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
<div id="main">
<div id="board">
<img class="title" src="images/main_board.png">
<table>
<tr>
<td width="70%">${BoardDTO.board_subject}</td>
<td width="30%"><fmt:formatDate pattern="yyyy/MM/dd" dateStyle="short" value="${BoardDTO.board_reg_date}"/></td>
</tr>
</table>
</div>
   <div class="container">
					<iframe src="https://www.youtube.com/embed/fOyr5bvf-Wk?showinfo=0&am p;autoplay=1" frameborder="0" allowfullscreen></iframe>
                </div>
<div id="new">
<img class="title" src="images/main_new.png">
<table>
<c:forEach items="${aList}" var="FoodsDTO">
<tr>
<td width="30%">${FoodsDTO.picture}</td>
<td width="70%">${FoodsDTO.foods_name}<br>출시!</td>
</tr>
</c:forEach>
</table>
</div>

<div id="etc">
<ul>
<li id="map">
<img alt="" src="images/main_1.png">
</li>
<li id="company">
<img alt="" src="images/main_2.png">
</li>
<li id="bb">
<img alt="" src="images/main_3.png">
</li>
</ul>
</div>

<div id="photo">
<img class="title" src="images/main_photo.png">
<ul>
<c:forEach items="${aList}" var="Photo_BoardDTO">
<li>${Photo_BoardDTO.picture}</li>
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
</div>
</body>
</html>
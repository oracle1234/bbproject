<!doctype html>
<html>
<head>
<meta charset="utf-8"/>
<title>bbproject</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" media="all" />
<link rel="stylesheet" type="text/css" href="css/mainpage_common.css" media="all">
<link rel="stylesheet" type="text/css" href="css/mainpage_main.css" media="all" />
<link rel="stylesheet" href="http://bxslider.com/lib/jquery.bxslider.css" type="text/css" /> <!-- bxslider 스타일 연동 -->
<!-- <link rel="stylesheet" type="text/css" href="css/style.css" /> --> <!-- 터치 슬라이드 스타일(CSS) 연동 -->

<script src="https://code.jquery.com/jquery-1.10.2.js"></script> <!-- 제이쿼리 라이브러리 연동 -->
<script src="js/jquery-ui-1.10.4.custom.min.js"></script> <!-- UI 플러그인 연동 -->
<script src="js/common.js"></script>
<script src="js/jquery.cookie.js"></script>  <!-- 쿠키 플러그인 연동 -->
<script src="js/main.js"></script>
<!-- 
<script src="http://bxslider.com/lib/plugins/jquery.fitvids.js"></script>
<script src="http://bxslider.com/lib/jquery.bxslider.js"></script> 
-->
<!-- <script src="js/swipe.js"></script> --> <!-- 터치 슬라이드 플러그인 연동 -->
<script src="js/jquery.bxslider.min.js"></script> <!-- bxSlider 플러그인 연동 -->
</head>

<body>
<!-- 

로그인, 회원가입, 게시판
<div id="wrap">
	<div id="header">
		<div class="wrap_inner">
			<ul>
				<li class="gnb">
					<a href="#">
						<img alt="로그인" src="images/gnb_login.gif">
					</a>
					<a href="#">
						<img alt="회원가입" src="images/gnb_joinus.gif">
					</a>
					<a href="#">
						<img alt="마이페이지" src="images/gnb_mypage.gif">
					</a>
					<a href="#">
						<img alt="장바구니" src="images/gnb_cart.gif">
					</a>
					<a href="#">
						<img alt="배송조회" src="images/gnb_orderlist.gif">
					</a>
				</li>
			</ul>
		</div>
	</div>
</div>



<div id="wrap">
  <div id="header2"> 
    header_area
    <div class="header_area">
      <div class="sm_logo"><a href="Website.html"><img src="" alt="??"></a></div>
      <div class="h_gnb"> 
        header depth
        <div class=dp_1>
          <ul>
            <li class="li_s"><a href="#">?</a>
              <ul class="dp_2">
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li> 
              </ul>
            </li>
            <li class="li_s"><a href="">?</a>
              <ul class="dp_2">
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li> 
              </ul>
            </li>
            <li class="li_s"><a href="">?</a></li>
            <li class="li_s"><a href="">?</a>
              <ul class="dp_2">
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
                <li><a href="#"></a></li>
              </ul>
            </li>
            <li class="li_s"><a href="">??</a>
              <ul class="dp_2">
                <li><a href="#">??</a></li>
                <li><a href="#"></a></li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  
  content(메인 배너)
  <div id="content">
    <ul class="bxslider">
      <li><img src="#"/></li>
      <li><img src="#" /></li>
      <li><img src="#" /></li>
      <li><img src="#" /></li>
    </ul>
  </div>
  
  banner_text(브랜드 배너)
  <div class="banner_text">
    <ul class="ul_banner1" onclick="#" style="opacity:1, border: 1px solid rgb(206, 206, 206);">
      <li>
        <h1 style="color:rgb(54, 54, 54);">???</h1>
      </li>
    </ul>
    <ul class="ul_banner2" onclick="#" style="opacity:1, border: 1px solid rgb(206, 206, 206);">
      <li>
        <h1 style="color:rgb(54, 54, 54);">???</h1>
      </li>
    </ul>
    <ul class="ul_banner3" onclick="#" style="opacity:1, border: 1px solid rgb(206, 206, 206);">
      <li>
        <h1 style="color:rgb(54, 54, 54);">???</h1>
      </li>
    </ul>
    <ul class="ul_banner4" onclick="#" style="opacity:1, border: 1px solid rgb(206, 206, 206);">
      <li>
        <h1 style="color:rgb(54, 54, 54);">???</h1>
      </li>
    </ul>
    <ul class="ul_banner5" onclick="#" style="opacity:1, border: 1px solid rgb(206, 206, 206);">
      <li>
        <h1 style="color:rgb(54, 54, 54);">???</h1>
      </li>
    </ul>
  </div>
  
  article(이벤트/행사 배너)
  <div class="article">
    <div class="con">
      <div class="menu_L">
        <h1 style="display:inline;">???</h1>
      </div>
      <div>
        <ul style="width:1100px">
          <li class=""> <img src="#" alt="1"/> </li>
          <li class=""> <img src="#" alt="2"/> </li>
          <li class=""> <img src="#" alt="3"/> </li>
          <li class=""> <img src="#" alt="4"/> </li>
          <li class=""> <img src="#" alt="5"/> </li>
        </ul>
      </div>
    </div>
  </div>
</div>

footer
<footer id="footer">
  <div class="bottom_gnb1">
    <div class="wrap">
      <div class="tit">
        <p><a href="#">??</a></p>
      </div>
      <div class="tit">
        <p><a href="#">??</a></p>
      </div>
      <div class="tit_1">
        <p><a href="#">??</a></p>
      </div>
    </div>
  </div>
  <div class="contact">
    <div class="wrap">
      <div class="info">
        <p class="text1">Company Info</p>
        <p class="text2"> <span class="tit">주소 : 서울특별시 성동구 무학로 2길 54 신방빌딩 4,5층 / 대표자 : 어쩌구 / TEL : ??-??-????, FAX : ??-???-????</span> </p>
      </div>
      <div class="sv">
        <p class="text1">Contact</p>
        <p class="text_line"> <a href="">Customer service</a> </p>
      </div>
    </div>
  </div>
  <div class="copyright">
    <div class="wrap">
      <p class="copy">Copyright ⓒ 2016 <span>??</span> Co.Ltd. All rights reserved.</p>
    </div>
  </div>
</footer>
 
 
 -->
 </body>
</html>

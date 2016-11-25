<%@page contentType="text/html; charset=UTF-8"%>
<div id="header">
			<h1>
				<a href="#"><img src="images/shop_basket" alt="이지스 퍼블리싱" /></a>
			</h1>
			<dl id="util_menu">
				<dt class="hide">유틸메뉴</dt>
				<dd class="util_first">
					<ul>
						<li class="login_wrap"><a href="#"> <img
								src="images/util_menu_1.gif" alt="로그인" />
						</a> <!-- 로그인 폼 -->
							<form action="#" method="post" name="log_f" id="login_f">
								<fieldset>
									<legend>로그인</legend>
									<p class="user_id">
										<label for="user_id"> <img
											src="images/login_title_id.gif" alt="아이디" />
										</label> <input type="text" name="user_id" id="user_id" />
									</p>
									<p class="user_pw">
										<label for="user_pw"> <img
											src="images/login_title_pw.gif" alt="아이디" />
										</label> <input type="password" name="user_pw" id="user_pw" />
									</p>
									<p>
										<input type="checkbox" name="save_id" id="save_id" /> <label
											for="save_id"> 비밀번호 저장</label>
									</p>
									<p class="log_btn">
										<input type="image" src="images/login_btn.gif" alt="로그인버튼" />
									</p>
									<p class="join_btn_wrap">
										<a href="#">회원가입</a> <a href="#" class="sch_id_btn">아이이디/비밀번호
											찾기</a>
									</p>
									<p class="login_close_btn">
										<a href="#"> <img src="images/login_close_btn.gif"
											alt="닫기버튼" />
										</a>
									</p>
								</fieldset>
							</form></li>
						<li><a href="#"><img src="images/util_menu_2.gif"
								alt="회원가입" /></a></li>
						<li><a href="#"><img src="images/util_menu_3.gif"
								alt="도서목록" /></a></li>
						<li><a href="#"><img src="images/util_menu_4.gif"
								alt="원고지원" /></a></li>
						<li><a href="#"><img src="images/util_menu_5.gif"
								alt="사이트맵" /></a></li>
					</ul>
				</dd>
				<dd>
					<ul id="zoom">
						<li><img src="images/util_zoom_1.gif" alt="" /></li>
						<li><a href="#" class="zoom_in"><img
								src="images/util_zoom_2.gif" alt="" /></a></li>
						<li><a href="#" class="zoom_return"><img
								src="images/util_zoom_3.gif" alt="" /></a></li>
						<li><a href="#" class="zoom_out"><img
								src="images/util_zoom_4.gif" alt="" /></a></li>
					</ul>
				</dd>
				<dd>
					<a href="#" class="print_btn"> <img src="images/util_print.gif"
						alt="" />
					</a>
				</dd>
				<dd>
					<div id="google_translate_element"></div>
				</dd>
			</dl>
			<form action="#" method="get" name="sch_f" id="sch_f">
				<fieldset>
					<legend>검색폼</legend>
					<p>
						<input type="text" name="keyword" id="keyword" title="검색어입력" /> <input
							type="image" src="images/header_sch_btn.gif" alt="검색" />
					</p>
				</fieldset>
			</form>
			<h2 class="hide">메인메뉴</h2>
			<ul id="gnb">
				<li><a href="#"><img src="images/gnb_1_out.gif" alt="" /></a>
					<ul class="sub1">
						<li><a href="#">홈으로이동</a></li>
					</ul></li>
				<li><a href="#"><img src="images/gnb_2_out.gif" alt="" /></a>
					<ul class="sub2">
						<li><a href="#">회사소개</a></li>
						<li><a href="#">출간분야</a></li>
						<li><a href="#">찾아오시는 길</a></li>
					</ul></li>
				<li><a href="#"><img src="images/gnb_3_out.gif" alt="" /></a>
					<ul class="sub3">
						<li><a href="#">신간도서1</a></li>
						<li><a href="#">인기도서</a></li>
						<li><a href="#">추천도서</a></li>
					</ul></li>
				<li><a href="#"><img src="images/gnb_4_out.gif" alt="" /></a>
					<ul class="sub4">
						<li><a href="#">고객문의</a></li>
						<li><a href="#">저자문의</a></li>
						<li><a href="#">자료요청</a></li>
						<li><a href="#">자주묻는 질문</a></li>
					</ul></li>
			</ul>
			<p id="total_btn">
				<a href="#"> <img src="images/allmenu_btn_out.gif" alt="전체메뉴" />
				</a>
			</p>
			<div id="total_menu">
				<dl>
					<dt>
						<img src="images/allmenu_title_1.gif" alt="홈" />
					</dt>
					<dd>
						<ul>
							<li><a href="#">홈으로이동</a></li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dt>
						<img src="images/allmenu_title_2.gif" alt="홈" />
					</dt>
					<dd>
						<ul>
							<li><a href="#">회사소개</a></li>
							<li><a href="#">출간분야</a></li>
							<li><a href="#">찾아오시는 길</a></li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dt>
						<img src="images/allmenu_title_1.gif" alt="홈" />
					</dt>
					<dd>
						<ul>
							<li><a href="#">신간도서</a></li>
							<li><a href="#">인기도서</a></li>
							<li><a href="#">추천도서</a></li>
						</ul>
					</dd>
				</dl>
				<dl>
					<dt>
						<img src="images/allmenu_title_1.gif" alt="홈" />
					</dt>
					<dd>
						<ul>
							<li><a href="#">고객문의</a></li>
							<li><a href="#">저자문의</a></li>
							<li><a href="#">자료요청</a></li>
							<li><a href="#">자주묻는 질문</a></li>
						</ul>
					</dd>
				</dl>
				<p id="total_close">
					<a href="#"> <img src="images/allmenu_close_btn.gif"
						alt="전체메뉴 닫기" />
					</a>
				</p>
			</div>
			<p id="date_wrap">
				<span class="year">0000</span> 년 <span class="month">00</span> 월 <span
					class="date">00</span> 일
			</p>
		</div>

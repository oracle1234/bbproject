<%@page contentType="text/html; charset=UTF-8"%>
<div id="wrap">
		<div id="header">
			<dl id="util_menu">
				<dt class="hide">유틸메뉴</dt>
				<dd id="menu_util">
					<ul>
						<li>
							<form action="#" method="post" name="log_f" id="login_f">
								<fieldset>
									<legend>로그인</legend>
									<input type="text" id="id" name="id" title="아이디입력"
										placeholder="아이디입력" /> <input type="password" id="password"
										name="password" title="비밀번호입력" placeholder="비밀번호입력" /> <input
										type="checkbox" id="remember" name="remember" /> <label
										for="remember">아이디 저장</label> <input type="image"
										id="loginBtn" src="images/login_btn.gif" />

								</fieldset>
							</form>
						</li>
						<li><a href="#" id="login_btn">로그인</a> |</li>
						<li><a href="join.html">회원가입</a></li>
					</ul>
				</dd>
				<dt class="hide">메뉴</dt>
				<dd id="menu_main">
					<ul id="gnb">
						<li><a href="#">홈</a></li>
						<li><a href="#">반찬</a>
							<ul>
								<li><a href="#">반찬1</a></li>
								<li><a href="#">반찬2</a></li>
								<li><a href="#">반찬3</a></li>
								<li><a href="#">반찬4</a></li>
							</ul></li>
						<li><a href="#">레시피</a>
							<ul>
								<li><a href="#">레시피1</a></li>
								<li><a href="#">레시피2</a></li>
								<li><a href="#">레시피3</a></li>
								<li><a href="#">레시피4</a></li>
							</ul></li>
						<li><a href="#">게시판</a>
							<ul>
								<li><a href="#">자유</a></li>
								<li><a href="#">질문</a></li>
								<li><a href="#">포토</a></li>
							</ul></li>
						<li><a href="#">마이페이지</a>
						<ul>
							<li><a href="#">주문</a></li>
							<li><a href="#">배송</a></li>
							<li><a href="#">기타</a></li>
						</ul></li>
					</ul>
				</dd>
			</dl>
		</div>
		
	</div>
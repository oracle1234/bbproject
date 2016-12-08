<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<meta charset="UTF-8">
<title>Login Form</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
var s_pw = "${sessionScope.member.pw}";
var s_id = "${sessionScope.member.id}";
var s_name = "${sessionScope.member.member_name}";
	$(document).ready(function() {
		if(s_id!=''){
			$('.logindiv').empty();
			$('.logindiv').append('<ul>'
					+'<li>'+s_name+'님&nbsp;</li>'
			+'<li id="logoutform"><a href="logout.do">로그아웃</a></li>'
			+'</ul>');
		}
/* 		$("#logoutform").on("click", function() {
			$.ajax({
				type : 'POST',
				url : 'logout.do',
				data : "id="+s_id+"&pw="+s_pw,
				success : function(data) {
					alert(data);
				},
				error : function(xhr,
						textStatus, error) {
					alert(error);
				}
			});
		}); */
		
		$('.idpwfind').hide(); 

		$('.pwupd').hide();

		$("#loginform").on("click", function() {
			$(".screen").css('display', 'block');
		});
		

		$("#close").on("click", function() {
			$(".screen").css('display', 'none');
		});

		$("#findbutton").on("click", function() {
			$(".screen").css('display', 'none');
			$('.idpwfind').show();
		});

		$("#findclose").on("click", function() {
			$('.idpwfind').hide();
		});
		
		$("#updclose").on("click", function() {
			$('.pwupd').hide();
		});


		$('#idok').on('click',function() {
			//alert("idck 이름"+$('#member_name').val());
			//alert("idck 메일"+$('#mail').val());
			$.ajax({
						type : 'POST',
						url : 'idfind.do',
						data : "member_name="+$('#loginmember_name').val()+"&mail="+$('#loginmail').val(),
						success : function(data) {
							alert(data);
							$('#loginmember_name').val('');
							$('#loginmail').val('');
						},
						error : function(xhr,
								textStatus, error) {
							alert(error);
						}
					});
				});

		$('#pwok').on('click',function() {
			//alert("pwck 아이디"+$('#pwid').val());
			//alert("pwck 이름"+$('#pwmember_name').val());
			//alert("pwck 메일"+$('#pwmail').val());
			$.ajax({
						type : 'POST',
						url : 'pwfind.do',
						data : "id="+$('#pwid').val()+ "&member_name="+ $('#pwmember_name').val()+"&mail="+$('#pwmail').val(),
						success : function(data) {
							alert(data);
						
									$(".pwupd").append('<input type="hidden" id="hdid" value="" name="id">'
									+'<input type="hidden" id="hdmember_name" value="" name="member_name">'
									+'<input type="hidden" id="hdmail" value="" name="mail">');
									$('#hdid').val($('#pwid').val());
									$('#hdmember_name').val($('#pwmember_name').val());
									$('#hdmail').val($('#pwmail').val());
											//alert($('#hdid').val());
											//alert($('#hdmember_name').val());
											//alert($('#hdmail').val());
									$(".idpwfind").remove();
									$(".pwupd").show();
							
							

							$("#loginpass").keyup(function() {
								$('font[name=logincheck]').text('');
							});
							
							$('#pw').keyup(function() {
								if ($("#loginpass").val() != $("#pwpw").val()) {
									$('#logincheck').css("color", "red");
									$('font[name=logincheck]').text('');
									$('font[name=logincheck]').html('비밀번호가 일치하지 않습니다.');
								} else {
									$('#logincheck').css("color", "green");
									$('font[name=logincheck]').text('');
									$('font[name=logincheck]').html('비밀번호가 일치합니다.');
								}
							});

							if (data != "입력하신 이름과 이메일이 일치하는 회원이 없습니다.") {
								$('#pwid').val('');
								$('#pwmember_name').val('');
								$('#pwmail').val('');
							}
						},
						error : function(xhr,textStatus,error) {
							alert(error);
						}
					});
		});

	$('#pwupdok').on('click',function() {
				//alert("pwck 아이디"+$('#hdid').val());
				//alert("pwck 이름"+$('#hdmember_name').val());
				//alert("pwck 메일"+$('#hdmail').val());
				//alert("pwck 메일"+$('#pwpw').val());
				$.ajax({
							type : 'POST',
							url : 'pwupd.do',
							data : "id="+ $('#hdid').val()+"&member_name="+$('#hdmember_name').val()+"&mail="+$('#hdmail').val()
									+ "&pw="+ $('#pwpw').val(),
							success : passsuc,
							error : function(xhr, textStatus, error) {
								alert(error);
							}
						});
				});

		});

	$(function() {

	});

	function chkfun() {
		$.ajax({
			type : "POST",
			datatype : "json",
			url : "loginpro.do",
			data : "id=" + $("#loginid").val() + "&pw=" + $("#loginpw").val(),
			success : function(data) {
				
				if (data.chk == null) {
					
					window.location.href = data.href;
					
				} else {
					alert(data.chk);
				}

			},
			error : function(xhr, textStatus, error) {
				alert(error);
			}
		});

	};
	
	function passsuc(aaa){
		alert("비밀번호 변경이 완료되었습니다.");
		$('.pwupd').hide();
	}
	
	</script>
<style>
.menu {
	position: relative;
	height: 79px;
	background: #2b2f3a;
	width: auto;
	clear: both;
}

.menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
	line-height: 1;
}

.menu>ul {
	height: 79px;
	position: relative;
	display: block;
	background: #ffffff;
	width: 100%;
	z-index: 500;
	text-align: center;
}

.menu>ul>li {
	width: 200px;
	display: inline-block;
	position: relative;
	margin: 0;
	padding: 0;
	display: inline-block;
}

.menu ul li a {
	display: block;
	font-family: Helvetica, sans-serif;
	text-decoration: none;
}

.menu>ul>li>a {
	line-height: 79px;
	font-size: 30px;
	font-weight: bold;
	text-align: center;
	color: #2b2f3a;
	text-transform: uppercase;
	-webkit-transition: color 0.25s ease-out;
	-moz-transition: color 0.25s ease-out;
	-ms-transition: color 0.25s ease-out;
	-o-transition: color 0.25s ease-out;
	transition: color 0.25s ease-out;
	color: #2b2f3a;
}

.menu ul ul {
	position: absolute;
	left: -9999px;
	top: 70px;
	opacity: 0;
	-webkit-transition: opacity .3s ease, top .25s ease;
	-moz-transition: opacity .3s ease, top .25s ease;
	-ms-transition: opacity .3s ease, top .25s ease;
	-o-transition: opacity .3s ease, top .25s ease;
	transition: opacity .3s ease, top .25s ease;
	z-index: 1000;
}

.menu ul ul li {
	position: relative;
	width: 200px;
}

.menu>ul>li:hover>ul {
	left: auto;
	top: 79px;
	opacity: 1;
}

.menu ul ul li a {
	border-bottom: 1px solid #eeeeee;
	padding: 10px 20px;
	font-size: 12px;
	color: #9ea2a5;
	background: #ffffff;
	-webkit-transition: all .35s ease;
	-moz-transition: all .35s ease;
	-ms-transition: all .35s ease;
	-o-transition: all .35s ease;
	transition: all .35s ease;
}

.menu ul ul li:hover>a {
	background: #f2f2f2;
	color: #8c9195;
}

.menu ul ul li:last-child>a, .menu ul ul li.last>a {
	border-bottom: 0;
}

.logindiv li {
	float: left;
}

.logindiv {
	float: right;
}

.screen {
	display: none;
	z-index: 100000;
	position: absolute;
	margin-top: -79px;
	width: 100%;
	height: 2100px;
	background-color: rgba(108, 107, 107, 0.5);
}

.login {
	width: 400px;
	height: 300px;
	z-index: 1000000;
	margin-top:200px;
	margin-left:780px;
	background-color:white;
}

#login_header {
	width: 400px;
	height: 50px;
	background-color: white;
	border-bottom:3px solid black; 
	font-size:35px;
	font-weight: bold; 
}

#login_header p{
margin-left:5px;
}

#close {
	width: 50px;
	height: 47px;
	margin-left: 350px;
	 margin-top:-45px; 
}

#close img{
	width: 50px;
	height: 47px;
}

.login-form {
	width: 400px;
	height: 125px;
}

#button {
	width: 400px;
	height: 90px;
	background-color: white;
	/* border:1px solid black; */
}

#form {
	width: 250px;
	height: 125px;
	background-color: white;
	margin-top:30px;
	/* border:1px solid black; */
}

#button{
float:left;

}

#findbutton{
width:150px;
height:40px;
margin-left: 30px;
}

#joinbutton{

width:150px;
height:40px;
margin-left:20px;
}

#loginbutton {
	margin-top: -125px;
	margin-left: 250px;
	width: 100px;
	height: 80px;
	background-color: black;
}

.idpwfind {
	display: none;
	z-index: 100000;
	position: absolute;
	margin-top: -79px;
	width: 100%;
	height: 2100px;
	background-color: rgba(108, 107, 107, 0.5);
}

.idpwform {
	width: 600px;
	height: 300px;
	z-index: 1000000;
	margin-top: 200px;
	margin-left: 650px;
	background-color: white;
}

.idpwheader {
	width: 600px;
	height: 50px;
	background-color: white;
	border-bottom:4px solid black; 
	font-size:35px;
	font-weight: bold; 
	
	
}

.idpwheader p{
margin-left:5px;
}

#findclose {
	width: 50px;
	height: 47px;
	margin-left: 550px;
	margin-top:-45px;
}

#findclose img{
	width: 50px;
	height: 47px;
}

.idfind {
	width: 278px;
	height: 250px;
	background-color: white;
	/* border:1px solid black; */
	border-right: 1px solid black;
	z-index:100;
	padding:10px;
}

.pwfind {
	width:280px;
	height: 250px;
	background-color: white;
	/* border:1px solid black; */
	margin-top: -270px;
	margin-left: 300px;
	padding:10px;
}

.pwupd {
	display: none;
	background-color: gray;
	z-index: 1000000;
	position: absolute;
	margin-top: -79px;
	width: 100%;
	height: 2100px;
	background-color: rgba(108, 107, 107, 0.5);
}

.pwupdform {
	width: 300px;
	height: 250px;
	z-index: 10000000;
	margin-top: 200px;
	margin-left: 750px;
	background-color: white;
	border: 2px solid black;
}

.pwupdheader {
	width: 300px;
	height: 50px;
	background-color: white;
	border-bottom:4px solid black; 
	font-size:35px;
	font-weight: bold; 
}

#updclose {
	width: 50px;
	height: 47px;
	margin-left: 250px;
	margin-top: -46px;
}

#updclose img{
	width: 50px;
	height: 47px;
	margin-left: 250px;
}

#logincheck {
margin-left:180px;
z-index:10000000;
}


input {
   font-family: inherit;
   color: inherit;
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   /* box-sizing: border-box; */
}

.login .signUpInput {
    outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
  width:180px;
  height:30px;
  border: 0;
  border-radius: 4px;
  box-sizing: border-box;
  padding: 12px 20px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
  font-weight: 500;
  line-height: inherit;
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
          margin:5px;
          margin-top:20px;
          margin-left:30px;
}

.idform .signUpInput {
    outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
/*    width:180px; */
  height:30px;  
  border: 0;
  border-radius: 4px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
   font-weight: 500; 
   line-height: inherit; 
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
          margin-top:40px;
          margin-left:40px; 
          margin:10px;
          float:left;
}

.pwfind .signUpInput {
    outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
   /* width:180px; */
  height:30px; 
  border: 0;
  border-radius: 4px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
   font-weight: 500; 
   line-height: inherit; 
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
          margin-top:40px;
          margin-left:40px; 
          margin:10px;
            float:left;
}

.pwupd .signUpInput {
    outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
 /*   width:180px; */
  height:30px; 
  border: 0;
  border-radius: 4px;
  color: rgba(0, 0, 0, 0.6);
  font-family: inherit;
  font-size: inherit;
   font-weight: 500; 
   line-height: inherit; 
  -webkit-transition: 0.3s ease;
          transition: 0.3s ease;
          /* margin-top:100px; */
          margin-left:40px; 
          margin:10px;
           float:left;
}

#findbutton{
width:150px;
height:40px;
border:2px solid black;
}

#joinbutton{
width:150px;
height:40px;
border:2px solid black;
}

.idbutton{
float:right;
margin-top:-30px;
}

 #loginpop{
 	float: left;
 	width: 280px;
	position: relative;
	top : -60px;
 }
#loginpop .pwform{
/* 	width: 175px; */
}

#loginpop .pwbutton{
	width: 0;
	position: relative;
	top : 45px;
}

#pwupdok{
float:right;
    margin-top: -100px;
    margin-left: 180px;
}

</style>

<div class="logindiv">
	<ul>
		<li id="loginform">로그인</li>
		<li>&nbsp;|&nbsp;</li>
		<li id="join"><a href="agree.do">회원가입</a></li>
	</ul>

</div>
<div class='menu'>
	<ul>
		<li><a href='main.do'><img alt="" src="images/logo.png"></a></li>
		<li><a href='shop.do'>SHOP</a>

			<ul>
				<li class='sub'><a href='shop.do?category_no=1'>국/찌개</a></li>
				<li class='sub'><a href='shop.do?category_no=2'>반찬</a></li>
				<li class='sub'><a href='shop.do?category_no=3'>김치</a></li>
			</ul></li>
		<li><a href='recipe.do'>RECIPE</a>
			<ul>
				<li class='sub'><a href="recipe.do?theme_no=1">영양식</a></li>
				<li class='sub'><a href="recipe.do?theme_no=2">간식</a></li>
				<li class='sub'><a href="recipe.do?theme_no=3">도시락</a></li>
				<li class='sub'><a href="recipe.do?theme_no=4">다이어트</a></li>
				<li class='sub'><a href="recipe.do?theme_no=5">야식</a></li>
			</ul></li>
		<li><a href='board_list.do'>BOARD</a>
			<ul>
				<li class='sub'><a href='board_list.do'>게시판1</a></li>
				<li class='sub'><a href='qa_list.do'>게시판2</a></li>
			</ul></li>
		<li class='last'><a href='mypage.do'>MYPAGE</a></li>
	</ul>
</div>


<div class="screen">
	<div class="login">
		<div id="login_header">
		<p>Login</p>
			<img id="close" src="images/button_close.png">
		</div>
		<div class="login-form">
			<div id="form">
				<input type="text" class="signUpInput" value="" placeholder="이이디"
					id="loginid" name="id"> <input type="password"
					class="signUpInput" value="" placeholder="비밀번호" id="loginpw" name="pw">
			</div>
			<div id="loginbutton">
				<a href="javascript:chkfun()"><img alt="" src="images/button_login.png"></a>
			</div>
		</div>

		<div id="button">
			<img id="findbutton" src="images/button_find.png"> 
			<a href="agree.do"><img id="joinbutton" src="images/button_join.png"></a>
		</div>
	</div>
</div>


<!-- 아이디 비밀번호 찾기 -->
<div class="idpwfind">
	<div class="idpwform">
		<div class="idpwheader">
		<p>Find</p>
			<img id="findclose" src="images/button_close.png">
		</div>
		<div class="idfind">
			<span>아이디 찾기 이름과 이메일을 입력하시면 아이디를 알려드립니다.</span>
			<div class="idform">
				<input type="text" id="loginmember_name" name="member_name"
					placeholder="이름" class="signUpInput"> <input type="text" id="loginmail" name="mail"
					placeholder="이메일 주소" class="signUpInput">
			</div>
			<div class="idbutton">
				<img id="idok" src="images/button_ok2.png">
			</div>
		</div>
		<div class="pwfind">
			<span>비밀번호 찾기 아이디, 이름, 이메일을 입력하시면 새로운 비밀번호로 변경할 수 있습니다.</span>
			<div id="loginpop">
				<div class="pwform">
					<input type="text" id="pwid" name="id" placeholder="아이디" class="signUpInput"> <input
						type="text" id="pwmember_name" name="member_name" placeholder="이름" class="signUpInput">
					<input type="text" id="pwmail" name="mail" placeholder="이메일 주소" class="signUpInput">
				</div>
				<div class="pwbutton">
					<img id="pwok" src="images/button_ok.png">
				</div>
			</div>
		</div>
	</div>
	</div>

	<div class="pwupd">
		<div class="pwupdform">
			<div class="pwupdheader">
			<p>New Password</p>
				<img id="updclose" src="images/button_close.png">
			</div>
			<table>
				<tr>
					<td><input type="password" name="pass" id="loginpass" placeholder="비밀번호" class="signUpInput"></td>
				</tr>
				<tr>
					<td><input type="password" name="pw" id="pwpw" placeholder="비밀번호 확인" class="signUpInput">
						<font id="logincheck" name="logincheck" size="2"></font></td>
				</tr>
			</table>
			<img id="pwupdok" src="images/button_ok.png">
		</div>
	</div>
	
	<!-- <div id="hide">
	<input type="hidden" id="hdid" value="" name="id">
	<input type="hidden" id="hdmember_name" value="" name="member_name">
	<input type="hidden" id="hdmail" value="" name="mail">
	</div> -->



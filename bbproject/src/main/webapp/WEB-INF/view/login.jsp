<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
var s_pw = "${sessionScope.member.pw}";
var s_id = "${sessionScope.member.id}";
var s_name = "${sessionScope.member.member_name}";

	function chkfun() {
		$.ajax({
			type : "POST",
			datatype : "json",
			url : "loginpro.do",
			data : "id=" + $("#loginidint").val() + "&pw=" + $("#loginpwint").val(),
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
	</script>
<style>

#notloginint{
width:930px;
height:170px;
margin:auto;
}

#notloginint img{
width:930px;
height:170px;
margin:auto;
}
.loginint {
	width: 400px;
    height: 300px;
    z-index: 100;
    margin:auto;
    background-color: white;
}

#login_headerint {
	width: 400px;
	height: 50px;
	background-color: white;
	border-bottom:3px solid black; 
	font-size:35px;
	font-weight: bold; 
}

#login_headerint p{
margin-left:5px;
}

.login-formint {
	width: 400px;
	height: 125px;
}

#buttonint {
	width: 400px;
	height: 90px;
	background-color: white;
	/* border:1px solid black; */
}

#formint {
	width: 250px;
	height: 125px;
	background-color: white;
	margin-top:30px;
	/* border:1px solid black; */
}

#loginbuttonint {
	margin-top: -125px;
	margin-left: 250px;
	width: 100px;
	height: 80px;
	background-color: black;
}


#logincheckint {
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

.loginint .signUpInput {
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



</style>

<div id="notloginint">
<img alt="" src="images/notlogin.gif">
</div>

	<div class="loginint">
		<div id="login_headerint">
		<p>Login</p>
		</div>
		<div class="login-formint">
			<div id="formint">
				<input type="text" class="signUpInput" value="" placeholder="이이디" id="loginidint" name="id"> 
					<input type="password" class="signUpInput" value="" placeholder="비밀번호" id="loginpwint" name="pw">
			</div>
			<div id="loginbuttonint">
				<a href="javascript:chkfun()"><img alt="" src="images/button_login.png"></a>
			</div>
		</div>
		<div id="buttonint">
		<input type="button" value="아이디/비밀번호 찾기">
		<input type="button" value="회원가입"> 
		</div>

	</div>


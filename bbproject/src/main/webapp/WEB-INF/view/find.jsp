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
	$(".pwupdint").hide();
		
	
	   $("#updcloseint").on("click", function() {
	         $('.pwupdint').hide();
	      });
	   
		$('#idokint').on('click',function() {
			//alert("idck 이름"+$('#member_name').val());
			//alert("idck 메일"+$('#mail').val());
			$.ajax({
						type : 'POST',
						url : 'idfind.do',
						data : "member_name="+$('#member_nameint').val()+"&mail="+$('#mailint').val(),
						success : function(data) {
							alert(data);
							$('#member_nameint').val('');
							$('#mailint').val('');
						},
						error : function(xhr,
								textStatus, error) {
							alert(error);
						}
					});
				});

		$('#pwokint').on('click',function() {
			//alert("pwck 아이디"+$('#pwidint').val());
			//alert("pwck 이름"+$('#pwmember_nameint').val());
			//alert("pwck 메일"+$('#pwmailint').val());
			$.ajax({
						type : 'POST',
						url : 'pwfind.do',
						data : "id="+$('#pwidint').val()+ "&member_name="+ $('#pwmember_nameint').val()+"&mail="+$('#pwmailint').val(),
						success : function(data) {
							alert(data);
						
									$(".pwupdint").append('<input type="hidden" id="hdidint" value="" name="id">'
									+'<input type="hidden" id="hdmember_nameint" value="" name="member_name">'
									+'<input type="hidden" id="hdmailint" value="" name="mail">');
									$('#hdidint').val($('#pwidint').val());
									$('#hdmember_nameint').val($('#pwmember_nameint').val());
									$('#hdmailint').val($('#pwmailint').val());
											//alert($('#hdid').val());
											//alert($('#hdmember_name').val());
											//alert($('#hdmail').val());
									$(".pwupdint").show();
							
							

							$("#loginpassint").keyup(function() {
								$('font[name=logincheckint]').text('');
							});
							
							$('#pw').keyup(function() {
								if ($("#loginpassint").val() != $("#pwpwint").val()) {
									$('#logincheckint').css("color", "red");
									$('font[name=logincheckint]').text('');
									$('font[name=logincheckint]').html('비밀번호가 일치하지 않습니다.');
								} else {
									$('#logincheckint').css("color", "green");
									$('font[name=logincheckint]').text('');
									$('font[name=logincheckint]').html('비밀번호가 일치합니다.');
								}
							});

							if (data != "입력하신 이름과 이메일이 일치하는 회원이 없습니다.") {
								$('#pwidint').val('');
								$('#pwmember_nameint').val('');
								$('#pwmailint').val('');
							}
						},
						error : function(xhr,textStatus,error) {
							alert(error);
						}
					});
		});

	$('#pwupdokint').on('click',function() {
				//alert("pwck 아이디"+$('#hdid').val());
				//alert("pwck 이름"+$('#hdmember_name').val());
				//alert("pwck 메일"+$('#hdmail').val());
				//alert("pwck 메일"+$('#pwpw').val());
				$.ajax({
							type : 'POST',
							url : 'pwupd.do',
							data : "id="+ $('#hdidint').val()+"&member_name="+$('#hdmember_nameint').val()+"&mail="+$('#hdmailint').val()
									+ "&pw="+ $('#pwpwint').val(),
							success : passsuc,
							error : function(xhr, textStatus, error) {
								alert(error);
							}
						});
				});
});

	function passsuc(aaa){
		alert("비밀번호 변경이 완료되었습니다.");
		$(".pwupdint").hide();
	}
	
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

.idpwformint {
	width: 600px;
	height: 300px;
	z-index: 1000000;
	margin:auto;
	background-color: white;
}

.idpwheaderint {
	width: 600px;
	height: 50px;
	background-color: white;
	border-bottom:4px solid black; 
	font-size:35px;
	font-weight: bold; 
	
	
}

.idpwheaderint p{
margin-left:5px;
}


.idfindint {
	width: 278px;
	height: 250px;
	background-color: white;
	/* border:1px solid black; */
	border-right: 1px solid black;
	z-index:100;
	padding:10px;
}

.pwfindint {
	width:280px;
	height: 250px;
	background-color: white;
	/* border:1px solid black; */
	margin-top: -270px;
	margin-left: 300px;
	padding:10px;
}

.pwupdint {
	/* position:absolute;	 */
	margin-top:-1400px;
	margin-left:0px;
	display: none;
	background-color: gray;
	z-index: 1000000;
	width: 2000px;
	height: auto;
	min-height: 1200px;
	background-color: rgba(255, 255, 255, 0.5);
}

.pwupdformint {
	width: 300px;
	height: 300px;
	z-index: 10000000;
	margin:auto;
	background-color: white;
	border: 2px solid black;
}


#updcloseint {
	width: 50px;
	height: 50px;
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


.idformint .signUpInput {
    outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
   width:180px;
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
}

.pwfindint .signUpInput {
    outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
   width:180px;
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
}

.pwupdint .signUpInput {
    outline: none;
  display: block;
  background: rgba(0, 0, 0, 0.1);
   width:180px;
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
          margin-top:100px;
          margin-left:40px; 
          margin:10px;
}


</style>

<div id="notloginint">
<img alt="" src="images/notlogin.gif">
</div>

<!-- 아이디 비밀번호 찾기 -->
	<div class="idpwformint">
		<div class="idpwheaderint">
		<p>Find</p>
		</div>
		<div class="idfindint">
			<span>아이디 찾기 이름과 이메일을 입력하시면 아이디를 알려드립니다.</span>
			<div class="idformint">
				<input type="text" id="member_nameint" name="member_name"
					placeholder="이름" class="signUpInput"> <input type="text" id="mailint" name="mail"
					placeholder="이메일 주소" class="signUpInput">
			</div>
			<div class="idbuttonint">
				<img id="idokint" src="images/button_ok2.png">
			</div>
		</div>
		<div class="pwfindint">
			<span>비밀번호 찾기 아이디, 이름, 이메일을 입력하시면 새로운 비밀번호로 변경할 수 있습니다.</span>
			<div class="pwformint">
				<input type="text" id="pwidint" name="id" placeholder="아이디" class="signUpInput"> <input
					type="text" id="pwmember_nameint" name="member_name" placeholder="이름" class="signUpInput">
				<input type="text" id="pwmailint" name="mail" placeholder="이메일 주소" class="signUpInput">
			</div>
			<div class="pwbuttonint">
				<img id="pwokint" src="images/button_ok.png">
			</div>
		</div>
	</div>

	<div class="pwupdint">
		<div class="pwupdformint">
			<table>
				<tr>
					<td><input type="password" name="pass" id="loginpassint" placeholder="비밀번호" class="signUpInput"></td>
				</tr>
				<tr>
					<td><input type="password" name="pw" id="pwpwint" placeholder="비밀번호 확인" class="signUpInput">
						<font id="logincheck" name="logincheckint" size="2"></font></td>
				</tr>
			</table>
			<input type="button" id="pwupdokint" value="확인">
			<button id="updcloseint" value="x"></button>
		</div>
	</div>
	
	
	<!-- <div id="hide">
	<input type="hidden" id="hdid" value="" name="id">
	<input type="hidden" id="hdmember_name" value="" name="member_name">
	<input type="hidden" id="hdmail" value="" name="mail">
	</div> -->



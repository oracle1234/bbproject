<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	
<script type="text/javascript">

$(document).ready(function(){
	
	$('.pwupd').hide();
	
	$("#pass").keyup(function(){
		$('font[name=check]').text('');
	});
	$('#pw').keyup(function(){
		if($("#pass").val()!=$("#pw").val()){
			$('#check').css("color","red");
			$('font[name=check]').text('');
			$('font[name=check]').html('비밀번호가 일치하지 않습니다.');
		}else{
			$('#check').css("color","green");
			$('font[name=check]').text('');
			$('font[name=check]').html('비밀번호가 일치합니다.');
		}
	});
	
	$('#idok').on('click',function(){
		//alert("idck 이름"+$('#member_name').val());
		//alert("idck 메일"+$('#mail').val());
		$.ajax({
			type:'POST',
			url: 'idfind.do',
			data : "member_name="+$('#member_name').val()+"&mail="+$('#mail').val(),
			success : function(data){
				alert(data);
			},
			error : function(xhr, textStatus, error) {
				alert(error);
			}
		});
	});
	
	$('#pwok').on('click',function(){
		//alert("pwck 아이디"+$('#id').val());
		//alert("pwck 이름"+$('#pwmember_name').val());
		//alert("pwck 메일"+$('#pwmail').val());
		$.ajax({
			type:'POST',
			url:'pwfind.do',
			data : "id="+$('#id').val()+"&member_name="+$('#pwmember_name').val()+"&mail="+$('#pwmail').val(),
			success : function(data){
				alert(data);
				if(data!="입력하신 이름과 이메일이 일치하는 회원이 없습니다."){
					alert("성공");
					$('.pwupd').show();
				}
			},
			error : function(xhr, textStatus, error) {
				alert(error);
			}
		});
	});
	
	$('#pwupdok').on('click',function(){
		$.ajax({
			type:'POST',
			url:'pwupd.do',
			data : "id="+$('#id').val()+"&member_name="+$('#pwmember_name').val()+"&mail="+$('#pwmail').val()+"&pw="+$('#pw').val(),
			success : passsuc,
			error: function(xhr, textStatus, error) {
	 			alert(error);
	 		}
		});
	});
	
});


function passsuc(aaa){
	alert("비밀번호 바꾸기 성공");
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="idpwfind">
<div class="idfind">
<span>아이디 찾기
이름과 이메일을 입력하시면 아이디를 알려드립니다.</span>
<div class="idform">
<input type="text" id="member_name" name="member_name" placeholder="이름">
<input type="text" id="mail" name="mail" placeholder="이메일 주소">
</div>
<div class="idbutton">
<input type="button" id="idok" value="확인">
</div>
</div>
<div class="pwfind">
<span>비밀번호 찾기
아이디, 이름, 이메일을 입력하시면 새로운 비밀번호로 변경할 수 있습니다.</span>
<div class="pwform">
<input type="text" id="id" name="id" placeholder="아이디">
<input type="text" id="pwmember_name" name="member_name" placeholder="이름">
<input type="text" id="pwmail" name="mail" placeholder="이메일 주소">
</div>
<div class="pwbutton">
<input type="button" id="pwok" value="확인">
</div>
</div>
<input type="button" id="close" value="닫기">
</div>

<div class="pwupd">
<table>
<tr>
<td><label for="pass">비밀번호</label></td>
<td><input type="password" name="pass" id="pass"></td>
</tr>
<tr>
<td class="label"><label for="pw">비밀번호확인</label></td>
<td class="form"><input type="password" name="pw" id="pw">
<font id="check" name="check" size="2"></font></td>
<input type="button" id="pwupdok" value="확인">
</tr>
</table>
</div>
</body>
</html>
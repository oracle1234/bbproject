<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".join").hide();
	
	$("#pwok").on("click", function(){
		$.ajax({
			type:'POST',
			url:'mypwcheck.do',
			data : "pw="+$('#pw').val(),
			success : function(data){
				alert(data);
			},
			error : function(xhr, textStatus, error) {
				alert(error);
			}
		});
	});
	
	$("#phone").keyup(function () {
	    if (this.value.length == this.maxLength) {
	        $("#phone2").focus();
	    }
	});
	
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
});
	
function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 도로명 조합형 주소 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
            if(fullRoadAddr !== ''){
                fullRoadAddr += extraRoadAddr;
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddress').value = fullRoadAddr;
            document.getElementById('address').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guide').innerHTML = '';
            }
        }
    }).open();
}
</script>
	<div class="mypage_body">
	<div class="password">
	<table>
<tr>
<td class="label"><label for="pw">비밀번호확인</label></td>
<td class="form"><input type="password" name="pw" id="pw">
<font id="check" name="check" size="2"></font></td>
</tr>
</table>
<input type="button" id="pwok" value="확인"> 
</div>

<div class="join">
<form action="joinInsert.do" method="post" enctype="application/x-www-form-urlencoded">
<fieldset>
<legend>회원정보 수정</legend>

<table>
<tr>
<td class="label"><label for="name">이름</label></td>
<td class="form"><input type="text" name="member_name" id="member_name" /></td>
</tr>

<tr>
<td class="label"><label for="id">아이디</label></td>
<td class="form"><input type="text" name="id" id="id" /><input type="button" id="button_idcheck" value="중복확인"></td>
</tr>

<tr>
<td class="label"><label for="pass">비밀번호</label></td>
<td class="form"><input type="password" name="pass" id="pass"></td>
</tr>

<tr>
<td class="label"><label for="pw">비밀번호확인</label></td>
<td class="form"><input type="password" name="pw" id="pw">
<font id="check" name="check" size="2"></font></td>
</tr>

<tr>
<td class="label"><label for="phone">휴대폰번호</label></td>
<td class="form"><select id="phoneselect">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
	<option value="018">018</option>
	<option value="019">019</option>
</select>
<span>-</span>
<input type="text" name="phone" id="phone" maxlength="4">
<span>-</span>
<input type="text" name="phone2" id="phone2" maxlength="4">
<input type="checkbox" id="messagree">문자메세지를 수신합니다.
<!-- <input type="hidden" id="tel" name="tel">-->
</td>
</tr>

<tr>
<td class="label2"><label for="mail">이메일</label></td>
<td class="form2"><input type="text" id="email"/><span>@</span>
<input type="text" name="mail2" id="mail2"/>
<select name="domain" id="domain">
<option value="::직접입력::">::직접입력::</option>
<option value="naver.com">naver.com</option>
<option value="daum.net">daum.net</option>
<option value="paran.com">paran.com</option>
<option value="empal.com">empal.com</option>
<option value="nate.com">nate.com</option>
<option value="yahoo.co.kr">yahoo.co.kr</option>
<option value="hotmail.com">hotmail.com</option>
</select>
<br><input type="checkbox" id="mailagree">반찬을부탁해에서 보내드리는 정보, 이벤트 메일을 받습니다
<!-- <input type="hidden" id="mail" name="mail"> --></td>
</tr>

<tr>
<td class="label2"><label for="addr">주소</label></td>
<td class="form2"><input type="text" id="sample4_postcode" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" id="map" value="우편번호 찾기"><br>
<input type="text" id="sample4_roadAddress" name="address" placeholder="도로명주소">
<input type="text" id="address" placeholder="지번주소"></td>
<span id="guide" style="color:#999"></span>
</tr>
</table>
</fieldset>


<p>
<input type="submit" value="확인" id="ok" />
<input type="reset" value="취소" />
</p>

</form>
</div>
	</div>

<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

var s_pw = "${sessionScope.member.pw}";
var s_id = "${sessionScope.member.id}";
var s_name = "${sessionScope.member.member_name}";

$(document).ready(function(){
	//alert(s_pw);
	$(".join").hide();
	
	$("#pwupok").on("click", function(){
		alert($('#pwck').val());
		if(s_pw==$("#pwckup").val()){
			$(".password").remove();
			$(".join").show();
			$("#member_nameup").attr("value",s_name);
			$("#idup").attr("value",s_id);
		}else{
			alert("비밀번호를 다시 입력해주세요.");
		}
	});
	
	$('#domainup').change(function(){
		if($('#domainup').val()!="::직접입력::"){
			$('#mail2up').attr("value",$('#domainup').val()).attr("readonly","true");
		//alert($('#domain').val());	
		}
	});
	
	$("#phoneup").keyup(function () {
	    if (this.value.length == this.maxLength) {
	        $("#phone2up").focus();
	    }
	});
	
	$("#passup").keyup(function(){
		$('font[name=check]').text('');
	});
	$('#pwup').keyup(function(){
		if($("#passup").val()!=$("#pwup").val()){
			$('#checkup').css("color","red");
			$('font[name=check]').text('');
			$('font[name=check]').html('비밀번호가 일치하지 않습니다.');
		}else{
			$('#checkup').css("color","green");
			$('font[name=check]').text('');
			$('font[name=check]').html('비밀번호가 일치합니다.');
		}
	});
	
	$("#okup").click(function () {
		
		$(".form2").append('<input type="hidden" id="mailup" name="mail">');
		$("#mailup").val($("#emailup").val()+"@"+$('#mail2up').val());
		//alert($("#mail").val());
		
		$(".form2").append('<input type="hidden" id="telup" name="tel">');
		$("#telup").val($('#phoneselectup').val()+"-"+$('#phoneup').val()+"-"+$('#phone2up').val());
		//alert($("#tel").val());
		
		$(".form2").append('<input type="hidden" id="addressup" name="address">');
	$("#addressup").val($('#sample4_roadAddressup').val()+"/"+$('#sangsaeup').val()+"/"+$('#sample4_postcodeup').val());
	//alert($("#address").val());
		
		if($("#member_nameup").val().length == 0 || $("#idup").val().length == 0 || $("#passup").val().length == 0 ||
				$("#pwup").val().length == 0 || $("#phoneup").val().length == 0 || $("#phone2up").val().length == 0 ||
				$("#emailup").val().length == 0 || $("#addressup").val().length == 0){
			alert("전부 입력해주세요.");
			if($("#member_nameup").val().length == 0){
				$('#member_nameup').focus();
			}
			
			if($("#idup").val().length == 0){
				 $('#idup').focus();
			}
			
			if($("#passup").val().length == 0){
				$('#passup').focus();
			}
			
			if($("#pwup").val().length == 0){
				$('#pwup').focus();
			}
			
			if($("#phoneup").val().length == 0){
				$('#phoneup').focus();
			}
			
			if($("#phone2up").val().length == 0){
				$('#phone2up').focus();
			}
			
			if($("#emailup").val().length == 0){
				$('#emailup').focus();
			}
			
			if($("#addressup").val().length == 0){
				$('#addressup').focus();
			}
		}
		else {
			if($("#passup").val()==$("#pwup").val()){
			$("a#okhrefup").attr("href","updsucc.do");
			$("#formup").attr('action','myupdate.do').attr('method','post').attr('onsubmit','true').submit();
			}else{
				alert("비밀번호가 일치하지 않습니다.");
			}
		}
		});
		
		var reg2 = /[^(a-zA-Z0-9ㄱ-ㅎㅏ-ㅣ가-힣)]/gi; // 영문자,숫자만 (대소문자 구분 x)
		var reg3 = /[^0-9a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/g; //특수문자는 반드시 포함되어야함
		var reg4 = /[0-9]/g; // 숫자는 반드시 포함되어야 함
		var reg5 = /[a-zA-Zㄱ-ㅎㅏ-ㅣ가-힣]/g; // 문자는 반드시 포함되어야 함

	 	
		$('#okup').on('click', function(){
			var pwreg =$('#passup').val();

			if(reg3.test(pwreg)){
				alert("pw true 3");
			} else {
				alert("특수문자는 반드시 포함되어야합니다.");
			}
			
			if(reg4.test(pwreg)){
				alert("pw true 4");
			} else {
				alert("숫자는 반드시 포함되어야합니다.");
			}
			
			if(reg5.test(pwreg)){
				alert("pw true 5");
			} else {
				alert("문자는 반드시 포함되어야합니다.");
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
            document.getElementById('sample4_postcodeup').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('sample4_roadAddressup').value = fullRoadAddr;
            document.getElementById('addressup').value = data.jibunAddress;

            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                //예상되는 도로명 주소에 조합형 주소를 추가한다.
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                document.getElementById('guideup').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                document.getElementById('guideup').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

            } else {
                document.getElementById('guideup').innerHTML = '';
            }
        }
    }).open();
}
</script>

<style>

.mypage_body .password{
width:950px;
height:100px;
border:1px solid gray;
}

fieldset{
width:900px;
background-color: white;
	z-index:100;
	margin-top:-15px;
	margin-left:-10px;
}



 .join{
	text-align: left;
	padding:10px;
	width:900px;
	height:500px;
	background-color: white;
	z-index:100;
} 

 .label{
	width:120px;
	height:40px;
}

.form{
	width:780px;
	height:40px;
}

.label2{
	width:120px;
	height:60px;
}

.form3{
	width:780px;
	height:60px;
} 


#passtable{
margin:auto;	
margin-top:30px;
}

.labelpass{
width:100px;
}

.formpass{
width:200px;
}

</style>
	<div class="mypage_body">
	<div class="password">
	<table id="passtable">
<tr>
<td class="labelpass"><label for="pw">비밀번호확인</label></td>
<td class="formpass"><input type="password" id="pwckup"></td>
</tr>
</table>
<input type="button" id="pwupok" value="확인"> 
</div>

<div class="join">
<form action="myupdate.do" method="post" enctype="application/x-www-form-urlencoded" id="formup" onsubmit="return false">
<fieldset>
<legend>회원정보 수정</legend>

<table>
<tr>
<td class="label"><label for="name">이름</label></td>
<td class="form"><input type="text" name="member_name" id="member_nameup" readonly style="background-color: rgb(219, 219, 219);"/></td>
</tr>

<tr>
<td class="label"><label for="id">아이디</label></td>
<td class="form"><input type="text" name="id" id="idup" readonly style="background-color: rgb(219, 219, 219);"></td>
</tr>

<tr>
<td class="label"><label for="pass">비밀번호</label></td>
<td class="form"><input type="password" name="pass" id="passup"></td>
</tr>

<tr>
<td class="label"><label for="pw">비밀번호확인</label></td>
<td class="form"><input type="password" name="pw" id="pwup">
<font id="checkup" name="check" size="2"></font></td>
</tr>

<tr>
<td class="label"><label for="phone">휴대폰번호</label></td>
<td class="form"><select id="phoneselectup">
	<option value="010">010</option>
	<option value="011">011</option>
	<option value="016">016</option>
	<option value="017">017</option>
	<option value="018">018</option>
	<option value="019">019</option>
</select>
<span>-</span>
<input type="text" name="phone" id="phoneup" maxlength="4">
<span>-</span>
<input type="text" name="phone2" id="phone2up" maxlength="4">
<input type="checkbox" id="messagreeup">문자메세지를 수신합니다.
<!-- <input type="hidden" id="tel" name="tel">-->
</td>
</tr>

<tr>
<td class="label2"><label for="mail">이메일</label></td>
<td class="form2"><input type="text" id="emailup"/><span>@</span>
<input type="text" name="mail2" id="mail2up"/>
<select name="domain" id="domainup">
<option value="::직접입력::">::직접입력::</option>
<option value="naver.com">naver.com</option>
<option value="daum.net">daum.net</option>
<option value="paran.com">paran.com</option>
<option value="empal.com">empal.com</option>
<option value="nate.com">nate.com</option>
<option value="yahoo.co.kr">yahoo.co.kr</option>
<option value="hotmail.com">hotmail.com</option>
</select>
<br><input type="checkbox" id="mailagreeup">반찬을부탁해에서 보내드리는 정보, 이벤트 메일을 받습니다
<!-- <input type="hidden" id="mail" name="mail"> --></td>
</tr>

<tr>
<td class="label2"><label for="addr">주소</label></td>
<td class="form2"><input type="text" id="sample4_postcodeup" placeholder="우편번호">
<input type="button" onclick="sample4_execDaumPostcode()" id="mapup" value="우편번호 찾기"><br>
<input type="text" id="sample4_roadAddressup" placeholder="도로명주소">
<input type="text" id="jibunup" placeholder="지번주소">
<input type="text" id="sangsaeup" placeholder="상세주소"></td>
<!-- <input type="hidden" id="address" name="address"> -->
<span id="guideup" style="color:#999"></span>
</tr>
</table>
</fieldset>


<p>
<a id="okhrefup" href=""><input type="submit" value="확인" id="okup" /></a>
<input type="reset" value="취소" />
</p>

</form>
</div>
	</div>

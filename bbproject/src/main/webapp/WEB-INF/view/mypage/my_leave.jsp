<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">
var s_pw = "${sessionScope.member.pw}";
var s_id = "${sessionScope.member.id}";
var s_name = "${sessionScope.member.member_name}";
$(document).ready(function(){
	//alert($('input[name=checkboxle]:checked').val());
	$(".leavele").hide();
	$("#hiddenle").hide();
	
	$("#pwokle").on("click", function(){
		if(s_pw==$("#pwckle").val()){
			$(".passwordle").remove();
			alert("비밀번호 확인되었습니다.");
			$(".leavele").show();
			$("#idle").attr("value",s_id);
			$("#pwle").attr("value",s_pw)
		}else{
			alert("비밀번호를 다시 입력해주세요.");
		}
	});
	
	$("#okle").click(function () {
		if($('input:checkbox[name="checkboxle"]:checked').length==0){

		// if($('input[name=checkboxle]').prop("unchecked")){
			alert("탈퇴 사유를 선택해주세요.");
			 
			} else {
				$("a#okhrefle").attr("href","leavesucc.do");
			$("#formle").attr('action','myleave.do').attr('method','post').attr('onsubmit','true').submit();
		}
		});
		
	
});
</script>

<style>

.mypage_body .passwordle{
width:300px;
height:200px;
margin:auto;
}

.labelleave{
width:100px;
}

.formleave{
width:200px;
}

#passtable{
margin:auto;	
margin-top:30px;
}

#uppwbtn{
width:140px;
height:40px;
}

#pwokle{
margin-top:10px;
}

.leavele{
width:250px;
height:400px;
margin:auto;
text-align: left;
margin-top:10px;
}

.leavele p{
text-align: center;
font-size: large;
}

.reason{
margin-top:10px;
}

#aa{
    margin-left: 90px;
}

.joinbut{
width:80px;
height:40px;
float: left;
}
/**/
#aa{
margin-left:30px;
margin-top:20px;
}

</style>
	<div class="mypage_body">
	<div class="passwordle">
	<table id="passtable">
<tr>
<td class="labelleave"><img id="uppwbtn" src="./images/button_pwck.png"></td>
<td class="formleave"><input type="password" name="pw" id="pwckle">
<font id="check" name="check" size="2"></font></td>
</tr>
</table>
<img id="pwokle" src="./images/btn_ok.gif"> 
</div>
<div class="leavele">
<form action="myleave.do" method="post" enctype="application/x-www-form-urlencoded" id="formle" onsubmit="return false">
	<p>탈퇴 사유<p>
	<ul class="reason">
	<li id="reason1"><input type="checkbox" name="checkboxle" >상품품질불만(맛)</li>
	<li id="reason2"><input type="checkbox" name="checkboxle" >상품품질불만(위생)</li>
	<li id="reason3"><input type="checkbox" name="checkboxle" >가격부담</li>
	<li id="reason4"><input type="checkbox" name="checkboxle" >타업체 이용</li>
	<li id="reason5"><input type="checkbox" name="checkboxle" >이용 빈도 낮음</li>
	<li id="reason6"><input type="checkbox" name="checkboxle" >새로운 아이디 생성을 위해</li>
	<li id="reason7"><input type="checkbox" name="checkboxle" >배송문제</li>
	<li id="reason8"><input type="checkbox" name="checkboxle" >포장문제</li>
	<li id="reason9"><input type="checkbox" name="checkboxle" >기타</li>
	</ul>
	
	<div id="aa">
	<a id="okhrefle" href=""><input type="submit" id="okle" value="확인" class="joinbut"/></a>
	
	<a href="mypage.do"><input type="button" id="nole" value="취소" class="joinbut"></a>
	</div>
	<div id="hiddenle">
	<input type="text" name="id" id="idle">
	<input type="text" name="pw" id="pwle">
	</div>
	</form>

	
	</div>
	
	</div>
	

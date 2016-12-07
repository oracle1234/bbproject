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
		

		if($("#otherreasonle").val().length == 0){
			alert("전부 입력해주세요.");
				 $('#otherreasonle').focus();
			} else {
				$("a#okhrefle").attr("href","joinsucc.do");
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

</style>
	<div class="mypage_body">
	<div class="passwordle">
	<table id="passtable">
<tr>
<td class="labelleave"><label for="pw">비밀번호확인</label></td>
<td class="formleave"><input type="password" name="pw" id="pwckle">
<font id="check" name="check" size="2"></font></td>
</tr>
</table>
<input type="button" id="pwokle" value="확인"> 
</div>
<div class="leavele">
<form action="myleave.do" method="post" enctype="application/x-www-form-urlencoded" id="formle" onsubmit="return false">
	탈퇴 사유
	<ul class="reason">
	<li id="reason1"><input type="checkbox" >상품품질불만(맛)</li>
	<li id="reason2"><input type="checkbox" >상품품질불만(위생)</li>
	<li id="reason3"><input type="checkbox" >가격부담</li>
	<li id="reason4"><input type="checkbox" >타업체 이용</li>
	<li id="reason5"><input type="checkbox" >이용 빈도 낮음</li>
	<li id="reason6"><input type="checkbox" >새로운 아이디 생성을 위해</li>
	<li id="reason7"><input type="checkbox" >배송문제</li>
	<li id="reason8"><input type="checkbox" >포장문제</li>
	<li id="reason9"><input type="checkbox" >기타</li>
	</ul>
	<div id="otherle">
	<input type="text" id="otherreasonle"> 
	</div>
	<a id="okhrefle" href=""><input type="submit" value="확인" id="okle" /></a>
	<input type="button" id="nole" value="취소">
	<div id="hiddenle">
	<input type="text" name="id" id="idle">
	<input type="text" name="pw" id="pwle">
	</div>
	</form>

	
	</div>
	
	</div>
	

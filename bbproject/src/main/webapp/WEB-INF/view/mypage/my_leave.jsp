<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("#ok").on("click", function(){
		$.ajax({
			type:'POST',
			url:'leave.do',
			data : "pw="+$('#pw').val(),
			success : function(data){
				alert(data);
			},
			error : function(xhr, textStatus, error) {
				alert(error);
			}
		});
	});
});
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
	<div id="other">
	</div>
	<input type="button" id="ok" value="확인">
	<input type="button" id="no" value="취소">
	</div>

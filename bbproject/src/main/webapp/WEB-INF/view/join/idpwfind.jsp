<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="idpwfind">
<form action="idfind.do" method="post" enctype="application/x-www-form-urlencoded"></form>
<form action="pwfind.do" method="post" enctype="application/x-www-form-urlencoded"></form>
<div class="idfind">
<span>아이디 찾기
이름과 이메일을 입력하시면 아이디를 알려드립니다.</span>
<div class="idform">
<input type="text" id="id" name="id" placeholder="이름">
<input type="text" id="mail" name="mail" placeholder="이메일 주소">
</div>
<div class="idbutton">
<input type="submit" id="idok" value="확인">
</div>
</div>
<div class="pwfind">
<span>비밀번호 찾기
아이디, 이름, 이메일을 입력하시면 새로운 비밀번호로 변경할 수 있습니다.</span>
<div class="pwform">
<input type="text" id="member_name" name="member_name" placeholder="아이디">
<input type="text" id="id" name="id" placeholder="이름">
<input type="text" id="mail" name="mail" placeholder="이메일 주소">
</div>
<div class="pwbutton">
<input type="submit" id="pwok" value="확인">
</div>
</div>
<input type="button" id="close" value="닫기">
</div>
</body>
</html>
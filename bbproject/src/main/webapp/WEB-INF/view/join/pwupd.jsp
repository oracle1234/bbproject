<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script type="text/javascript">


</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="pwupd">
<table>
<tr>
<td class="label"><label for="pass">비밀번호</label></td>
<td class="form"><input type="password" name="pass" id="pass"></td>
</tr>
<tr>
<td class="label"><label for="pw">비밀번호확인</label></td>
<td class="form"><input type="password" name="pw" id="pw">
<font id="check" name="check" size="2"></font></td>
</tr>
</table>
<input type="submit" id="pwok" value="확인">
</div>
</body>
</html>
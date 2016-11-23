<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="stylesheet" href="css/login.css">
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {
		
		
	
	});
	
	function chkfun() {
		$.ajax({
			type : "POST",
			datatype : "json",
			url : "loginpro.do",
			data : "id="+$("#id").val()+"&pw="+$("#pw").val(),
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function (data) {
				if(data.chk == null){
					alert(data.href);
			        window.location.href = data.href;       
				}else{
					alert(data.chk);					
				}
				
				
				
			},
			error : function(xhr, textStatus, error) {
				alert(error);
			}
		});
		
	};
	
</script>

</head>

<body>

		<div class="login">
			<div class="login-screen">
				<div class="app-title">
					<h1>Login</h1>
				</div>

				<div class="login-form">
					<div class="control-group">
						<input type="text" class="login-field" value=""
							placeholder="username" id="id" name="id"> <label
							class="login-field-icon fui-user" for="login-name"></label>
					</div>

					<div class="control-group">
						<input type="password" class="login-field" value=""
							placeholder="password" id="pw" name="pw"> <label
							class="login-field-icon fui-lock" for="login-pass"></label>
					</div>

					<a class="btn btn-primary btn-large btn-block" href="javascript:chkfun()">login</a>
					<a class="login-link" href="#">Lost your password?</a>
				</div>
			</div>
		</div>


</body>
</html>

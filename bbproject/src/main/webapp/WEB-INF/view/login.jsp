<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form</title>
<link rel="stylesheet" href="css/login.css">
</head>

<body>
	<form action="loginpro.do" method="post">
		<div class="login">
			<div class="login-screen">
				<div class="app-title">
					<h1>Login</h1>
				</div>

				<div class="login-form">
					<div class="control-group">
						<input type="text" class="login-field" value=""
							placeholder="username" id="login-name"> <label
							class="login-field-icon fui-user" for="login-name"></label>
					</div>

					<div class="control-group">
						<input type="password" class="login-field" value=""
							placeholder="password" id="login-pass"> <label
							class="login-field-icon fui-lock" for="login-pass"></label>
					</div>

<!-- 					<a class="btn btn-primary btn-large btn-block" href="#">login</a> -->
					<input type="submit" class="btn btn-primary btn-large btn-block" href="#" value="login">
					<a class="login-link" href="#">Lost your password?</a>
				</div>
			</div>
		</div>
	</form>


</body>
</html>

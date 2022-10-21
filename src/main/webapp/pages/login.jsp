<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar" style="background-color: #cafcdc;">
		<h1>Login Page</h1>
	</nav>

	<div class="m-1 p-4">
		<form action="login" method="post" onsubmit="return loginValidation()">
			${invalid}
			<div class="form-group row">
				<label class="col-2">Username</label><input type="text"
					class="col-3" name="uname" placeholder="username" id="username"
					required />
			</div>
			<div class="form-group row">
				<label class="col-2">Password</label><input type="password"
					class="col-3" name="pass" placeholder="password" id="password"
					required />
			</div>
			<div class="form-group row">
				<div class="col-sm-10">
					<input type="submit" class="btn btn-primary" value="Login" />
				</div>
			</div>
		</form>
		<div id="uploadError"></div>
	</div>
	<script type="text/javascript">
		function loginValidation() {
			var usernameLength = document.getElementById("username").value.length;
			var passwordLength = document.getElementById("password").value.length;
			if (usernameLength<5 || usernameLength>50
					|| passwordLength<5 || passwordLength>50) {
				document.getElementById("uploadError").innerHTML = "<div id=\"invalid\"class=\"alert alert-danger\" role=\"alert\">\r\n"
						+ "					<span>Username and password must be within the range of 5 to 50 characters only!</span>\r\n"
						+ "				</div>";
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
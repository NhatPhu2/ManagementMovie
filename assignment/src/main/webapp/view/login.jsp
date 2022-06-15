<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to login</title>
<style><%@include file="/WEB-INF/css/start.css"%></style>
<style><%@include file="/WEB-INF/css/login.css"%></style>
</head>
<body>

<header class="showcase">
			<div  class="showcase-top">
			<img alt="" src="/assignment/images/netflix.png">
			</div>
			<div style="margin-top: 0rem; text-align: left;" class="showcase-content">
			 <div class="login-container">
			 <form action="/assignment/Login" method="post">
			 	<div class="form-login">
					<h1 style="font-size: 32px;">Sign In</h1>
					
					<div class="input-login">
					<div class="ip-lg">
					
					<input class="ip"  type="text" name="lg-user" value="${user}" placeholder="Email or phone number"/>
					<div class="input-error">${messageError.userAccount}</div>
					</div>
					
					<div class="ip-lg">
					<input class="ip"  type="password" name="lg-pass" value="${pass}" placeholder="Password"/>
					<div class="input-error">${messageError.password}</div>	
					
					</div>
					

					</div>
				
					<button formaction="/assignment/Login" class="btn-signin">Sign In</button>
					<div class="remem-help">
						<input style="color: #000; font-size: 18px;" ${status} name="remember" type="checkbox"/><label>Remember me</label>
						<a href="#">Need help?</a>
					</div>
				</div>
			</form>
				<div class="sign-up">
					<div class="to-signup">New to Netflix? <a href="/assignment/view/register.jsp"> Sign up now.</a></div>
					<div class="little-info">
						<span>This page is protected by Google reCAPTCHA to ensure you're not a bot. 
						<a href="#"> Learn more.</a></span>
					</div>
				
				</div>
			 </div>
				
				
			</div>
		</header>
</body>
</html>
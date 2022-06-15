<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to login</title>
<style>
<%@include file="/WEB-INF/css/start.css"%>
<%@include file="/WEB-INF/css/login.css"%>

</style>

</head>
<body>
<header class="showcase">
			<div  class="showcase-top">
			<img alt="" src="/assignment/images/netflix.png">
		</div>
			<div style="margin-top: 0rem; text-align: left;" class="showcase-content">
			 <div class="login-container">
			 	<div class="form-login">
					<h1 style="font-size: 32px;">Sign Up</h1>
					<form action="" method="post">
					<div class="input-login">
					<div class="ip-lg"><input class="ip"  required="required" value="${acc}" name="id" type="text" placeholder="Account Name"/><div class="input-error">${messageError.account}</div></div>
					<div class="ip-lg"><input class="ip"  required="required" value="${full}" name="fullName" type="text" placeholder="Enter fullName"/><div class="input-error">${messageError.fullname}</div></div>	
					<div class="ip-lg"><input class="ip"  required="required" value="${pass}" name="passwords" type="text" placeholder="Password"/><div class="input-error">${messageError.password}</div></div>	
					<div class="ip-lg"><input class="ip"  required="required" value="${rep}" name="re-pass" type="text" placeholder="Re-password"/><div class="input-error">${messageError.repassword}</div></div>					
					<div class="ip-lg"><input class="ip"  required="required" value="${ema}" name="email" type="text" placeholder="Email"/><div class="input-error">${messageError.email}</div></div>	
					</div>
				
					<button formaction="/assignment/Register" class="btn-signin">Sign Up</button>
					</form>
					<div class="remem-help">
						<a href="#">Need help?</a>
					</div>
				</div>
				
				<div class="sign-up">
					<div class="to-signup">Already have an account? <a href="/assignment/view/login.jsp"> Sign In now.</a></div>
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
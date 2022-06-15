<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
<style>
.ct {
	background-color: white;
	margin-top: 60px;
	height: 693px;
}

.ct-info {
	display: inline-block;
	float: left;
	width: 50%;
}

.ct-info a {
	display: block;
}

.t-acc {
	color: #333;
	font-size: 24px;
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
	padding-top: 10px;
	margin-left: 51px;
}

.personal-info {
	margin-left: 50px;
	font-size: 21px;
}
.ct-info input{
	border: none;
	outline: none;
	font-size: 21px
}
</style>
</head>
<body>

	<%@include file="header.jsp"%>
	<div class="ct">
		<div class="t-acc">Account</div>

		<hr>
		<div class="personal-info">
			<div class="ct-info">
			<form  action="" id="save-form" method="post">
				<p>Email: <input type="text" value="${userProfile.email}" name="email">   </p>
				<p>Password: <input type="text" value="${userProfile.passwords}" name="passwords"></p>
				<p>FullName: <input type="text" value="${userProfile.fullName}" name="fullName"></p>
				<button  formaction="/assignment/profile/save">Save</button>
			</form>
			</div>
		</div>

	</div>
</body>
</html>
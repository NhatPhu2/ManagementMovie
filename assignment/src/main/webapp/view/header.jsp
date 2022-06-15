<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
<%@include file="/WEB-INF/css/header.css"%>
</style>



<script src="https://kit.fontawesome.com/fc8a291d5f.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<!--header -->
	<header id="heading">
		<div class="sub">
			<a href="#" class="subhead netflix-logo"> <img
				src="/assignment/images/netflix.png" alt=""></a>
			<div class="subhead">
				<ul id="head-ul">
					<li><a href="/assignment/HomeServlet">Home</a></li>
					<li><a href="">TV Shows</a></li>
					<li><a href="">Movies</a></li>
					<li><a href="">New & Popular</a></li>
					<li><a href="/assignment/MyList">My List</a></li>
				</ul>
			</div>
			<div class="down right-heading">
				<i class="fa-solid fa-caret-up" style="display: none;"></i> <i
					class="fa-solid fa-sort-down"></i>
			</div>
			<div class="right-heading profile">
				<div style="height: 60px;">
					<ul id="sub-profile">
						<li><img src="/assignment/images/man.png" alt="">

							<ul class="sub-menu">
								<li><a href="/assignment/profile/save">Account</a></li>
								<li><a href="">Help</a></li>
								<li><a href="/assignment/logout">Logout</a></li>
							</ul></li>
					</ul>
				</div>

			</div>

			<div class="right-heading bell">
				<i class="fa-solid fa-bell"></i>
			</div>

			<div class="right-heading search">
				<form style="display: none" id="form-search" method="get"
					action="/assignment/SearchMovie"></form>
				<input onchange="this.form.submit()" type="text" form="form-search"
					name="value-search" value="${keyword}" class="search-key"
					placeholder=" Movies,Genre..."> <i
					class="fa-solid fa-magnifying-glass"></i>
			</div>

		</div>
	</header>
	
	<%--Search animation --%>
	<script><%@include file="/WEB-INF/js/searchAnimation.js"%></script>

	<%--change background header color scroll-down --%>
	<script><%@include file="/WEB-INF/js/scrollDown.js"%></script>


	

</body>
</html>










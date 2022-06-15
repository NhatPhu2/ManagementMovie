<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My list</title>
<style>
<%@include file ="/WEB-INF/css/content.css"%> 
<%@include file ="/WEB-INF/css/header.css"%>
.slider {
	transition: transform 1000ms ease-in-out;
	display: inline-block;
	margin-left: 46px;
}

.slider .items-movie {
	display: inline-block;
	cursor: pointer;
	padding: 0;
	margin-bottom: 50px;
}

.content-movie {
	margin-top: 75px;
}

h3 {
	color: white;
	font-family: 'Netflix Sans', 'Helvetica Neue', Helvetica, Arial,
		sans-serif;
	display: inline-block;
	font-weight: 500;
	font-size: 14px;
	margin-left: 48px;
}
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

</head>
<body>
	<div class="container">
		<!--header -->
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
						action="/assignment/MyList"></form>
					<input onchange="this.form.submit()" type="text" form="form-search"
						autofocus="autofocus" name="value-search" value="${keyword}"
						class="search-key" placeholder="Title"><i
						class="fa-solid fa-magnifying-glass"></i>
				</div>

			</div>

		</header>
		<!--content -->
		<div class="content-movie">
			<h3>My List</h3>
			<%--list film--%>
			<div class="list-film">
				<div class="row">
					<div class="slider">
						<c:forEach var="listFv" items="${listFavorite}">
							<div class="items-movie ">
								<img class="img-video"
									onclick="movieDetail('${listFv.video.idVideo}')" width="230px"
									height="130px" src="/assignment/images/${listFv.video.poster}"
									alt="">

								<div class="action">
									<button formmethod="post"
										onclick="playMovie('${listFv.video.idVideo}')"
										class="play-button">
										<i style="font-size: 29px;" class="fa-solid fa-circle-play"></i>
									</button>
									
									<button onclick="removeFavorite('${listFv.id}')"
										value="${item.video.idVideo}" class="right-font like-btn"
										title="Like">
										<i  onclick="removeFavorite('${listFv.id}')" class="fa-solid fa-circle-minus like"></i>
									</button>

									<button onclick="share(this)" value="${listFv.video.idVideo}"
										class="right-font share-bt" title="Share">
										<i class="fa-solid fa-share"></i>
									</button>

									<button class="right-font info-detail"
										onclick="movieDetail('${listFv.video.idVideo}')"
										title="More Info">
										<i class="fa-solid fa-circle-chevron-down "></i>
									</button>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>

	</div>

	<%@include file="movieDetail.jsp"%>
	<%@include file="modalshare.jsp"%>

	<%--Search animation --%>
	<script><%@include file="/WEB-INF/js/searchAnimation.js"%></script>

	<%--change background color scroll-down --%>
	<script><%@include file="/WEB-INF/js/scrollDown.js"%></script>


	<script>
	//call remove favorite to servlet
		function removeFavorite(idFv){
			document.location.href="/assignment/mylist/removeFavorite?idFv="+idFv;
		}
	
	
	<%@include file="/WEB-INF/js/searchMovie.js"%>
		
	<%@include file="/WEB-INF/js/home.js"%>
		
	</script>


</body>


</html>
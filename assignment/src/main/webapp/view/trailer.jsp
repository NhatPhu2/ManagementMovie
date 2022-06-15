<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>trailer</title>
<style>
<%@include file="/WEB-INF/css/trailer.css"%>
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<%--Trailer video--%>
	<div class="trailer">
		<div class='video-wrapper'>
			<%-- random trailer when page refresh --%>
			<iframe style="pointer-events: none;"  frameborder="0"
				allow="autoplay;"
				src="http://www.youtube.com/embed/${trailer[0].idVideo}?autoplay=1&mute=1&controls=0&loop=1&playlist=${trailer[0].idVideo}"></iframe>
		</div>
		<div class="trailer-video">

			<h1 class="title-logo">${trailer[0].title}</h1>
			<p class="description">${trailer[0].descriptions}</p>
			<div>
				<button onclick="playMovie( '${trailer[0].idVideo}')"
					class="info play-video">
					<i class="fa-solid fa-play"></i>Play
				</button>
				<button onclick="movieDetail('${trailer[0].idVideo}')"
					style="opacity: 0.9;" class="info info-film">
					<i class="fa-solid fa-circle-exclamation"></i>More Info
				</button>
			</div>

		</div>
		<div class="limit-age">
			<p>16+</p>
		</div>

		<div class="genres">
			Movies
			<div class="dropdown">
				<button onclick="myFunction()" class="dropbtn">
					Genres <i class="fa-solid fa-sort-down down-genre"></i>
				</button>
				<div id="myDropdown" class="dropdown-content">
					<c:set var="count" value="0" />
					<c:set var="currentIndex" value="0" />
					<c:forEach var="column" begin="0" end="2"><%-- select all genre and split 2 --%>
						<ul class="sub-genre">
							<c:forEach var="rows" begin="0" end="${genres.size()}">
								<c:if test="${count < 6}">
									<li><a
										href="/assignment/HomeServlet?genre=${genres[currentIndex].genre}">${genres[currentIndex].genre}</a></li>
									<c:set var="count" value="${count + 1}" />
									<c:set var="currentIndex" value="${currentIndex + 1}" />
								</c:if>

							</c:forEach>
						</ul>
						<c:set var="count" value="${count = 0}" />
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<script>
		/* When the user clicks on the button, 
		 toggle between hiding and showing the dropdown content */
		function myFunction() {
			document.getElementById("myDropdown").classList.toggle("show");
		}
		// Close the dropdown if the user clicks outside of it
		window.onclick = function(event) {
			if (!event.target.matches('.dropbtn')) {
				var dropdowns = document.getElementsByClassName("dropdown-content");
				var i;
				for (i = 0; i < dropdowns.length; i++) {
					var openDropdown = dropdowns[i];
					if (openDropdown.classList.contains('show')) {
						openDropdown.classList.remove('show');
					}
				}
			}
		}
	</script>
</body>
</html>



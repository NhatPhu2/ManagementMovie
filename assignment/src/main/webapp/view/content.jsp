<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content</title>
<style>
<%@
include file="/WEB-INF/css/content.css"%>
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<!--content -->
	<div class="content-movie">
		<%--list film--%>
		<%--Chia phim theo từng thể loại --%>
		<c:forEach var="rows" items="${genresByVideo}">

			<div class="list-film">
				<%--title--%>
				<div class="title-header">
					<a href="" class="title">${rows.genre}</a>
					<%--progress bar--%>
					<div class="progress-bar"></div>
				</div>

				<div class="row">
					<div class="handle left-handle">
						<i class="fa-solid fa-angle-left"></i>
					</div>
					<div class="slider">

						<c:forEach var="item" items="${videos}">
							<%-- duyệt video theo từng thẻ loại --%>
							<c:if test="${item.genreVideo.idGenre == rows.idGenre}">
								<div class="items-movie ">
									<img class="img-video" onclick="movieDetail('${item.idVideo}')"
										width="230px" height="130px"
										src="/assignment/images/${item.poster}" alt="">

									<div class="action">
										<button onclick="playMovie('${item.idVideo}')" class="play-button">
											<i style="font-size: 29px;" class="fa-solid fa-circle-play"></i>
										</button>

										<button onclick="likeVideo('${item.idVideo}')" value="${item.idVideo}"  class="right-font like-btn" title="Like">
											<i class="fa-solid fa-heart like"></i>
										</button>

										<button onclick="share(this)" value="${item.idVideo}" class="right-font share-bt" title="Share">
											<i class="fa-solid fa-share"></i>
										</button>

										<button class="right-font info-detail"
											onclick="movieDetail('${item.idVideo}')" title="More Info">
											<i class="fa-solid fa-circle-chevron-down "></i>
										</button>
									</div>
								</div>
							</c:if>


						</c:forEach>
					</div>


					<div class="handle right-handle">
						<i class="fa-solid fa-angle-right"></i>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
	
	
	<script>
		
	<%@include file="/WEB-INF/js/slider.js"%>
		
	</script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
<%@include file="/WEB-INF/css/movieDetail.css"%>
</style>
<link rel="stylesheet"
	href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
</head>
<body>
	<div class="modal" >
		<div class="modal-container">
			<header id="modal-header">
				<div class="images" id="image-background"></div>

				<div class="action-button">
				<%-- set the idVideo detail for click to watch movie --%>
				<input id="vdId" type="hidden"  name = "play-detail">
					
					<button class="font-button play-detail" onclick="playMovie(vdId())">
					
					<i class="fa-solid fa-play"> <span>Play</span>  </i>
					
					</button>
			
					
					
				
					<button class="font-button share" onclick="share(videoIdForShare())"  class="right-font share-bt detail-button" title="Share">
							<i class="fa-solid fa-share"></i>
					</button>
				
					
					<button onclick="likeVideo(vdId())" class="font-button">
						<i class="fa-solid fa-heart detail-button" id="heart-detail"></i>
					</button>
				</div>

				<i class="fa-solid fa-circle-xmark close"></i>
			</header>

			<div class="modal-body">
				<div class="modal-left">
					<div class="time-release">
						<div class="time-movie">2019</div>
						<div class="time-movie">
							1g 39ph<i class="fa-thin fa-high-definition"></i>
						</div>
					</div>


					<div class="description">
						<p id="description">Description</p>

					</div>
				</div>

				<div class="modal-right">
					<h3 id="director">Director</h3>
					<h3 id="actor">Actor</h3>
					<h3 id="genre">Genres</h3>
				</div>
			</div>
		</div>
	</div>
<script> 
<%@include file="/WEB-INF/js/modalDetail.js"%>
//get the value play to watch
function vdId() {
	var value = document.getElementById('vdId').value;
	return value;
}
function videoIdForShare() {
	var value = document.getElementById('vdId');
	return value;
}

</script>

</body>
</html>
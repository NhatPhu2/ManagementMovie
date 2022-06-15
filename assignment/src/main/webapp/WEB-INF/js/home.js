//call to watchMovieServlet with parameter
function playMovie(idVideo) {
	document.location.href = 'WatchMovie?idPlay=' + idVideo;
}

//when clicking more-info button get idVideo then set value for detail
function movieDetail(id) {
	$.ajax({
		type: 'POST',
		headers: {
			Accept: "application/json; charset=utf-8",
			"Content-Type": "application/json; charset=utf-8"
		},
		url: '${pageContext.request.contextPath }/Home/detailVideo?idVideo=' + id,
		success: function(result) {
			//get array value with 2 object Video and listVideoFavoriteUser parsed as string json and parse it to json object
			var detailMovie = $.parseJSON(result);//index 0 is object Video and 1 is listVideoFavoriteUser object
			for (let i = 0; i < detailMovie[1].length; i++) {
				if (detailMovie[1][i].idVideo === id) {// found break loop
					$('#heart-detail').css('color', 'red');
					break;
				} else {
					$('#heart-detail').css('color', 'black');
				}
			}

			$('#description').html("Description: " + detailMovie[0].descriptions);

			$('#actor').html("Actor: " + detailMovie[0].actor);

			//set the value for hidden field movieDetail
			$('input[name="play-detail"]').val(id);

			$('#director').html("Director: " + detailMovie[0].director);

			$('#genre').html("Genre: " + detailMovie[0].genreVideo.genre);
			$('#image-background').css('background'
				, 'linear-gradient( rgba(20, 20, 20, 0) 0%,rgba(20, 20, 20, 0) 0%,rgba(20, 20, 20, 0) 80%,rgba(20, 20, 20, 100) 100%),url("/assignment/images/' + detailMovie[0].poster + '") left top / cover no-repeat');
		}
	});
}





//likeVideo
function likeVideo(idVideo) {
	$.ajax({
		type: 'POST',
		headers: {
			Accept: "application/json; charset=utf-8",
			"Content-Type": "application/json; charset=utf-8"
		},
		url: '${pageContext.request.contextPath}/Home/checkStatus?idVideo=' + idVideo,
		success: function(result) {
			
			var videoLikedOrunLiked = $.parseJSON(result);//list object Video liked of user or null if not exits 
			if (videoLikedOrunLiked === null) {//if null click to like video
				$.ajax({
					type: 'POST',
					headers: {
						Accept: "application/json; charset=utf-8",
						"Content-Type": "application/json; charset=utf-8"
					},
					url: '${pageContext.request.contextPath}/Home/likeVideo?idVideo=' + idVideo,
					success: function(result) {
						loadstatus();//refresh color like iconheart
					}
				})
			} else {// if not null click to unlike
				$.ajax({
					type: 'POST',
					headers: {
						Accept: "application/json; charset=utf-8",
						"Content-Type": "application/json; charset=utf-8"
					},
					url: '${pageContext.request.contextPath}/Home/unLikeVideo?idVideo=' + idVideo,
					success: function(result) {
						loadstatus();//refresh color like iconheart
					}
				})
			}


		}
	})
}

//call to loadStatus servlet after has loaded
function loadstatus() {
	$(document).ready(function() {
		$.ajax({
			type: 'GET',
			headers: {
				Accept: "application/json; charset=utf-8",
				"Content-Type": "application/json; charset=utf-8"
			},
			url: '${pageContext.request.contextPath }/Home/loadStatus',
			success: function(result) {
				//object Video at loadStatus servlet return here 
				// and parse it to json
				var likedVideo = $.parseJSON(result);

				if (likedVideo.length != 0) {//if favorite of user is not empty set color for heart icon
					var heartIcon = document.getElementsByClassName("like"); // this get all class of heart icon
					var btnHeart = document.querySelectorAll(".like-btn"); // this  get all of like button
					var indexHeart = [];
					for (let i = 0; i < likedVideo.length; i++) {
						for (let j = 0; j < btnHeart.length; j++) {
							if (likedVideo[i].idVideo === btnHeart[j].value) {
								//save index of heart if liked
								indexHeart.push(j);
							} else {//if unlike set color black
								heartIcon[j].style.color = "black";
							}

						}
					}
				
					for (let h = 0; h < indexHeart.length; h++) {
						heartIcon[indexHeart[h]].style.color = "red"//set color red liked
					}

				}
			}
		});
	});

}

loadstatus();






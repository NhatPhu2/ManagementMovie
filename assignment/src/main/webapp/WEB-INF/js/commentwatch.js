//auto resize when enter new line textarea

const tx = document.getElementsByTagName("textarea");
for (let i = 0; i < tx.length; i++) {
	tx[i].setAttribute("style", "height:" + (tx[i].scrollHeight)
		+ "px;overflow-y:hidden;");
	tx[i].addEventListener("input", OnInput, false);
}

function OnInput() {
	this.style.height = "auto";
	this.style.height = (this.scrollHeight) + "px";
}




/* When the user clicks on the button, 
 toggle between hiding and showing the dropdown content */

function myFunction(index) {
	var show = document.querySelectorAll("#myDropdown");
	show[index].classList.add("show");
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
	if (!event.target.matches('.dropbtn')) {
		var dropdowns = document
			.getElementsByClassName("dropdown-content");
		var i;
		for (i = 0; i < dropdowns.length; i++) {
			var openDropdown = dropdowns[i];
			if (openDropdown.classList.contains('show')) {
				openDropdown.classList.remove('show');
			}
		}
	}
}
var contai = document.querySelector("#content-comment");
contai.addEventListener('click', function(event) {
	event.stopPropagation();
});





//check when page loaded if comment is empty disabled comment button
$(document).ready(function() {
	var text = $('.text-area').val();
	if (text.trim() === "") {
		$('.btn-comment').attr('disabled')
		$('.btn-comment').css('background-color', 'gray');
	}
})

//if comment is empty disabled comment button
function statusComment() {
	var text = $('.text-area').val();
	if (text.trim() === "") {
		$('.btn-comment').attr('disabled');
		$('.btn-comment').css('background-color', 'gray');
	} else {
		$('.btn-comment').removeAttr('disabled');
		$('.btn-comment').css('background-color', '#065fd4');
	}
}
//add new comment
function addComment() {
	$
		.ajax({
			type: 'GET',
			headers: {
				Accept: "application/json; charset=utf-8",
				"Content-Type": "application/json; charset=utf-8"
			},
			url: '${pageContext.request.contextPath }/watchMovie/addComment?text='
				+ $('.text-area').val(),//call to servlet and get the para of textarea
			success: function(result) {

				//get an object comment returned by watchMovieServlet
				var commentVideo = $.parseJSON(result);

				//add new comment html
				$(document)
					.ready(
						function() {
							$("#content-comment")
								.append(
									"<div class='user-comment'>"

									+ "<div>"
									+ "<div class='edit'>"
									+ "<button>"
									+ "<i class='fa-light fa-ellipsis-vertical'></i>"

									+ "</button>"

									+ "</div>"

									+ "<div class='user-info'>"
									+ "<div class='name-user'>"
									+ " "
									+ commentVideo.userComment.fullName
									+ " <span class='date-comment'>"
									+ commentVideo.dateComment
									+ "</span>"
									+ "</div>"

									+ "</div>"

									+ "<div class='edit-text'>"
									+ "<div class='text'>"
									+ commentVideo.text
									+ "</div>"
									+ "</div>"

									+ "</div>"

									+ "</div>");
						});

				$('.text-area').val('')
				statusComment()
			}

		})
}
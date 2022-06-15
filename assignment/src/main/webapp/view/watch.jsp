<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Watch</title>
<style type="text/css">
<%@
include file ="/WEB-INF/css/trailer.css"%>
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.fa-solid.fa-arrow-left-long {
	position: absolute;
	font-size: 50px;
	color: white;
	top: 41px;
	left: 22px;
	cursor: pointer;
}

.video:hover a {
	transition-delay: 0s;
	opacity: 1;
	cursor: none;
}

a {
	opacity: 0;
	transition: opacity 0s 3s;
}

textarea {
	border: none;
	/* width: 165px; */
	resize: none;
	width: 100%;
	border-bottom: 2px solid;
	overflow-y: hidden;
	outline: none;
	padding-top: 20px;
	font-size: 17px;
}

.comment {
	width: 50%;
	margin-top: 30px;
	margin-left: 50px;
}

.btn {
	width: 100%;
	overflow: hidden;
}

.btn button {
	float: right;
	float: right;
	border: none;
	padding: 7px;
	font-size: 16px;
	margin-left: 2px;
	cursor: pointer;
}

.btn-cancel {
	background-color: white;
}

.btn-comment {
	background-color: #065fd4;
	color: white;
}

.add-comment {
	
}

.user-comment {
	margin-top: 10px;
	margin-bottom: 20px;
}

.edit {
	float: right;
	line-height: 29px;
}

.text {
	width: 80%;
}

.date-comment {
	color: gray;
	margin-left: 6px;
}

.user-info {
	font-family: Arial, Helvetica, sans-serif;
}

.edit-text {
	font-size: 15px;
	font-family: Arial, Helvetica, sans-serif;
	margin-top: 10px;
}

.edit-text button {
	cursor: pointer;
}

.fa-ellipsis-vertical {
	font-size: 24px;
	color: black;
}

.edit button {
	border: none;
	background-color: white;
	cursor: pointer;
}

.dropdown-content {
	position: absolute;
	background-color: #f1f1f1;
	min-width: 131px;
	overflow: auto;
	box-shadow: 0px 8px 16px 0px rgb(0 0 0/ 20%);
	z-index: 1;
	/* background-color: rgba(0, 0, 0, .9); */
	left: 0px;
	background-color: white;
	border-radius: 5px;
}
</style>
<link rel="stylesheet"
	href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<div class="video">
		<iframe aria-disabled="true" height="753px" frameborder="0"
			width="100%" allow="autoplay" allowfullscreen="true"
			src="https://www.youtube.com/embed/${playMovie}"></iframe>
		<a href="/assignment/HomeServlet"><i
			class="fa-solid fa-arrow-left-long"></i></a>
	</div>
	<div class="comment">
		<div class="add-comment">
			<form style="display: none;"
				action="/assignment/watchMovie/addComment" method="get"
				id="form-message"></form>
			<textarea oninput="statusComment()" class="text-area"
				form="form-message" rows="1" name="textComment"
				placeholder="Add a comment..."></textarea>
			<div class="btn">
				<button class="btn-comment" value="" onclick="addComment()">COMMENT</button>
				<button form="form-message" type="reset" class="btn-cancel">CANCEL</button>
			</div>
		</div>

		<div id="content-comment">
			<c:set var="index" value="0" />
			<c:forEach var="rows" items="${loadComment}">

				<div class="user-comment">
					<div>
						<div class="edit">
							<div class="dropdown">
								<button onclick="myFunction('${index}')" class="dropbtn">
									<i onclick="myFunction('${index}')"
										class="fa-light fa-ellipsis-vertical "></i>
								</button>
								<div id="myDropdown" class="dropdown-content">

									<ul class="sub-genre">

										<li><button class="btn-edit">Edit</button></li>
										<li><button class="btn-remove">Remove</button></li>

									</ul>

								</div>
							</div>
							<c:set var="index" value="${index+1}" />
						</div>
						<div class="user-info">

							<div class="name-user">
								${rows.userComment.fullName}<span class="date-comment">${rows.dateComment}</span>
							</div>

						</div>

						<div class="edit-text">

							<div class="text">${rows.text}</div>
						</div>

					</div>

				</div>
			</c:forEach>
		</div>
	</div>
	<script type="text/javascript"><%@include file="/WEB-INF/js/commentwatch.js"%></script>
</body>
</html>
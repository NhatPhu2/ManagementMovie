<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
<%@
include file ="/WEB-INF/css/movieDetail.css"%>
.form-input {
	color: white;
	line-height: 50px;
}

.contair {
	display: inline-block;
	font-size: 18px;
	margin-left: 62px;
}

.contair label {
	display: inline-block;
	color: white;
}

.form-active {
	display: inline-block;
	width: 170px;
}

.form-active label {
	display: inline;
}

#modal-header {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 70px;
	width: 80%;
}

.file-image {
	border: 1px solid;
	cursor: pointer;
	height: 100px;
	width: 167px;
	margin-top: 7px;
}

.ok {
	padding: 10px;
	background-color: orange;
	color: white;
	cursor: pointer;
	position: relative;
	top: 34px;
	left: -10px;
}

.ip-value {
	display: inline-block;
	float: right;
	width: 0px;
}
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div style="min-height: 533px;" class="modal">
		<div class="modal-container">
			<header id="modal-header">

			<form action="" method="post" enctype="multipart/form-data">
				<div class="contair ip">
					<div class="form-input">

						<label>Youtube Id</label> 
						<div class="ip-value">
							<input class="form-youtube" type="text" required="required" name="idVideo">
						</div>

					</div>

					<div class="form-input">

						<label   for="img" style="border: none" class="file-image">Choose
							a photo</label>
						<div class="ip-value">
							<input type="hidden" name="hdValueImg" id="hidden-img-value">
							<img alt="" class="file-image" id="poster" src="/assignment/images/">
							<input onchange="onFileSelected(event)" style="display: none" name="poster" type="file" accept="image/*" id="img">
						</div>

					</div>

					<div class="form-input">

						<label>Title</label>
						<div class="ip-value">
							<input class="form-title" required="required" type="text" name="title">
						</div>

					</div>

					<div class="form-input">
						<label>Views</label>
						<div class="ip-value">
							<input class="form-view" required="required" type="number" name="viewss">
						</div>
					</div>

					<div class="form-input">
						<label>Description</label>

						<div class="ip-value">
							<textarea class="form-description" required="required" rows="" cols="" name="descriptions"></textarea>
						</div>
					</div>

					<div class="form-input">
						<label>Active</label>
						<div class=" ip-value">
							<div class="form-active">
								<label>Active</label> <input  required="required" value="true" type="radio" name="active">
								<label>InActive</label> <input required="required" value="false" type="radio" name="active">
							</div>
	
						</div>

					</div>

					<div class="form-input">
						<label>Director</label>
						<div class="ip-value">
							<input class="form-director" required="required" type="text" name="director">
						</div>
					</div>

					<div class="form-input">
						<label>Genre</label>
						<div class="ip-value">
							<select  name="genre" style="width: 170px; height: 25px;">
							<c:forEach var="listGenre" items="${genreEdit}">
								<option class="form-gender" value="${listGenre.idGenre}">${listGenre.genre}</option>
							</c:forEach>
							</select>
						</div>

					</div>

					<div class="form-input">
						<label>Actor</label>

						<div class="ip-value">
							<textarea class="form-actor"  required="required" rows="" cols="" name="actor"></textarea>
						</div>
					</div>

				</div>
				
				<button  class="ok">Ok</button>
				</form>
				
				<i class="fa-solid fa-circle-xmark close"></i>
			</header>
		</div>
	</div>
	
	<%--show update and insert form --%>
	<script>
		const moda = document.querySelector('.modal');
		const modalContainer = document.querySelector('.modal-container');
		const insert = document.querySelector('.insert');
		const okStatus = document.querySelector('.ok');
		const update = document.querySelectorAll('.update');
		const close = document.querySelector('.close');
		
		function showDetail(){
			moda.classList.add('show');
		}
		function hideDetail(){
			moda.classList.remove('show');
		}
		close.addEventListener('click',hideDetail);
		
		
		
		
		insert.addEventListener('click',function handle(){
			showDetail()
			okStatus.textContent = "Add new video";
			okStatus.setAttribute('formaction','/assignment/editvideo/insert');
		}		
		);
		
		for(const up of update){
			up.addEventListener('click',function handle(){
				showDetail()
				okStatus.textContent = "Save";
				okStatus.setAttribute('formaction','/assignment/editvideo/update');
			}		
			);
		}

		modalContainer.addEventListener('click',function (event) {
            event.stopPropagation();
		});
			moda.addEventListener('click',hideDetail);
		</script>
	
	
	
	<%-- change image when choose --%>
	<script>
	function onFileSelected(event) {
		  var selectedFile = event.target.files[0];
		  var reader = new FileReader();

		  var imgtag = document.getElementById("poster");
		  imgtag.title = selectedFile.name;

		  reader.onload = function(event) {
		    imgtag.src = event.target.result;
		  };

		  reader.readAsDataURL(selectedFile);
		}
	</script>
	
	
</body>
</html>
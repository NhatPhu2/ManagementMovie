<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management Video</title>

<style><%@include file="/WEB-INF/css/admin.css"%></style>
<link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<%@include file="home.jsp"%>
	
	<table>
	<thead>
		<tr>

			<th>Youtube ID</th>

			<th>Poster</th>

			<th>Title</th>

			<th>View</th>

			<th style="padding-right:  150px; padding-left: 150px;" >Description</th>

			<th>Active</th>
			
			<th>Genre</th>
			
			<th>Director</th>
			
			<th style="padding-right:  100px;padding-left: 100px;">Actor</th>
			
			<th>Edit</th>

		</tr>
	</thead>
	
	<tbody>
	<c:forEach var="rows" items="${editVideo}">
		<tr>
			<td>${rows.idVideo}</td>
			<td>
				<img alt="" src="/assignment/images/${rows.poster}" width="100px">
			</td>
			<td>${rows.title}</td>
			<td>${rows.viewss}</td>
			<td>${rows.descriptions}</td>
			<td>${rows.active}</td>
			<td>${rows.genreVideo.genre}</td>
		
			<td>${rows.director}</td>
			<td>${rows.actor}</td>
			<td >
				<div class="action">	
				
				<button onclick="setValueUpdate('${rows.idVideo}')" class="update">Update</button>
				<form style="display: none" action="" method="post" id="formDelete">
				</form>
					<button form="formDelete" formaction="/assignment/editvideo/remove?idVideoRemove=${rows.idVideo}">Remove</button>
				
				</div>
					
			</td>
		</tr>
	</c:forEach>
	</tbody>
		
	<tfoot>
		
		<tr>
			<td colspan="10	"> 
				<div class="direction">
				<form action="" method="get">
				<%--first --%>
					<button formaction="/assignment/editvideo/first"><i class="fa-solid fa-left-to-line"></i></button>  
						<%--previous --%>
					<button formaction="/assignment/editvideo/previous"><i class="fa-solid fa-backward"></i></button>
					<input style="width: 20px; border: 1px solid black;" value="${page}/${numberOfPage}" type="text">
						<%--next --%>
					<button formaction="/assignment/editvideo/next" ><i class="fa-solid fa-forward"></i></button>
						<%--last --%>
					<button formaction="/assignment/editvideo/last" ><i class="fa-solid fa-right-to-line"></i></button>  
					
				</form>
				</div>
				
			</td>
		
		</tr>
		
		<tr>
			<td colspan="10">
				<button class="action insert">Insert</button>  
			</td>
		</tr>
		
	</tfoot>
	</table>
	<%@include file="modalvideo.jsp" %>
	
	<%--jquery and ajax to show update form without refresh page  --%>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<%-- setValue for form update --%>
	<script>
		function setValueUpdate(id) {
			$.ajax({
				type : 'POST',
				headers : {
					Accept : "application/json; charset=utf-8",
					"Content-Type" : "application/json; charset=utf-8"
				},
				url : '${pageContext.request.contextPath}/editvideo/setValueUpdate?idVideo=' + id,
				success : function(result) {
					//get value object video of servlet parsed as string json and parse it to json object
					var setFormUpdate = $.parseJSON(result);
					
					//setValue for form update
					$('.form-youtube').val(setFormUpdate.idVideo);
					//disabled change id youtube
					$('.form-youtube').attr("readonly","true");
					
					$('.form-title').val(setFormUpdate.title);
					$('.form-view').val(setFormUpdate.viewss);
					$('.form-description').val(setFormUpdate.descriptions);
					
					
					$('input:radio[name="active"]').filter('[value="'+setFormUpdate.active+'"]').attr('checked', true);
					$('.form-director').val(setFormUpdate.director);
					$('.form-actor').val(setFormUpdate.actor);
					$('#poster').attr("src","/assignment/images/"+setFormUpdate.poster);
					$('#hidden-img-value').val(setFormUpdate.poster);
					
					//setValue for form update
				}
			});
		}
	</script>
	
	
	
	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Management User</title>
<style>
<%@include file="/WEB-INF/css/admin.css"  %>

</style>
<link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<%@include file="home.jsp" %>
	<table>
	<thead>
		<tr>
			<th>ID</th>
			<th>Password</th>
			<th>Email</th>
			<th>FullName</th>
			<th>Role</th>
			<th>Edit</th>
		</tr>
	</thead>
	
	<tbody>
	<c:forEach var="rows" items="${editUser}">

		<tr>
		<td>${rows.id}</td>
		<td>${rows.passwords}</td>
		<td>${rows.email}</td>
		<td>${rows.fullName}</td>
		<td>${rows.roles?"Admin":"User"}</td>
		<td >
				<div class="action">	
					<button onclick="setValueUpdate('${rows.id}')" class="update">Update</button>
				<form style="display: none" action="" method="post" id="formDelete">
				</form>
					<button form="formDelete" formaction="/assignment/edituser/remove?idUser=${rows.id}">Remove</button>
					
				</div>
					
			</td>
		</tr>
		</c:forEach>
	</tbody>
	
	<tfoot>
		
		
		<tr>
			<td colspan="10"> 
				<div class="direction">
				<form  action="" method="get">
					<button formaction="/assignment/edituser/first"><i class="fa-solid fa-left-to-line"></i></button>  
					<button formaction="/assignment/edituser/previous"><i class="fa-solid fa-backward"></i></button>
					<input style="width: 20px; border: 1px solid black;" value="${page}/${numberOfPage}" type="text">
					<button formaction="/assignment/edituser/next"><i class="fa-solid fa-forward"></i></button>
					<button formaction="/assignment/edituser/last"><i class="fa-solid fa-right-to-line"></i></button> 
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
		<%@include file="modaluser.jsp" %>
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
				url : '${pageContext.request.contextPath}/edituser/setValueUpdate?idUser=' + id,
				success : function(result) {
					//get value object of servlet parsed as string json and parse it to json object
					var setFormUpdate = $.parseJSON(result);
					
					//setValue for form update
					$('.userID').val(setFormUpdate.id);
					//disabled change id youtube
					$('.userID').attr("readonly","true");
					
					$('.passwordUser').val(setFormUpdate.passwords);
					$('.email').val(setFormUpdate.email);
					$('.fullname').val(setFormUpdate.fullName);
					
					
					$('input:radio[name="roles"]').filter('[value="'+setFormUpdate.roles+'"]').attr('checked', true);
				
					
					//setValue for form update
				}
			});
		}
	</script>
	
	
</body>
</html>
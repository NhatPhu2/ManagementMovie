<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Share</title>
<style><%@include file="/WEB-INF/css/admin.css"%></style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
		<%@include file="home.jsp" %>
	<h2>Video Title <select><option></select> </h2>	
		<table>
	<thead>
		<tr>
			<th colspan="4">Video Title 
				<form action="/assignment/report/share" method="get">
						<select name="list-title" onchange="this.form.submit()">
							<c:forEach var="rows" items="${listTitleVideo}">
								<option value="${rows.title}"${currentTitle==rows.title?'selected':''}>${rows.title}</option>
							</c:forEach>
						</select>
					</form>	
			</th>
		</tr>
		
		<tr>

			<th>Sender Name</th>

			<th>Sender Email</th>

			<th>Receiver Email</th>

			<th>Sent Date</th>

		</tr>
		
	</thead>
	
	<tbody>
	<c:forEach var="rows" items="${listShare}">
		<tr>
			<td>${rows.userShare.fullName}</td>
			<td>${rows.userShare.email}</td>
			<td>${rows.email}</td>
			<td>${rows.shareDate}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</body>
</html>
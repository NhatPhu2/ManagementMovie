<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report</title>
<style><%@include file="/WEB-INF/css/admin.css"%></style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<%@include file="home.jsp" %>
	<table>
	<thead>
		<tr>

			<th>Video Title</th>

			<th>Number of like</th>

			<th>Latest Date</th>

			<th>Oldest Date</th>

		</tr>
	</thead>
	
	<tbody>
	<c:forEach var="rows" items="${listReportFavorite}">
		<tr>
			<td>${rows.videoTitle}</td>
			<td>${rows.likes}</td>
			<td>${rows.newest}</td>
			<td>${rows.oldest}</td>
		</tr>
	</c:forEach>
	</tbody>
	</table>
</body>
</html>
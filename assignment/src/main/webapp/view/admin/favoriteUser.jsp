<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<%@include file="/WEB-INF/css/admin.css"%>
</style>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<%@include file="home.jsp"%>
	<h2>
		Video Title <select><option></select>
	</h2>
	<table>
		<thead>
			<tr>
				<th colspan="4">Video Title
					<form action="/assignment/report/Title" method="get">
						<select name="list-title" onchange="this.form.submit()">
							<c:forEach var="rows" items="${listTitleVideo}">
								<option value="${rows.title}"
									${currentTitle==rows.title?'selected':''}>${rows.title}</option>
							</c:forEach>
						</select>
					</form>
				</th>
			</tr>

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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Netflix</title>

<link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
<%--jquery and ajax to show detailMovie without refresh page  --%>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>

<body style="overflow-x: hidden;">
    <div class="container">
       <%--header --%>
       <%@include file="/view/header.jsp" %>
       
       <%--trailer --%>
       <%@include file="/view/trailer.jsp" %>
       
       <%--content --%>
        <%@include file="/view/content.jsp" %>
        
        <%--detail movie --%>
        <%@include file="/view/movieDetail.jsp" %>
        
         <%--form share video --%>
        <%@include file="/view/modalshare.jsp"%>
        
        <%--footer --%>
        <%@include file="/view/footer.jsp" %>
    </div>

    <div class="clear-float"></div>
    <script>
    <%@include file="/WEB-INF/js/home.js"%>
    //click to show trailer detail	
    const detailTrailer = document.querySelector('.info-film');

    //click button
    detailTrailer.addEventListener('click', showDetail);
    </script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home admin</title>
<style>
<%@include file="/WEB-INF/css/header.css"%>
	
		.sub-admin>li{
			display: block;
			width: 150px;
			
		}
		
		.sub-admin{
			position: absolute;
			background-color: black;
			display: none;
			padding-left: 0px;

	
		}
		
		.report:hover .sub-admin{
			display: inline-block;
	}
}
	
	
</style>
</head>
<body style="background-color: white">
	 <header id="heading" style="background-color: black">
            <div class="sub">
                <a href="#" class="subhead netflix-logo"> <img src="/assignment/images/netflix.png" alt=""></a>
                <div class="subhead">
                    <ul id="head-ul" >
                        <li ><a href="${pageContext.request.contextPath}/view/admin/home.jsp">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/loadVideoAdmin">Video</a></li>
                        <li><a href="${pageContext.request.contextPath}/loadUser">User</a></li>
                        <li class="report"><a href="${pageContext.request.contextPath}/view/admin/report.jsp">Report</a>
                        	 <ul class="sub-admin">
                                    <li ><a href="${pageContext.request.contextPath}/report/favorite">Favorite</a></li>
                                    <li ><a href="${pageContext.request.contextPath}/report/Title">Favorite User</a></li>
                                    <li><a href="${pageContext.request.contextPath}/report/share">Shared</a></li>
                                </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </header>
</body>
</html>
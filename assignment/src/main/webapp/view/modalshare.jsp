<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
<%@include file="/WEB-INF/css/share.css"%>
}
</style>
<link rel="stylesheet"
	href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
</head>
<body>
	<div class="modalshare">
		<div class="modalshare-container">
			<header id="modalshare-header">
				<form action="" method="post">
					<div class="ct"><input type="text" readonly="readonly"></div>
					<input type="hidden" value="" class="hdValue-share" name="idVideoShare">
					<div class="ct"><input type="text" name="share-email" placeholder="Send to Email?"></div>
					<button class="btn-share" formaction="/assignment/ShareVideo">Share</button>
				</form>
			</header>
		</div>
	</div>
	
	<%--get value idVideo when click which video want to share for hidden field class = hdValue-share --%>
	<script>
		function share(idVideo){
			var idVideoShare = document.querySelector('.hdValue-share').value = idVideo.value;
		}
	
	</script>
	
	<script ><%@include file="/WEB-INF/js/modalShare.js"%></script>
</body>
</html>
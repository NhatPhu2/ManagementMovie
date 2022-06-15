<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
<%@include file="/WEB-INF/css/movieDetail.css"%>
	.form-input{
	color: white;
}

.contair{
	display: inline-block;
	font-size: 18px;
    font-size: 18px;
    line-height: 44px;
    margin-left: 62px;
}

.contair label{
 display: block;
 color:white;
}

.form-active{
	display: inline-block;
}

.form-active label{
	display: inline;
}

#modal-header{
	display: flex;
	justify-content: center;
	align-items: center;
	margin-top: 180px;
}

.file-image{
	border: 1px solid;
	cursor: pointer;
    height: 100px;
    width: 167px;
    
    margin-top: 7px;
}

.ok{
padding: 10px;
background-color: orange;
color: white;
cursor: pointer;
position: relative;
top: 134px;
left: -173px;
}
}

</style>
</head>
<body>
	<div class="modal">
		<div  class="modal-container">
			<header id="modal-header">
			
			<div class="contair label">
				<label>ID</label>
				<label>Password</label>
				<label>Email</label>
				<label>FullName</label>
				<label>Role</label>
			</div>
			
				<form action="" method="post" id="form1">
			<div class="contair ip">
		
				<div class="form-input">
				
					<input type="text" class="userID" name="id">
				</div>
				
				<div class="form-input">
					
					<input type="text" class="passwordUser" name="passwords" >
				
				</div>
				
				<div class="form-input">
				
					<input type="text" class="email" name="email" >
				</div>
				
				<div class="form-input" >
					
					<input type="text" class="fullname" name="fullName" >
				</div>
				
				<div >
					<div class="form-active">	
						<label>Admin</label>
						<input type="radio" value="true" name="roles">
					</div >
				
				<div class="form-active">
					<label>User</label>
					<input type="radio" value="false" name="roles">
				</div>
					
				</div>

			</div>	
				<button class="ok">Ok</button>
				<input class="action" form="form1" type="reset">
				<i class="fa-solid fa-circle-xmark close"></i>
				</form>
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
			okStatus.textContent = "Add new User";
			okStatus.setAttribute('formaction','/assignment/edituser/insert');
		}		
		);
		
		for(const up of update){
			up.addEventListener('click',function handle(){
				showDetail()
				okStatus.textContent = "Save";
				okStatus.setAttribute('formaction','/assignment/edituser/update');
			}		
			);
		}

		modalContainer.addEventListener('click',function (event) {
            event.stopPropagation();
		});
			moda.addEventListener('click',hideDetail);
		</script>
		
	
	
	
</body>
</html>
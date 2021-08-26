<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="layout/styles/quantri.css" rel="stylesheet" type="text/css"
	media="all">
<title>Document</title>
</head>
<body>
	<div class="container">
		 <div class="header__quantri">
            <div class="title_quantri">
                User hiện có
            </div>
            <span class="logout__quantri">
                <button class="logout__quantri-btn" ><a href="index.jsp">LOGOUT</a></button>
            </span>
            <div class="addUser">
                <button class="addUser__quantri-btn" onclick="hide_modalAdduser()">Add User</button>
            </div>
        </div>
		<table class="table__user">
			<thead>
				<tr>
					<th scope="col">ID_USER</th>
					<th scope="col">USER_NAME</th>
					<th scope="col">#Edit</th>
					<th scope="col">#Delete</th>
					
				</tr>
			</thead>
			
			<tbody>
			<c:forEach items="${listAcc}" var="o">
				<tr id="acc${o.id}">
					<th scope="row">${o.id}</th>
					<td>${o.username }</td>
					<td><button onclick="edit(${o.id})">EDIT</button></td>
					<td><button onclick="deleteAcc(${o.id})">DELETE</button></td>
				</tr>
				<form action="editUser" method="post">
				<div class="modal__editUser" id="modal__editUser${o.id}">
        		<p class="textEdit" >Bạn đang chỉnh sửa tài khoản có số ID: <input style="width:20px;" value=${o.id} name="id"></input></p>
        		Username: <input type="text" value="${o.username}" name="nameAfterEdit">
        		<button >Submit</button>		
   				 </div>
   				 </form>
			</c:forEach>
			</tbody>
			
		</table>

	</div>
	<div class="modal__addUser" id="modal__addUser">
		<form method="post" action="addUser">
        <div class="modal__username">username: <input class="modal__addUser-input" type="text" name="adduserName"></div>
        <div class="modal__password">password: <input class="modal__addUser-input" type="text" name="addpassWord"></div>
        <button class="modal__submit-btn" onclick="">Submit</button>
        </form>
        <button class="modal__close-btn" onclick="close__modal()">Close</button>
    </div>
     
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		
	/* 	function doneEdit(id,username){
			$.ajax({
				url : "/shopAoquan/editUser",
				type : "post", //send it through get method
				data : {		
					id:id,
					username:username
				},
				success : function(data) {	
					const element = "modal__editUser"+id;
					document.getElementById(element).style.display = "none";
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		} */
		function edit(id){
		const element = "modal__editUser"+id;
     	document.getElementById(element).style.display = "block";
 		}
	 	function hide_modalAdduser(){
         	document.getElementById("modal__addUser").style.display = "block";
     	}
     	function close__modal(){
        	 document.getElementById("modal__addUser").style.display = "none";
     	}
     	
		function deleteAcc(id){
			$.ajax({
				url : "/shopAoquan/deleteAccount",
				type : "get", //send it through get method
				data : {		
					id:id
				},
				success : function(data) {	
					var deleteE = document.getElementById("acc"+id);
				
					deleteE.innerText="";
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		}
		function submit__addUser(){
			$.ajax({
				url : "/shopAoquan/addUser",
				type : "post", //send it through get method
				data : {		
					
				},
				success : function(data) {	
					
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		}
		
	</script>
</body>
</html>
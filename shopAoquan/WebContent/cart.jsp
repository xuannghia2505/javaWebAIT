
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CartPage</title>


<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">

</head>

<body style="background-color: #fff;">
	<div class="wrapper row1">
		<jsp:include page="header.jsp"></jsp:include>

	</div>
	<table style="margin-top: 50px; width: 80%; margin:100px 0 0 140px;">
		<thead>
			<tr>
				<th scope="col"
					style="background-color: #999; border: 3px solid rgb(177, 233, 189); width: 20%;">
					<div>Sản Phẩm</div>
				</th>
				<th scope="col"
					style="background-color: #999; border: 3px solid rgb(177, 233, 189); width: 20%;">
					<div>Đơn Giá</div>
				</th>
				<th scope="col"
					style="background-color: #999; border: 3px solid rgb(177, 233, 189); width: 20%;">
					<div>Số Lượng</div>
				</th>
				<th scope="col"
					style="background-color: #999; border: 3px solid rgb(177, 233, 189); width: 20%;">
					<div>Xóa</div>
				</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${cartoder}" var="o">
				<tr id="cartProduct${o.id}">
					<td scope="row" style="text-align: center;">
						<div class="p-2">
							<img src="${o.image }" style="height: 100px; width: 100px;">
							<h5 class="mb-0">
								<a href="#" class="text-dark d-inline-block">${o.name }</a>
							</h5>
							<span class="text-muted font-weight-normal font-italic"></span>
						</div>


					</td>
					<td  class="align-middle" style="text-align: center;"><strong id="priceP${o.id}">${o.price }</strong></td>

					<td class="align-middle" style="text-align: center;"><button
							onclick="minusProducts(${o.id},${o.price })" 
							style="border: 3px solid green; padding: 2px; float: left;">-</button>
						</button> <strong  id="soluong${o.id}"> ${o.soluong }</strong>
						<button onclick="plusProducts(${o.id},${o.price})"
							style="border: 3px solid green; padding: 2px; float: right;">+</button></td>

					<td class="align-middle" style="text-align: center;"><a
						href="#" class="text-dark">
							<button onclick="deleteP(${o.id},${o.price})" type="button" class="btn "
								style="color: #835;">Delete</button>
					</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="row py-5 p-4 bg-white rounded shadow-sm"
		style="text-align: center;">

		<div id="tongtienE" class="col-lg-6">

			<div class="p-4">
				<ul class="list-unstyled mb-4" style="list-style-type: none;">
					<li class="d-flex justify-content-between py-3 border-bottom"><strong
						class="text-muted">Tổng tiền hàng:</strong><strong id="tongtien">
							${tongtien} </strong>$</li>
					<li class="d-flex justify-content-between py-3 border-bottom"><strong
						class="text-muted">Phí vận chuyển:</strong><strong> Free
							ship</strong></li>
					<li class="d-flex justify-content-between py-3 border-bottom"><strong
						class="text-muted">VAT:</strong><strong> 0 $</strong></li>
					<li class="d-flex justify-content-between py-3 border-bottom"><strong
						class="text-muted">Tổng thanh toán:</strong>
						<strong  class="font-weight-bold">${tongtien}</strong>$</li>
				</ul>
				<a  class="btn btn-dark rounded-pill py-2 btn-block"><button style="cursor: pointer;  color:#999; font-size:bold; border:none; padding:5px; " onclick="muahangBtn(${tongtien})">Mua
					hàng</button></a>
				<div id="muahang"></div>
			</div>
		</div>
	</div>



	<!-- End -->


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		

		
		function minusProducts(id,price) {
			
			var row = document.getElementById("soluong"+id);
			var soP= row.innerText;
				
			if(soP==1){
				deleteP(id,price);
				soP--;
				}
			
				
			else{
				soP--;	
				changeTongtien(price,"minus");
			$.ajax({
				url : "/shopAoquan/changeProduct",
				type : "get", //send it through get method
				data : {
					soP :soP,
					id : id
					
				},
				success : function(data) {
					
					row.innerHTML = data;
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
			}
		}
		function plusProducts(id,price) {
			
			changeTongtien(price,"plus")
			var row = document.getElementById("soluong"+id);
			var soP= row.innerText;
				soP++;
			$.ajax({
				url : "/shopAoquan/changeProduct",
				type : "get", //send it through get method
				data : {
					soP :soP,
					id : id
				
				},
				success : function(data) {
					
					
					row.innerHTML = data;
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		}
		function changeTongtien(price,type){
			var tongtien = document.getElementById("tongtien").innerText;
			if(type=="minus")
				tongtien=tongtien-price;
			else
				tongtien=tongtien-(-price);
			$.ajax({
				url : "/shopAoquan/changeTongtien",
				type : "get", //send it through get method
				data : {
					tongtien:tongtien
				
				},
				success : function(data) {	
					var row = document.getElementById("tongtienE");
					row.innerHTML = data;
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
			
		}
		function deleteP(id,price){
			var row = document.getElementById("soluong"+id);
			var soP= row.innerText;
				
			changeTongtien(price*soP,"minus");
		
			$.ajax({
				url : "/shopAoquan/deleteP",
				type : "get", //send it through get method
				data : {
					id: id,
					deleteL:"del"
				
				},
				success : function(data) {	
					var deleteE = document.getElementById("cartProduct"+id);
					console.log("ok");
					var sohangOder = document.getElementById("sohangOder");
					sohang= sohangOder.innerText;
					sohang--;
					
					sohangOder.innerText=sohang;
					deleteE.innerText="";
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
			
		}
		function muahangBtn(){
			$.ajax({
				url:"/shopAoquan/muahangControl",
				type:"get",
				data:{
					
				},
				success : function(data){
					var thongtin=document.getElementById("muahang");
					thongtin.innerHTML=data;
				},
				error : function(xhr){
					
				}
			})
		}
		
		
	</script>

	
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>

</html>
</html>
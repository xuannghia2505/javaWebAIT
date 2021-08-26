<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Template Name: Chillaid
Author: <a href="https://www.os-templates.com/">OS Templates</a>
Author URI: https://www.os-templates.com/
Copyright: OS-Templates.com
Licence: Free to use under our free template licence terms
Licence URI: https://www.os-templates.com/template-terms
-->
<html lang="">
<!-- To declare your language - read more here: https://www.w3.org/International/questions/qa-html-language-declarations -->
<head>
<title>NghiaShop | Pages | Summer</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css"
	media="all">
</head>
<body id="top">
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row1">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="bgded overlay"
		style="background-image: url('../images/demo/backgrounds/01.png');">

	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row3">
		<main class="hoc container clear">
			<!-- main body -->
			<!-- ################################################################################################ -->
			<div class="content">
				<!-- ################################################################################################ -->
				<div id="gallery">
					<figure>
						<header class="heading">Choose Summer Clothes Here</header>
						<ul id="aoquan" class="nospace clear">
							<c:forEach items="${listP}" var="o">
								<li class="one_quarter ${o.pid%4==1 ? "first" : ""}"><a
									href="#"><img src="${o.image }" alt=""
										style="height: 250px; width: 250px;"></a>
									<div style="margin-top: 10px">
										<a style="font-weight: bold;">Price:${o.price }$</a>
										<button class="btn"
											style="border-radius: 5px; height: 80%; width: 50%; font-size: 12px;">
											<a style="color: green;" href="cartControl?pid=${o.pid }"><strong>+
													Add to cart</strong></a>
										</button>
									</div>
									</li>

							</c:forEach>

						</ul>

					</figure>
				</div>
				<!-- ################################################################################################ -->
				<!-- ################################################################################################ -->
				<nav class="pagination">
					<ul>
						
							<li><button id="btnP" onclick="preIndex()">&laquo;
									Previous</button></li>
						
						<c:forEach begin="1" end="${soPage}" var="index">
							<li id="indexAc${index}" class="${tag==index ? "current" : "" } "><button
								onclick="loadIndex(${index})">${index}</button></li>
						</c:forEach>
						
							<li><button id="btnN" onclick="nextIndex()">Next &raquo;</button></li>
						
					</ul>
				</nav>
				<!-- ################################################################################################ -->
			</div>
			<!-- ################################################################################################ -->
			<!-- / main body -->
			<div class="clear"></div>
		</main>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row2">
		<jsp:include page="section.jsp"></jsp:include>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="bgded overlay row4"
		style="background-image: url('../images/demo/backgrounds/01.png');">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<div class="wrapper row5">
		<div id="copyright" class="hoc clear">
			<!-- ################################################################################################ -->
			<p class="fl_left">
				Copyright &copy; 2018 - All Rights Reserved - <a href="#">Domain
					Name</a>
			</p>
			<p class="fl_right">
				Template by <a target="_blank" href="https://www.os-templates.com/"
					title="Free Website Templates">OS Templates</a>
			</p>
			<!-- ################################################################################################ -->
		</div>
	</div>
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<!-- ################################################################################################ -->
	<a id="backtotop" href="#top"><i class="fas fa-chevron-up"></i></a>
	<!-- JAVASCRIPTS -->
	        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		var page=1;
		function changeUrl(page){
			url= "http://localhost:8080/shopAoquan/summer?summerIndex="+page;
			history.pushState(null,null,url);
		}
		function loadIndex(tag) {
			
			$.ajax({
				url : "/shopAoquan/loadIndex",
				type : "get", //send it through get method
				data : {
					index :tag,
					type : "summer"
				},
				success : function(data) {
					page = tag;
					changeUrl(page);
					var row = document.getElementById("aoquan");
					var stringIndex= "#indexAc"+tag;
					var khacindex= "[id!='"+stringIndex+"']";
					console.log(khacindex);
					$(khacindex).removeClass("current");
					$(stringIndex).addClass("current");
					
					row.innerHTML = data;
				},
				error : function(xhr) {
					//Do Something to handle error
				}
			});
		}
		function nextIndex(){
			
			if(page<3){
				page++;
				loadIndex(page);
			}
				
			
		}
		function preIndex(){
			if(page>1){
				page--;
				loadIndex(page);
			}
		}
	</script>
	<script src="../layout/scripts/jquery.min.js"></script>
	<script src="../layout/scripts/jquery.backtotop.js"></script>
	<script src="../layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>
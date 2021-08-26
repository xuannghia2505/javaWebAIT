<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header" class="hoc clear" style="position:fixed; 
	top:0; 
	left:0; 
	right:0; 
	z-index:2; 
	background-color:#333;
	
	animation: headerAni ease 2s infinite;" >
	<div id="logo" class="fl_left">
		<!-- ################################################################################################ -->
		<h1 class="logoname">
			<a href="index.html">xuan<span>n</span>ghia
			</a>
		</h1>
		<!-- ################################################################################################ -->
	</div>
	<nav id="mainav" class="fl_right">
		<!-- ################################################################################################ -->
		<ul class="clear" >
			<li class="active"><a href="index.jsp">Home</a></li>
			<li><a class="drop" href="#">Pages</a>
				<ul>
					<li><a href="spring?springIndex=1">Spring</a></li>
					<li><a href="summer?summerIndex=1">Summer</a></li>
					<li><a href="autumn?autumnIndex=1">Autumn</a></li>
					<li><a href="#">Winter</a></li>
					<li><a href="#">Basic clothes</a></li>
					<li><a href="#">Modern clothes</a></li>
				</ul></li>
			<c:if test="${sessionScope.acc==null }">
				<li><a href="login.jsp">LOGIN</a></li>
			</c:if>
			<c:if test="${sessionScope.acc!=null }">
				<li><a>HELLO,${sessionScope.acc.username}</a></li>
				<li><a href="logout">LOGOUT</a></li>
			</c:if>
			<li><a class=" btn-success btn-sm ml-3" href="cart.jsp"> <i
					class="fa fa-shopping-cart"></i> Cart <span id="sohangOder"
					class="badge badge-light">${sohangOder }</span>
			</a></li>

		</ul>
		<!-- ################################################################################################ -->
	</nav>
</header>
<%@page import="com.bookquestor.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %> 
<%
response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
User usr1=(User)session.getAttribute("userlogin");
if(usr1==null)
{
	response.sendRedirect("login.jsp");
	session.setAttribute("no-login","Please login to continue...");
}
else{
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>
<%@include file="allcomponents/allcss.jsp"%>
<style type="text/css">
a{
	text-decoration: none;
	color: black;
}
	
a:hover{
	text-decoration: none;
}
</style>
</head>
<body style="background-color: #b9ddfa">
	<%@include file="allcomponents/navbar.jsp"%>
	
	<div class="container">
		<div class="row mt-5 p-4 ">
			<div class="col-md-6">
				<a href="sellbook.jsp">
					<div class="card p-2">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-book-open fa-3x"></i>
							</div>
							
							<h4>Sell Old Book</h4>						
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-6">
				<a href="editprofile.jsp">
					<div class="card p-2">
						<div class="card-body text-center">
							<div class="text-success">
								<i class="fas fa-user-pen fa-3x"></i>
							</div>
							
							<h4>Edit Profile</h4>						
						</div>
					</div>
				</a>
			</div>		
		</div>
		
		<div class="row p-1">
			<div class="col-md-4">
				<a href="editaddress.jsp">
					<div class="card p-4">
						<div class="card-body text-center">
							<div class="text-warning">
								<i class="fas fa-location-dot fa-3x"></i>
							</div>
							<h4>Your Address</h4>
							<h5>Edit Address</h5>						
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="myorder.jsp">
					<div class="card p-4">
						<div class="card-body text-center">
							<div class="text-danger">
								<i class="fas fa-box-open fa-3x"></i>
							</div>
							
							<h4>My Order</h4>	
							<h5>Track Your Order</h5>					
						</div>
					</div>
				</a>
			</div>
			
			<div class="col-md-4">
				<a href="">
					<div class="card p-4">
						<div class="card-body text-center">
							<div class="text-primary">
								<i class="fas fa-circle-info fa-3x"></i>
							</div>
							
							<h4>Help Center</h4>
							<h5>24*7 Service</h5>						
						</div>
					</div>
				</a>
			</div>		
		</div>
	</div>
</body>
</html>
<%
}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: ALl Orders</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
		if(user!=null){
	%>
	<h1 class="text-center">Hello, Admin</h1>
	<table class="table table-striped">
		<thead class="thead-dark">
			<tr>
				<th scope="col">OrderId</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment Type</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>ABS</td>
				<td>VSD</td>
				<td>132</td>
				<td>New</td>
				<td>Active</td>
				<td>Active</td>
				<td>Active</td>
				<td>Active</td>
			</tr>
		</tbody>
	</table>
<%
		}
		else{
			response.sendRedirect("../login.jsp");
			session.setAttribute("no-login","Please, login to continue!");
		}
%>
</body>
</html>
<%@page import="com.bookquestor.dao.UserDAO"%>
<%@page import="com.bookquestor.model.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	User usr = (User)session.getAttribute("userlogin");
	if (usr != null) {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ordered Books</title>
<%@include file="allcomponents/allcss.jsp"%>
<style type="text/css">
#main{
	background-image: url(https://images.unsplash.com/photo-1682687982093-4773cb0dbc2e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
	background-size: cover ;
	background-position: center;
	
}

#box{
	background-image: url(https://images.unsplash.com/photo-1682687982093-4773cb0dbc2e?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D);
	background-size: cover ;
	background-position: center;
}

#item td{
	
}
</style>
</head>
<body id="main">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container mt-4">
		<u><h2 class="text-start">ORDER ID - <%=request.getParameter("order_id") %></h2></u>
		<table class="table table-striped" id="box">
			<thead class="thead-dark">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Quantity</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Cart> list = UserDAO.getCartList(user.getId());
				int totalqty = 0;
				double totalcost = 0.0;
				for (Cart b : list) {
					totalcost += b.getQuantity() * b.getTotalcost();
					totalqty += b.getQuantity();
				%>
				<tr id="item">
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getQuantity() * b.getPrice()%></td>
					<td><%=b.getQuantity()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>
<%
} else {
response.sendRedirect("login.jsp");
session.setAttribute("no-login", "Please, login to continue!");
}
%>
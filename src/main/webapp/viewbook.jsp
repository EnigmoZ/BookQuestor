<%@page import="com.bookquestor.model.Book"%>
<%@page import="com.bookquestor.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>BookQuestor: View Book</title>
<%@include file="allcomponents/allcss.jsp"%>

</head>
<body style="background-color: #b9ddfa">
	<%@include file="allcomponents/navbar.jsp"%>
	<%
		String bid = request.getParameter("bid");
		Book b=UserDAO.getBookById(bid);		
	%>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getCover() %>" style="height:200px;width: 155px;"><br>
				<h4><%=b.getBookname() %></h4>
				<h4>~ <%=b.getAuthor() %></h4>
				<h4>Category: <%=b.getCategory() %></h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname() %></h2><br>
				<%
				if("OLD".equals(b.getCategory())){
				%>
					<h4>Contact to seller</h4>
					<h4>Email: <%=b.getEmail() %></h4><br>
				<%	
				}
				%>
				<div class="row">
					<div class="col-md-4 text-success text-center p-2">
						<i class="fa-solid fa-money-bill-wave fa-2x"></i>
						<p>Cash on Delivery</p>
					</div>
					<div class="col-md-4 text-warning text-center p-2">
						<i class="fa-solid fa-truck-fast fa-2x"></i>
						<p>Free Shipping</p>
					</div>
					<div class="col-md-4 text-primary text-center p-2">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
				</div><br>
				<div class="text-center p-3">
				<%
				if("OLD".equals(b.getCategory())){
				%>
					<a href="home.jsp" class="btn btn-primary">Back to see Books</a>
					<a href="" class="btn btn-success"><i class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				<%
				}else{
				%>
					<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=user.getId()%>" class="btn btn-primary"><i class="fa-solid fa-cart-plus"></i> Add</a>
					<a href="" class="btn btn-success"><i class="fa-solid fa-indian-rupee-sign"></i> 200</a>
				<%
				}
				%>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%
}
%>
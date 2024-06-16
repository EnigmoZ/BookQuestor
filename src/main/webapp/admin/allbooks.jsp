<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@page import="com.bookquestor.dao.UserDAO"%>
<%@page import="com.bookquestor.model.Book"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: ALL Books</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
		if(user!=null){
	%>
	<h1 class="text-center">Hello, Admin</h1>
	<%
	String succmsg = (String) session.getAttribute("successmsg");
	if (succmsg != null) {
	%>
	<div class="text-center alert alert-success" role="alert"><%=succmsg%></div>
	<%
	session.removeAttribute("successmsg");
	}
	%>

	<%
	String failedmsg = (String) session.getAttribute("failedmsg");
	if (failedmsg != null) {
	%>
	<div class="text-center alert alert-danger" role="alert"><%=failedmsg%></div>
	<%
	session.removeAttribute("failed-msg");
	}
	%>
	<table class="table table-striped">
		<thead class="thead-dark">
			<tr>
				<th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Category</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
			<%
			List<Book> list = UserDAO.getBookList();
			for (Book b : list) {
			%>
			<tr>
				<td><%=b.getBookid()%></td>
				<td><img src="../book/<%=b.getCover()%>"
					style="width: 50px; height: 60px"></td>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getCategory()%></td>
				<td><%=b.getStatus()%></td>
				<td>
					<a href="editbooks.jsp?book_id=<%=b.getBookid()%>"
					class="btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i> Edit</a> 
					<a href="../delete?book_id=<%=b.getBookid()%>" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a>
				</td>
			</tr>
			<%
			}
			%>
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
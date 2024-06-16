<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.bookquestor.model.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin : BookQuestor</title>
<%@include file="allcss.jsp"%>
<style>
a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
		if(user!=null){
	%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-3">
				<a href="addbooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-square-plus fa-3x text-primary"></i><br>
							<h4>Add Books</h4>
							-----------
						</div>
					</div>
				</a>

			</div>

			<div class="col-md-3">
				<a href="allbooks.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-book-open fa-3x text-danger"></i></i><br>
							<h4>All Books</h4>
							-----------
						</div>
					</div>
				</a>

			</div>

			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-box-open fa-3x text-warning"></i><br>
							<h4>Orders</h4>
							-----------
						</div>
					</div>
				</a>

			</div>

			<div class="col-md-3">
				<a href="../logout" data-toggle="modal" data-target="#exampleModal">
					<div class="card">
						<div class="card-body text-center">
							<i class="fa-solid fa-right-from-bracket fa-3x text-primary"></i><br>
							<h4>Logout</h4>
							-----------
						</div>
					</div>
				</a>

			</div>

		</div>
	</div>
	<div style="margin-top: 200px">
		<%@include file="footer.jsp"%>
	</div>
	<%
		}
	else{
		response.sendRedirect("../login.jsp");
		session.setAttribute("no-login","Please, login to continue!");
	}
	%>
</body>
</html>
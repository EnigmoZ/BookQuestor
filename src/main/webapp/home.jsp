<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@page import="com.bookquestor.dao.UserDAO"%>
<%@page import="com.bookquestor.model.Book"%>
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
<title>BookQuestor: Home</title>
<style type="text/css">
.back-img {
	background: url(images/bbb.jpg);
	height: 50vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
}

.crd-ho:hover {
	background-color: #66bffa;
}
</style>
<%@include file="allcomponents/allcss.jsp"%>

</head>

<body style="background-color: #b9ddfa">
	<%@include file="allcomponents/navbar.jsp"%>

	<div class="container-fluid back-img">
		<div class="text">
			<h1 class="text-center text-white">
				<br> "Discover the joy of reading <br>and let the stories
				take you<br> on a delightful journey."
			</h1>
		</div>

	</div>
	<br>
	<!-- Recent book -->
	<div class="container ">
		<h3 class="text-center">Recent Books</h3>
		<br>
		<div class="row">
			<%
			List<Book> rlist = UserDAO.getRecentBook();
			for (Book b : rlist) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getCover()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p>
							<b><%=b.getBookname()%></b>
						</p>
						<p>
							<b><%=b.getAuthor()%></b>
						</p>
						<p>
							<b>Category: <%=b.getCategory()%></b>
						</p>
						<%
						if (b.getCategory().equals("OLD")) {
						%>
						<div class="row text-center">
							<a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-5">View Book</a> <a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<div class="row  text-center">
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add</a> 
							<a href="viewbook.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-1">View Book</a> 
							<a href="viewbook.jsp?bid=<%=b.getBookid()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
		<div class="text-center mt-3">
			<%
			if (user != null) {
			%>
			<a href="recentbook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
			<%
			} else {
			%>
			<a href="login.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
			<%
			}
			%>
		</div>
	</div>
	<!-- Recent book -->

	<hr>
	<!-- new book -->
	<div class="container ">
		<h3 class="text-center">New Books</h3>
		<br>
		<div class="row">
			<%
			List<Book> nlist = UserDAO.getNewBook();
			for (Book b : nlist) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getCover()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p>
							<b><%=b.getBookname()%></b>
						</p>
						<p>
							<b><%=b.getAuthor()%></b>
						</p>
						<p>
							<b>Category: <%=b.getCategory()%></b>
						</p>
						<div class="row text-center">
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=user.getId()%>"
								class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add</a> <a
								href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-1">View Book</a> <a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>

		<div class="text-center mt-3">
			<%
			if (user != null) {
			%>
			<a href="newbook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
			<%
			} else {
			%>
			<a href="login.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
			<%
			}
			%>
		</div>
	</div>
	<!-- new book -->

	<hr>
	<!-- old book -->
	<div class="container ">
		<h3 class="text-center">Old Books</h3>
		<br>
		<div class="row">
			<%
			List<Book> olist = UserDAO.getOldBook();
			for (Book b : olist) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getCover()%>"
							style="height: 200px; width: 150px;" class="img-thumblin">
						<p>
							<b><%=b.getBookname()%></b>
						</p>
						<p>
							<b><%=b.getAuthor()%></b>
						</p>
						<p>
							<b>Category: <%=b.getCategory()%></b>
						</p>
						<div class="row text-center">
							<a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-5">View Book</a> <a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center mt-3">
			<%
			if (user != null) {
			%>
			<a href="oldbook.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
			<%
			} else {
			%>
			<a href="login.jsp" class="btn btn-danger btn-sm text-white">View
				All</a>
			<%
			}
			%>
		</div>
	</div>
	<!-- old book -->
	<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
<%
}
%>
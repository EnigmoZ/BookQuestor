<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.bookquestor.model.Book"%>
<%@page import="com.bookquestor.dao.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Edit Book</title>
<%@include file="allcss.jsp"%>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<%
		response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
		if(user!=null){
	%>
	<div class="container-fluid">
		<div class="row p-3">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<h4 class="mt-3 p-3">EDIT BOOK</h4>
					</div>
					<div class="card-body">
						<%
						String id=request.getParameter("book_id");
						Book b=UserDAO.getBookById(id);
						%>
						<form action="../EditServlet" method="post">
							<input type="hidden" name="id" value="<%=b.getBookid()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname"
									value="<%=b.getBookname()%>" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="aname"
									value="<%=b.getAuthor()%>" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									name="price" value="<%=b.getPrice()%>" required>
							</div>
							<div class="form-group">
								<label for="inputstate">Book status*</label> <select
									id="inputstate" name="bstatus" class="form-control">
									<%
									if ("Active".equals(b.getStatus())) {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									} else {
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
									}
									%>

								</select>
							</div>

							<button type="submit" class="btn btn-primary mt-3">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		else{
			response.sendRedirect("../login.jsp");
			session.setAttribute("no-login", "Please, login to continue!");
		}
	%>
</body>
</html>
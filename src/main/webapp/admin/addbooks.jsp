<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
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
						<h4 class="mt-3 p-3">ADD BOOKS</h4>
					</div>
					<div class="card-body">
						<form action="../BookAdd" method="post" enctype="multipart/form-data">
							<%
							String succmsg = (String) session.getAttribute("successmsg");
							if (succmsg != null) {
							%>
							<div class="alert alert-success" role="alert"><%=succmsg%></div>
							<%
							session.removeAttribute("successmsg");
							}
							%>

							<%
							String failedmsg = (String) session.getAttribute("failedmsg");
							if (failedmsg != null) {
							%>
							<div class="alert alert-danger" role="alert"><%=failedmsg%></div>
							<%
							session.removeAttribute("failed-msg");
							}
							%>
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="bname" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="aname" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									name="price" required>
							</div>

							<div class="form-group">
								<label for="inputstate">Book Categories*</label> <select
									id="inputstate" name="btype" class="form-control">
									<option selected>--select--</option>
									<option value="NEW">New book</option>
								</select>
							</div>

							<div class="form-group">
								<label for="inputstate">Book status*</label> <select
									id="inputstate" name="bstatus" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>

							<div class="form-group">
								<label for="exampleFormControlFile1">Upload image*</label> <input
									type="file" class="form-control-file"
									id="exampleFormControlFile1" name="bimg" required>
							</div>
							<input type="hidden" name="email" value="Admin">
							<button type="submit" class="btn btn-primary mt-3">Add</button>

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
			session.setAttribute("no-login","Please, login to continue!");
		}
	%>
</body>
</html>
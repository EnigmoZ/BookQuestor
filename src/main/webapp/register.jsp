<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookQuestor: SignUp</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body style="background-color: #b9ddfa;">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 mb-5">
					<div class="card-body">
						<h4 class="text-center">Create Account</h4>

						<form action="RegisterServlet" method="post">
							<%
							String regmsg = (String) session.getAttribute("reg-success");
							if (regmsg != null) {
							%>
							<div class="alert alert-success" role="alert"><%=regmsg%>
								Login<a href="login.jsp"> Click Here</a>
							</div>
							<%
							session.removeAttribute("reg-success");
							}
							%>

							<%
							String failedmsg = (String) session.getAttribute("failed-msg");
							if (failedmsg != null) {
							%>
							<div class="alert alert-danger" role="alert"><%=failedmsg%></div>
							<%
							session.removeAttribute("failed-msg");
							}
							%>
							<div class="form-group">
								<label for="exampleInputEmail1">Name*</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phone" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" required>
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="check" required> <label
									class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-2">SignUp</button>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="allcomponents/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
User usr1=(User)session.getAttribute("userlogin");
if(usr1!=null)
{
	response.sendRedirect("home.jsp");
	session.setAttribute("no-login","Please login to continue...");
}	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BookQuestor: Login</title>
<%@include file="allcomponents/allcss.jsp"%>
<style>
.div-color {
	background-image: radial-gradient(circle, #ececec, #dee4f4, #c2dffb, #98ddfc, #64dcf1,
		#4dd0ed, #32c5e9, #00b9e5, #009ef1, #007ef9, #0059f4, #1019da);
}
</style>
</head>
<body style="background-color: #b9ddfa;">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container">
		<div class="row mt-4">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center">Login</h3>
						<br>
						<%
						String loginfailed = (String) session.getAttribute("login-failed");
						if (loginfailed != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=loginfailed%></div>
						<%
						session.removeAttribute("login-failed");
						}
						%>

						<%
						String withoutlogin = (String) session.getAttribute("no-login");
						if (withoutlogin != null) {
						%>
						<div class="alert alert-danger" role="alert"><%=withoutlogin%></div>
						<%
						session.removeAttribute("no-login");
						}
						%>

						<%
						String loutmsg = (String) session.getAttribute("logoutmsg");
						if (loutmsg != null) {
						%>
						<div class="alert alert-success" role="alert"><%=loutmsg%></div>
						<%
						session.removeAttribute("logoutmsg");
						}
						%>

						<form action="LoginServlet" method="post">

							<div class="form-group">
								<label for="exampleInputEmail1">Email*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="password" required>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-3">Login</button>
								<br> <br>
								<p>
									New User? <a href="register.jsp">Create Account</a>
								</p>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
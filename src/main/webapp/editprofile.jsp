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
<title>Edit Profile</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body style="background-color: #b9ddfa;">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-5 mb-5">
					<div class="card-body">
						<h4 class="text-center">Edit Profile</h4>

						<form action="updateservlet" method="post">
							<%
							String upmsg = (String) session.getAttribute("update-success");
							if (upmsg != null) {
							%>
							<div class="alert alert-success" role="alert"><%=upmsg%></div>
							<%
							session.removeAttribute("update-success");
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
							<input type="hidden" name="userid" value="<%=usr1.getId() %>" required>
							<div class="form-group">
								<label for="exampleInputEmail1">Name*</label> <input type="text"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="name" value="<%=usr1.getName() %>" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" value="<%=usr1.getEmail() %>" required>
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Phone*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phone" value="<%=usr1.getPhone() %>" required>
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="number" class="form-control" id="exampleInputPassword1"
									name="password" value="<%=usr1.getPassword() %>" required>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-primary mt-2">Update</button>
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
<%
}
%>
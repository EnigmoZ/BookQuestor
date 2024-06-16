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
<title>Update Address</title>
<%@include file="allcomponents/allcss.jsp"%>
</head>
<body style="background-color: #b9ddfa;">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-5 mb-5">
					<div class="card-body">
						<h3 class="text-center text-success mb-2">Update Address</h3>

						<form action="" method="post">
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
							<input type="hidden" name="userid" value="<%=user.getId() %>" required>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputcity">Address</label> <input type="text"
										class="form-control" id="inputcity" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputlandmark">Landmark</label> <input type="text"
										class="form-control" id="inputlandmark" required>
								</div>
								
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputcity">City</label> <input type="text"
										class="form-control" id="inputcity" required>
								</div>
								<div class="form-group col-md-3">
									<label for="inputstate">State</label> <input type="text"
										class="form-control" id="inputstate" required>
								</div>
								<div class="form-group col-md-3">
									<label for="inputzip">Zip</label> <input type="number"
										class="form-control" id="inputzip" required>
								</div>
							</div>
							<div class="text-center">
								<button type="submit" class="btn btn-warning mt-2">Update</button>
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
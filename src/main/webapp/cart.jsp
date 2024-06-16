<%@page import="com.bookquestor.model.Cart"%>
<%@page import="com.bookquestor.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
int totalqty = 0;
double totalcost = 0.0;
response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
User usr1 = (User) session.getAttribute("userlogin");
if (usr1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("no-login", "Please login to continue...");
} else {
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@include file="allcomponents/allcss.jsp"%>

</head>
<body style="background-color: #b9ddfa">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container">
		<div class="row p-5">
			<div class="col-md-6">

				<div class="card bg-white">
					<div class="card-body">
						<h3 class="text-center text-success">Your selected books</h3>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">QTY</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								List<Cart> list = UserDAO.getCartList(user.getId());

								for (Cart b : list) {
									totalcost += b.getQuantity() * b.getTotalcost();
									totalqty += b.getQuantity();
								%>
								<tr>
									<th scope="row"><%=b.getBookname()%></th>
									<td><%=b.getAuthor()%></td>
									<td><%=b.getQuantity()%></td>
									<td><%=b.getQuantity() * b.getPrice()%></td>
									<td><a href="deleteCart?cart_id=<%=b.getCid()%>"
										class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>
											Remove</a></td>
								</tr>
								<%
								}
								%>
								<tr>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<th scope="row">Total Cost :</th>
									<td></td>
									<td></td>
									<td></td>
									<td><%=totalcost%></td>
								</tr>
								<tr>
									<th scope="row">Total QTY :</th>
									<td></td>
									<td></td>
									<td></td>
									<td><%=totalqty%></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Order Details</h3>
						<form action="order" method="post">
							<input type="hidden" name="uid" value="<%=usr1.getId()%>">
							<input type="hidden" name="qty" value="<%=totalqty%>"> 
							<input type="hidden" name="tcost" value="<%=totalcost%>">
							<div class="form-row">

								<div class="form-group col-md-6">
									<label for="inputname">Name</label> <input type="text"
										class="form-control" name="name" value="<%=usr1.getName()%>"
										required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputemail">Email</label> <input type="email"
										class="form-control" name="email"
										value="<%=usr1.getEmail()%>" required>
								</div>
							</div>

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputmobile">Mobile No</label> <input type="number"
										class="form-control" name="phone"
										value="<%=usr1.getPhone()%>" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputAddress">Address</label> <input type="text"
										class="form-control" name="address" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputlandmark">Landmark</label> <input type="text"
										class="form-control" name="landmark" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputcity">City</label> <input type="text"
										class="form-control" name="city" required>
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputstate">State</label> <input type="text"
										class="form-control" name="state" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputzip">PinCode</label> <input type="number"
										class="form-control" name="pincode" required>
								</div>
							</div>
							<div class="form-group">
								<label>Payment Mode</label> <select name="COD"
									class="form-control">
									<option>--Select--</option>
									<option>Cash On Delivery</option>
								</select>
							</div>
							<div class="row ml-5">
								<button type="submit" class="btn btn-warning mr-3">Place Order</button> 
								<a href="home.jsp" class="btn btn-success">Continue Shopping</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
<%
}
%>
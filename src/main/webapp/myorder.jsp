<%@page import="com.bookquestor.model.Orders"%>
<%@page import="java.util.List"%>
<%@page import="com.bookquestor.dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<%@include file="allcomponents/allcss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #66bffa;
}

#toast {
	min-width: 300px;
	position: fixed;
	bottom: 30px;
	left: 50%;
	margin-left: -125px;
	background: #333;
	padding: 10px;
	color: white;
	text-align: center;
	z-index: 1;
	font-size: 18px;
	visibility: hidden;
	box-shadow: 0px 0px 100px #000;
}

#toast.display {
	visibility: visible;
	animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
}

@
keyframes fadeIn {from { bottom:0;
	opacity: 0;
}

to {
	bottom: 30px;
	opacity: 1;
}

}
@
keyframes fadeOut {form { bottom:30px;
	opacity: 1;
}

to {
	bottom: 0;
	opacity: 0;
}
}
</style>
</head>
<body>
	<c:if test="${not empty cancelsuccess}">
		<div id="toast">${cancelsuccess}</div>

		<script type="text/javascript">
			showToast();
			function showToast(content)
			{
			    $('#toast').addClass("display");
			    $('#toast').html(content);
			    setTimeout(()=>{
			        $("#toast").removeClass("display");
			    },2000)
			}	
	</script>
	</c:if>
	<%@include file="allcomponents/navbar.jsp"%>
	<%
	response.setHeader("cache-control", "no-cache,no-store,must-revalidate");
	if (user != null) {
	%>

	<div class="container">
		<table class="table table-striped mt-3">
			<thead class="thead-dark">
				<tr>
					<th scope="col">OrderId</th>
					<th scope="col">Name</th>
					<th scope="col">Book Quantity</th>
					<th scope="col">Address</th>
					<th scope="col">Total</th>
					<th scope="col">Payment Type</th>
					<th scope="col">Cancel</th>
					<th scope="col">See Books</th>
				</tr>
			</thead>
			<tbody>
				<%
				Orders order = new Orders();
				int oid = order.getOid();
				List<Orders> list = UserDAO.getOrderList(user.getId());
				for (Orders b : list) {
				%>
				<tr>
					<th scope="row">Order-ID-<%=b.getOid()%></th>
					<td><%=b.getName()%></td>
					<td><%=b.getQuantity()%></td>
					<td><%=b.getAddress()%></td>
					<td><%=b.getTotal()%></td>
					<td><%=b.getPtype()%></td>
					<td><a href="cancel?order_id=<%=b.getOid()%>"
						class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i>
							Cancel</a></td>
					<td><a href="books.jsp?order_id=<%=b.getOid()%>" style="text-decoration: none">See
							Books</a></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
	<%
	} else {
	response.sendRedirect("login.jsp");
	session.setAttribute("no-login", "Please, login to continue!");
	}
	%>
</body>
</html>
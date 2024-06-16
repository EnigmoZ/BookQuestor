<%@page import="java.util.List"%>
<%@page import="com.bookquestor.model.Book"%>
<%@page import="com.bookquestor.dao.UserDAO"%>
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
<title>BookQuestor: Fresh</title>
<%@include file="allcomponents/allcss.jsp"%>
<style type="text/css">
.crd-ho:hover {
	background-color: #66bffa;
}
</style>
</head>
<body style="background-color: #b9ddfa">
	<%@include file="allcomponents/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row p-3">
			<%
			List<Book> rlist = UserDAO.getAllRecentBook();
			for (Book b : rlist) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho mt-3">
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
							<a href="viewbook.jsp?bid=<%=b.getBookid()%>" class="btn btn-success btn-sm ml-5">View Book</a> <a
								href="viewbook.jsp?bid=<%=b.getBookid()%>" class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%
						} else {
						%>
						<div class="row  text-center">
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add</a> <a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-1">View Book</a> <a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
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
	</div>
<%@include file="allcomponents/footer.jsp" %>	
</body>
</html>
<%
}
%>
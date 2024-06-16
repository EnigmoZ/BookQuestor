<%@page import="com.bookquestor.dao.UserDAO"%>
<%@page import="com.bookquestor.model.Book"%>
<%@page import="java.util.List"%>
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
<title>BookQuestor: Old Books</title>
<%@include file="allcomponents/allcss.jsp" %>
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
			List<Book> olist = UserDAO.getAllOldBook();
			for (Book b : olist) {
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
						<div class="row  text-center">
							 <a href="viewbook.jsp?bid=<%=b.getBookid()%>"	class="btn btn-success btn-sm ml-5">View Book</a> 
							 <a href="viewbook.jsp?bid=<%=b.getBookid()%>" class="btn btn-danger btn-sm ml-1"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
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
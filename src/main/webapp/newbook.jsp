<%@page import="com.bookquestor.dao.UserDAO"%>
<%@page import="com.bookquestor.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>    
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
<title>BookQuestor: New Books</title>
<%@include file="allcomponents/allcss.jsp" %>
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

@keyframes fadeIn {from { bottom:0;
							opacity: 0;
						}
						
						to {
							bottom: 30px;
							opacity: 1;
						}
						
}
@keyframes fadeOut {form { bottom:30px;
							opacity: 1;
   						 }
						
					to {
							bottom: 0;
							opacity: 0;
						 } 
}
</style>
</head>
<body style="background-color: #b9ddfa">

<c:if test="${not empty addcart}">
	<div id="toast">${addcart} </div>

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
	<div class="container-fluid">
		<div class="row p-3">
			<%
			List<Book> nlist = UserDAO.getAllNewBook();
			for (Book b : nlist) {
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
							<a href="cart?bid=<%=b.getBookid()%>&&uid=<%=user.getId()%>" class="btn btn-danger btn-sm ml-3"><i
								class="fa-solid fa-cart-plus"></i> Add</a> <a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-success btn-sm ml-1">View Book</a> <a href="viewbook.jsp?bid=<%=b.getBookid()%>"
								class="btn btn-danger btn-sm ml-1"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
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
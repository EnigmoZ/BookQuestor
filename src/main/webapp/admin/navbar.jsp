<%@page import="com.bookquestor.model.User"%>
<div class="container-fluid"
	style="background-color: #01579b; height: 10px"></div>
<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3">
			<%
			User user = (User) session.getAttribute("userlogin");
			if (user != null) {
			%>
			<a class="navbar-brand" href="adminhome.jsp"><i
				class="fa-solid fa-book"></i> BookQuestor</a>
			<%
			} else {
			%>
			<a class="navbar-brand" href="../login.jsp"><i
				class="fa-solid fa-book"></i> BookQuestor</a>
			<%
			}
			%>
		</div>
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
		<div class="col-md-3">
			<%
			if (user != null) {
			%>
			<a href="adminhome.jsp" class="btn btn-success"><i
				class="fa-solid fa-user-tie"></i> <%=user.getName()%></a> <a
				data-toggle="modal" data-target="#exampleModal"
				class="btn btn-primary"><i
				class="fa-solid fa-right-from-bracket"></i> Logout</a>
			<%
			} else {
			%>
			<a href="../login.jsp" class="btn btn-success"><i
				class="fa-solid fa-right-to-bracket"></i> login</a> <a
				href="../register.jsp" class="btn btn-primary"><i
				class="fa-solid fa-user-plus"></i> SignUp</a>
			<%
			}
			%>
		</div>
	</div>
</div>
<!-- logout modal start-->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Logout</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">Do you want to Logout?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<a href="../logout" class="btn btn-primary">Logout</a>
			</div>
		</div>
	</div>
</div>
<!-- logout modal stop -->

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link"
				href="adminhome.jsp"><i class="fas fa-home"></i> Home <span
					class="sr-only">(current)</span> </a></li>
		</ul>
	</div>
</nav>
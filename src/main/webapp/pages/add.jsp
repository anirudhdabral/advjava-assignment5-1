<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.web.dao.AuthorDetailsDao"%>
<%@page import="database.AuthorDetails"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add a book</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>
	<%
	if (session.getAttribute("username") == null) {
		response.sendRedirect("login");
	}
	Date date = new Date();
	String dt = new SimpleDateFormat("dd MMMMM yyyy").format(date);
	%>
	<nav class="navbar justify-content-between"
		style="background-color: #cafcdc;">
		<h1>Library Management System</h1>
		<form class="form-inline" action="logout">
			<span class="p-1">Welcome @${username}</span><input type="submit"
				class="btn btn-outline-danger" value="Logout">
		</form>
	</nav>

	<div class="m-1">
		<div class="container">

			<div class="p-4 row justify-content-center">
				<h2>Add Book Details</h2>
			</div>
			${invalid}
			<div class="p-4">
				<form action="insert" method="post">
					<div class="form-group row">
						<label class="col-2">Book Code</label><input type="text"
							class="col-3" id="color" name="code"
							placeholder="Enter book code" required />
					</div>
					<div class="form-group row">
						<label class="col-2">Book Name</label><input type="text"
							class="col-3" name="name" placeholder="Enter book name" required />
					</div>
					<div class="form-group row">
						<label class="col-2">Author</label> <select name="author"
							class="form-control col-3">
							<%
							try {
								AuthorDetailsDao authorDetailsDao = new AuthorDetailsDao();
								List<AuthorDetails> ls = authorDetailsDao.getAllAuthor();
								for (AuthorDetails author : ls) {
							%>
							<option><%=author.getName()%></option>
							<%
							}
							} catch (Exception ex) {
							ex.printStackTrace();
							}
							%>
						</select>
					</div>
					<div class="form-group row">
						<label class="col-2">Added on</label> <span class="p-1"><%=dt%></span>
					</div>
					<div class="form-group row">
						<div class="col-sm-10">
							<input type="submit" class="btn btn-primary" value="Submit" /> <a
								href="cancel"><button type="button" class="btn btn-danger">Cancel</button></a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@page import="com.web.dao.BookDetailsDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="database.BookDetails"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>
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
	%>
	<nav class="navbar justify-content-between"
		style="background-color: #cafcdc;">
		<h1>Library Management System</h1>
		<form class="form-inline" action="logout">
			<span class="p-1">Welcome @${username}</span><input type="submit"
				class="btn btn-outline-danger" value="Logout">
		</form>
	</nav>

	<div class="container">

		<div class="p-4 row justify-content-between">
			<h2>Book Listing</h2>
			<form class="form-inline" action="addPage" method="post">
				<input type="submit" class="btn btn-primary" value="Add a book">
			</form>
		</div>

		<div class="table-responsive">
			<table class="table table-bordered table-hover p-1">
				<thead class="thead-light" align="center">
					<th>Book Code</th>
					<th>Book Name</th>
					<th>Author</th>
					<th>Date Added</th>
					<th>Actions</th>
				</thead>
				<tbody align="center">
					<%
					try {
						BookDetailsDao bookDetailsDao = new BookDetailsDao();
						List<BookDetails> ls = bookDetailsDao.getAllBook();
						for (BookDetails book : ls) {
							String date = new SimpleDateFormat("dd MMMMM yyyy").format(book.getAddedDate());
					%>
					<tr>
						<td class="align-middle"><%=book.getBookCode()%></td>
						<td class="align-middle"><%=book.getBookName()%></td>
						<td class="align-middle"><%=book.getAuthorName()%></td>
						<td class="align-middle"><%=date%></td>
						<td>
							<div class="btn-group btn-group-sm" role="group">
								<form action="editPage" method="get">
									<input type="hidden" name="editcode"
										value="<%=book.getBookCode()%>" /> <input
										class="btn btn-outline-success" type="submit"
										style="border-radius: 5px 0px 0px 5px; border-right-style: dotted;"
										value="Edit" />
								</form>
								<form action="delete" method="get">
									<input type="hidden" name="deletecode"
										value="<%=book.getBookCode()%>" /> <input
										class="btn btn-outline-danger" type="submit"
										style="border-radius: 0px 5px 5px 0px; border-left-style: dotted;"
										value="Delete" />
								</form>

							</div>
						</td>
					</tr>
					<%
					}
					} catch (Exception ex) {
					ex.printStackTrace();
					}
					%>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>

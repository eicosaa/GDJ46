<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="vo.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>categoryList</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class = "container">
<br>
		<h1>
			<div class="container p-3 my-3 bg-secondary text-white text-center">Category List</div>
		</h1>
	<table class="table table-bordered text-center table-hover">
		<thead>
			<tr>
				<th>Category No</th>
				<th>Category Title</th>
			</tr>
		</thead>
		<tbody>
			<%
				List<Category> list = (List<Category>)request.getAttribute("list"); // -object 타입으로 되기에 형변환 필요
				for(Category c : list) {
			%>
					<tr>
						<td><%= c.getCategoryNo() %></td>
						<td><%= c.getCategoryTitle() %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</div>		
</body>
</html>
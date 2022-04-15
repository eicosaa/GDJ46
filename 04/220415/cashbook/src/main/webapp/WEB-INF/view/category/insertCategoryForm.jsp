<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>categoryInsertForm</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class = "container">
<br>
	<h1>
		<div class="container p-3 my-3 bg-secondary text-white text-center">Category List Insert</div>
	</h1>
	
	<form method = "post" action = "<%= request.getContextPath() %>/category/InsertCategoryController">
		<table class="table table-bordered text-center table-hover">
			<tr>
				<td>category Title</td>
				<td>
					<input name = "categoryTitle" type = "text" class = "form-control">
				</td>
			</tr>
		</table>
		
		<div>
			<button type = "submit" class = "btn btn-outline-dark">입력</button>
		</div>
	</form>
</div>
</body>
</html>
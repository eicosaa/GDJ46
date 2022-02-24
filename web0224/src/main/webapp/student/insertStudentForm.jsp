<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertStudentForm</title>
<style>
	table, td {border : 1px solid #6B9900;}
</style>
</head>
<body>

	<h1> student 입력 폼 </h1>
	
	<form method="post" action="./insertStudentAction.jsp">
		<table>
			<tr>
				<td>studentNo</td>
				<td>
					<input name ="studentNo" type = "number"> 
				</td>
			</tr>
			<tr>
				<td>studentName</td>
				<td>
					<input name="studentName" type="text">
				</td>
			</tr>
			<tr>
				<td>studentBirth</td>
				<td>
					<input name="studentBirth" type="number">
				</td>
			</tr>
			<tr>
				<td>studentGender</td>
				<td>
					<input name="studentGender" type="radio" value="남">남
					<input name="studentGender" type="radio" value="여">여
				</td>
			</tr>
			<tr>
				<td>studentAddress</td>
				<td>
					<input name="studentAddress" type="text">
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<button type="submit">student 입력</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
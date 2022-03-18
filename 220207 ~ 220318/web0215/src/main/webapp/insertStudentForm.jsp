<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>insertStudentForm</title>
	<style type = "text/css">
		table {border : 1px solid #FF0000;}
		td {border : 1px solid #FF0000;}
		
		<!-- .a {border : 1px solid #FF0000;} class = "a"로 사용-->
	</style>
</head>
<body>
	<h1>학생 입력</h1>
	<form method="post" action="./insertStudentAction.jsp">
		<table>
			<tr>
				<td>번호</td>
				<td><input type="number" name="studentNo"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="studentName"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="studentBirth"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="studentAddr"></td>
			</tr>
			<tr>
				<td>학교</td>
				<td><input type="text" name="studentSchool"></td>
			</tr>
			<tr>
				<td>전공</td>
				<td><input type="text" name="studentMajor"></td>
			</tr>
			<tr>
				<td>수료</td>
				<td>
					<select name="studentComplete">
						<option value="N">N</option>
						<option value="Y">Y</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>취업</td>
				<td>
					<select name="studentJob">
						<option value="N">N</option>
						<option value="Y">Y</option>
					</select>
				</td>
			</tr>
		</table>
		<tr>
			<td colspan="2">
				<button type="submit">학생입력</button>
			</td>
		</tr>
	</form>
</body>
</html>
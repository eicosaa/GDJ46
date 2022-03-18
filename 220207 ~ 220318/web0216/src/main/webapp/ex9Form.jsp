<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorCode = "";
	if(request.getParameter("errorCode") != null) {
		errorCode = request.getParameter("errorCode");
		System.out.println(errorCode);
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex9Form</title>
</head>
<body>
	<h1>입력폼</h1>
	<div><%= errorCode %></div>
	<form method="post" action="./ex9Action.jsp">
		<div>
			관심사<br>
			<input type="checkbox" name="hobby" value="경제">경제<br>
			<input type="checkbox" name="hobby" value="IT">IT<br>
			<input type="checkbox" name="hobby" value="프로그래밍">프로그래밍<br>
			<input type="checkbox" name="hobby" value="등산">등산<br>
			<input type="checkbox" name="hobby" value="낚시">낚시<br>
		</div>
		<div>
			<input type="text" name="sn">
			<input type="text" name="sn">
		</div>
		<div>
			<button type="submit">전송</button>
		</div>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = "";
	if(request.getParameter("msg") != null) {
		msg = request.getParameter("msg");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>snForm</title>
</head>
<body>
	<h1>주민번호 입력</h1>
	<form method="post" action="./snAction.jsp">

			주민번호 : <input type = "text" name = "sn1" value="710523"> - 
			<input type = "password" name = "sn2" value="1111111">

			<button type = "submit">입력</button>
			<span><%= msg %></span>

	</form>
</body>
</html>
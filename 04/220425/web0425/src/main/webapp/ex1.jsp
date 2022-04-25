<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex1</title>
</head>
<body>
	<%
		String a = "1";
		request.setAttribute("b", "2");
		session.setAttribute("c", "3-1");
		application.setAttribute("d", "4");
	%>
</body>
</html>
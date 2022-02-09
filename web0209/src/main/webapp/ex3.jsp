<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// System.out.println(request.getParameter("id")); // admin
	// System.out.println(request.getParameter("pw")); // 1234
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>ex3</h1>
	<div>ID : <% out.print(id); %></div>
	<div>PW : <% out.print(pw); %></div>
	<!-- out.print() 표현식(축약식) -->
	<div>ID : <%= id %></div>
	<div>PW : <%= pw %></div>
</body>
</html>
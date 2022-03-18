<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<h1>주민번호입력</h1>
	<form method="post" action="./snAction2.jsp">
		<input type="text" name="sn1">
		-
		<input type="password" name="sn2">
		<button type="submit">분석</button>
		<span><%=msg%></span>
	</form>
</body>
</html>
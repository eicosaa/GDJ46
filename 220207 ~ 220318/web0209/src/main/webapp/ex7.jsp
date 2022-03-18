<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><%= 7 == 7 %></div>
	<div><%= "jsp" == "jsp" %></div>
	<div><%= "jsp".equals("jsp") %></div>
	<%
		String s1 = "jsp";
		String s2 = "jsp";
		String s3 = new String("jsp");
		String s4 = new String("jsp");
	%>
	<div>s1 : <%= s1 %></div>
	<div>s2 : <%= s2 %></div>
	<div><%=s1.equals(s2) %></div>
	 
	<div>s3 : <%= s3 %></div>
	<div>s4 : <%= s4 %></div>
	<div><%= s1 == s2 %></div>
	<div><%= s3 == s4 %></div>
	<div><%= s3.equals(s4) %></div>

</body>
</html>
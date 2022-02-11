<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	System.out.println("콘솔 테스트");
	out.print("페이지 테스트");
%>

	<div style = "color:red;">
		<%
			out.println("페이지 테스트");
		%>
	</div>
</body>
</html>
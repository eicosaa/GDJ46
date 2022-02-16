<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// String[] name = {"강민창", "강한빛", "구혜민", "김득환", "김민서"}; // 단축 표현
	String[] name = new String[5];
	name[0] = "강민창";
	name[1] = "강한빛";
	name[2] = "구혜민";
	name[3] = "김득환";
	name[4] = "김민서";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 목록</h1>
	<ol>
		<%
			for(String n : name) {
		%>
				<li><%= n %></li>
		<%				
			}
		%>
	</ol>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>학생 삭제</h1>
	<form method="post" action="./deleteStudentAction.jsp">
		<input type="text" name="studentNo" value="<%=studentNo%>" readonly="readonly">
		<div>
			<button type="submit">삭제</button>
		</div>
	</form>
</body>
</html>

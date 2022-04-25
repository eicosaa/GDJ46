<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2</title>
</head>
<body>
	<!-- -ex1을 실행하고 ex2를 실행한다. -> b는 안나오고 c, d는 나온다 -->
	<div> <%= request.getAttribute("b") %> </div>
	<div> <%= session.getAttribute("c") %> </div>
	<div> <%= application.getAttribute("d") %> </div>
</body>
</html>
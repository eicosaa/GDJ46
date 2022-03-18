<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- loginForm 카멜표현식 -->
	<!-- login_form 스네이크표현식 -->
	
	<form method = "post" action = "./loginAction.jsp">
		<div>
			ID : <input type = "text" name = "id">
		</div>
		<div>
			PW : <input type = "password" name = "pw">
		</div>
		<div>
			<button type = "submit">로그인</button>
		</div>
	</form>
</body>
</html>
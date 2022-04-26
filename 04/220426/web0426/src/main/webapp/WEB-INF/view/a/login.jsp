<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method = "post" action = "${ pageContext.request.contextPath }/a/LoginController">
	<div>
		아이디 : <input type = "text" name = "id" value = "${ cookieId }">
	</div>
	<div>
		비밀번호 : <input type = "password" name = "pw">
	</div>
	<div>
		<input type = "checkbox" name = "idSave">ID저장
	</div>
	<div>
		<button type = "submit">로그인</button>
	</div>
	</form>
</body>
</html>
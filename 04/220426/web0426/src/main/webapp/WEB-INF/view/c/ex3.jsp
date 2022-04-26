<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex3</title>
</head>
<body>
	<h1>관리자 레벨의 사용자만 접근 가능한 페이지</h1>
	<div><a href = "${ pageContext.request.contextPath }/b/LogoutController">로그아웃</a></div>
</body>
</html>
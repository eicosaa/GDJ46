<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex2</title>
</head>
<body>
	<h1>[ex2.jsp] 로그인 사용자만 접근 가능한 페이지</h1>
	<div>${ sessionLoginMember.id }님 반갑습니다. LEVEL : ${ sessionLoginMember.level }</div>
	<div><a href = "${ pageContext.request.contextPath }/b/LogoutController">로그아웃</a></div>
</body>
</html>
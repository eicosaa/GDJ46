<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String systemId = "admin";
	String systemPw = "1234";
	
	String id = request.getParameter("id");
	System.out.println(id + " <-- id"); // 디버깅 코드
	String pw = request.getParameter("pw");
	System.out.println(pw + " <-- pw"); // 디버깅 코드

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(id.equals(systemId) && pw.equals(systemPw)) { // 로그인 성공
	%>
			<div><%= id %>님 반갑습니다.</div>
	<%
		} else { // 로그인 실패
	%>
			<div>아이디 또는 패스워드가 불일치 합니다.</div>
	<%
		}
	%>
</body>
</html>
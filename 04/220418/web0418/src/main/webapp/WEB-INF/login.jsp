<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- @WebServlet("/login") 맵핑된 서블릿 클래스 객체의 doGet()메서드 호출 -->
	<form method = "post" action = "<%= request.getContextPath() %>/login">
		아이디 :
		<!-- 
			 0. 톰캣이 @WebServlet("/login") 맵핑된 서블릿 클래스 객체를 만들고 (생성자 -> init())
			    -> 존재하면 객체를 이용
			 1. 톰캣이 request = new Request() 객체를 만들고
			 2. 톰캣이 request.setParameter("userId", "사용자 입력값"), request.setParameter("userPw", "사용자 입력값")
			 3. 톰캣이 response = new Response();
			 4. 서블릿 클래스 객체의 doGet(request, response); 호출
		-->
		<input type = "text" name = "userId"> <br> 
		비밀번호 :
		<input type = "password" name = "userPw"> <br>
		<!-- 동일한 이름속성으로 여러개의 값을 넘기면 -->
		취미 : 
		<input type = "checkbox" name = "hobby" value = "game"> game
		<input type = "checkbox" name = "hobby" value = "study"> study
		<br>
		관심사 : 
		<input type = "text" name = "interest">
		<input type = "text" name = "interest"> <br>
		
		<button type = "submit">로그인</button>
		<button type = "reset">초기화</button>
	</form>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// * 변수의 생명주기 -> {}생명주기를 가진다.
	// 변수는 {}안에 만들어지고 {}이 끝나면 {}과 함께 사라진다.
	int x = 0;
	{
		// int x = 0; // x라는 변수를 중복해서 만들 수 없다
		int y = 0;
		{
			int z = 0;
		}
	}
	int y = 0; 
	int z = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
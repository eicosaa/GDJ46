<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//요청값 인코딩 처리
	request.setCharacterEncoding("utf-8"); 
	
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	String op = request.getParameter("op");
	// 디버깅
	System.out.println(x + " <-- x");
	System.out.println(y + " <-- y");
	System.out.println(op + " <-- op");
	// 이슈 1. x, y, op 값 중 공백("")값이 넘어 갈 수도 있다.
	if(x.equals("") || y.equals("") || op.equals("")) {
		System.out.println("x ,y ,op 중 공백값 존재");
		response.sendRedirect("./calForm.jsp"); // 클라이언트에게 calForm.jsp를 요청하게끔 하는 코드
		return;
	}
	
	// 이슈 2. 숫자가 넘어가야하는데 숫자를 넘기는 방법은 존재하지 않는다. 글자만 넘긴다.
	int numX = Integer.parseInt(x);
	int numY = Integer.parseInt(y);
	
	int result = 0;
	if(op.equals("add")) {
		result = numX + numY; // 변수의 생명주기 -> 블럭{}
	} else if(op.equals("sub")) {
		result = numX - numY;
	}else if(op.equals("mul")) {
		result = numX * numY;
	}else if(op.equals("div")) {
		result = numX / numY;
	}else if(op.equals("rest")) {
		result = numX % numY;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div><%= numX %> <%= op %> <%= numY %> : <%= result %></div>
	
</body>
</html>
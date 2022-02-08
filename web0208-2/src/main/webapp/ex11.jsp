<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	byte a;
	short b;
	int c;
	long d;
	
	a = 1;
	b = 2;
	c = 3;
	d = 4;
	
	c = 4 + 9; // 연산식 c = 13;
	int e = c; // 변수식 e = 13;
	
	float f;
	double g;
	
	f = 3.1F;
	g = 3.1;
	
//	e = g; // e = 3.1; 

	boolean h;
	h = true; // false
	
	char i;
	i = 'a';
	
	int x = 10;
	
	String str = "자바";
	
	String str2;
	str2 = "자바";
	
	boolean flag = false;
%>
</body>
</html>
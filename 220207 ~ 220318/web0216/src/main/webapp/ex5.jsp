<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int a = 7;
	int b = 10;
	
	// 두 개의 변수값이 바꿔서 a -> 10, b -> 7
	
	// x
	// a = 10;
	// b = 7;
	
	// swap
	a = b;
	b = a;
	System.out.println(a); // 10
	System.out.println(b); // 10
	
	int x = 1;
	int y = 10;
	System.out.printf("변경 전 x값과 y값 x : %d, y : %d \n", x, y);
	int temp = x; // 임시변수 temp 사용
	x = y;
	y = temp;
	System.out.printf("변경 후 x값과 y값 x : %d, y : %d \n", x, y);
%>
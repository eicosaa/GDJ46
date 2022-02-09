<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*
		if(논리값 | 식) {
			메서드호출식
		}
	*/
	
	System.out.println(1);
	// if문 안의 "실행문/명령문/메서드호출" 실행될 수도 있고 아닐 수도 있다.
	if(true) {
		System.out.println(2);
	}
	
	if(false) {
		System.out.println(3);
	}
	
	// itelse문 둘 중에 하나만 실행
	if(true) {
		System.out.println(4);
	} else {
		System.out.println(5);
	}
	
	if(false) {
		System.out.println(6);
	} else {
		System.out.println(7);
	}
	
	// ifelseif문 여러 개 중에 하나
	if(false) {
		System.out.println(8);
	} else if(true) {
		System.out.println(9);
	} else if(false) {
		System.out.println(10);
	}
	
	if(false) {
		System.out.println(11);
	} else if(true) {
		System.out.println(12);
	} else {
		System.out.println(13);
	}

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
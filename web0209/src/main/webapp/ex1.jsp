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
	// 값을 출력하는 방법(명령 -> 메서드)
	// System.out.println(값); 숫자값, 정수값...
	
	// 숫자값(기본타입)
	System.out.println(1); 
	System.out.println(1L);
	System.out.println(3.14F);
	System.out.println(3.14);
	
	// 논리값(기본타입)
	System.out.println(true);
	System.out.println(false);
	
	// 글자값(기본타입)
	System.out.println('a');
	System.out.println('가');
	
	// 문자열값(참조타입)
	System.out.println("사과");
	
	// 값의 자리에는 식이 대신할 수 있다.
	// 연산식
	System.out.println(2 + 3); // -> System.out.println(5);
	System.out.println(20 - 5);
	System.out.println(2 * 5);
	System.out.println(13 / 5); // 정수 나누기 정수 결과값도 정수이다.
	System.out.println(13 % 5); // 나머지 연산
	System.out.println(10 > 5); // true
	System.out.println(10 == 5); // false
	
	System.out.println(true && false); // false and연산
	System.out.println(true || false); // true  or연산
	
	System.out.println((3 > 1) && (10 % 2 == 0)); // true
	System.out.println((3 > 1) || (10 % 2 == 0)); // true
	
	System.out.println("자바" + "수업");
	
	// 변수식
	// System.out.println(x); // -> x라는 변수가 선언되지 않아서 오류, x는 값이 아니기에 오류
	int x = 7;
	int y = 10;
	System.out.println(x); // System.out.println(7);
	System.out.println(y % x); // System.out.println(10 % 7); System.out.println(3);
		
	// 메서드호출식
	System.out.println(Math.random());
	double num = 0.0;
	num = Math.random();
	System.out.println(num);
	// (int) int타입으로 값을 변환시키는 형변환 연산자
	System.out.println((int)(Math.random() * 45) + 1); // 1 ~ 45의 값
	
	
%>
</body>
</html>
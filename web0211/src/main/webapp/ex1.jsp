<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 제어문 
	// 1. 조건문(if, switch)
	// 2. 반복문(for, while)
	
	/*
		for 반복문 문법
		
		for(3개의 명령문) { 반복해야 할 코드 }

		for (for문 안에서 사용 할 변수값을 초기화; 논리값; 증감식)
		for(=연산식; >연산식; 대입식) {
			반복해야 할 코드;
		}
	*/
	// 실행순서 ①[int i = 0] -> ②[i < 10] -> ③[System.out.println("hello" + i);] -> ④[i = i + 1]
	// -> {⑤[i < 10] -> ⑥[System.out.println("hello" + i);] -> ⑦[i = i + 1]} -> ⑤⑥⑦ 반복
	for(int i = 0; i < 10; i = i + 1) { // 10번
		System.out.println("hello" + i);
	}
	
	// 10번 : 0 ~ 9
	int num = 1;
	for(int i = 0; i < 10; i = i + 1) {
		System.out.println(num);
		num = num + 1;
	}
	
	for(int i = 1; i < 11; i = i + 1) {
		System.out.println(i);
	}
	
	for(int i = 0; i < 10; i = i + 1) {
		System.out.println(i + 1);
	}
	
	// 1 ~ 10 사이의 짝수만 출력
	for(int i = 1; i <= 10; i = i + 1) {
		if(i % 2 == 0) { 
			System.out.println(i + 1);
		}
	}
	
	// 1 ~ 10(10번의 반복) 사이의 홀수(홀수 조건)만 출력
	for(int i = 1; i <= 10; i = i + 1) {
		if(i % 2 == 1) { // if(i % 2 != 0)
			System.out.println(i + 1);
		}
	}
	
	// 1 ~ 10 사이의 홀수만 출력 
	// 결과값은 동일하지만 10번의 반복도 아니고(5번) 조건을 묻는 코드가 존재하지 않음 -> 답을 알고 답만 출력하는 코드
	for(int i = 1; i <= 10; i = i + 2) {
		System.out.println(i);
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
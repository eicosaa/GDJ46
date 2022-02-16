<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 8개의 기본 타입
	// 참조 타입
	// 1) String 클래스 개별 값을 참조할 수 있는 연산자가 존재X,
	// 그래서 substring()메서드를 사용하여 개별 문자열을 참조하기도 한다.
	// 2) 사용자 정의 클래스 ex) Company.class 참조연산자 . 사용
	// 3) 배열 : 동일한 여러개의 타입을 집합으로 묶은 것. 인덱스 연산자 [] 를 사용

	int[] arr = null; // arr : 배열 타입 (int 여러 개)
	arr = new int[3]; // [0], [1], [2]
	arr[0] = 7;
	arr[1] = 3;
	arr[2] = 15;
	
	// 배열 출력 방법 ①
	System.out.println(arr[0]);
	System.out.println(arr[1]);
	System.out.println(arr[2]);
	
	// 배열 출력 방법 ②
	int i = 0;
	System.out.println(arr[i]);
	i = 1;
	System.out.println(arr[i]);
	i = 2;
	System.out.println(arr[i]);
	
	// 배열 출력 방법 ③
	for(int a = 0; a < 3; a = a + 1) {
		System.out.println(arr[a]);
	}
	
	// 배열 출력 방법 ④
	System.out.println(arr.length + " <-- 배열의 길이");
	
	for(int a = 0; a < arr.length; a = a + 1) {
		System.out.println(arr[a]);
	}
	
%>
<%@page import="vo.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 참조 타입 변수와 참조 타입 객체(값)의 메모리 형태
	// 1) String
	String name = null;
	name = "자바";
	// 참조 변수 출력 시 위치값이 아닌 참조 객체 개별값의 전체가 출력된다.
	System.out.println(name); 
	// 자바는 String 참조타입의 경우 참조 객체 개별 접근 이름을 제공하지 않는다.
	// 참조 객체 개별을 하고 싶으면 -> 메소드를 제공한다.
	System.out.println(name.substring(0, 1)); // 0번째 글자 / name[0] 이런 방식을 제공하지 않는다.
	System.out.println(name.substring(1, 2)); // 1번째 글자 / name[1] 이런 방식을 제공하지 않는다.
	
	// 2) 사용자 정의 타입(Class) <- 기본 타입으로만 구성된
	vo.Data data = null; // import코드 추가했으면 Data data = null;
	data = new vo.Data();
	// 참조연산자(.)와 참조 객체의 개별 이름을 이용하여 개별 값에 접근이 가능
	System.out.println(data.x); // 0
	System.out.println(data.y); // 0
	System.out.println(data); // 개별 값 접근이 허용되므로 참조 변수 출력 시 위치 값이 출력된다.
	// 보안 상 위치 값 출력 시 정확한 주소 값이 아닌 -> [데이터 타입 + @ + 주소 값]을 암호화 시킨 숫자 값(16진수) ex> vo.Data@431be898
	data.x = 5;
	data.y = 10;
	System.out.println(data.x); // 0
	System.out.println(data.y); // 0
	System.out.println(data);
	
	// 3) 배열 <- 기본 타입으로만 구성된
	int[] arr = null;
	arr = new int[2];
	System.out.println(arr[0]);
	System.out.println(arr[1]);
	System.out.println(arr);
	arr[0] = 7;
	arr[1] = 9;
	System.out.println(arr[0]);
	System.out.println(arr[1]);
	System.out.println(arr);
	
	/*
	char[] arr = null;
	arr = new char[2];
	System.out.println(arr[0] + " <-- arr[0]"); // 디폴트 값이 공백 문자
	System.out.println(arr[1] + " <-- arr[1]"); // 디폴트 값이 공백 문자
	System.out.println(arr + " <-- arr");
	arr[0] = '자';
	arr[1] = '바';
	System.out.println(arr[0] + " <-- arr[0]"); // 자
	System.out.println(arr[1] + " <-- arr[1]"); // 바
	System.out.println(arr + " <-- arr");
	*/
%>

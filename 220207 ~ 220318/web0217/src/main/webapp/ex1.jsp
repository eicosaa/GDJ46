<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Arrays" %>
<%
	// int[] arr = new int[5]; 
	// new 참조 객체를 만들 때 사용하는 연산자
	// int[5] 배열 객체를 만들 때 사용하는 메소드 형태
	// -① new int[5];(변수 5개 생성/0,1,2,3,4) -> 0으로 자동 초기화
	// -② int[] arr (arr변수 생성)-> 숫자 형태로 위치값 저장
	
	// 단축 표현
	int[] arr = {5, 9, 10, 3, 7};
	
	// 최대값 / 최소값 알고리즘 구현
	// 1) 범위를 알고 있다. 0 ~ 100 
	int max = 0;
	int min = 100;
	for(int num : arr) {
		if(num > max) {
			max = num;
		}
		if(num < min) {
			min = num;
		}
	}
	System.out.printf("최대값 : %d, 최소값 : %d \n", max, min);
	
	// 2) 범위를 알지 못한다.
	int max2 = arr[0];
	int min2 = arr[0];
	for(int num : arr) {
		if(num > max2) {
			max2 = num;
		}
		if(num < min2) {
			min2 = num;
		}
	}
	System.out.printf("최대값 : %d, 최소값 : %d \n", max2, min2);
	
	// 3) java.util.Arrays API를 사용(Arrays.sort(int[]))
	Arrays.sort(arr); // 입력된 배열을 오름차순으로 변경하는 static 메소드 -> arr 배열이 오름차순으로 정렬
	System.out.printf("최대값 : %d, 최소값 : %d \n", arr[arr.length - 1], arr[0]);
	// arr[arr.length - 1] -> 배열의 마지막
%>
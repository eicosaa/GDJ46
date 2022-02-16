<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 배열을 만드는 정석적인 방법
	int [] arr = new int[3]; 
	arr[0] = 7;
	arr[1] = 5;
	arr[2] = 9;
	
	// 배열을 만드는 단축문들 -> 배열을 만들고 바로 배열 값들을 초기화할 때 사용
	int[] arr2 = new int[] {7, 5, 9};
	int[] arr3 = {7, 5, 9}; 
	
	// for문 사용(조건에 따라 횟수 반복) -> 읽기, 쓰기 사용 가능
	for(int i = 0; i < arr.length; i += 1) { // i++, ++i, i+=1, i=i+1
		System.out.print(arr[i] + " ");
	}
	System.out.println(); // System.out.print("\n");
	
	// foreach문을 사용(집합 전체를 순환(처음부터 끝까지)) -> 읽기 용도로만 사용 -> 집합체 있을 때 사용 가능
	for(int n : arr) { // -int n을 arr에서 복사해온다.
		System.out.print(arr[n] + " ");
	}
%>
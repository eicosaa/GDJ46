<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int[] arr = new int [2];
	arr[0] = 2;
	arr[1] = 4;
	System.out.println("변경 전");
	for(int num : arr) {
		System.out.println(num);
	}
	
	int temp = arr[0];
	arr[0] = arr[1];
	arr[1] = temp;
	
	System.out.println("변경 후");
	for(int num : arr) {
		System.out.println(num);
	}
	
%>
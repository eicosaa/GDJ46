<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] names = new String[3];
	names[0] = "강민창";
	names[1] = "강한빛";
	
	for(String s : names) { // null 출력
		System.out.println(s);
	}
	
	// 2명이 입력되어있다는 것을 알고 있으면 
	for(int i=0; i<2; i=i+1){ 
		System.out.println(names[i]);
	}
	
	// 몇명이 입력되어 있는지 모르면
	for(int i=0; i<names.length; i=i+1){ 
		if(names[i] != null){
			System.out.println(names[i]);
		}
	}
	
	// names[3] = "김득환"; -> 에러
	// 기본 배열을 정적 배열이라 하는데 크기가 고정, 인덱스 수정이 힘들다.
%>
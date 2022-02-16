<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 27명의 시험 점수 (0 ~ 100점)
	int[] score = new int[27];
	// score[0] = (int)(Math.random() * 101); // 0.00000 * 101 -> 0.000..., 0.9999 * 101 -> 10.999...
	// 반복의 주체인 집합체가 존재하지만 27번의 쓰기 필요
	for(int i = 0; i <score.length; i += 1) {
		score[i] = (int)(Math.random() * 101);
		// score[i] = (int)(Math.random() * 51) + 50; // 50점 ~ 100점
	}
	
	// 출력 집합체도 존재, 읽기만
	for(int num : score) {
		System.out.print(num + ", ");
	}
	System.out.println();
	
	// 총점, 평균
	int total = 0;
	for(int num : score) {
		// total += num;
		total = total + num;
	}
	double average = (double)total / (double)score.length;
	System.out.println(total + " <-- total");
	System.out.println(average + " <-- average");
	
	// 평균을 소수점 첫번째 자리까지 반올림하기
	// Math.round 방법
	System.out.println(Math.round(average * 10) /10.0 + " <-- average"); 
	// String.format 방법
	System.out.println(String.format("%.1f", average) + " <-- average"); 
	
%>
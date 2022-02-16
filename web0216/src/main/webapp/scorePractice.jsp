<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 100명의 시험 점수 (0 ~ 100점)
	int[] score = new int[100];

	// 100번 생성
	for(int i = 0; i <score.length; i += 1) {
		score[i] = (int)(Math.random() * 101); // 점수를 랜덤으로 배열에 넣는다.
	}
	
	// 총점, 평균, 최고점, 최저점
	int total = 0; // 총점
	int max = 0; // 최고점
	int min = 100; // 최저점
	int count = 0; // 100점 인원수
	int count2 = 0; // 90점 이상 인원수
	int count3 = 0; // 80점이상 인원수
	int count4 = 0; // 80점미만 인원수
	
	for(int i = 0; i < score.length; i++) {
		total = total + score[i]; // 점수를 더해서 총점 만들기
		
		if(score[i] > max) { // 최고점
			max = score[i]; // 새로운 최고점이 나오면 max에 저장
		}
		if(score[i] < min) { // 최저점
			min = score[i]; // 새로운 최저점이 나오면 min에 저장
		}
		
		// 특정 점수 이상 인원
		if(score[i] == 100) {
			count = count + 1;
		} else if(score[i] >= 90) {
			count2 = count2 + 1;
		} else if(score[i] >= 80) {
			count3 = count3 + 1;
		} else {
			count4 = count4 + 1;
		}
	}
	int average = total / score.length; // 평균

	// 디버깅 코드
	// System.out.println(total + " <-- total");
	// System.out.println(average + " <-- average");
	// System.out.println(max + " <-- max score");
	// System.out.println(min + " <-- min score");
	
	System.out.printf("총점은 %d, 평균은 %d, 최고점은 %d, 최저점은 %d 입니다. \n", 
			total, average, max, min);
	System.out.println("100점 맞은 사람 수 : " + count);
	System.out.println("90점이상 맞은 사람 수 : " + count2);
	System.out.println("80점이상 맞은 사람 수 : " + count3);
	System.out.println("80점미만 맞은 사람 수 : " + count4);
	
	/*
	// 평균을 소수점 첫번째 자리까지 반올림하는 2가지 방법
	// Math.round 방법
	System.out.println(Math.round(average * 10) /10.0 + " <-- average"); 
	// String.format 방법
	System.out.println(String.format("%.1f", average) + " <-- average"); 
	*/
	
%>
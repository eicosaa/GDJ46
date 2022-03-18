<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<%
	Calendar c = Calendar.getInstance(); // 현재 시간날짜 정보를 가진 참조값
	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH); // 월은 0부터 시작 ex) 1월이면 0, ... 12월이면 11
	int date = c.get(Calendar.DATE);
	System.out.printf("%d년 %d월 %d일 \n", year, month, date); 
	
	int dayOfWeek = c.get(Calendar.DAY_OF_WEEK); // Calendar API에는 요일을 리턴하는 메소드는 없다.
	System.out.println(dayOfWeek + " <-- dayOfWeek"); // 일1, 월2, 화3, ... 토7
	String yoil = "";
	if(dayOfWeek == 1) {
		yoil = "일";
	} else if(dayOfWeek == 2) {
		yoil = "월";
	} else if(dayOfWeek == 3) {
		yoil = "화";
	} else if(dayOfWeek == 4) {
		yoil = "수";
	} else if(dayOfWeek == 5) {
		yoil = "목";
	} else if(dayOfWeek == 6) {
		yoil = "금";
	} else {
		yoil = "토";
	}
	System.out.println(yoil + " <-- yoil");
	
	// 이달의 마지막 날짜
	System.out.println(c.getActualMaximum(Calendar.DATE) + " <-- 마지막 날짜");
	
	// 날짜 변경 -> 1일로
	c.set(Calendar.DATE, 1); // c참조변수의 날짜정보값이 날짜만 1일로 변경
	System.out.println(c.get(Calendar.DATE));
	System.out.println(c.get(Calendar.DAY_OF_WEEK) + " <-- 1일 날짜의 요일값");
	// 1일 날짜의 요일값 - 1 ==> 달력의 시작공백 숫자와 일치
	
%>
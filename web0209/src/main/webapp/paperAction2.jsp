<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8"); // 인코딩
	// 비지니스 코드
	final int maxScore = 100;
	int totalQuestionCount = 10;
	
	if(maxScore % totalQuestionCount != 0) {
		response.sendRedirect("./error.jsp?errorCode=999"); // 999 점수 에러
		return;
	}
	
	int scorePerQuestion = maxScore / totalQuestionCount;
	System.out.println(scorePerQuestion + " <-- scorePerQuestion"); // 디버깅 코드
	//System.out.println("10" + " <-- scorePerQuestion");
	
	// 요청값 처리
	// 이슈
	// 1. 요청값의 null 이슈 -> 요청값이 넘어 오지 않으면 (요청값이 null 이면) "" 으로 처리
	String name = request.getParameter("name");
	if(name == null || name.equals("")) {
		response.sendRedirect("./error.jsp?errorCode=888"); // 888 네임 에러
		return;
	}
	
	String q1 = "";
 	String q2 = "";
 	String q3 = "";
 	String q4 = "";
 	String q5 = "";
 	String q6 = "";
 	String q7 = "";
 	String q8 = "";
 	String q9 = "";
 	String q10 = "";
 	if(request.getParameter("q1") == null) { 
 		q1 = request.getParameter("q1");
 	}
 	if(request.getParameter("q2") == null) { 
 		q1 = request.getParameter("q2");
 	}
 	if(request.getParameter("q3") == null) { 
 		q1 = request.getParameter("q3");
 	}
 	if(request.getParameter("q4") == null) { 
 		q1 = request.getParameter("q4");
 	}
 	if(request.getParameter("q5") == null) { 
 		q1 = request.getParameter("q5");
 	}
 	if(request.getParameter("q6") == null) { 
 		q1 = request.getParameter("q6");
 	}
 	if(request.getParameter("q7") == null) { 
 		q1 = request.getParameter("q7");
 	}
 	if(request.getParameter("q8") == null) { 
 		q1 = request.getParameter("q8");
 	}
 	if(request.getParameter("q9") == null) { 
 		q1 = request.getParameter("q9");
 	}
 	if(request.getParameter("q10") == null) { 
 		q1 = request.getParameter("q10");
 	}
	
	// 문제 정답 셋팅
	String a1 = "3";
 	String a2 = "1";
 	String a3 = "4";
 	String a4 = "2";
 	String a5 = "3";
 	String a6 = "1";
 	String a7 = "3";
 	String a8 = "3";
 	String a9 = "2";
 	String a10 = "4";
 	
 	// 점수 처리
 	int myScore = 0;
 	String star = "";
 	if(q1.equals(a1)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q2.equals(a2)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q3.equals(a3)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q4.equals(a4)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q5.equals(a5)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q6.equals(a6)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q7.equals(a7)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q8.equals(a8)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q9.equals(a9)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	if(q10.equals(a10)) {
 		myScore = myScore + scorePerQuestion;
 		star = star + "★";
 	}
 	
	// 출력 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, td {
		border : 1px, solid, #FF0000;
	}
</style>
</head>
<body>
	<h1>답안지</h1>
	<div>
		<span>이름 : <%= name %></span>
		<span>점수 : <%= myScore %></span>
		<!-- 별점 -->
		<span>
			<%= star %>
		</span>
	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>정답</th>
			<th>사용자 답</th>
			<th>true / false</th>
		</tr>
		<tr>
			<td>1</td>
			<td><%= a1 %></td>
			<td><%= q1 %></td>
			<td><%= a1.equals(q1) %></td>
		</tr>
		<tr>
			<td>2</td>
			<td><%= a2 %></td>
			<td><%= q2 %></td>
			<td><%= a2.equals(q2) %></td>
		</tr>
		<tr>
			<td>3</td>
			<td><%= a3 %></td>
			<td><%= q3 %></td>
			<td><%= a3.equals(q3) %></td>
		</tr>
		<tr>
			<td>4</td>
			<td><%= a4 %></td>
			<td><%= q4 %></td>
			<td><%= a4.equals(q4) %></td>
		</tr>
		<tr>
			<td>5</td>
			<td><%= a5 %></td>
			<td><%= q5 %></td>
			<td><%= a5.equals(q5) %></td>
		</tr>
		<tr>
			<td>6</td>
			<td><%= a6 %></td>
			<td><%= q6 %></td>
			<td><%= a6.equals(q6) %></td>
		</tr>
		<tr>
			<td>7</td>
			<td><%= a7 %></td>
			<td><%= q7 %></td>
			<td><%= a7.equals(q7) %></td>
		</tr>
		<tr>
			<td>8</td>
			<td><%= a8 %></td>
			<td><%= q8 %></td>
			<td><%= a8.equals(q8) %></td>
		</tr>
		<tr>
			<td>9</td>
			<td><%= a9 %></td>
			<td><%= q9 %></td>
			<td><%= a9.equals(q9) %></td>
		</tr>
		<tr>
			<td>10</td>
			<td><%= a10 %></td>
			<td><%= q10 %></td>
			<td><%= a10.equals(q10) %></td>
		</tr>		
	</table>
</body>
</html>
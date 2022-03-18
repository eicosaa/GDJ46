<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Calendar" %>
<%
	Calendar targetDay = Calendar.getInstance(); // 오늘날짜
	// targetDay.set(Calendar.MONTH, 11); // 12월로 변경 후 확인
	targetDay.set(Calendar.DATE, 1); // 타겟날짜를 오늘에서 1일로 변경	
	// 2월 1일 요일을 알면?
	int beginBlank = targetDay.get(Calendar.DAY_OF_WEEK) - 1; 
	System.out.println(beginBlank + " <-- beginBlank");
	// Calendat API에 마지막 날짜 값을 리턴하는 메소드
	int lastDate = targetDay.getActualMaximum(Calendar.DATE);
	System.out.println(lastDate + " <-- lastDate");
	
	int endBlank = 0;
	if((beginBlank + lastDate) % 7 != 0) {
		endBlank = 7 - (beginBlank + lastDate) % 7;
	}
					
	int totalTd = beginBlank + lastDate + endBlank;
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table, th, td {border : 1px dashed #F15F5F;}
	</style>
</head>
<body>
	<h1><%= targetDay.get(Calendar.YEAR) %>년 <%= targetDay.get(Calendar.MONTH) %>월</h1>
	<table>
		<tr>
			<th>일</th> 
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
			<%
				for(int i=1; i<=totalTd; i=i+1) {
			%>
					<td>
					<%	
						int num = i - beginBlank;
						if(num < 1 || num > lastDate) {
					%>
							&nbsp;
					<%
						} else {
					%>
							<%= num %>
					<%
						}
					%>
					</td>
			<%
					if(i != totalTd && i % 7 == 0) {
			%>
						</tr><tr>
			<%
					}
				}
			%>
		</tr>
	</table>
</body>
</html>
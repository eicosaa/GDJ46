<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	request.setCharacterEncoding("utf-8");
 
 	int result = 0; //점수
 
 	String a1 = "4"; // 정답
 	String a2 = "1";
 	String a3 = "4";
 	String a4 = "2";
 	String a5 = "3";
 	String a6 = "1";
 	String a7 = "3";
 	String a8 = "3";
 	String a9 = "2";
 	String a10 = "4";
 	
 	String name = request.getParameter("name");
 	String q1 = request.getParameter("q1");
 	String q2 = request.getParameter("q2");
 	String q3 = request.getParameter("q3");
 	String q4 = request.getParameter("q4");
 	String q5 = request.getParameter("q5");
 	String q6 = request.getParameter("q6");
 	String q7 = request.getParameter("q7");
 	String q8 = request.getParameter("q8");
 	String q9 = request.getParameter("q9");
 	String q10 = request.getParameter("q10");
 	
 	System.out.println(q1 + " <-- q1"); // 디버깅 코드
 	System.out.println(q5 + " <-- q5"); // 디버깅 코드
 	System.out.println(q10 + " <-- q10"); // 디버깅 코드
 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div> 이름 : <%= name %></div>

	<%
		if(q1.equals(a1)) { // 문제와 답 일치 확인
	%>
			<div>선택한 1번문제 답 : <%= q1 %> 정답 : <%= a1 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 1번문제 답 : <%= q1 %> 정답 : <%= a1 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q2.equals(a2)) { // 문제와 답 일치 확인
	%>
			<div>선택한 2번문제 답 : <%= q2 %> 정답 : <%= a2 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 2번문제 답 : <%= q2 %> 정답 : <%= a2 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q3.equals(a3)) { // 문제와 답 일치 확인
	%>
			<div>선택한 3번문제 답 : <%= q3 %> 정답 : <%= a3 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 3번문제 답 : <%= q3 %> 정답 : <%= a3 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q4.equals(a4)) { // 문제와 답 일치 확인
	%>
			<div>선택한 4번문제 답 : <%= q4 %> 정답 : <%= a4 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 4번문제 답 : <%= q4 %> 정답 : <%= a4 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q5.equals(a5)) { // 문제와 답 일치 확인
	%>
			<div>선택한 5번문제 답 : <%= q5 %> 정답 : <%= a5 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 5번문제 답 : <%= q5 %> 정답 : <%= a5 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q6.equals(a6)) { // 문제와 답 일치 확인
	%>
			<div>선택한 6번문제 답 : <%= q6 %> 정답 : <%= a6 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 6번문제 답 : <%= q6 %> 정답 : <%= a6 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q7.equals(a7)) { // 문제와 답 일치 확인
	%>
			<div>선택한 7번문제 답 : <%= q7 %> 정답 : <%= a7 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>	
	<%
		} else { 
	%>
			<div>선택한 7번문제 답 : <%= q7 %> 정답 : <%= a7 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q8.equals(a8)) { // 문제와 답 일치 확인
	%>
			<div>선택한 8번문제 답 : <%= q8 %> 정답 : <%= a8 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 8번문제 답 : <%= q8 %> 정답 : <%= a8 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q9.equals(a9)) { // 문제와 답 일치 확인
	%>
			<div>선택한 9번문제 답 : <%= q9 %> 정답 : <%= a9 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 9번문제 답 : <%= q9 %> 정답 : <%= a9 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<%
		if(q10.equals(a10)) { // 문제와 답 일치 확인
	%>
			<div>선택한 10번문제 답 : <%= q10 %> 정답 : <%= a10 %> 답 일치 여부 : O</div>
	<%
			result = result + 10;
	%>
	<%
		} else { 
	%>
			<div>선택한 10번문제 답 : <%= q10 %> 정답 : <%= a10 %> 답 일치 여부 : x</div>
	<%
		}
	%>
	
	<div> <%= name %>님 점수는 <%= result %>점 입니다.</div>
</body>
</html>
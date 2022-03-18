<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String ck = request.getParameter("ck");
	System.out.println(ck + " <-- ck");
	
	String dice1 = "ready.jpg";
	String dice2 = "ready.jpg";
	int r1 = 0;
	int r2 = 0;
	if(ck != null) {
		r1 = (int)(Math.random() * 6) + 1;
		r2 = (int)(Math.random() * 6) + 1;
		// 첫번째 주사위 이미지 셋팅
		if(r1 == 1) {
			dice1 = "one.jpg";
		} else if(r1 == 2) {
			dice1 = "two.JPG";
		} else if(r1 == 3) {
			dice1 = "three.jpg";
		} else if(r1 == 4) {
			dice1 = "four.jpg";
		} else if(r1 == 5) {
			dice1 = "five.jpg";
		} else if(r1 == 6) {
			dice1 = "six.jpg";
		}
		// 두번째 주사위 이미지 셋팅
		if(r2 == 1) {
			dice2 = "one.jpg";
		} else if(r2 == 2) {
			dice2 = "two.JPG";
		} else if(r2 == 3) {
			dice2 = "three.jpg";
		} else if(r2 == 4) {
			dice2 = "four.jpg";
		} else if(r2 == 5) {
			dice2 = "five.jpg";
		} else if(r2 == 6) {
			dice2 = "six.jpg";
		}
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>dicePlay</title>
</head>
<body>
	<h1>주사위 던지기</h1>
	<a href="../index.jsp">홈으로</a>
	
	<div>
		<img src="../images/<%= dice1 %>" width="200" height="200">
		<img src="../images/<%= dice2 %>" width="200" height="200">
	</div>
	<div>주사위 합 : <%= r1 + r2 %></div>
	<form method="post" action="./dicePlay.jsp">
		<!-- <input type="text" name="play" value="play" readonly="readonly"> -->
		<input type="hidden" name="ck" value="play">
		<button type="submit">play</button>
	</form>
</body>
</html>
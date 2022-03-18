<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// swap을 사용한 로또번호추출기
	// 45개의 공을 만들기
	// 1번부터 45번까지 마킹한다.
	// 섞는다.
	// 앞에서 6개만 추출한다.
	
	int[] ball = new int[45];
	for(int i = 0; i < ball.length; i = i + 1) {
		ball[i] = i + 1;
	}
	System.out.println("초기화 후(1 ~ 45) ");
	for(int num : ball) {
		System.out.print(num + " ");
	}
	System.out.println();
	
	// shuffle
	for(int i = 0; i < 10000; i = i + 1) { // 10000번의 행위를 하겠다. 0번째와 임의의 위치(0~44)의 변수값을 변경
		// swap
		int temp = ball[0];
		int r = (int)(Math.random() * 45); // 0 ~ 44
		ball[0] = ball[r];
		ball[r] = temp;
	}
	System.out.println("shuffle 후");
	/*
	for(int num : ball) {
		System.out.print(num + " ");
	}
	System.out.println();
	*/
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex7</title>
</head>
<body>
	<%
		for(int i = 0; i < 6; i = i + 1) {
	%>
			<span><%= ball[i] %></span>
	<%
		}
	%>
</body>
</html>
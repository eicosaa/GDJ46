<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 1부터 10까지의 합
	int sum = 0;
	for(int i = 1; i <= 10; i = i + 1) { // i=i+1; i+=1; i++; ++i;
		// i값을 누적해서 저장할 수 있는 변수가 필요
		sum = sum + i;
	}
	System.out.println(sum + " <-- 1 ~ 10까지의 합");
	
	// 2. 1부터 20사이의 3의 배수
	for(int i=1; i<=20; i=i+1) {
		if(i%3 == 0) { // i를 3으로 나누었을 때 나머지가 0인 조건 -> 3의 배수
			System.out.println(i);
		}
	}
	
	// 3. 1부터 100번까지 번호가 부여된 그룹이 있다. 10명씩 한 팀이 되고 각 팀의 1번이 팀장
	// 팀장의 번호를 출력하세요.
	for(int i=1; i<=100; i=i+1) {
		if(i%10 == 1) { 
			System.out.println(i);
		}
	}
	
	// 4. 2000년부터 2100년 사이의 윤년을 출력하세요.
	// 윤년
	// 4-1. 400년에 한 번씩 온다 -> 400으로 나누었을 때 나누어 떨어진다.
	// 4-2. 100으로 나누어 떨어지지 않으면서 4로 나누어 떨어지면 윤년이다.
	for(int i=2000; i<=2100; i=i+1){
		if(i%400 == 0 || (i%100 != 0 && i%4 == 0)) {
				System.out.println(i);
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
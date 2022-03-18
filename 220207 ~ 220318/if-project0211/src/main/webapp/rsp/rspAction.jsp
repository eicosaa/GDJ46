<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// rspAction 역할
	// 1. rspForm 넘겨준 요청 분석 (요청값을 처리, 가공)
	request.setCharacterEncoding("utf-8"); // 인코딩 처리
	
	// 1-1. 요청 유효성 검사
	// if (true / false) {... true/false 결과를 내는 연산식 : >, <, ==, !=, ||, &&, ...
	if(request.getParameter("userRsp") == null || request.getParameter("userRsp") == "") { 
		// 클라이언트가 재요청(주소창 새 주소를 타이핑 후 엔터를 치는 행위)하게 만드는 메서드
		response.sendRedirect("./rspForm.jsp?msg=Choose RSP!"); // 매개값 <- 새 주소를 문자열로 입력
		return; // 1. 실행코드(메서드)를 중지 2. 실행코드를 호출한 쪽에 값을 리턴
	}
	
	String userRsp = ""; // 가위, 바위, 보
	userRsp = request.getParameter("userRsp");
	// ★★★★★디버깅★★★★★
	System.out.println(userRsp + " <-- userRsp");
	
	// 2. 시스템이 가위 / 바위 / 보 중 하나를 선택할 수 있도록 로직(처리 코드)을 제공
	String sysRsp = "";
	// 2-1. 3가지 경우에 따라서 sysRsp가 가위, 바위, 보
	int randomNum = (int)(Math.random() * 3); // 0 / 1 / 2 -> 3가지 경우에 따는 분기(조건) -> if문
	// ★★★★★디버깅★★★★★
	System.out.println(randomNum + " <-- randomNum");
	if(randomNum == 0) {
		sysRsp = "가위";
	} else if(randomNum == 1) {
		sysRsp = "바위";
	} else if(randomNum == 2) {
		sysRsp = "보";
	}
	// ★★★★★디버깅★★★★★
	System.out.println(sysRsp + " <-- sysRsp");
	
	//3. 사용자의 선택 vs 시스템의 선택 --> 결과치
	String result = ""; // 사용자가 이겼습니다, 졌습니다, 비겼습니다.
	if(userRsp.equals(sysRsp)) {
		result = "비겼습니다.";
	} else if(userRsp.equals("가위") && sysRsp.equals("보")
			|| userRsp.equals("보") && sysRsp.equals("바위")
			|| userRsp.equals("바위") && sysRsp.equals("가위")) {
		result = "이겼습니다.";
	} else {
		result = "졌습니다.";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rspAction</title>
</head>
<body>
	<div>사용자의 선택 : <%= userRsp %></div>
	<div>시스템의 선택 : <%= sysRsp %></div>
	<div>사용자가 <%= result %></div>
</body>
</html>
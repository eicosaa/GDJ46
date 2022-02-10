<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%	
	// 유효성 검사 코드 (null check 유효성 코드)
	if(request.getParameter("sn1") == null || request.getParameter("sn2") == null) {
		response.sendRedirect("./snForm.jsp?msg=incorrect sn : null");
		return;
	}
	
	// 값 길이의 유효성 체크 코드
	String sn1 = request.getParameter("sn1");
	String sn2 = request.getParameter("sn2");
	int sn1Len = sn1.length();
	System.out.println(sn1Len); 
	System.out.println(sn2.length()); // 문자열변수.length() 메서드는 문자열글자수를 리턴한다(남긴다)
	if(sn1.length() != 6 || sn2.length() != 7) { // sn1의 길이가 6이 아니거나 sn2의 길이가 7이 아니면
		response.sendRedirect("./snForm.jsp?msg=incorrect sn : length");
		return;
	}
	
	// 분석에 용이하도록 데이터 가공
	String sn = sn1 + sn2;
	
	// 사전지식 : 주민번호에 대한 이해(개발자 공부)
	
	// 나이
	// import 선언 전 표현
	// java.util.Calendar today = java.util.Calendar.getInstance();
	// import 선언 후 변경된 코드
	Calendar today = Calendar.getInstance(); // today 변수에는 오늘 날짜 데이터(참조타입)가 대입(할당)
	System.out.println(today); // [디버깅] 오늘 날짜 정보 출력
	
	// 오늘 날짜의 년도
	int todayYear = 0;
	todayYear = today.get(Calendar.YEAR);
	System.out.println(todayYear + " <-- todayYear");
	
	// 생일 날짜의 년도
	String zeroOne = sn.substring(0, 2); // sn문자열을 위치 0부터 위치 2 앞에까지 잘라서 리턴
	// 위치 6의 문자에 따라 21세기, 20세기, 19세기에 태어났는지가 구분
	String six = sn.substring(6, 7); // sn문자열을 위치 6부터 위치 7 앞에까지 잘라서 리턴
	String preYear = "";
	if(six.equals("0") || six.equals("9")) {
		preYear = "18";
	} else if(six.equals("1") || six.equals("2") || six.equals("5") || six.equals("6")) {
		preYear = "19";
	} else {
		preYear = "20";
	}
	
	int birthYear = Integer.parseInt(preYear + zeroOne); // "19"+"71" 결과물을 숫자로
	
	int age = todayYear - birthYear;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>snAction</title>
</head>
<body>
	<div> 주민번호 : <%= sn %> </div>
	<div> 나이 : <%= age %> </div>
</body>
</html>
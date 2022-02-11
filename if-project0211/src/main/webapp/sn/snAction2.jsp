<!-- 출생신고지역부분을 <=, >= 사용하여 코드를 좀 더 짧게 작성 -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>

<%
	// 널체크 유효성 체크 코드 
	// if조건문 -> if(논리값){코드} -> 값이 true값이면 {}안 코드를 실행
	// 값 자리에는 항상 식이 대신 나올 수 있다.
	if(request.getParameter("sn1")==null || request.getParameter("sn2")==null) { // 메서드호출식, 연산식(비교, 논리)
		response.sendRedirect("./snForm.jsp?msg=incorrect sn : null");
		return;
	}
	
	// 값길이의 유효성 체크 코드
	String sn1 = request.getParameter("sn1");
	String sn2 = request.getParameter("sn2");
	int sn1Len = sn1.length(); // 문자열변수.length() 메서드는 문자열글자수를 리턴한다(남긴다)
	System.out.println(sn1Len); 
	System.out.println(sn2.length());
	if(sn1.length() != 6 || sn2.length() != 7) { // sn1의 길이가 6이 아니거나 또는 sn2의 길이가 7이 아니거나
		response.sendRedirect("./snForm.jsp?msg=incorrect sn : length");
		return; // 1. 실행코드를 종료 return void;
	}
	
	// 분석에 용이하도록 데이터 가공
	String sn = sn1+sn2;
	
	// 사전지식 : 주민번호에 대한 이해(개발자 공부)
	
	// 나이
	// import 선언 전 표현
	// java.util.Calendar today = java.util.Calendar.getInstance();
	// import 선언 후 변경된 코드
	Calendar today = Calendar.getInstance(); // today변수에는 오늘 날짜 데이터(참조타입)가 대입(할당)
	System.out.println(today); // [디버깅] 오늘 날짜 정보 출력
	
	// 오늘 날짜의 년도
	int todayYear = 0;
	todayYear = today.get(Calendar.YEAR);
	System.out.println(todayYear+" <-todayYear");
	
	// 생일날짜의 년도
	String zeroOne = sn.substring(0, 2); // sn문자열을 위치0부터 위치2앞에 까지 잘라서 리턴
	// 위치6의 문자에 따라 21세기, 20세기, 19세기에 태어났는지가 구분
	String six = sn.substring(6, 7); // sn문자열을 위치6부터 위치7앞에 까지 잘라서 리턴
	String preYear = "";
	if(six.equals("0") || six.equals("9")) {
		preYear = "18";
	} else if(six.equals("1") || six.equals("2") || six.equals("5") || six.equals("6")) {
		preYear = "19";
	} else {
		preYear = "20";
	}
	
	int birthYear = Integer.parseInt(preYear + zeroOne); //"19"+"71" 결과물을 숫자로
	
	int age = todayYear - birthYear;
	
	// 성별 구하기(일곱번째 : 위치값 6의 값을 숫자로 변경 후 홀수인가 짝수인가로 구분)
	// 홀수 -> 남성, 짝수 -> 여성
	// 연산을 위해서 일곱번째 위차값 6의 문자값을 숫자로 변경
	// 변수선언 시 초기화도 같이 한다.
	int numSix = 0; // 문자값을 숫자로 변경한 값을 저장하기 위한 변수
	// 자료형 int 변수이름 numSix 대입연산자 = 값 0 명령/문장의 종결자 ;
	// -대입연산자 우측 값을 좌측에 넣는다. 좌측에는 값이 올 수 없다. 
	
	numSix = Integer.parseInt(six); // 어떤 문자를 숫자로 변경해서 리턴, 문자입력값 필요 /Double.parseDouble(); -문자값을 double로 바꾼다.
	// gender -> 남 or 여
	String gender = "남"; // 참조변수는 대부분 null로 초기화, 문자열같은 경우는 gender = ""; 공백하는 경우도 있다.
	if(numSix % 2 == 0) {
		gender = "여";
	} 
	
	// 출생 신고 지역
	int area = Integer.parseInt(sn.substring(7, 9)); // 위치7부터 위치9앞에까지 (7,8번째 자리의 숫자)
	String area2 = ""; // area2를 문자형으로 저장하고 초기화
	System.out.println(area + " <- area"); // 디버깅 코드
	if(area == 44 || area == 96) {
		area2 = "세종특별자치시";
	} else if (area == 40) {
		area2 = "대전광역시";
	} else if (area == 85) {
		area2 = "울산광역시";
	} else if (area == 55 || area == 56) {
		area2 = "광주광역시";
	} else if (area == 94 || area == 95) {
		area2 = "제주특별자치도";
	} else if (area == 55 || area == 56) {
		area2 = "광주광역시";
	} else if (area >= 0 && area <= 8) {
		area2 = "서울특별시";
	} else if (area >= 9 && area <= 12) {
		area2 = "부산광역시";
	} else if (area >= 13 && area <= 15) {
		area2 = "인천광역시";
	} else if (area >= 16 && area <= 25) {
		area2 = "경기도";
	} else if (area >= 26 && area <= 34) {
		area2 = "강원도";
	} else if (area >= 35 && area <= 39) {
		area2 = "충청북도";
	} else if (area >= 41 && area <= 47) {
		area2 = "충청남도";
	} else if (area >= 48 && area <= 54) {
		area2 = "전라북도";
	} else if (area >= 55 && area <= 66) {
		area2 = "전라남도";
	} else if (area >= 67 && area <= 69 || area == 76) {
		area2 = "대구광역시";
	} else if (area >= 70 && area <= 81) {
		area2 = "경상북도";
	} else if (area >= 82 && area <= 93) {
		area2 = "경상남도";
	} else {
		area2 = "잘못된 지역번호 입니다.";
	}
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>snAction</title>
</head>
<body>
	<div>주민번호 : <%= sn %></div>
	<div>나이 : <%= age %></div>
	<div>
		성별 : 
		<%
			if(gender.equals("남")) {
		%>
			<img src = "../images/boy.png" width="100" height="100">
		<% 
			} else {
		%>
			<img src = "../images/girl.png" width="100" height="100">
		<% 
			}
		%>
	</div>
	<div>출생 신고 지역 : <%= area2 %></div>
</body>
</html>
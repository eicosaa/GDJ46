<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.Student" %>
<%
	// 1. 요청(request) 처리 (Controller Layer)
	// HttpServletRequest Request request = new Request(); <-- 톰캣이 이런 코드를 추가해주기에 만든 적이 없지만 이미 존재한다.  
	
	// 일반 메소드 (static 메소드 아님) void setCharacterEncoding(String)
	// 입력 받은 문자열의 인코딩값으로 request안의 값들의 인코딩을 설정
	request.setCharacterEncoding("utf-8"); 
	// 안전장치를 위한 코드(유효성 검사)
	String tempNo = request.getParameter("studentNo"); // 일반 메소드
	int studentNo = Integer.parseInt(tempNo); // static 메소드
	System.out.println(studentNo + " <-- studentNo"); // 디버깅 코드
	
	String studentName = request.getParameter("studentName");
	System.out.println(studentName + " <-- studentName");
	
	String studentBirth = request.getParameter("studentBirth");
	System.out.println(studentBirth + " <-- studentBirth");
	
	String studentAddr = request.getParameter("studentAddr");
	System.out.println(studentAddr + " <-- studentAddr");
	
	String studentSchool = request.getParameter("studentSchool");
	System.out.println(studentSchool + " <-- studentSchool");
	
	String studentMajor = request.getParameter("studentMajor");
	System.out.println(studentMajor + " <-- studentMajor");
	
	String studentComplete = request.getParameter("studentComplete");
	System.out.println(studentComplete + " <-- studentComplete");
	
	String studentJob = request.getParameter("studentJob");
	System.out.println(studentJob + " <-- studentJob");
	
	// 2. 요청처리에 대한 결과를 데이터화 -> 모델값 (Model Layer)
	// 8개의 요청 입력값을 하나의 논리적 변수에 묶어서 담는다. -> 새로운 참조타입 필요하다.(Student.class)
	// A.java(소스파일) -> 해석 프로그램(컴파일러) -> A.class(실행파일, 기계어)
	Student student = new Student();
	student.studentNo = studentNo;
	student.studentName = studentName;
	student.studentBirth = studentBirth;
	student.studentAddr = studentAddr;
	student.studentSchool = studentSchool;
	student.studentMajor = studentMajor;
	student.studentComplete = studentComplete;
	student.studentJob = studentJob;
		
	// 3. 출력 (View Layer)
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>insertStudentAction</title>
	<style type="text/css">
		table, td {border : 1px solid #00FF00;}
	</style>
</head>
<body>
	<h1>학생 정보</h1>
	<table>
		<tr>
			<td>번호</td>
			<td><%= student.studentNo %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%= student.studentName %></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><%= student.studentBirth %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%= student.studentAddr %></td>
		</tr>
		<tr>
			<td>학교</td>
			<td><%= student.studentSchool %></td>
		</tr>
		<tr>
			<td>전공</td>
			<td><%= student.studentMajor %></td>
		</tr>
		<tr>
			<td>수료</td>
			<td><%= student.studentComplete %></td>
		</tr>
		<tr>
			<td>취업</td>
			<td><%= student.studentJob %></td>
		</tr>
	</table>
</body>
</html>
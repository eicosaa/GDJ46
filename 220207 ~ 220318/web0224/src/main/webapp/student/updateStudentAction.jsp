<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*" %>
<%
	request.setCharacterEncoding("utf-8"); // 인코딩
	
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	String studentName = request.getParameter("studentName");
	int studentBirth = Integer.parseInt(request.getParameter("studentBirth"));
	String studentGender = request.getParameter("studentGender");
	String studentAddress = request.getParameter("studentAddress");
	
	// 요청에서 넘겨진 값들을 가공
	Student student = new Student();
	student.studentNo = studentNo;
	student.studentName = studentName;
	student.studentBirth = studentBirth;
	student.studentGender = studentGender;
	student.studentAddress = studentAddress;
	
	// 오라클 드라이버 로딩, 오라클 RDBMS에 접속
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	System.out.println("updateStudentAction.jsp 드라이버 로딩 성공");
	
	// 쿼리를 저장
	PreparedStatement stmt = conn.prepareStatement("update student set student_name=?, student_birth=?, student_gender=?, student_address=?, update_date=sysdate where student_no=?");
	stmt.setString(1, student.studentName);
	stmt.setInt(2, student.studentBirth);
	stmt.setString(3, student.studentGender);
	stmt.setString(4, student.studentAddress);
	stmt.setInt(5, student.studentNo);
	int row = stmt.executeUpdate();
	
	if(row == 0) {
		System.out.println("수정 실패");
		response.sendRedirect("./updateStudentForm.jsp?studentNo=" + student.studentNo);
	} else if(row == 1) {
		System.out.println("수정 성공");
		response.sendRedirect("./studentOne.jsp?studentNo=" + student.studentNo);
	} else {
		System.out.println("수정 에러(updateStudentAction.jsp)");
	}
	
	conn.close();
%>
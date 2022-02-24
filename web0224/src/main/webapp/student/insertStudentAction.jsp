<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "vo.Student" %>
<%
	request.setCharacterEncoding("utf-8");

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
	
	// 오라클 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	
	// 오라클 RDBMS에 접속
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	
	PreparedStatement stmt = conn.prepareStatement("insert into student( student_no, student_name, student_birth, student_gender, student_address, create_date, update_date ) values ( ?, ?, ?, ?, ?, sysdate, sysdate )");
	stmt.setInt(1, student.studentNo);
	stmt.setString(2, student.studentName);
	stmt.setInt(3, student.studentBirth);
	stmt.setString(4, student.studentGender);
	stmt.setString(5, student.studentAddress);
	
	int row = stmt.executeUpdate(); // 몇 행을 입력했는지 return
	// 디버깅
	if(row == 1) {
		System.out.println(row + "행 입력 성공");
	} else {
		System.out.println("입력 실패");
	}
	conn.close(); // -conn있는 코드에서 close로 닫는다.
	
	response.sendRedirect("./studentList.jsp");
%>
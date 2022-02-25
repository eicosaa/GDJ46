<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="vo.*" %>
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));
	System.out.println("deleteStudentAction.jsp(studentNo) : " + studentNo); // 디버깅 코드
	
	// 요청에서 넘겨진 값들을 가공
	Student student = new Student();
	student.studentNo = studentNo;
	
	// 오라클 드라이버 로딩, 오라클 RDBMS에 접속
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","java1004");
	System.out.println("deleteBoardAction.jsp 드라이버 로딩 성공");
	
	// 쿼리를 저장
	PreparedStatement stmt = conn.prepareStatement("delete from student where student_no=?");
	stmt.setInt(1, student.studentNo);
	int row = stmt.executeUpdate();
	conn.close();
	
	if(row == 0) { // 삭제 실패
		System.out.println("삭제 실패");
		response.sendRedirect("./deleteStudentForm.jsp?studentNo=" + student.studentNo);
	} else if(row == 1) { // 삭제 성공
		System.out.println("삭제 성공");
		response.sendRedirect("./studentList.jsp");
	} else { // 여러 행이 삭제되면 에러
		System.out.println("삭제 에러(deletestudentAction.jsp)");
	}
%>
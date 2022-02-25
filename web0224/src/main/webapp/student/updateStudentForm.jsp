<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo"));

	// 수정 전 데이터 조회(가져오기)
	
	// 오라클 드라이버 로딩, 오라클 RDBMS에 접속
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	System.out.println("updateStudentAction.jsp 드라이버 로딩 성공");
	
	// 쿼리 저장
	PreparedStatement stmt = conn.prepareStatement("select student_no, student_name, student_birth, student_gender, student_address from student where student_no=?");
	stmt.setInt(1, studentNo);
	ResultSet rs = stmt.executeQuery();
	Student student = null;
	if(rs.next()) {
		student = new Student();
		student.studentNo = rs.getInt("student_no");
		student.studentName = rs.getString("student_name");
		student.studentBirth = rs.getInt("student_birth");
		student.studentGender = rs.getString("student_gender");
		student.studentAddress = rs.getString("student_address");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, td {
		border: 1px solid #990085;
	}
</style>
</head>
<body>
	<h1>글 수정</h1>
	<form method="post" action="./updateStudentAction.jsp">
		<table>
			<tr>
				<td>studentNo</td>
				<td>
					<input type="number" name="studentNo" readonly="readonly" value="<%= student.studentNo %>">
				</td>
			</tr>
			<tr>
				<td>studentName</td>
				<td>
					<input type="text" name="studentName" value="<%= student.studentName %>">
				</td>
			</tr>
			<tr>
				<td>studentBirth</td>
				<td>
					<input type="text" name="studentBirth" value="<%= student.studentBirth %>">
				</td>
			</tr>
			<tr>
				<td>studentGender</td>
				<td>
					<input name="studentGender" type="radio" value="남">남
					<input name="studentGender" type="radio" value="여">여
				</td>
			</tr>
			<tr>
				<td>studentAddress</td>
				<td>
					<input type="text" name="studentAddress" value="<%= student.studentAddress %>">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*" %>
<%
	int studentNo = Integer.parseInt(request.getParameter("studentNo")); 
	System.out.println(studentNo + " <-- studentNo"); // 디버깅
	
	// 오라클 드라이브 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	System.out.println(conn + " <-- conn");
	
	PreparedStatement stmt = conn.prepareStatement("select * from student where student_no = ?");
	stmt.setInt(1, studentNo); //?에 요청값 대입
	System.out.println(stmt+"<-stmt"); //디버깅
	
	ResultSet rs = stmt.executeQuery();
	System.out.println(rs + " <-- ResultSet");//디버깅
	Student student = null;
	if(rs.next()){ 
		student = new Student();
		student.studentNo = rs.getInt("student_no");
		student.studentName =rs.getString("student_name");
		student.studentBirth=rs.getInt("student_birth");
		student.studentGender=rs.getString("student_gender");
		student.studentAddress=rs.getString("student_Address");
		student.createDate = rs.getString("create_date");
		student.updateDate=rs.getString("update_date");
	}
	
	conn.close(); // Connection 객체는 사용이 끝나면 반납
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>studentOne</title>
<style type="text/css">
	table, th, td {border : 1px solid #A566FF;}
</style>
</head>
<body>
	<h1>student 상세보기</h1>
	<table>
		<tr>
			<td>studentNo</td>
			<td><%= student.studentNo %></td>
		</tr>
		<tr>
			<td>studentName</td>
			<td><%= student.studentName %></td>
		</tr>
		<tr>
			<td>studentBirth</td>
			<td><%= student.studentBirth %></td>
		</tr>
		<tr>
			<td>studentGender</td>
			<td><%= student.studentGender %></td>
		</tr>
		<tr>
			<td>studentAddress</td>
			<td><%= student.studentAddress %></td>
		</tr>
		<tr>
			<td>createDate</td>
			<td><%= student.createDate %></td>
		</tr>
		<tr>
			<td>updateDate</td>
			<td><%= student.updateDate %></td>
		</tr>
	</table>
	<div>
		<a href = "./updateStudentForm.jsp?studentNo=<%= student.studentNo %>">[수정]</a>
		<a href = "./deleteStudentForm.jsp?studentNo=<%= student.studentNo %>">[삭제]</a>
	</div>
</body>
</html>
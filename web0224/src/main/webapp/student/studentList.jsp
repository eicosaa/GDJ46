<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.Student" %>
<%@page import="java.util.ArrayList"%>
<%
	
	// 인코딩
	//request.setCharacterEncoding("utf-8");
		
	// 오라클 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공");
	
	// 오라클 RDBMS에 접속
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	System.out.println("드라이버 로딩 성공");
	
	// 쿼리를 저장 (내림차순 정렬 : desc 사용)
	PreparedStatement stmt = conn.prepareStatement("select student_no, student_name from student order by student_no asc");
	System.out.println(stmt + " <-- stmt");
	
	// 쿼리를 실행 후 결과값(테이블 모양의 ResultSet타입)을 리턴
	ResultSet rs = stmt.executeQuery();
	System.out.println(rs + " <-- rs");
	
	// 4) Resultset -> ArrayList<Student> 변경
	ArrayList<Student> list = new ArrayList<Student>();
	while(rs.next()) { // next()메소드는 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		Student s = new Student();
		s.studentNo = rs.getInt("student_no");
		s.studentName = rs.getString("student_name");
		list.add(s);
	}
	
	conn.close(); // -conn있는 코드에서 close로 닫는다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardList</title>
<style type="text/css">
	table, th, td {border : 1px solid #4374D9;}
</style>
</head>
<body>

	<h1>student 리스트</h1>
	<div>
		<a href = "./insertStudentForm.jsp">student 글 입력</a>
	</div>
	<table>
		<thead>
			<tr>
				<th> student_no </th>
				<th> student_name </th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Student s : list) {
			%>
					<tr>
						<td><%= s.studentNo %></td>
						<td><a href = "./studentOne.jsp?studentNo=<%= s.studentNo %>"><%= s.studentName %></a></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>
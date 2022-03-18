<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.Job" %>
<%@page import="java.util.ArrayList"%>
<%
	// oracle 접속 -> student 테이블 -> select 결과물 -> Arraylist 변경 -> 출력
	
	// 0) 오라클 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공");
	
	// 1) 오라클 RDBMS에 접속(IP주소, 접속계정 아이디, 패스워드)
	// Connection타입 연결된 데이터베이스에 SQL쿼리 명령을 전송 할 수 있는 메소드를 가진 타입
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	// 에러, 예외 발생 or conn 값이 null이면 접속 실패
	System.out.println(conn + " <-- conn");
	// java.sql.Connection의 객체가 필요 -> new Connection()이런 코드로는 객체가 안 만들어진다. -> sql 쿼리 실행
	// --> Connection conn 객체를 통해서 sql 쿼리를 실행
	
	// 2) 쿼리를 저장
	PreparedStatement stmt = conn.prepareStatement("select job_id, job_title, min_salary, max_salary from jobs");
	System.out.println(stmt + " <-- stmt");
	
	// 3) 쿼리를 실행 후 결과값(테이블 모양의 ResultSet타입)을 리턴
	ResultSet rs = stmt.executeQuery();
	System.out.println(rs + " <-- rs");
	
	// 4) Job table의 Resultset -> ArrayList<Job> 변경
	ArrayList<Job> list = new ArrayList<Job>(); // -사이즈가 0인 빈 ArrayList 생성
	while(rs.next()) { // next()메소드는 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		Job j = new Job();
		j.jobId = rs.getString("job_id");
		j.jobTitle = rs.getString("job_title");
		j.minSalary = rs.getInt("min_salary");
		j.maxSalary = rs.getInt("max_salary");
		list.add(j);
		
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, th, td {border : 1px solid #FF0000;}
</style>
</head>
<body>
	<h1>Job 리스트</h1>
	<table>
		<thead>
			<tr>
				<th> job_id </th>
				<th> job_title </th>
				<th> min_salary </th>
				<th> max_salary </th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Job j : list) {
			%>
					<tr>
						<td><%= j.jobId %></td>
						<td><%= j.jobTitle %></td>
						<td><%= j.minSalary %></td>
						<td><%= j.maxSalary %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>
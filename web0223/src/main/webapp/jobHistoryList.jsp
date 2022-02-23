<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.JobHistory" %>
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
	PreparedStatement stmt = conn.prepareStatement("select employee_id, start_date, end_date, job_id, department_id from job_history");
	System.out.println(stmt + " <-- stmt");
	
	// 3) 쿼리를 실행 후 결과값(테이블 모양의 ResultSet타입)을 리턴
	ResultSet rs = stmt.executeQuery();
	System.out.println(rs + " <-- rs");
	
	// 4) JobHistory table의 Resultset -> ArrayList<JobHistory> 변경
	ArrayList<JobHistory> list = new ArrayList<JobHistory>(); // -사이즈가 0인 빈 ArrayList 생성
	while(rs.next()) { // next()메소드는 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		JobHistory j = new JobHistory();
		j.employeeId = rs.getInt("employee_id");
		j.startDate = rs.getString("start_date");
		j.endDate = rs.getString("end_date");
		j.jobId = rs.getString("job_id");
		j.departmentId = rs.getInt("department_id");
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
	<h1>Job History 리스트</h1>
	<table>
		<thead>
			<tr>
				<th> employee_id </th>
				<th> start_date </th>
				<th> end_date </th>
				<th> job_id </th>
				<th> department_id </th>
			</tr>
		</thead>
		<tbody>
			<%
				for(JobHistory j : list) {
			%>
					<tr>
						<td><%= j.employeeId %></td>
						<td><%= j.startDate %></td>
						<td><%= j.endDate %></td>
						<td><%= j.jobId %></td>
						<td><%= j.departmentId %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>
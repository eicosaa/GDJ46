<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.Employee" %>
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
	PreparedStatement stmt = conn.prepareStatement("select employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id from employees");
	System.out.println(stmt + " <-- stmt");
	
	// 3) 쿼리를 실행 후 결과값(테이블 모양의 ResultSet타입)을 리턴
	ResultSet rs = stmt.executeQuery();
	System.out.println(rs + " <-- rs");
	
	// 4) Employee table의 Resultset -> ArrayList<Employee> 변경
	ArrayList<Employee> list = new ArrayList<Employee>(); // -사이즈가 0인 빈 ArrayList 생성
	while(rs.next()) { // next()메소드는 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		Employee e = new Employee();
		e.employeeId = rs.getInt("employee_id");
		e.firstName = rs.getString("first_name");
		e.lastName = rs.getString("last_name");
		e.email = rs.getString("email");
		e.phoneNumber = rs.getString("phone_number");
		e.hireDate = rs.getString("hire_date");
		e.jobId = rs.getString("job_id");
		e.salary = rs.getInt("salary");
		e.commissionPct = rs.getInt("commission_pct");
		e.managerId = rs.getInt("manager_id");
		e.departmentId = rs.getInt("department_id");
		list.add(e);
		
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
	<h1>사원 리스트</h1>
	<table>
		<thead>
			<tr>
				<th> employee_id </th>
				<th> first_name </th>
				<th> last_name </th>
				<th> email </th>
				<th> phone_number </th>
				<th> hire_date </th>
				<th> job_id </th>
				<th> salary </th>
				<th> commission_pct </th>
				<th> manager_id </th>
				<th> department_id </th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Employee e : list) {
			%>
					<tr>
						<td><%= e.employeeId %></td>
						<td><%= e.firstName %></td>
						<td><%= e.lastName %></td>
						<td><%= e.email %></td>
						<td><%= e.phoneNumber %></td>
						<td><%= e.hireDate %></td>
						<td><%= e.jobId %></td>
						<td><%= e.salary %></td>
						<td><%= e.commissionPct %></td>
						<td><%= e.managerId %></td>
						<td><%= e.departmentId %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>
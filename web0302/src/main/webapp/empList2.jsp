<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.HashMap" %>
<%@ page import = "java.util.ArrayList" %>
<%
	// 비즈니스 코드 (서비스 단)
	
	/*
		쿼리
		 -nvl(값, 지정값) : 값이 null인 경우 지정값으로 바꿈 (ex> comm안의 null값을 0으로 바꿈)
		 -case문 : case when 조건1 then 값1 when 조건N then 값N ... end
		 
		select empno, ename, sal, comm, sal+nvl(comm, 0) total, 
		       case 
		       when deptno = 10  then 'ACOUNTING'
		       when deptno = 20  then 'RESEARCH'
		       when deptno = 30  then 'SALES'
		       when deptno = 40  then 'OPERATIONS'
		       end dname
	    from emp; 
		--> 이 결과의 (한)행을 VO에 저장할 수 없다. ? --> Map을 사용하자.
	*/
	
	// -오라클 드라이버 로딩 + 오라클 RDBMS 접속
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
	System.out.println("empList2.jsp 드라이버 로딩 성공");
	
	// -쿼리
	String sql = "select empno, ename, sal, comm, sal+nvl(comm, 0) total, case when deptno = 10  then 'ACOUNTING' when deptno = 20  then 'RESEARCH' when deptno = 30  then 'SALES' when deptno = 40  then 'OPERATIONS' end dname from emp";
	PreparedStatement stmt = conn.prepareStatement(sql);
	
	// -쿼리 실행 후 결과값(테이블 모양의 ResultSet타입) 리턴
	ResultSet rs = stmt.executeQuery();

	// -VO타입 대신 Map타입 사용
	// -HashMap -> 저장(put), 읽기(get)
	// -Resultset을 ArrayList<HashMap...> 변경, HashMap을 ArrayList에 담기
	ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	while(rs.next()) { // next()메소드 : 문자 혹은 문자열을 공백 기준으로 한 단어 또는 한 문자씩 입력받음, 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		// -HashMap을 Arraylist에 담기 위해 map 변수 선언
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("empno", rs.getInt("empno"));
		map.put("ename", rs.getString("ename"));
		map.put("sal", rs.getInt("sal"));
		map.put("comm", rs.getInt("comm"));
		map.put("total", rs.getInt("total"));
		map.put("dname", rs.getString("dname"));
		list.add(map);
	}
	
	conn.close();
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>empList2</title>
<style>
	table, th, td {border : 1px solid #C889FF;}
</style>
</head>
<body>
	<!-- -출력단 [비즈니스 코드(서비스단)를 출력하는 뷰 코드(뷰단)] -->
	<h1>empList2</h1>
	<table>
		<thead>
			<tr>
				<th>empno</th>
				<th>ename</th>
				<th>sal</th>
				<th>comm</th>
				<th>total</th>
				<th>dname</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(HashMap m : list) {
			%>
					<tr>
						<td><%= m.get("empno") %></td>
						<td><%= m.get("ename") %></td>
						<td><%= m.get("sal") %></td>
						<td><%= m.get("comm") %></td>
						<td><%= m.get("total") %></td>
						<td><%= m.get("dname") %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>
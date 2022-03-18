<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.Location" %>
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
	PreparedStatement stmt = conn.prepareStatement("select location_id, street_address, postal_code, city, state_province, country_id from locations");
	System.out.println(stmt + " <-- stmt");
	
	// 3) 쿼리를 실행 후 결과값(테이블 모양의 ResultSet타입)을 리턴
	ResultSet rs = stmt.executeQuery();
	System.out.println(rs + " <-- rs");
	
	// 4) Location table의 Resultset -> ArrayList<Location> 변경
	ArrayList<Location> list = new ArrayList<Location>(); // -사이즈가 0인 빈 ArrayList 생성
	while(rs.next()) { // next()메소드는 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		Location l = new Location();
		l.locationId = rs.getInt("location_id");
		l.streetAddress = rs.getString("street_address");
		l.postalCode = rs.getString("postal_code");
		l.city = rs.getString("city");
		l.stateProvince = rs.getString("state_province");
		l.countryId = rs.getString("country_id");
		list.add(l);
		
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
	<h1>지역 리스트</h1>
	<table>
		<thead>
			<tr>
				<th> location_id </th>
				<th> street_address </th>
				<th> postal_code </th>
				<th> city </th>
				<th> state_province </th>
				<th> country_id </th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Location l : list) {
			%>
					<tr>
						<td><%= l.locationId %></td>
						<td><%= l.streetAddress %></td>
						<td><%= l.postalCode %></td>
						<td><%= l.city %></td>
						<td><%= l.stateProvince %></td>
						<td><%= l.countryId %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>
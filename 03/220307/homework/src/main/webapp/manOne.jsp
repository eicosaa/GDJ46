<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*" %>
<%@ page import = "java.util.ArrayList"%>
<%
	/*
	-----------mariadb 쿼리
	SELECT man_no manNo, man_name manName, man_addr manAddr, create_date createDate
	FROM man
	WHERE man_no = 1;
	
	--------manOne.jsp 쿼리
	SELECT man_no manNo, man_name manName, man_addr manAddr, create_date createDate
	FROM man
	WHERE man_no = ?;
	*/
	
	//---------------------------------------manList.jsp 페이지에서 넘어온 값 변수에 저장
	int manNo = Integer.parseInt(request.getParameter("manNo"));
	System.out.println("[manOne.jsp] manNo : " + manNo);
	
	// -----------------------------------mariadb 드라이버 로딩 + mariadb RDBMS 접속
	Class.forName("org.mariadb.jdbc.Driver"); // 드라이버 로딩
	Connection conn = null;
	String dburl = "jdbc:mariadb://localhost:3306/homework"; // DB 주소
	String dbuser = "root"; // DB 아이디
	String dbpw = "java1234"; // DB 패스워드
	conn = DriverManager.getConnection(dburl, dbuser, dbpw);
	System.out.println("[manOne.jsp] conn : " + conn + " / 드라이버 로딩 성공");
	
	// ---------------------------------------------------------------------쿼리
	// -쿼리 저장
	PreparedStatement stmt = conn.prepareStatement("SELECT man_no manNo, man_name manName, man_addr manAddr, create_date createDate FROM man WHERE man_no = ?");
	stmt.setInt(1, manNo); // 사용자가 선택해서 넘어온 ?값
			
	// -쿼리를 실행 후 결과값(테이블 모양의 ResultSet타입)을 리턴
	// -한 행의 데이터값을 가져오기에 ArrayList 대신 Man man 사용
	ResultSet rs = stmt.executeQuery();
	Man man = null;
	if(rs.next()) { // -next()메소드 : 문자 혹은 문자열을 공백 기준으로 한 단어 또는 한 문자씩 입력받음, 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false 
		man = new Man();
		man.manNo = rs.getInt("manNo");
		man.manName = rs.getString("manName");
		man.manAddr = rs.getString("manAddr");
		man.createDate = rs.getString("createDate");
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manOne</title>
<style type="text/css">
	table, th, td {border : 1px solid #A566FF;}
</style>
</head>
<body>

	<h1>man 상세보기</h1>
	<table>
		<tr>
			<td>manNo</td>
			<td><%= man.manNo %></td>
		</tr>
		<tr>
			<td>manName</td>
			<td><%= man.manName %></td>
		</tr>
		<tr>
			<td>manAddr</td>
			<td><%= man.manAddr %></td>
		</tr>
		<tr>
			<td>createDate</td>
			<td><%= man.createDate %></td>
		</tr>
	</table>
	<div>
		<!-- <a href="<%=request.getContextPath()%>/updateManForm.jsp?boardNo=<%= man.manNo %>">[수정]</a> -->
		<!-- <a href="<%=request.getContextPath()%>/deleteManForm.jsp?boardNo=<%= man.manNo %>">[삭제]</a> -->
		<a href="<%=request.getContextPath()%>/manList.jsp">[이전 페이지]</a>
	</div>
</body>
</html>
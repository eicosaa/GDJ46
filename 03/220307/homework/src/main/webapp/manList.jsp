<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>    
<%
	/* 
	-----------mariadb 페이징 쿼리
	SELECT man_no manNo, man_name manName, create_date createDate
	FROM man
	ORDER BY create_date DESC 
	LIMIT 0, 10;

	-------manList.jsp 페이징 쿼리
	SELECT man_no manNo, man_name manName, create_date createDate
	FROM man
	ORDER BY create_date DESC 
	LIMIT ?, ?;
	
	-----------------전체 행의 개수
	SELECT COUNT(*) FROM man; 
	*/
	
	// ----------------------------------------------------------------페이징 설정
	// manList페이지 실행하면 최근 10개의 목록을 보여주고 1page로 설정
	int currentPage = 1; // 현재 페이지의 기본값은 1페이지
	if(request.getParameter("currentPage") != null) { // 이전, 다음 링크를 통해서 들어왔다면
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	System.out.println("[manList.jsp] currentPage(현재 페이지) : " + currentPage);

	int rowPerPage = 10; // rowPerPage은 한 페이지에 내가 보고 싶은 글 수 (한 행에 10개씩 보고 싶다.)
	int beginRow = (currentPage - 1) * rowPerPage; // 현재 페이지가 변경되면 beginRow도 변경된다. -> 가져오는 데이터 변경된다.
	
	// -----------------------------------mariadb 드라이버 로딩 + mariadb RDBMS 접속
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = null;
	String dburl = "jdbc:mariadb://localhost:3306/homework";
	String dbuser = "root";
	String dbpw = "java1234";
	conn = DriverManager.getConnection(dburl, dbuser, dbpw);
	System.out.println("[manList.jsp] conn : " + conn + " / 드라이버 로딩 성공");
	
	// -----------------------------------------------------------------manList
	String manSql = null;
	PreparedStatement manStmt = null;
	manSql = "SELECT man_no manNo, man_name manName, man_addr manAddr, create_date createDate FROM man ORDER BY create_date DESC LIMIT ?, ?";
	manStmt = conn.prepareStatement(manSql);
	manStmt.setInt(1, beginRow); // 사용자가 선택해서 넘어온 첫번째 ?값
	manStmt.setInt(2, rowPerPage); // 사용자가 선택해서 넘어온 두번째 ?값

	// -쿼리를 실행 후 결과값(테이블 모양의 ResultSet타입)을 리턴
	// -여러 행의 데이터 값을 가져오기에 ArrayList 사용
	ResultSet manRs = manStmt.executeQuery();
	ArrayList<Man> manList = new ArrayList<Man>();
	while(manRs.next()) {
		Man m = new Man();
		m.manNo = manRs.getInt("manNo");
		m.manName = manRs.getString("manName");
		m.manAddr = manRs.getString("manAddr");
		m.createDate = manRs.getString("createDate");
		manList.add(m);
	}
	
	// 전체 행의 개수
	int totalRow = 0; // select count(*) from man; -> 전체 행의 개수
	String totalRowSql = "SELECT COUNT(*) cnt FROM man";
	PreparedStatement totalRowStmt = conn.prepareStatement(totalRowSql);
	ResultSet totalRowRs = totalRowStmt.executeQuery();
	if(totalRowRs.next()) {
		totalRow = totalRowRs.getInt("cnt");
		System.out.println("[manList.jsp] totalRow(전체 행) : " + totalRow);
	}
	
	// 마지막 페이지 수
	int lastPage = 0;
	if(totalRow % rowPerPage == 0) {
		lastPage = totalRow / rowPerPage;
	} else {
		lastPage = (totalRow / rowPerPage) + 1;
	}
	
	conn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>manList</title>
<style type="text/css">
	th, td {
		border: 1px solid green;
	}
</style>
</head>
<body>

	<h1>manList(total : <%= totalRow %>)</h1>
	<select name="rowPerPage">
		<option value="5">5</option>
		<option value="10">10</option>
		<option value="15">15</option>
	</select>
	<table>
		<thead>
			<tr>
				<th>manNo</th>
				<th>manName</th>
				<th>manAddr</th>
				<th>createDate</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Man m : manList) {
			%>
					<tr>
						<td><%= m.manNo %></td>
						<td><a href="<%=request.getContextPath()%>/manOne.jsp?manNo=<%=m.manNo%>"><%= m.manName %></a></td>
						<td><%= m.manAddr %>
						<td><%= m.createDate %></td>
					</tr>
			<%		
				}
			%>
		</tbody>
	</table>
	<div>
		<!-- 페이지 넘기기 -->
		<%
			if(currentPage > 1) { // 현재 페이지가 1이면 이전 페이지가 존재해서는 안된다.
		%>
				<a href="<%=request.getContextPath()%>/manList.jsp?currentPage=<%= currentPage - 1 %>">[이전]</a>
		<%
			}
		%>

		<%
			if(currentPage < lastPage) {
		%>
				<a href="<%=request.getContextPath()%>/manList.jsp?currentPage=<%= currentPage + 1 %>">[다음]</a>
		<%
			}
		%>
	</div>
</body>
</html>
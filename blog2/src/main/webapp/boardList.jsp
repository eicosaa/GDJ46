<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.*" %>
<%

	String categoryName = request.getParameter("categoryName");
	System.out.println("[boardList.jsp] categoryName : " + request.getParameter("categoryName")); // 한글이 깨지는지 확인
	
	
	// -mariadb 드라이버 로딩 + mariadb RDBMS 접속
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = null;
	String dburl = "jdbc:mariadb://localhost:3307/blog";
	String dbuser = "root";
	String dbpw = "java1234";
	conn = DriverManager.getConnection(dburl, dbuser, dbpw);
	System.out.println("[boardList.jsp] conn : " + conn + " / 드라이버 로딩 성공");
	
	/*
		SELECT category_name categoryName, COUNT(*) cnt
		FROM board
		GROUP BY category_name
	*/
	// -쿼리 (category테이블)
	// -category테이블의 쿼리를 담을 categorySql 변수 선언
	String categorySql = "SELECT category_name categoryName, COUNT(*) cnt FROM board GROUP BY category_name";
	PreparedStatement categoryStmt = conn.prepareStatement(categorySql);
	// -쿼리 실행 후 결과값(테이블 모양의 ResultSet타입) 리턴
	ResultSet categoryRs = categoryStmt.executeQuery();
	
	// 쿼리에 결과를 Category, Board VO로 저장할 수 없다. -> HashMap을 사용해서 저장하자!
	// -VO타입 대신 Map타입 사용
	// -HashMap -> 저장(put), 읽기(get)
	// -Resultset을 ArrayList<HashMap...> 변경, HashMap을 ArrayList에 담기
	/*
		VO가 아닌 ArrayList를 사용하는 이유
		-Board VO는 board테이블 한 행을 저장할 때 사용
		-ArrayList는 board테이블 여러 행을 저장할 때 사용
	*/
	ArrayList<HashMap<String, Object>> categoryList = new ArrayList<HashMap<String, Object>>();
	while(categoryRs.next()) { // next()메소드 : 문자 혹은 문자열을 공백 기준으로 한 단어 또는 한 문자씩 입력받음, 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false 
		// -HashMap을 Arraylist에 담기 위해 map 변수 선언
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("categoryName", categoryRs.getString("categoryName"));
		map.put("cnt", categoryRs.getInt("cnt"));
		categoryList.add(map);
	}
	
	// -쿼리 (board테이블)
	// -board테이블의 쿼리를 담을 boardSql 변수 선언
	String boardSql = "";
	PreparedStatement boardStmt = null;
	
	if(categoryName == null) {
		boardSql = "SELECT board_no, category_name, board_title, create_date FROM board ORDER BY create_date DESC LIMIT 0, 10"; 
		boardStmt = conn.prepareStatement(boardSql);
	} else {
		// categoryName이 null이 아닐 경우 게시글을 선택한 카테고리로 바꾼다.
		boardSql = "SELECT board_no, category_name, board_title, create_date FROM board WHERE category_name = ? ORDER BY create_date DESC LIMIT 0, 10";
		boardStmt = conn.prepareStatement(boardSql);
		boardStmt.setString(1, categoryName);
	}
	System.out.println("[boardList.jsp] boardSql : " + boardSql);
	System.out.println("[boardList.jsp] boardStmt : " + boardStmt); 
	System.out.println("[boardList.jsp] categoryName : " + categoryName);
	
	ResultSet boardRs = boardStmt.executeQuery();
	ArrayList<Board> boardList = new ArrayList<Board>();
	while(boardRs.next()) { // next()메소드는 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		Board b = new Board();
		b.boardNo = boardRs.getInt("board_no");
		b.categoryName = boardRs.getString("category_name");
		b.boardTitle = boardRs.getString("board_title");
		b.createDate = boardRs.getString("create_date");
		boardList.add(b);
	}
	
	conn.close();
	
	// -request.getContextPath() : 프로젝트 명이 바뀔 수 있기 때문에 사용 
	//	(프로젝트 명이 바뀌면 a href를 수정해야 하기 때문에 번거롭지 않기 위해 사용)
	// -request.getContextPath()는 프로젝트 명을 갖고 옴 (/blog라는 글이 들어갈거임)
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
	<!-- category별 게시글 링크 메뉴 -->
	<div>
		<ul>
			<%
				for(HashMap<String, Object> m : categoryList) {
			%>
					<li>
						<a href="<%=request.getContextPath()%>/boardList.jsp?categoryName=<%=m.get("categoryName")%>"><%=m.get("categoryName")%>(<%=m.get("cnt")%>)</a>
					</li>
			<%		
				}
			%>
		</ul>
	</div>
	
	<!-- board -->
	<table>
		<thead>
			<tr>
				<th>board_no</th>
				<th>category_name</th>
				<th>board_title</th>
				<th>create_date</th>
				
			</tr>
		</thead>
		<tbody>
			<%
				for(Board b : boardList) {
			%>
				<tr>
					<td><%=b.boardNo%></td>
					<td><%=b.categoryName%></td>
					<td><%=b.boardTitle%></td>
					<td><%=b.createDate%></td>
					
				</tr>
			<%
				}
			%>
		</tbody>	
	</table>
</body>
</html>
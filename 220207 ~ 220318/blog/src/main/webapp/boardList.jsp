<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "vo.Board" %>
<%
	// vo 사용?

	String cateName = request.getParameter("categoryName");
	System.out.println("boardList.jsp categoryName : " + request.getParameter("categoryName")); // 한글이 깨지는지 확인
	

	// -mariadb 드라이버 로딩 + mariadb RDBMS 접속
	Class.forName("org.mariadb.jdbc.Driver");
	Connection conn = null;
	String dburl = "jdbc:mariadb://localhost:3306/blog";
	String dbuser = "root";
	String dbpw = "java1234";
	conn = DriverManager.getConnection(dburl, dbuser, dbpw);
	System.out.println("boardList.jsp conn : " + conn + " / 드라이버 로딩 성공");
	
	// -쿼리 (category테이블)
	// -category테이블의 쿼리를 담을 categorySql 변수 선언
	String categorySql = "select category_name categoryName from category order by category_name";
	PreparedStatement categoryStmt = conn.prepareStatement(categorySql); 
	// -쿼리 실행 후 결과값(테이블 모양의 ResultSet타입) 리턴
	ResultSet categoryRs = categoryStmt.executeQuery();
	
	ArrayList<String> categoryList = new ArrayList<String>();
	while(categoryRs.next()) { // next()메소드 : 문자 혹은 문자열을 공백 기준으로 한 단어 또는 한 문자씩 입력받음, 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false 
		categoryList.add(categoryRs.getString("categoryName"));
	}
	
	// -쿼리 (board테이블)
	// -board테이블의 쿼리를 담을 boardSql 변수 선언
	String boardSql = "";
	if("categoryName" == null) {
		boardSql = "SELECT board_no, category_name, board_title, create_date FROM board ORDER BY create_date DESC LIMIT 0, 10";
	} else {
		boardSql = "SELECT board_no boardNo, category_name categoryName, board_title boardTitle, create_date createDate FROM board WHERE category_name = ? ORDER BY create_date DESC LIMIT 0, 10";
		PreparedStatement boardStmt = conn.prepareStatement(boardSql); 
		boardStmt.setString(1, cateName);
		
		// -쿼리 실행 후 결과값(테이블 모양의 ResultSet타입) 리턴
		ResultSet boardRs = boardStmt.executeQuery();
		
		// -VO타입 대신 Map타입 사용
		// -HashMap -> 저장(put), 읽기(get)
		// -Resultset을 ArrayList<HashMap...> 변경, HashMap을 ArrayList에 담기
		ArrayList<HashMap<String, Object>> boardList = new ArrayList<HashMap<String, Object>>();
		while(boardRs.next()) { // next()메소드 : 문자 혹은 문자열을 공백 기준으로 한 단어 또는 한 문자씩 입력받음, 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
			// -HashMap을 Arraylist에 담기 위해 map 변수 선언
			HashMap<String, Object> map = new HashMap<String, Object>(); 
			map.put("boardNo", boardRs.getInt("boardNo"));
			map.put("cateName", boardRs.getString("categoryName"));
			map.put("boardTitle", boardRs.getString("boardTitle"));
			map.put("createDate", boardRs.getInt("createDate"));
			boardList.add(map);
		}
	}
	
	ArrayList<Board> list = new ArrayList<Board>();
	while(boardRs.next()) { // next()메소드는 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		Board b = new Board();
		b.boardNo = boardRs.getInt("board_no");
		b.categoryName = boardRs.getString("categoryName");
		b.boardTitle = boardRs.getString("board_title");
		b.createDate = boardRs.getInt("create_date");
		list.add(b);
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
</head>
<body>
	<!-- category별 게시글 링크 메뉴 -->
	<div>
		<ul>
			<%
				for(String s : categoryList) {
			%>
					<li>
						<a href = "<%= request.getContextPath() %>/boardList.jsp?categoryName=<%= s %>"><%= s %></a>
					</li>
			<%
				}
			%>
		</ul>
	</div>
	
	<!-- 
		1) categoryName null일 때
		SELECT board_no, category_name, board_title, create_date FROM board
		ORDER BY create_date DESC
		LIMIT 0, 10;
		
		2) categoryName null 아닐 때
		SELECT board_no, category_name, board_title, create_date FROM board
		WHERE category_name = ?
		ORDER BY create_date DESC
		LIMIT 0, 10;
		
		? <-- categoryName 값
	 -->
	 
	 <h1>boardList</h1>
	<table>
		<thead>
			<tr>
				<th>boardNo</th>
				<th>categoryName</th>
				<th>boardTitle</th>
				<th>createDate</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(HashMap m : boardList) {
			%>
					<tr>
						<td><%= m.get("boardNo") %></td>
						<td><%= m.get("categoryName") %></td>
						<td><%= m.get("boardTitle") %></td>
						<td><%= m.get("createDate") %></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>
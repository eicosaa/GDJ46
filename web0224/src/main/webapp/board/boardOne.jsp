<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*" %>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	System.out.println(boardNo + " <-- boardNo");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	/*
		(-board_pw는 보여주기 위한 데이터가 아니기에 갖고 오지 않는다. / 수정에 사용)	
	
		select board_no, board_title, board_content, create_date, update_date
		from board
		where board_no = ?
	*/
	PreparedStatement stmt = conn.prepareStatement("select board_no, board_title, board_content, create_date, update_date from board where board_no = ?");
	stmt.setInt(1, boardNo);
	// ResultSet은 ArrayList같은 컬렉션 자료구조타입이지만 보편적으로 사용이 가능한 타입은 아니다.
	ResultSet rs = stmt.executeQuery();
	Board board = null;
	if(rs.next()) {
		board = new Board();
		board.boardNo = rs.getInt("board_no");
		board.boardTitle = rs.getString("board_title");
		board.boardContent = rs.getString("board_content");
		board.createDate = rs.getString("create_date");
		board.updateDate = rs.getString("update_date");
	}
	
	conn.close(); // Connection 객체는 사용이 끝나면 반납
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardOne</title>
<style type="text/css">
	table, th, td {border : 1px solid #A566FF;}
</style>
</head>
<body>
	<h1>board 상세보기</h1>
	<table>
		<tr>
			<td>boardNo</td>
			<td><%= board.boardNo %></td>
		</tr>
		<tr>
			<td>boardTitle</td>
			<td><%= board.boardTitle %></td>
		</tr>
		<tr>
			<td>boardContent</td>
			<td><%= board.boardContent %></td>
		</tr>
		<tr>
			<td>createDate</td>
			<td><%= board.createDate %></td>
		</tr>
		<tr>
			<td>updateDate</td>
			<td><%= board.updateDate %></td>
		</tr>
	</table>
	<div>
		<a href = "./updateBoardForm.jsp?boardNo=<%= board.boardNo %>">[수정]</a>
		<a href = "./deleteBoardForm.jsp?boardNo=<%= board.boardNo %>">[삭제]</a>
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="vo.*" %>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	// 수정 전 boardTitle, boardContent 조회(가져오기)
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");

	PreparedStatement stmt = conn.prepareStatement("select board_no,board_title,board_content from board where board_no=?");
	stmt.setInt(1, boardNo);
	ResultSet rs = stmt.executeQuery();
	Board board = null;
	if(rs.next()) {
		board = new Board();
		board.boardNo = rs.getInt("board_no");
		board.boardTitle = rs.getString("board_title");
		board.boardContent = rs.getString("board_content");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, td {
		border: 1px solid #990085;
	}
</style>
</head>
<body>
	<h1>글수정</h1>
	<form method="post" action="./updateBoardAction.jsp">
		<table>
			<tr>
				<td>boardNo</td>
				<td>
					<input type="number" name="boardNo" readonly="readonly" value="<%=board.boardNo%>">
				</td>
			</tr>
			<tr>
				<td>boardTitle</td>
				<td>
					<input type="text" name="boardTitle" value="<%=board.boardTitle%>">
				</td>
			</tr>
			<tr>
				<td>boardContent</td>
				<td>
					<textarea rows="5" cols="80" name="boardContent"><%=board.boardContent%></textarea>
				</td>
			</tr>
			<tr>
				<td>boardPw</td>
				<td>
					<input type="text" name="boardPw">
				</td>
			</tr>
		</table>
		<button type="submit">수정</button>
	</form>
</body>
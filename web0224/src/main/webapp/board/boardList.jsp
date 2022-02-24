<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.Board" %>
<%@page import="java.util.ArrayList"%>
<%
	/* 쿼리
		select board_no, board_title
		from board
		order by board_no desc;

		쿼리문을 해석할 때
		1) from
		2) select
		3) order by (항상 제일 마지막에 해석)
	*/
	
	// 인코딩
	//request.setCharacterEncoding("utf-8");
		
	// 오라클 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공");
	
	// 오라클 RDBMS에 접속
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	System.out.println("드라이버 로딩 성공");
	
	// 쿼리를 저장 (내림차순 정렬 : desc 사용 -> 불러온 값들을 board_no의 내림차순으로 정렬한다.)
	PreparedStatement stmt = conn.prepareStatement("select board_no, board_title from board order by board_no desc");
	System.out.println(stmt + " <-- stmt");
	
	// 쿼리를 실행 후 결과값(테이블 모양의 ResultSet타입)을 리턴
	ResultSet rs = stmt.executeQuery();
	System.out.println(rs + " <-- rs");
	
	// 4) Resultset -> ArrayList<Board> 변경
	ArrayList<Board> list = new ArrayList<Board>();
	while(rs.next()) { // next()메소드는 다음 줄로 커서를 이동해서 읽을 값들이 존재하면 true, 존재하지 않으면 false
		Board b = new Board();
		b.boardNo = rs.getInt("board_no");
		b.boardTitle = rs.getString("board_title");
		list.add(b);
	}
	
	conn.close(); // -conn있는 코드에서 close로 닫는다.
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

	<h1>board 리스트</h1>
	<div>
		<a href = "./insertBoardForm.jsp">board 글 입력</a>
	</div>
	<table>
		<thead>
			<tr>
				<th> board_no </th>
				<th> board_title </th>
			</tr>
		</thead>
		<tbody>
			<%
				for(Board b : list) {
			%>
					<tr>
						<td><%= b.boardNo %></td>
						<td><a href = "./boardOne.jsp?boardNo=<%= b.boardNo %>"><%= b.boardTitle %></a></td>
					</tr>
			<%
				}
			%>
		</tbody>
	</table>

</body>
</html>
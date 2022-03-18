<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>
<%@ page import ="vo.*" %>
<%
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String boardPw = request.getParameter("boardPw");
	System.out.println("deleteBoardAction.jsp(boardNo, boardPw) : " + boardNo + boardPw); // 디버깅 코드
	
	// 요청에서 넘겨진 값들을 가공
	Board board = new Board();
	board.boardNo = boardNo;
	board.boardPw = boardPw;
	
	// 오라클 드라이버 로딩, 오라클 RDBMS에 접속
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","java1004");
	System.out.println("deleteBoardAction.jsp 드라이버 로딩 성공");
	
	// 쿼리를 저장
	PreparedStatement stmt = conn.prepareStatement("delete from board where board_no=? and board_pw=?");
	stmt.setInt(1, board.boardNo);
	stmt.setString(2, board.boardPw);
	int row = stmt.executeUpdate();
	conn.close();
	
	if(row == 0) { // 삭제 실패
		System.out.println("삭제 실패");
		response.sendRedirect("./deleteBoardForm.jsp?boardNo="+board.boardNo);
		// deleteBoardForm.jsp로 가면 boardNo을 넘겨받기에 boardNo 추가
	} else if(row == 1) { // 삭제 성공
		System.out.println("삭제 성공");
		response.sendRedirect("./boardList.jsp");
	} else { // 여러 행이 삭제되면 에러
		System.out.println("삭제 에러(deleteBoardAction.jsp)");
	}
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "vo.*" %>
<%
	request.setCharacterEncoding("utf-8"); // 인코딩
	
	int boardNo = Integer.parseInt(request.getParameter("boardNo"));
	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String boardPw = request.getParameter("boardPw");
	
	// 요청에서 넘겨진 값들을 가공
	Board board = new Board();
	board.boardNo = boardNo;
	board.boardTitle = boardTitle;
	board.boardContent = boardContent;
	board.boardPw = boardPw;
	
	// 오라클 드라이버 로딩, 오라클 RDBMS에 접속
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	System.out.println("updateBoardAction.jsp 드라이버 로딩 성공");
	
	/*
		update 쿼리문
		update board set board_title=?, board_content=?, update_date=sysdate
		where board_no=? and board_pw=?
		
	*/
	
	// 쿼리를 저장
	PreparedStatement stmt = conn.prepareStatement("update board set board_title=?, board_content=?, update_date=sysdate where board_no=? and board_pw=?");
	stmt.setString(1, board.boardTitle);
	stmt.setString(2, board.boardContent);
	stmt.setInt(3, board.boardNo);
	stmt.setString(4, board.boardPw);
	int row = stmt.executeUpdate();
	
	if(row == 0) {
		System.out.println("수정 실패");
		response.sendRedirect("./updateBoardForm.jsp?boardNo="+board.boardNo);
	} else if(row == 1) {
		System.out.println("수정 성공");
		response.sendRedirect("./boardOne.jsp?boardNo="+board.boardNo);
	} else {
		System.out.println("수정 에러(updateBoardAction.jsp)");
	}
	
	conn.close();
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "vo.Board" %>
<%
	request.setCharacterEncoding("utf-8");

	String boardTitle = request.getParameter("boardTitle");
	String boardContent = request.getParameter("boardContent");
	String boardPw = request.getParameter("boardPw");
	// 디버깅 코드
	
	// 요청에서 넘겨진 값들을 가공해서 하나의 변수로...
	Board board = new Board();
	board.boardTitle = boardTitle;
	board.boardContent = boardContent;
	board.boardPw = boardPw;
	
	// 0) 오라클 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver"); 
	// OracleDriver 데이터 타입 사용 가능, OracleDriver안의 메소드도 사용 가능
	
	// 1) 오라클 RDBMS에 접속(IP주소, 접속계정 아이디, 패스워드)
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "java1004");
	
	// 2)
	/*
		insert into board(
				board_no, board_title, board_content, board_pw, create_date, update_date
		) values (
			board_seq.nextval, ?, ?, ?, sysdate, sysdate		
		)
		
		?는 printf()에서 사용하는 %s, %d같은 변수를 대신하는 표현식
	*/
	PreparedStatement stmt = conn.prepareStatement("insert into board( board_no, board_title, board_content, board_pw, create_date, update_date ) values ( board_seq.nextval, ?, ?, ?, sysdate, sysdate )");
	// stmt의 ? 표현식 값을 완성한다.
	stmt.setString(1, board.boardTitle);
	stmt.setString(2, board.boardContent);
	stmt.setString(3, board.boardPw);
	
	int row = stmt.executeUpdate(); // 몇 행을 입력했는지 return
	// 디버깅
	if(row == 1) {
		System.out.println(row + "행 입력 성공");
	} else {
		System.out.println("입력 실패");
	}
	conn.close(); // -conn있는 코드에서 close로 닫는다.
	
	// 입력 실패 or 성공 후 boardList.jsp로 이동
	response.sendRedirect("./boardList.jsp");
%>
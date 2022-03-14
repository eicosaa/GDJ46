package dao;

import java.sql.*;
import java.util.*;
import vo.*;

// -메소드 2개
public class GuestbookDao {
	public GuestbookDao() { } // 생성자 메소드
	// guestbook 리스트를 반환
	public ArrayList<Guestbook> selectGuestbookList(int beginRow, int rowPerPage) throws Exception {
		// - ArrayList<Guestbook> 리턴
		// 비지니스 로직(모델 계층)
		Class.forName("org.mariadb.jdbc.Driver"); // -빨간줄 : 나중에 예외가 발생할 수도 있다.(jsp와 다르게 빨간줄이 뜬다)
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/blog", "root", "java1234");
		String sql = "SELECT * FROM guestbook LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, beginRow);
		stmt.setInt(2, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		// 반환할 타입의 변수 -(list)
		ArrayList<Guestbook> list = new ArrayList<Guestbook>();
		while(rs.next()) {
			Guestbook g = new Guestbook(); // new 연산자 뒤에는 항상 생성자 메서드
			g.guestbookNo = rs.getInt("guestbook_no");
			g.guestbookContent = rs.getString("guestbook_content");
			list.add(g);
		}
		return list;
	}
}

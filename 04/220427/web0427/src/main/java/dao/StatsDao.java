package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import vo.Stats;

public class StatsDao {
	
	public void insertStats() { // <-- Listener
		// INSERT INTO stats(day, cnt) VALUES(CURDATE(), 1);
		
		// -데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			// -데이터베이스 드라이버 연결
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "java1234");
			
			String sql = "INSERT INTO stats(day, cnt) VALUES(CURDATE(), 1)";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();
			System.out.println("insertStats 실행");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public Stats selectStatsOneByNow() { // <-- Listener, Controller
		// SELECT day, cnt FROM stats WHERE day = CURDATE();
		Stats stats = new Stats();
		
		// -데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			// -데이터베이스 드라이버 연결
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "java1234");
			
			String sql = "SELECT day, cnt FROM stats WHERE day = CURDATE()";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			System.out.println("selectStatsOneByNow 실행");
			while(rs.next()) {
				stats.setDay(rs.getString("day"));
				stats.setCnt(rs.getInt("cnt"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// return new Stats("2022-04-27", 7);
		return stats;
	}
	
	public void updateStatsByNow() { // <-- Listener
		// UPDATE stats SET cnt = cnt + 1 WHERE day = CURDATE();
		
		// -데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		
		try {
			// -데이터베이스 드라이버 연결
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "java1234");
			
			String sql = "UPDATE stats SET cnt = cnt + 1 WHERE day = CURDATE()";
			stmt = conn.prepareStatement(sql);
			stmt.executeUpdate();	
			System.out.println("updateStatsByNow 실행");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public int selectStatsTotalCount() { // <-- Controller
		// SELECT SUM(cnt) FROM stats;
		int cnt = 0;
		
		// -데이터베이스 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			// -데이터베이스 드라이버 연결
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "java1234");
			
			String sql = "SELECT SUM(cnt) scnt FROM stats";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			while(rs.next()) {
				cnt = rs.getInt("scnt");
			}
			System.out.println("selectStatsTotalCount 실행");
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
				
		return cnt;
	}
}

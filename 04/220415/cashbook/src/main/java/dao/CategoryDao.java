package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import vo.Category;

public class CategoryDao {
	
	// -입력 / cashbook 데이터베이스의 카테고리 리스트
	public void insertCategory(Category category) {
		
		// -데이터베이스 접속 + 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		
		String sql = "INSERT INTO category(category_title) VALUES (?)";
	
		try {
			 Class.forName("org.mariadb.jdbc.Driver");
			 conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/cashbook", "root", "java1234");
			 System.out.println("[CategoryDao.insertCategory] conn : " + conn + " / 드라이버 로딩 성공");
			 
			 stmt = conn.prepareStatement(sql);
			 stmt.setString(1, category.getCategoryTitle());
			 
			 System.out.println("[CategoryDao.insertCategory] stmt : " + stmt);
			 
			 int row = stmt.executeUpdate();
			 // 디버깅
			 if(row == 1) {
			 	 System.out.println("[insertCategory] " + row + "행 입력 성공");
			 } else {
				 System.out.println("[insertCategory] 입력 실패");
			 }
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				// -데이터베이스 자원 반환
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// -cashbook 데이터베이스의 카테고리 리스트
	public List<Category> selectCategoryList() {
		List<Category> list = new ArrayList<Category>();
		
		// -데이터베이스 접속 + 자원 준비
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/cashbook", "root", "java1234");
			
			String sql = "SELECT category_no categoryNo, category_title categoryTitle FROM category";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				Category c = new Category();
				c.setCategoryNo(rs.getInt("categoryNo"));
				c.setCategoryTitle(rs.getString("categoryTitle"));
				list.add(c);
			} 
			System.out.println("[CategoryDao.selectCategoryList] list : " + list);
			
		} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
				try {
					// -데이터베이스 자원 반환
					rs.close();
					stmt.close();
					conn.close();
				} catch (SQLException  e) {
					e.printStackTrace();
				}
			}
		return list;
	}
}

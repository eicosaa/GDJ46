package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import vo.Address;

public class AddressDao {
	
	public void insertAddress3(Address address) {
		
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "INSERT INTO address3(id, detail_addr) VALUES(?, ?)";
		
		try {
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "java1234");
			
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, address.getId());
			stmt.setString(2, address.getDetailAddr());
			stmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public List<Map<String, Object>> selectAddressListBySearch(String searchAddr) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		
		/*
		 	SELECT id, CONCAT(province, city, town, street) addr FROM address2
		 	WHERE CONCAT(province, city, town, street) LIKE ?;
		*/
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT id, CONCAT(zip_code, province, city, town, street) addr FROM address2"
				+ "		 	WHERE CONCAT(province, city, town, street) LIKE ?";
		
		try {
			conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "java1234");
			
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, "%"+ searchAddr + "%");
			rs = stmt.executeQuery();
			while(rs.next()) {
				Map<String, Object> m = new HashMap<>();
				m.put("id", rs.getInt("id"));
				m.put("addr", rs.getString("addr"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
}

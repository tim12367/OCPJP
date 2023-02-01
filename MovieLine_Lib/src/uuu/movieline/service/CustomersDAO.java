package uuu.movieline.service;

import java.sql.*;

import uuu.movieline.entity.Customer;

class CustomersDAO {
	private static final String SELECT_CUSTOMER_BY_ID = "SELECT id, email, password, name, birthday, gender, "
			+ "address, phone, blood_type, subscribed" + " FROM customers " + "WHERE id = ? OR email = ?";

	Customer selectCustomerById(String idOrEmail) {
		Customer c = null;

		try (
				Connection connection = MySQLConnection.getConnection(); // 1,2
				PreparedStatement pstmt = connection.prepareStatement(SELECT_CUSTOMER_BY_ID);
				) {
			// 3.1 傳入?的值
			pstmt.setString(1, idOrEmail);
			pstmt.setString(2, idOrEmail);
			try (
					ResultSet rs = pstmt.executeQuery(); // 4.執行SELECT SQL指令
			) {
				// 5.處理rs
				while (rs.next()) {
					c = new Customer();
					c.setId(rs.getString("id"));
					c.setEmail(rs.getString("email"));
					c.setName(rs.getString("name"));
					c.setPassword(rs.getString("password"));
					c.setBirthday(rs.getString("birthday"));
					c.setGender(rs.getString("gender").charAt(0));
					
					//非必要欄位
					c.setAddress(rs.getString("address"));
					c.setPhone(rs.getString("phone"));
					c.setSubscribed(rs.getBoolean("subscribed"));
					
				}
			}

		} catch (SQLException e) {
			throw new RuntimeException("查詢客戶失敗", e);
		}
		return c;
	}
}

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
			throw new RuntimeException("查詢客戶時執行SQL失敗", e);
		}
		return c;
	}

	private static final String INSERT_CUSTOMER="INSERT INTO customers (id,email,password,name,"
	+ "birthday,gender,address,phone,blood_type,subscribed)"
	+ " VALUES (?,?,?,?,?,?,   ?,?,?,?);";
	void insert(Customer c){
		try(
				Connection connection = MySQLConnection.getConnection();//自己寫的 1,2
				PreparedStatement pstmt = connection.prepareStatement(INSERT_CUSTOMER);
				) {
			//3-1傳入?的值
			pstmt.setString(1, c.getId());
			pstmt.setString(2, c.getEmail());
			pstmt.setString(3, c.getPassword());
			pstmt.setString(4, c.getName());
			pstmt.setString(5, c.getBirthday().toString());
			pstmt.setString(6, String.valueOf(c.getGender()));
			
			pstmt.setString(7, c.getAddress());
			pstmt.setString(8, c.getPhone());
			pstmt.setString(9, null);//沒寫血型
			pstmt.setBoolean(10,c.isSubscribed());
			
			//4.執行insert指令
			pstmt.executeUpdate();//沒有回傳結果的execute
			
		} catch (Exception e) {
			throw new RuntimeException("新增客戶SQL失敗",e);
		}
	}
}

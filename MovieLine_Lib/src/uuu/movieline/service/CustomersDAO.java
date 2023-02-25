package uuu.movieline.service;

import java.sql.*;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.VIP;
import uuu.movieline.exception.MLException;
import uuu.movieline.exception.MLInvalidDataException;

class CustomersDAO {
	private static final String SELECT_CUSTOMER_BY_ID = "SELECT id, email, password, name, birthday, gender, "
			+ "address, phone, subscribed, discount" + " FROM customers " + "WHERE id = ? OR email = ?";

	Customer selectCustomerById(String idOrEmail) throws MLException {
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
					//!使用c前要建立物件 初始化在上方
					int discount = rs.getInt("discount");
					if(discount>0) {
						c = new VIP();
						((VIP)c).setDiscount(rs.getInt("discount"));
					}else {
						c = new Customer();
					}
					
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
			throw new MLException("查詢客戶時執行SQL失敗", e);
		}
		return c;
	}

	private static final String INSERT_CUSTOMER="INSERT INTO customers (id,email,password,name,"
	+ "birthday,gender,address,phone,subscribed)"
	+ " VALUES (?,?,?,?,?,?,   ?,?,?);";
	void insert(Customer c) throws MLException{
		try(
				Connection connection = MySQLConnection.getConnection();//自己寫的 1,2
				PreparedStatement pstmt = connection.prepareStatement(INSERT_CUSTOMER);
				) {
			//3-1傳入?的值
			pstmt.setString(1, c.getId());
			pstmt.setString(2, c.getEmail());
			pstmt.setString(3, c.getPassword());
//			pstmt.setString(4, null);//fortest
			pstmt.setString(4, c.getName());
			pstmt.setString(5, c.getBirthday().toString());
			pstmt.setString(6, String.valueOf(c.getGender()));
			
			pstmt.setString(7, c.getAddress());
			pstmt.setString(8, c.getPhone());
//			pstmt.setString(9, null);//沒寫血型
			pstmt.setBoolean(9,c.isSubscribed());
			
			//4.執行insert指令
			pstmt.executeUpdate();
			//executeUpdate:沒有回傳結果的execute
			
		} catch (SQLIntegrityConstraintViolationException e) {//Duplicate key ,Not null給null值
			if(e.getMessage().indexOf("customers.PRIMARY")>0) {
				throw new MLInvalidDataException("新增客戶失敗,帳號已經重複註冊",e);				
			}else if (e.getMessage().indexOf("customers.email_UNIQUE")>0) {
				throw new MLInvalidDataException("新增客戶失敗,email已經重複註冊",e);
			}else {
				throw new MLInvalidDataException("新增客戶時執行SQL失敗",e);
			}
		} catch (SQLException e) {
			throw new MLException("新增客戶時執行SQL失敗",e);
		}
	}
	private static final String UPDATE_CUSTOMER="UPDATE customers SET "
			+ " email = ?, password =?, name =?, "
			+ " birthday =?, gender =?,"
			+ " address =?, phone =?, subscribed =?"
			+ " WHERE id =?;";
	void update(Customer c) throws MLException{
		try(
				Connection connection = MySQLConnection.getConnection();//自己寫的 1,2
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_CUSTOMER);
				) {
			//3-1傳入?的值
			
			pstmt.setString(1, c.getEmail());
			pstmt.setString(2, c.getPassword());

			pstmt.setString(3, c.getName());
			pstmt.setString(4, c.getBirthday().toString());
			pstmt.setString(5, String.valueOf(c.getGender()));
			
			pstmt.setString(6, c.getAddress());
			pstmt.setString(7, c.getPhone());

			pstmt.setBoolean(8,c.isSubscribed());
			pstmt.setString(9, c.getId());
			//4.執行insert指令
			pstmt.executeUpdate();
			//executeUpdate:沒有回傳結果的execute
			
		} catch (SQLIntegrityConstraintViolationException e) {//Duplicate key ,Not null給null值
			if (e.getMessage().indexOf("customers.email_UNIQUE")>0) {
				throw new MLInvalidDataException("修改客戶失敗,email已經重複註冊",e);
			}else {
				throw new MLInvalidDataException("修改客戶時執行SQL失敗",e);
			}
		} catch (SQLException e) {
			throw new MLException("修改客戶時執行SQL失敗",e);
		}
	}
}

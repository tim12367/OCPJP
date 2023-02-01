package uuu.movieline.test;

import java.sql.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Customer;

/**
 * 這個範例用Statement來執行SQL,指令和資料只能在excuteXXX(sql)一起送到伺服器
 * 無法避免SQL Injection
 * @author Admin
 *
 */


public class TestCustomerLogin {
	private static final String driver = "com.mysql.cj.jdbc.Driver";// mysql 8.0.12
	private static final String url = "jdbc:mysql://localhost:3306/vgb";
	private static final String userid = "root"; // 帳號
	private static final String pwd = "1234"; // 密碼

	private static final String SELECT_CUSTOMER = "SELECT id, email, password, name, birthday, gender, "
			+ "address, phone, blood_type, subscribed" + " FROM customers ";

	public static void main(String[] args) {
		// 1.輸入帳號密碼
		Scanner scannner = new Scanner(System.in);
		System.out.println("請輸入帳號:");
		String id = scannner.next();
		System.out.println("請輸入密碼:");
		String password = scannner.next();
		scannner.close();

		Customer c = null;
		// 2.執行資料庫查詢
		{
			// 要分大小寫的話加 binary
			String sql = SELECT_CUSTOMER + "WHERE id = '" + id + "' AND password = BINARY '" + password + "'";
			System.out.println(sql);

			try {
				// 1.載入driver
				Class.forName(driver);

				try (
						// 2.建立connection
						Connection connection = DriverManager.getConnection(url, userid, pwd);

						// 3.建立Statement物件
						Statement stmt = connection.createStatement();

						// 4.執行stmt
						ResultSet rs = stmt.executeQuery(sql);
						) {
					System.out.printf("建立%s成功 : %s\n", connection.getClass().getName(), connection.getCatalog()); // 資料庫名稱
					// 5.處理rs
					while (rs.next()) {
						c = new Customer();
						c.setId(rs.getString("id"));
						c.setEmail(rs.getString("email"));
						c.setName(rs.getString("name"));
						c.setBirthday(rs.getString("birthday"));
						c.setGender(rs.getString("gender").charAt(0));
						c.setAddress(rs.getString("address"));
						c.setPhone(rs.getString("phone"));
						c.setSubscribed(rs.getBoolean("subscribed"));
						
						System.out.println(c);
					}
					
					
					// 資料庫查詢結束,6關閉連線(7.0之後可以用try with resource自動關閉)

				} catch (SQLException e) {
					Logger.getLogger("測試CustomerLogin").log(Level.SEVERE, "建立Connection失敗|執行指令失敗|讀取rs失敗", e);
				}
			} catch (ClassNotFoundException e) {
				Logger.getLogger("測試CustomerLogin").log(Level.SEVERE, "建立Connection失敗", e);
			}
		}
		// 3.輸出執行結果
		if (c != null) {
			System.out.printf("%s登入成功\n", c.getName());
			//System.out.println(c);
		} else {
			System.err.println("登入失敗");
		}
		System.out.printf("你輸入的帳號密碼是 %s , %s\n", id, password);
	}

}

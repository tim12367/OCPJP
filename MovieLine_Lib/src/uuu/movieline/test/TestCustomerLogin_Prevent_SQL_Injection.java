package uuu.movieline.test;

import java.sql.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Customer;

/**
 * 這個範例用PreparedStatement來執行SQL,指令和資料應該在prepare(sql), 在execute前才傳入資料 可以完全避免SQL
 * Injection
 * 
 * @author Admin
 *
 */

public class TestCustomerLogin_Prevent_SQL_Injection {
	private static final String driver = "com.mysql.cj.jdbc.Driver";// mysql 8.0.12
	private static final String url = "jdbc:mysql://localhost:3306/vgb";
	private static final String userid = "root"; // 帳號
	private static final String pwd = "1234"; // 密碼

	private static final String SELECT_CUSTOMER = "SELECT id, email, password, name, birthday, gender, "
			+ "address, phone, blood_type, subscribed" + " FROM customers ";

	public static void main(String[] args) {
		// 1.輸入帳號密碼
		Scanner scannner = new Scanner(System.in);
		System.out.println("請輸入帳號或Email:");
		String id = scannner.next();
		System.out.println("請輸入密碼:");
		String password = scannner.next();
		scannner.close();

		Customer c = null;
		// 2.執行資料庫查詢
		{
			// 要分大小寫的話加 binary
			String sql = SELECT_CUSTOMER + "WHERE id = ? AND password = BINARY ? ";
			System.out.println(sql);

			try {
				// 1.載入driver
				Class.forName(driver);

				try (Connection connection = 
						DriverManager.getConnection(url, userid, pwd); // 2.建立connection

						PreparedStatement pstmt = connection.prepareStatement(sql);// 3.建立Statement物件

				) {
					System.out.printf("建立%s成功 : %s\n", 
							connection.getClass().getName(), connection.getCatalog()); // 資料庫名稱
					// 3-1傳入?的值
					pstmt.setString(1, id);
					pstmt.setString(2, password);
//					System.out.println("pstmt : " + pstmt); //for test
					try ( // 因為被搬出小括號所以另外加try
							ResultSet rs = pstmt.executeQuery();// 4.執行pstmt
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
							
							//以下為BloodType屬性
//							String btypeString = rs.getString("blood_type");
//							if (btypeString != null) {
//								BloodType btype = BloodType.valueOf(btypeString);
//								c.setBloodType(btype);
//							}
							//以上為BloodType屬性

							System.out.printf("%s登入成功\n",c);//for test
						}
					} // 資料庫查詢結束,6關閉連線(7.0之後可以用try with resource自動關閉)
					
					
					
				} catch (SQLException e) {
					Logger.getLogger("測試CustomerLogin").log(
							Level.SEVERE, "建立Connection失敗|執行指令失敗|讀取rs失敗", e);
				}
			} catch (ClassNotFoundException e) {
				Logger.getLogger("測試CustomerLogin").log(
						Level.SEVERE, "建立Connection失敗", e);
			}
		}
		// 3.輸出執行結果
		System.out.printf("你輸入的帳號密碼是 %s , %s\n", id, password);
		
		if(c!=null && c.getPassword().equals(password)) {
			System.out.printf("%s登入成功\n", c.getName());
			return;
		}
		
		System.err.println("登入失敗");
		
		
	}

}

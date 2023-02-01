package uuu.movieline.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class TestConnection_0130 {
	public static final String driver = "com.mysql.cj.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/vgb";
	public static final String username = "root";
	public static final String password = "1234";
	public static final String SELECT_CUSTOMER = "SELECT id, email, password, name, birthday, gender, "
			+ "address, phone, blood_type, subscribed" + " FROM customers ";
	
	public static void main(String[] args) {
		String sql = SELECT_CUSTOMER + "WHERE id = ? AND password = BINARY ? ";
		System.out.println(sql);
		try {
			//載入Driver
			Class.forName(driver);
			
			try(	
				//建立connection
				Connection connection = DriverManager.getConnection(url, username, password);
				//pstmt
				PreparedStatement pstmt = connection.prepareStatement(sql);
			) {
				System.out.printf("建立%s成功 : %s\n", 
						connection.getClass().getName(), connection.getCatalog()); // 資料庫名稱
				// 3-1傳入?的值
				pstmt.setString(1, "A123123123");
				pstmt.setString(2, "12345;lkj");
				try(
			    //執行
				ResultSet rs = pstmt.executeQuery();
						
				){
					while(rs.next()) {
						System.out.println(rs.getString("id"));
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}

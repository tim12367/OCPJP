package uuu.movieline.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class TestConnection_0108 {
	public static final String driver= "com.mysql.cj.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/vgb";
	public static final String user = "root";
	public static final String pwd = "1234";
	
	public static final String SELECT_CUSTOMERS = 
			"SELECT id, email, password, name, birthday, gender, "
			+ "address, phone, blood_type, subscribed "
			+ "FROM customers "
			+ "WHERE id = ? AND password = ? ;";
	public static void main(String[] args) {
		String id = "A123123123";
		String password = "12345;lkj";
		try {
			//1.載入Driver
			Class.forName(driver);
			
			try(//2.建立Connection
					Connection connection = DriverManager.getConnection(url, user, pwd);
					//3.PrepareStatement
					PreparedStatement pstmt = connection.prepareStatement(SELECT_CUSTOMERS);
					) {
				
				//3.1 SetString
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				try(//4.執行pstmt
						ResultSet rs = pstmt.executeQuery();
						){
					//5.處理RS
					while(rs.next()) {
						System.out.println(rs.getString("name") + "你好");
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

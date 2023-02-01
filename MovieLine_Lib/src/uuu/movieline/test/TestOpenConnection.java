package uuu.movieline.test;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TestOpenConnection {
	
	private static final String driver = "com.mysql.cj.jdbc.Driver";//mysql 8.0.12
	private static final String url = "jdbc:mysql://localhost:3306/vgb";
	private static final String userid = "root"; //帳號
	private static final String pwd = "1234"; //密碼
	
	public static void main(String[] args) {
		
		
		try {
			//1.載入JDBC Driver類別定義
			Class.forName(driver);
			System.out.println("載入JDBC Driver成功!");
			Connection connection = null;
			//2.建立Connection(import java.sql.*;)
			try {
				connection = 
						DriverManager.getConnection(url, userid, pwd);
				System.out.printf("建立Connection成功%s\n",connection.getCatalog());//for test,vgb
				
			} catch (SQLException e) {
				Logger.getLogger("測試資料庫Connection").log(
						Level.SEVERE,
						"建立Connection失敗",
						e);
			}finally {
				//舊版寫法(7.0之後可以用try with resource自動關閉)
				try {
					if(connection!=null && !connection.isClosed())
						connection.close();// 結束程序時要記得關閉連線
				} catch (SQLException e) {
					e.printStackTrace();
				} 
			}
			
		} catch (ClassNotFoundException e) {
			Logger.getLogger("測試資料庫連線").log(Level.SEVERE, "載入JDBC Driver失敗", e);; //Logger
		}
		System.out.println("The End!");
	}

}

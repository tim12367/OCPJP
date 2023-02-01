package uuu.movieline.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

class MySQLConnection {
	private static final String driver = "com.mysql.cj.jdbc.Driver";// mysql 8.0.12
	private static final String url = "jdbc:mysql://localhost:3306/vgb";
	private static final String userid = "root"; // 帳號
	private static final String pwd = "1234"; // 密碼
	static {
		//TODO:從外部設定檔讀取
	}
	static Connection getConnection() {
		try {
			//1.載入JDBC Driver
			Class.forName(driver);
			try {
				//2.建立Connection
				Connection connection = 
						DriverManager.getConnection(url, userid, pwd);
				return connection;
			} catch (SQLException e) {
				throw new RuntimeException("建立Database連線失敗",e);
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("載入JDBC Driver失敗",e);
		}
	}
}

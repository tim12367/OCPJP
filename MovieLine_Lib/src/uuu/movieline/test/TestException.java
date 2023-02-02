package uuu.movieline.test;

import java.time.LocalDate;
//import java.time.format.DateTimeParseException;


public class TestException {

	public static void main(String[] args) {
			//unchecked exception: ArithmeticException, NullPointerException, DateTimeParseException
			int i=1;
			int j = 0; 
			if(j!=0) {
				System.out.println(i/j); //ArithmeticException: /by zero(整數除法分母為0)
			}
			
			String s = null;
			System.out.println(s!=null?s.length():"s是null"); //NullPointerException
			
			String bDate = "2011-1-15";			
			try {
				LocalDate date = LocalDate.parse(bDate); //java.time.format.DateTimeParseException
				System.out.println(date);
			}catch(Exception ex) {
				System.out.println("日期不符合iso8601: " + bDate);
			}
			
			String qty = "2";
			if(qty.matches("\\d+")) {
				int quantity = Integer.parseInt(qty);
				System.out.println(quantity);
			}else {
				System.err.println("數量不正確，必須為正整數: " + qty);
			}
			
			//checked exception: ClassNotFoundException, SQLException
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("載入成功");
			} catch (ClassNotFoundException e) {
				System.out.println("無法載入JDBC Driver");
			}
			
			System.out.println("The End");
	}

}

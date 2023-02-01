package uuu.movieline.test;

import java.util.Scanner;

import uuu.movieline.entity.Customer;

public class TestCustomerCheckId {
	public static void main(String[] args) {
		//輸入
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入身分證號");
		String id = scanner.next();
		scanner.close(); //關閉scanner
		//商業邏輯
		Customer c = new Customer();
		c.setName("Anne");
		c.setGender('F');
		boolean answer = c.checkId(id);
		
		//輸出結果
		System.out.println("你輸入的身分證是:" + id + (answer?"正確":" 錯誤"));
		System.out.printf("%s%s , 你好" ,c.getName(),c.getGender() == 'M'?"先生":"小姐");
	}
}

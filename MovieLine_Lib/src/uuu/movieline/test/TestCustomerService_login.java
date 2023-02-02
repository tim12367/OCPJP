package uuu.movieline.test;

import java.util.Scanner;

import uuu.movieline.entity.Customer;
import uuu.movieline.exception.MLException;
import uuu.movieline.service.CustomerService;

public class TestCustomerService_login {

	public static void main(String[] args) {
		// 1.輸入帳號密碼
		Scanner scannner = new Scanner(System.in);
		System.out.println("請輸入帳號:");
		String id = scannner.next();
		System.out.println("請輸入密碼:");
		String password = scannner.next();
		
		//2.呼叫商業邏輯
		CustomerService service = new CustomerService();
		Customer c;
		try {
			c = service.login(id, password);
			
			System.out.printf("%s登入成功\n",c);
		} catch (MLException e) {
			System.out.println("登入失敗");
		}
		
	}

}

package uuu.movieline.test;

import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Customer;
import uuu.movieline.exception.LoginFailException;
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
		} catch (LoginFailException e) {
			System.out.println("登入失敗");
			Logger.getLogger("測試會員登入").log(
					Level.SEVERE,e.getMessage()
					);
		} catch (MLException e) {
			//三參數錯誤較詳細
//			Logger.getLogger("測試會員登入").log(
//					Level.SEVERE,e.getMessage()
//					);
			Logger.getLogger("測試會員登入").log(
					Level.SEVERE,e.getMessage(),e
					);
		} catch (Exception e) {
//			只能抓到Exception 不能抓 Throwable 會抓到Error
			System.out.println("系統錯誤!");
			Logger.getLogger("測試會員登入").log(
					Level.SEVERE,e.getMessage(),e
					);
		}
		
	}

}

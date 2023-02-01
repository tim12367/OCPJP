package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.VIP;

public class TestVIP {

	public static void main(String[] args) {
		Customer c = new Customer("A123123123","test@uuu.com","123456;lkj");
		
		VIP vip = new VIP();
		
		vip.setId("A123123123");
		vip.setPassword("123456;lkj");
		vip.setBirthday("2001-06-15");
		vip.setDiscount(15);
		vip.setEmail("vip007@uuu.com");

		System.out.println(vip);
	}

}

package uuu.movieline.test;

import uuu.movieline.entity.Customer;

public class TestCustomer_gender {

	public static void main(String[] args) {
		Customer c = new Customer(
				"A123123123", "test@uuu.com.tw", "12345;lkj");
		c.setGender(Customer.MALE);
		
		
		System.out.println(c);
	}

}

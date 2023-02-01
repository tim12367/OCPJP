package uuu.movieline.test;

import javax.crypto.spec.SecretKeySpec;

import uuu.movieline.entity.Customer;

public class TestCustomerAge_null {

	public static void main(String[] args) {
		Customer c = new Customer();
		c.setId("A123123123");
		c.setEmail("test@test.com");
		c.setBirthday("2000-01-20");
		c.setPassword("123456");
		c.setGender(Customer.FEMALE);
		System.out.println(c);
	}
}

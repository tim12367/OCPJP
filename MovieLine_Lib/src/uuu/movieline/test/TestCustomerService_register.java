package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.service.CustomerService;

public class TestCustomerService_register {

	public static void main(String[] args) {
		Customer c = new Customer();
		c.setId("G177224855");
		c.setEmail("test05@uuu.com");
		c.setName("湯米");
		c.setPassword("12345;lkj");
		c.setBirthday("2005-07-07");
		c.setGender(Customer.UNKNOW);
		
		c.setAddress("新北市中和區中山路信義路4段5號");
		c.setPhone(null);
		c.setSubscribed(false);
		
		CustomerService service = new CustomerService();
		
		service.register(c);
		
		c = service.login("G177224855", "12345;lkj");
		System.out.println(c);
	}

}

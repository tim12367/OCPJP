package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.service.CustomerService;

public class TestCustomerService_register {

	public static void main(String[] args) {
		Customer c = new Customer();
		c.setId("A123456770");
		c.setEmail("test770@uuu.com.tw");
		c.setName("碧螺春");
		c.setPassword("12345;lkj");
		c.setBirthday("2000-05-05");
		c.setGender('M');
		
//		System.out.println(c);//for test
		CustomerService service = new CustomerService();
		
		service.register(c);
	}

}

package uuu.movieline.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Customer;
import uuu.movieline.exception.MLException;
import uuu.movieline.exception.MLInvalidDataException;
import uuu.movieline.service.CustomerService;

public class TestCustomerService_register {

	public static void main(String[] args) {
		
		try {
			Customer c = new Customer();
			c.setId("A123456752");
			c.setEmail("test752@uuu.com");
			c.setName("武厄");
			c.setPassword("12345;lkj");
			c.setBirthday("2001/06/01");
			c.setGender(Customer.UNKNOW);
			
			c.setAddress("高雄中和區中山路4段5號");
			c.setPhone(null);
			c.setSubscribed(false);
			
			CustomerService service = new CustomerService();
			service.register(c);
			
			c = service.login("A123456752", "12345;lkj");
			System.out.println(c);
		}catch (MLInvalidDataException e) {
			System.err.println(e.getMessage());//for user
//			Logger.getLogger("會員註冊測試").log( //for admin developer,tester
//					Level.SEVERE,e.getMessage()); 
		}catch (MLException e) {
			System.out.println("請聯絡系統管理員"+e.getMessage());
			Logger.getLogger("會員註冊測試").log(
					Level.SEVERE,e.getMessage(),e);
		 
		} catch (Exception e) {
			System.err.print("發生系統錯誤: "+e);
			Logger.getLogger("會員註冊測試").log(
					Level.SEVERE,"發生非預期錯誤",e);
		}
		
		
		
	}

}

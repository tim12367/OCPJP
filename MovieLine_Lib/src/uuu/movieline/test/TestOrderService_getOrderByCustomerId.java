package uuu.movieline.test;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.entity.Order;
import uuu.movieline.exception.MLException;
import uuu.movieline.service.CustomerService;
import uuu.movieline.service.OrderService;

public class TestOrderService_getOrderByCustomerId {

	public static void main(String[] args) {
		OrderService oService = new OrderService();
		CustomerService cService = new CustomerService();
		try {
			Customer c =  cService.login("A123123123", "12345;lkj");
			List<Order> oList = oService.getOrdersByCustomer(c);
			System.out.println(oList);
		} catch (MLException e) {
			Logger.getLogger("測試[id查詢]").log(
					Level.SEVERE,e.getMessage(),e);
		}
	}

}

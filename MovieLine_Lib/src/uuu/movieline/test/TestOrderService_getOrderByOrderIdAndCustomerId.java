package uuu.movieline.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.MovieSession;
import uuu.movieline.entity.Order;
import uuu.movieline.exception.MLException;
import uuu.movieline.service.OrderService;

public class TestOrderService_getOrderByOrderIdAndCustomerId {

	public static void main(String[] args) {
		OrderService oService = new OrderService();
		try {
			Order o = oService.getOrderByOrderIdAndCustomerId("13", "A123123123");
			System.out.println(o);
		} catch (MLException e) {
			Logger.getLogger("測試[id查詢]").log(
					Level.SEVERE,e.getMessage(),e);
		}
	}

}

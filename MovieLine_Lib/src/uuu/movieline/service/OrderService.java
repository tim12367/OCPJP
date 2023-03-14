package uuu.movieline.service;



import uuu.movieline.entity.Order;
import uuu.movieline.exception.MLException;

public class OrderService {
	private OrdersDAO dao = new OrdersDAO();
	
	public void checkOut(Order order) throws MLException {
		dao.insert(order);
	}
}
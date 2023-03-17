package uuu.movieline.service;



import uuu.movieline.entity.Order;
import uuu.movieline.exception.MLException;

public class OrderService {
	private OrdersDAO dao = new OrdersDAO();
	
	public void checkOut(Order order) throws MLException {
		dao.insert(order);
	}
	public Order getOrderByOrderIdAndCustomerId(String orderId ,String customerId ) throws MLException {
		if(orderId==null) throw new IllegalArgumentException("查詢訂單時訂單ID不可為空");
		if(customerId==null) throw new IllegalArgumentException("查詢訂單時客戶ID不可為空");
		return dao.selectOrderByOrderIdAndCustomerId(orderId ,customerId);
	}
}
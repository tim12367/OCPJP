package uuu.movieline.service;



import java.util.List;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.Order;
import uuu.movieline.exception.MLException;

public class OrderService {
	private OrdersDAO dao = new OrdersDAO();
	
	public void checkOut(Order order) throws MLException {
		dao.insert(order);
	}
	public Order getOrderByOrderIdAndCustomer(String orderId ,Customer member ) throws MLException {
		if(member==null) throw new IllegalArgumentException("查詢訂單時客戶不可為空");
		Order order = dao.selectOrderByOrderIdAndCustomerId(orderId ,member.getId());
		if(order!=null) {
			order.setCustomer(member);
		}
		return order;
	}
	public List<Order>  getOrdersByCustomer(Customer member ) throws MLException {
		if(member==null) throw new IllegalArgumentException("查詢全部訂單時客戶不可為空");
		List<Order> list = dao.selectOrdersByCustomerId(member.getId());
		
		return list;
	}
	
}
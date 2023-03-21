package uuu.movieline.service;



import java.time.LocalDateTime;
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

	public void updateOrderStatusToPAID(Customer member, String orderId, String cardF6, String cardL4,

			String auth, String paymentDate, String amount) throws MLException {

		StringBuilder paymentNote = new StringBuilder("信用卡號:");

		paymentNote.append(cardF6 == null ? "4311-95" : cardF6).append("**-****")
				.append(cardL4 == null ? 2222 : cardL4);

		paymentNote.append(",授權碼:").append(auth == null ? "777777" : auth);

		paymentNote.append(",交易時間:").append(paymentDate == null ? LocalDateTime.now() : paymentDate); // 必須import
	// java.time.LocalDateTime
//	    paymentNote.append(",刷卡金額:").append(amount);
		System.out.println("orderId = " + orderId);
		System.out.println("memberId = " + member.getId());
		System.out.println("paymentNote = " + paymentNote);
		dao.updateOrderStatusToPAID(member.getId(), Integer.parseInt(orderId), paymentNote.toString());

	}

	 
}
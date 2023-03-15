package uuu.movieline.test;


import java.time.LocalDate;
import java.time.LocalTime;
import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.entity.Order;
import uuu.movieline.entity.PaymentType;
import uuu.movieline.entity.Seat;
import uuu.movieline.entity.ShippingType;
import uuu.movieline.entity.ShoppingCart;
import uuu.movieline.exception.MLException;
import uuu.movieline.service.CustomerService;
import uuu.movieline.service.OrderService;
import uuu.movieline.service.ProductService;

public class TestOrder {
	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		ProductService pService = new ProductService();
		try {
			Customer member = cService.login("A123123123", "12345;lkj");
			ShoppingCart cart = new ShoppingCart();
			
			cart.setMember(member);
			{ //product Id 1
				
				String movieId = "10"; //request.getParameter("productId")
				String date = "2023-02-28"; //request.getParameter("color")
				String time = "19:30"; //request.getParameter("sizeName")				
				
				MovieSession p = pService.getSessionsByMovieIdDatetime(movieId,date,time);
				Seat s = new Seat();
				s.setRowE(8);
				s.setRowF(24);
				//System.out.println(p); //for test
				cart.addCartItem(p, s);				
			}
			
			{ //product Id 1
				
				String movieId = "7"; //request.getParameter("productId")
				String date = "2023-02-28"; //request.getParameter("color")
				String time = "12:50"; //request.getParameter("sizeName")				
				
				MovieSession p = pService.getSessionsByMovieIdDatetime(movieId,date,time);
				Seat s = new Seat();
				s.setRowF(128);
				s.setRowH(64);
//				System.out.println("測試2"+s);
				//System.out.println(p); //for test
				cart.addCartItem(p, s);		
			}
			
			
			
//		System.out.println("測試cart"+cart);

		Order order = new Order();
		order.setCustomer(cart.getMember());
		order.setOrderDate(LocalDate.now());
		order.setOrderTime(LocalTime.now());
		
		PaymentType thePType = PaymentType.valueOf("HOME");
		order.setPaymentType(thePType.name());
		order.setPaymentFee(thePType.getFee());
		
		ShippingType theShippingType = ShippingType.valueOf("HOME");			
		order.setShippingType(theShippingType.name());
		order.setShippingFee(theShippingType.getFee());			
		order.setShippingAddress("台北市復興北路99號12F");
		
		order.setRecipientName("林莉");
		order.setRecipientEmail("test01@uuu.com.tw");
		order.setRecipientPhone("0987641111");
		order.add(cart);
		System.out.println(order);
		OrderService oService = new OrderService();
		oService.checkOut(order);
		}catch (MLException e) {
			Logger.getLogger("建立訂單測試").log(
					Level.SEVERE, e.getMessage(), e
				);
		} 

	}
}
package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.entity.Seat;
import uuu.movieline.entity.ShoppingCart;
import uuu.movieline.exception.MLException;
import uuu.movieline.service.CustomerService;
import uuu.movieline.service.ProductService;

public class TestShoppingCart {
	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		ProductService pService = new ProductService();
		try {
			Customer member = cService.login("A123123123", "12345;lkj");
			ShoppingCart cart = new ShoppingCart();
			
			cart.setMember(member);
			{ //product Id 1
				
				String movieId = "6"; //request.getParameter("productId")
				String date = "2023-02-28"; //request.getParameter("color")
				String time = "18:10:00"; //request.getParameter("sizeName")				
				
				MovieSession p = pService.getSessionsByMovieIdDatetime(movieId,date,time);
				Seat s = new Seat();
				s.setRowA(8);
				s.setRowB(3);
				//System.out.println(p); //for test
				cart.addCartItem(p, s);				
			}
			
			{ //product Id 1
				
				String movieId = "9"; //request.getParameter("productId")
				String date = "2023-02-28"; //request.getParameter("color")
				String time = "21:30:00"; //request.getParameter("sizeName")				
				
				MovieSession p = pService.getSessionsByMovieIdDatetime(movieId,date,time);
				Seat s = new Seat();
				s.setRowB(6);
				//System.out.println(p); //for test
				cart.addCartItem(p, s);				
			}
			
			
			
		System.out.println(cart);
		}catch (MLException e) {
			System.out.println(e.getMessage());
		} 

	}
}
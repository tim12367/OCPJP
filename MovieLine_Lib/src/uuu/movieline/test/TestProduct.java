package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.Movie;

public class TestProduct {

	public static void main(String[] args) {
		Movie p = new Movie();
//		Customer c;
		p.setId(1);
		p.setName("test");
		p.setUnitPrice(1);
		
		System.out.println(p);
		System.out.println("*************以下為p2**************");
//		Product p2 = new Product(65,"JAVA 7 教學手冊第五版" ,-1,20,"123") ;
		var p2 = p;
		p2.setId(2);
		p2.setName("第六版");
		System.out.println(p2);
	}

}

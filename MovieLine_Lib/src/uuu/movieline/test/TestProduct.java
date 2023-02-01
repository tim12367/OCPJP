package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.Product;

public class TestProduct {

	public static void main(String[] args) {
		Product p = new Product();
		Customer c;
		p.setId(-1);
		p.setName("JAVA 7 教學手冊第五版");
		p.setUnitPrice(650);
		
		System.out.println(p);
		System.out.println("*************以下為p2**************");
//		Product p2 = new Product(65,"JAVA 7 教學手冊第五版" ,-1,20,"123") ;
		var p2 = p;
		p2.setId(2);
		p2.setName("第六版");
		System.out.println(p2);
	}

}

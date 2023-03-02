package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.Movie;

public class TestProduct_PassByValue {

	public static void main(String[] args) {
		
		Movie p = new Movie();
		Customer c;
		p.setId(-1);
		p.setName("JAVA 7 教學手冊第五版");
		p.setUnitPrice(650);
		
		System.out.printf("id:%d \n",p.getId());
		System.out.printf("name:%s \n",p.getName());
		System.out.printf("uniprice:%f \n",p.getUnitPrice());
//		System.out.printf("stock:%d \n",p.getStock());
		System.out.printf("description:%s \n",p.getDescription());
		System.out.printf("photoUrl:%s \n",p.getPhotoUrl());
		System.out.printf("launchDate:%s \n",p.getLaunchDate());
		System.out.printf("category:%s \n",p.getCategory());
		System.out.println("*************以下為p2**************");
//		Product p2 = new Product(65,"JAVA 7 教學手冊第五版" ,-1,20,"123") ;
		var p2 = p;
		p2.setName("第六版");
		System.out.printf("id:%d \n",p2.getId());
		System.out.printf("name:%s \n",p2.getName());
		System.out.printf("uniprice:%f \n",p2.getUnitPrice());
//		System.out.printf("stock:%d \n",p2.getStock());
		System.out.printf("description:%s \n",p2.getDescription());
		System.out.printf("photoUrl:%s \n",p2.getPhotoUrl());
		System.out.printf("launchDate:%s \n",p2.getLaunchDate());
		System.out.printf("category:%s \n",p2.getCategory());
//		System.out.printf("this: %s",p2.getThis());

	}

}

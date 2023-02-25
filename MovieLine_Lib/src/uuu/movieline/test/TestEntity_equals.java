package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.Outlet;
import uuu.movieline.entity.Movie;
import uuu.movieline.entity.VIP;

public class TestEntity_equals {

	public static void main(String[] args) {
		int i = 1;
		double j = 1D;
		System.out.println(i==j);//true
		
		String s = "Hello";
		String s1 = "Hello";//s1從String pool參考了同個"Hello"
		String s2 =new String ("Hello");//s2 參考建立了新的"Hello"
		String s3 = getString();
		System.out.println(s==s1);//true
		System.out.println(s==s2);//false 因為建立了新字串物件所以不==
		System.out.println(s==s3);//true
		System.out.println(s2==s3);//false
		
		System.out.println(s.equals(s1));//true
		System.out.println(s.equals(s2));//true
		System.out.println(s.equals(s3));//true
		System.out.println(s2.equals(s3));//true
		
		s3 = s2;
		System.out.println(s3==s2);
		
		s=s+"World";
		System.out.println(s);
		System.out.println(s1);
		
		Movie p = new Movie(1,"java",650);
		Movie p2 = new Movie(1,"java",650);
		Outlet o = new Outlet(1,"java",650,21);
		Outlet o2 = new Outlet(1,"java",650,65);
		
		System.out.println("p == p2 : "+ (p==p2)); //false
		System.out.println("p.equals(p2) : " + p.equals(p2)); //true
		System.out.println("p.equals(o)  : " + p.equals(o)); //false //class不相同
		System.out.println("o.equals(o2)  : " + o.equals(o2)); //true
		
		p.setUnitPrice(655);
		System.out.println(p.getUnitPrice());
		System.out.println(p2.getUnitPrice());
		
		Customer c1 = new Customer("A123123123","test@uuu.com",
				"123456;lkj","李四");
		Customer c2 = new Customer("A123123123","test@uuu.com",
				"123456;lkj","李四");
		System.out.println(c1.equals(c2));
		
		VIP c3 = new VIP("A123123123","test@uuu.com",
				"123456;lkj","李四");
		//若想要vip跟Customer相同要用instanseof判斷
		System.out.println(c2.equals(c3)); 
		Customer c4 = new Customer();
		Customer c5 = new Customer();
		System.out.println(c4.equals(c5));
		}
	public static String getString() {
		return "Hello";
	}

}

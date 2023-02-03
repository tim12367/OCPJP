package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.VIP;

public class TestClassCastException {

	public static void main(String[] args) {
		Customer v = new VIP();
//		System.out.println(p.getClass()==Product.class);較嚴格 同class檢查
		System.out.println(((VIP)v).getDiscount());
		
		Customer v2 = new Customer();
		//向下轉型
		VIP v3 = (VIP) v2;
		System.out.println(v3.getDiscount()); //java.lang.ClassCastException
	}

}

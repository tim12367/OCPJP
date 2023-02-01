package uuu.movieline.test;

import uuu.movieline.entity.Outlet;

public class TestOutletConstructor {

	public static void main(String[] args) {
		Outlet outlet = new Outlet(2,"手機",10000,35);
		
//		outlet.setId(2);
//		outlet.setName("手機");
//		outlet.setUnitPrice(10000);
//		outlet.setDiscount(35);
		System.out.println(outlet);

	}

}

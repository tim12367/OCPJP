package uuu.movieline.test;

import uuu.movieline.entity.Outlet;

public class TestOutlet {

	public static void main(String[] args) {
		Outlet outlet = new Outlet();

		outlet.setId(2);
		outlet.setName("手機");
		outlet.setUnitPrice(10000);
		outlet.setDiscount(35);
		System.out.println(outlet);
	}

}

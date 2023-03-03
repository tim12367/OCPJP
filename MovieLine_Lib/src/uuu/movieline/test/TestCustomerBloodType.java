package uuu.movieline.test;

import uuu.movieline.entity.Customer;

public class TestCustomerBloodType {

	public static void main(String[] args) {
		Customer c = new Customer(
				"A123123123", "test@uuu.com.tw", "12345;lkj");
		System.out.println(c);
		//當Customer有bloodType屬性，可以uncomment以下2行
		//c.setBloodType(BloodType.O);	
		//System.out.printf("c.getBloodType(): %s\n", c.getBloodType());
		
		
		for(int i=0;i<BloodType.values().length;i++) {
			BloodType bType = BloodType.values()[i];
			System.out.printf("bType: %s, %s, %d\n", 
									bType, bType.name(),bType.ordinal());

		}
		
		//BloodType G = new BloodType("G", 4); //enum不得建立其他新的物件
	}

}

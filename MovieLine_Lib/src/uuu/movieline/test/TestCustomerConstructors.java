package uuu.movieline.test;

import uuu.movieline.entity.Customer;

public class TestCustomerConstructors {

	public static void main(String[] args) {
		Customer customer = new Customer("A123123123","test@uuu.com","1234;lkj","Tom");
		
		customer.setBirthday("2000-02-19");
		customer.setGender('M');
		
		customer.setAddress("台北市復興路99號14F");
		customer.setPhone("02-25149191");
		customer.setSubscribed(true);
		
		System.out.printf("身分證 = %s\n" ,customer.getId());
		System.out.printf("email = %s\n" ,customer.getEmail());
		System.out.printf("密碼 = %s\n" ,customer.getPassword());
		System.out.printf("姓名 = %s\n" ,customer.getName());
		System.out.printf("生日 = %s\n" ,customer.getBirthday());
		System.out.printf("性別 =  %s\n" ,customer.getGender());
		System.out.printf("地址 = %s\n" ,customer.getAddress());
		System.out.printf("電話 = %s\n" ,customer.getPhone());
		System.out.printf("是否訂閱 = %s\n" ,customer.isSubscribed());

	}

}

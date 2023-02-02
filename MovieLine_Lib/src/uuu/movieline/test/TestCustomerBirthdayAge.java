package uuu.movieline.test;


import uuu.movieline.entity.Customer;

public class TestCustomerBirthdayAge {

	public static void main(String[] args) {
		//Unit Test
		Customer customer = new Customer();
		customer.setId("H163610237");

		customer.setEmail("hi123@uuu.com");
		
//		customer.password = "12345;Lkj";
		customer.setPassword("12345678");
		
//		customer.name = "林國斌";
		customer.setName("林國斌");
		
//		LocalDate bDate = LocalDate.parse("9999-01-05");
		
//		int thisYear = LocalDate.now().getYear();
//		int birthYear = bDate.getYear();
		
//		int age = customer.getAge(bDate);
//		
//		if (age>=12) {
			customer.setBirthday("2000-2-15");
//		}else{
//			System.err.println("客戶生日必須輸入且須符合限制規則:必須年滿12歲");
//		}
		
		customer.setGender('M'); //0~65535, 'M':77 , 'F':70
		
//		System.out.printf("身分證 = %s\n" ,customer.id);
		System.out.printf("身分證 = %s\n" ,customer.getId());
		System.out.printf("email = %s\n" ,customer.getEmail());
//		System.out.printf("密碼 = %s\n" ,customer.password);
		System.out.printf("密碼 = %s\n" ,customer.getPassword());
//		System.out.printf("姓名 = %s\n" ,customer.name);
		System.out.printf("姓名 = %s\n" ,customer.getName());
		System.out.printf("生日 = %s\n" ,customer.getBirthday());
		System.out.printf("年齡 = %s\n" ,customer.getAge());
		
//		birthYear = bDate.getYear();
//		age = thisYear - birthYear;
		
		System.out.printf("性別 =  %s\n" ,customer.getGender());
		System.out.printf("地址 = %s\n" ,customer.getAddress());
		System.out.printf("電話 = %s\n" ,customer.getPhone());
		System.out.printf("是否訂閱 = %s\n" ,customer.isSubscribed());
	}

}

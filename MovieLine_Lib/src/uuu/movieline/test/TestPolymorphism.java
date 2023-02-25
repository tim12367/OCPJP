package uuu.movieline.test;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.Outlet;
import uuu.movieline.entity.Movie;

public class TestPolymorphism {
	/**
	 *  示範多型區域變數(polymorphic local variable(s))
	 * @param args
	 */
	public static void main(String[] args) {
		Object obj = new Object();//normal object type variable
		String s = "Hello";
		
		System.out.println(obj.toString()); //java.lang.Object@記憶體位置的16進位
		System.out.println(s.toString());
		System.out.println(s.length());
		
		Object obj2 = new String("hello");//polymorphic local variable
		System.out.println(obj2.toString());//O
//		System.out.println(obj2.length()); //X
		
		Object obj3 = new Customer("A123123123","test@uuu.com","12345;lkkj");//polymorphic local variable
		System.out.println(obj3.toString());//O
//		System.out.println(obj3.getAge());//X  getAge()在Object類別沒有定義
		
		Movie p = new Outlet(2,"java程式語言",650,21);//polymorphic local variable
		System.out.println(p.toString());//O
		System.out.println(p.getName());//O
		System.out.println(p.getUnitPrice());//售價
		if(p instanceof Outlet) {
			Outlet outlet = (Outlet)p;
			System.out.println(outlet.getListPrice());//getListPrice()在Product類別沒有定義
		}
//		p = new Product(2,"java程式語言",650,21,"書本");
//		System.out.println(p.getListPrice());//X getListPrice()在Product類別沒有定義
		System.out.println(p instanceof Outlet?((Outlet)p).getListPrice():p.getUnitPrice());
		System.out.println(((Outlet)p).getListPrice());//因為沒有檢查 當p參考到Product物件就會發生執行時期錯誤
//		System.out.println(p.getDiscount());//X
	}

}

package uuu.movieline.test;

public class TestRuntimeException {

	public static void main(String[] args) {
//		System.out.println(1D/0);//Infinity
//		System.out.println(1/0);//java.lang.ArithmeticException
		String s = null;
//		System.out.println(s.length());//java.lang.NullPointerException
		
		s = "abcd";
		
		if(s.matches("\\d+")) {
			int i = Integer.parseInt(s);//java.lang.NumberFormatException
			System.out.println(i);
		}
	}

}

package uuu.movieline.test;

import java.text.DecimalFormat;
import java.text.NumberFormat;

public class TestLocalVariablesType {

	public static void main(String[] args) {
		byte b = 0b010; // 2
		System.out.println(b);
		
		short c = 010; // 8
		System.out.println(c);
		
		int a = 0xCaFe; //49152 + 2560 + 240 + 14
		System.out.println(a); //  = 51966
		System.out.println((char) a); //쫾
		
		long d = 1_0000_0000_0000_0000L; // 不加L會錯 因為預設Int 超過21億
		float e = 1.F;
		double f= 1.0 - 0.8; //IEEE 754
		System.out.println(f);
		
		double data = 12345678.98765432987; // 整數8位會變成科學記號
		System.out.println(data);
		System.out.println("1E1F : " + 1e1f); // 10.0
		System.out.println(".141e-9f : " + .141e-9f); // 1.41E-10
		
		NumberFormat nf = NumberFormat.getInstance(); //需要import
		nf.setMaximumFractionDigits(4);
		nf.setMinimumFractionDigits(2);
		System.out.println(nf.format(f)); // 整數會以三個為一組加"," 的 String
		System.out.println(nf.format(data));
		System.out.printf("data = %.2f\n",data);
		
		// 字串中0代表一定要有值，#則代表不一定要有值
		DecimalFormat df = new DecimalFormat("$#,##0.00%");
		System.out.println("DecimalFormat = " + df.format(data));
		
		char g = 'a';
		char g2 = '資';
		char g3 = '堃';
		System.out.println(g3);
		char g4 = '\u03A6';
		System.out.println(g4);
		boolean h = true;
		boolean h1 = false;
		int i = 1;//initialize
		i = 10; //assign
		System.out.println(i);

	}

}

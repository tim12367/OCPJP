package uuu.movieline.test;

import java.util.Scanner;

public class TestRocId {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("輸入身分證號碼:");
		String testId = scanner.nextLine();
		scanner.close();
		
		// 首字大寫+[1289]+8碼
		if (!testId.matches("^[A-Z][1289]\\d{8}")) {
			System.err.println("身分證有誤");
		} else if (calculateRocIdNum10(testId)) {
			System.out.println("合法");
		} else {
			//首字大寫+[1289]+8碼 但驗證失敗
			System.err.println("身分證有誤");
		}
		

	}

	static boolean calculateRocIdNum10(String rocId) {
		int idFirstcode = -1;
		switch (rocId.substring(0, 1)) {
		case "A":idFirstcode = 10;break;
		case "B":idFirstcode = 11;break;
		case "C":idFirstcode = 12;break;
		case "D":idFirstcode = 13;break;
		case "E":idFirstcode = 14;break;
		case "F":idFirstcode = 15;break;
		case "G":idFirstcode = 16;break;
		case "H":idFirstcode = 17;break;
		case "I":idFirstcode = 34;break;
		case "J":idFirstcode = 18;break;
		case "K":idFirstcode = 19;break;
		case "M":idFirstcode = 21;break;
		case "N":idFirstcode = 22;break;
		case "O":idFirstcode = 35;break;
		case "P":idFirstcode = 23;break;
		case "Q":idFirstcode = 24;break;
		case "T":idFirstcode = 27;break;
		case "U":idFirstcode = 28;break;
		case "V":idFirstcode = 29;break;
		case "W":idFirstcode = 32;break;
		case "X":idFirstcode = 30;break;
		case "Z":idFirstcode = 33;break;
		case "L":idFirstcode = 20;break;
		case "R":idFirstcode = 25;break;
		case "S":idFirstcode = 26;break;
		case "Y":idFirstcode = 31;break;
		}
		if (idFirstcode==-1) {
			// 如果出現例外
			System.err.println("ConvertFirstIdError"+idFirstcode);
		}
		int num00 = idFirstcode / 10;
		int num01 = idFirstcode % 10;
		int num1 = rocId.charAt(1) - 48;
		int num2 = rocId.charAt(2) - 48;
		int num3 = rocId.charAt(3) - 48;
		int num4 = rocId.charAt(4) - 48;
		int num5 = rocId.charAt(5) - 48;
		int num6 = rocId.charAt(6) - 48;
		int num7 = rocId.charAt(7) - 48;
		int num8 = rocId.charAt(8) - 48;
		int num9 = rocId.charAt(9) - 48;
		int varifiedInt = 
				num00 * 1 + 
				num01 * 9 + 
				num1 * 8 + 
				num2 * 7 + 
				num3 * 6 + 
				num4 * 5 + 
				num5 * 4 + 
				num6 * 3 + 
				num7 * 2 + 
				num8 * 1 + 
				num9 * 1;
		System.out.println(varifiedInt);
		boolean result = false;
		if ((varifiedInt % 10) == 0) {
			result = true;
		}
//		System.out.println(result);
		return result;
	}

}

package uuu.movieline.test;

import java.util.Iterator;

public class TestArray {
	public static void main(String[] args) {
		main(null);//StackOverflowError 遞迴呼叫自己
		int[] a = new int[3];
		var b = new int[5];
		for(int i :b) {
			System.out.println(i);//預設0
		}
		System.out.println(a.length);
		System.out.println(b[b.length-1]);
		b[b.length-1] = (byte)128.0;//溢位
		System.out.println(b[b.length-1]);//.length 陣列屬性
		System.out.println("test".length());//.length()字串方法
	}
}

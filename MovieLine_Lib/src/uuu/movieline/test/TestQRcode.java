package uuu.movieline.test;


import java.nio.file.Paths;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

public class TestQRcode {

	public static void main(String[] args) throws Exception {
		String data = "2023";
		String path = "G:\\其他電腦\\我的電腦\\DATA\\testQRcode.jpg";
		
		BitMatrix matrix = new MultiFormatWriter()
				.encode(data, BarcodeFormat.QR_CODE, 500, 500);
		
		MatrixToImageWriter.writeToPath(matrix, "jpg", Paths.get(path));
	}
}

package uuu.movieline.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

/**
 * Servlet implementation class QRcodeServlet
 */
@WebServlet("/images/qrcode.png")
public class QRcodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QRcodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String movieNameString = request.getParameter("movieName");
		String dateString = request.getParameter("date");
		String timeString = request.getParameter("time");
		String theaterString = request.getParameter("theater");
		String seatString = request.getParameter("seat");
		String data = movieNameString+"_"+dateString+"_"+timeString+"_"+theaterString+"_"+seatString;
//		System.out.println(data);//for test
		response.setContentType("image/png");
		try {
			BitMatrix matrix = new MultiFormatWriter()
					.encode(new String(data.getBytes("utf-8"),"ISO-8859-1") , BarcodeFormat.QR_CODE, 500, 500);
			ServletOutputStream outStream = response.getOutputStream();
			MatrixToImageWriter.writeToStream(matrix, "png", outStream);
		} catch (WriterException e) {
			this.log("QRcode產生失敗!zxing.Writer發生問題!",e);
		} catch (Exception e) {
			this.log("QRcode產生失敗!發生未預期錯誤",e);
		}
	}

}

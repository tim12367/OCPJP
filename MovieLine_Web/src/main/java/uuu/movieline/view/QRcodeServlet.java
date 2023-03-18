package uuu.movieline.view;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;

import uuu.movieline.entity.Customer;

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
		String dateString = request.getParameter("date");
		String timeString = request.getParameter("time");
		String theaterString = request.getParameter("theater");
		String seatString = request.getParameter("seat");
		HttpSession session = request.getSession();
		Customer member = (Customer) session.getAttribute("member");
		String memberId = "0000000000";
		if(member!=null) {
			memberId = member.getId();
		}
		String data = dateString+"_"+timeString+"_"+theaterString+"_"+seatString+"_"+memberId;
//		System.out.println(data);//for test
		try {
			BitMatrix matrix = new MultiFormatWriter()
					.encode(data, BarcodeFormat.QR_CODE, 500, 500);
			ServletOutputStream outStream = response.getOutputStream();
			MatrixToImageWriter.writeToStream(matrix, "png", outStream);
		} catch (WriterException e) {
			this.log("QRcode產生失敗!",e);
		} catch (Exception e) {
			this.log("QRcode產生失敗!發生未預期錯誤",e);
		}
	}

}

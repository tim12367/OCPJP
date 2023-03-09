package uuu.movieline.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.movieline.entity.Movie;
import uuu.movieline.entity.MovieSession;
import uuu.movieline.entity.Seat;
import uuu.movieline.entity.ShoppingCart;
import uuu.movieline.exception.MLException;
import uuu.movieline.service.ProductService;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/add_cart.do")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		HttpSession session = request.getSession();
		
		//已使用filter統一處理中文編碼
		//1.取得request的Form Data
		String movieId = request.getParameter("movieId");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String quantity = request.getParameter("quantity");
		String rowA = request.getParameter("rowA");
		String rowB = request.getParameter("rowB");
		String rowC = request.getParameter("rowC");
		String rowD = request.getParameter("rowD");
		String rowE = request.getParameter("rowE");
		String rowF = request.getParameter("rowF");
		String rowG = request.getParameter("rowG");
		String rowH = request.getParameter("rowH");
		String rowI = request.getParameter("rowI");
		
		//2.檢查並呼叫商業邏輯
		if(movieId!=null && date!=null && time!=null) {
			ProductService pService = new ProductService();
			try {
				MovieSession s = pService.getSessionsByMovieIdDatetime(movieId, date, time);
				Seat bookingSeat = new Seat(); 
				if(s!=null&&quantity!=null&&quantity.matches("\\d+")) {
					if(rowA!=null&&rowA.length()>0&&rowA.matches("\\d+")) {bookingSeat.setRowA(Integer.parseInt(rowA));}//else{bookingSeat.setRowA(0);};
					if(rowB!=null&&rowB.length()>0&&rowB.matches("\\d+")) {bookingSeat.setRowB(Integer.parseInt(rowB));}//else{bookingSeat.setRowB(0);}; 
					if(rowC!=null&&rowC.length()>0&&rowC.matches("\\d+")) {bookingSeat.setRowC(Integer.parseInt(rowC));}//else{bookingSeat.setRowC(0);}; 
					if(rowD!=null&&rowD.length()>0&&rowD.matches("\\d+")) {bookingSeat.setRowD(Integer.parseInt(rowD));}//else{bookingSeat.setRowD(0);}; 
					if(rowE!=null&&rowE.length()>0&&rowE.matches("\\d+")) {bookingSeat.setRowE(Integer.parseInt(rowE));}//else{bookingSeat.setRowE(0);}; 
					if(rowF!=null&&rowF.length()>0&&rowF.matches("\\d+")) {bookingSeat.setRowF(Integer.parseInt(rowF));}//else{bookingSeat.setRowF(0);};
					if(rowG!=null&&rowG.length()>0&&rowG.matches("\\d+")) {bookingSeat.setRowG(Integer.parseInt(rowG));}//else{bookingSeat.setRowG(0);};
					if(rowH!=null&&rowH.length()>0&&rowH.matches("\\d+")) {bookingSeat.setRowH(Integer.parseInt(rowH));}//else{bookingSeat.setRowH(0);};
					if(rowI!=null&&rowI.length()>0&&rowI.matches("\\d+")) {bookingSeat.setRowI(Integer.parseInt(rowI));}//else{bookingSeat.setRowI(0);};
					
					if(bookingSeat.getQuantity()!=0){
						ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
						if(cart==null) {
							cart = new ShoppingCart();
							session.setAttribute("cart", cart);
						}					
						cart.addCartItem(s, bookingSeat);
					}else {
						errorList.add("加入購物車失敗!quantity必須為正整數!");
					};
				}
				
			}catch (MLException e) {
				this.log("加入購物車失敗",e);
				errorList.add(e.getMessage());
			}
		}else {
			errorList.add("MovieId不得為null");
		}
		if(errorList!=null&&errorList.size()>0) System.err.println(errorList);
		//3.外部轉址 /member/cart.jsp
		response.sendRedirect(request.getContextPath()+"/member/cart.jsp");
		return;
	}
}

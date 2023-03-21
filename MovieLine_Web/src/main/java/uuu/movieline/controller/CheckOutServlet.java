package uuu.movieline.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import uuu.movieline.entity.Customer;
import uuu.movieline.entity.Order;
import uuu.movieline.entity.PaymentType;
import uuu.movieline.entity.ShippingType;
import uuu.movieline.entity.ShoppingCart;
import uuu.movieline.exception.MLException;
import uuu.movieline.exception.MLStockSortageException;
import uuu.movieline.service.OrderService;

/**
 * Servlet implementation class CheckOutServlet
 */
@WebServlet("/member/check_out.do")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList = new ArrayList<>();
		HttpSession session = request.getSession();
		Customer member = (Customer) session.getAttribute("member");
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		//判斷是否有購物車
		if(cart==null||cart.isEmpty()) {
			response.sendRedirect("cart.jsp");
			return;
		}
		//1.取得request中的form data
		String paymentType = request.getParameter("paymentType");
		String shippingType = request.getParameter("shippingType");
		String shippingAddr = request.getParameter("address");
		
		String recipientName = request.getParameter("name");
		String recipientEmail = request.getParameter("email");
		String recipientPhone = request.getParameter("phone");
		
		PaymentType thePType = null;//初始化thePType
		if(paymentType==null||paymentType.trim().length()==0) {
			errorList.add("必須選擇付款方式");
		}else {
			try {
				thePType = PaymentType.valueOf(paymentType);
			}catch(Exception ex) {
				errorList.add("錯誤的付款方式");
			}
		}
		
		ShippingType theShippingType = null; //將paymentType字串轉為對應的
		if(shippingType==null || shippingType.length()==0) {
			errorList.add("必須選擇取貨方式");
		}else {
			try {
				theShippingType = ShippingType.valueOf(shippingType);
			}catch(Exception ex) {
				errorList.add("錯誤的取貨方式");
			}
		}
		
		if(shippingAddr==null || (shippingAddr = shippingAddr.trim()).length()==0) {
			errorList.add("必須輸入取件地址");
		}
		 
		if(recipientName==null || (recipientName = recipientName.trim()).length()==0) {
			errorList.add("必須輸入收件人姓名");
		}
		
		if(recipientEmail==null || (recipientEmail = recipientEmail.trim()).length()==0) {
			errorList.add("必須輸入收件人Email");
		}
		
		if(recipientPhone==null || (recipientPhone = recipientPhone.trim()).length()==0) {
			errorList.add("必須輸入收件人電話");
		}
		
		//2. 若無誤, 則呼叫商業邏輯
		String errorsUrl="check_out.jsp";
		if(errorList.isEmpty()) {
			Order order = new Order();
			order.setCustomer(member);
			order.setOrderDate(LocalDate.now());
			order.setOrderTime(LocalTime.now());
			
			order.setPaymentType(thePType.name());
			order.setPaymentFee(thePType.getFee());
			
			order.setShippingType(theShippingType.name());
			order.setShippingFee(theShippingType.getFee());
			
			order.setShippingAddress(shippingAddr);
			order.setRecipientName(recipientName);
			order.setRecipientEmail(recipientEmail);
			order.setRecipientPhone(recipientPhone);
			
			order.add(cart);
			OrderService oService = new OrderService();
			try {
				oService.checkOut(order);
				//結帳成功要記得移除session中的購物車 不然如果按refresh會一直送出訂單
				session.removeAttribute("cart");
				if(order.getPaymentType().equals(PaymentType.CARD.name())){               
					request.setAttribute("order", order);
					request.getRequestDispatcher("/WEB-INF/credit_card.jsp").forward(request, response);                  
					return;
				}
				//3.1內部轉只給check_out_ok.jsp
				request.setAttribute("theOrder",order);
//				session.setAttribute("theOrder",order);//for test
				request.getRequestDispatcher("check_out_ok.jsp").forward(request, response);
				return;
				
			}catch (MLStockSortageException e) {
				this.log(e.getMessage(), e); //for admin
				errorList.add(e.getMessage()); //for user
				errorsUrl="cart.jsp";
			}catch (MLException e) {
				this.log(e.getMessage());
				errorList.add(e.getMessage());
			}catch (Exception e) {
				this.log("建立訂單發生非預期錯誤", e);
				errorList.add("建立訂單發生非預期錯誤:" +e.getMessage());
			}
		}
		
		//3.2 error內部轉交給check_out.jsp
		request.setAttribute("errorList",errorList);
		request.getRequestDispatcher(errorsUrl).forward(request, response);
		
	}

}
